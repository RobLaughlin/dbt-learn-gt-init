WITH payments AS 
(
    SELECT * FROM {{ ref('stg_stripe__payment') }}
    WHERE status = 'success'
),

pivoted AS (
    SELECT 
        order_id,

        {%- set payment_methods_query -%}
            select payment_method
            from {{ ref('stripe_payment_methods') }}
            order by payment_method
        {%- endset -%}

        {%- set payment_methods = run_query(payment_methods_query).columns['payment_method'].values() | list -%}

        {%- for method in payment_methods %}
            SUM(    
                CASE WHEN payment_method = '{{method}}' THEN amount_usd ELSE 0 END
            ) AS {{method}}_amount {%- if not loop.last %},{%- endif %}
        {%- endfor %}
    FROM payments
    GROUP BY order_id
    ORDER BY order_id
)

SELECT * FROM pivoted