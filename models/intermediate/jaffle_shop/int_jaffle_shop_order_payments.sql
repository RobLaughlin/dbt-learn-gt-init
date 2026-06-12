WITH orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        status
    FROM {{ ref('stg_jaffle_shop__orders') }}
),

payment AS (
    SELECT order_id, amount_usd FROM {{ ref('stg_stripe__payment') }}
),

order_payments AS (
    SELECT
        orders.customer_id,
        MIN(orders.order_date) AS first_order_date,
        MAX(orders.order_date) AS most_recent_order_date,
        COALESCE(COUNT(orders.order_id), 0) AS number_of_orders,
        COALESCE(SUM(payment.amount_usd), 0.0) AS lifetime_value_usd,
    FROM orders
    LEFT JOIN payment 
    ON payment.order_id = orders.order_id
    GROUP BY customer_id
)

SELECT 
    customer_id,
    first_order_date,
    most_recent_order_date,
    number_of_orders,
    lifetime_value_usd
FROM order_payments

