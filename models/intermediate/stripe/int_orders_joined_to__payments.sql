WITH orders AS (
    SELECT order_id, customer_id FROM {{ ref("stg_jaffle_shop__orders") }}
),

payment AS (
    SELECT order_id, amount_usd FROM {{ ref("stg_stripe__payment") }}
),

final AS (
    SELECT 
        orders.order_id,
        orders.customer_id,
        payment.amount_usd,
    FROM orders
    LEFT JOIN payment ON orders.order_id = payment.order_id
)

SELECT * FROM final