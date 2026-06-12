WITH order_payments AS (
    SELECT 
        customer_id,
        first_order_date,
        most_recent_order_date,
        number_of_orders,
        lifetime_value_usd,
    FROM {{ ref('int_jaffle_shop_order_payments') }}
),

customers AS (
    SELECT
        customer_id,
        first_name,
        last_name
    FROM {{ ref('stg_jaffle_shop__customers') }}
),

{# employees as (
    SELECT * FROM {{ref('jaffle_shop_employees')}}
), #}

customer_payments AS (
    SELECT
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        order_payments.first_order_date,
        order_payments.most_recent_order_date,
        order_payments.number_of_orders,
        order_payments.lifetime_value_usd
    FROM customers

    LEFT JOIN order_payments
    ON customers.customer_id = order_payments.customer_id
)

SELECT
    customer_id,
    first_name,
    last_name,
    first_order_date,
    most_recent_order_date,
    number_of_orders,
    lifetime_value_usd 
FROM customer_payments

