SELECT 
    order_id,
    SUM(amount_usd) AS total_amount_usd
FROM {{ ref('stg_stripe__payment') }}
GROUP BY order_id
HAVING total_amount_usd < 0