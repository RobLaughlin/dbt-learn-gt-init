WITH customer_payments AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        first_order_date,
        most_recent_order_date,
        number_of_orders,
        lifetime_value_usd 
    FROM {{ ref('int_jaffle_shop_customer_payments') }}
),

employees as (
    SELECT 
        employee_id,
        customer_id,
        email
    FROM {{ref('jaffle_shop_employees')}}
),

customer_employee_payments AS (
    SELECT 
        customer_payments.customer_id,
        customer_payments.first_name,
        customer_payments.last_name,
        customer_payments.first_order_date,
        customer_payments.most_recent_order_date,
        customer_payments.number_of_orders,
        customer_payments.lifetime_value_usd,
        employees.employee_id
    FROM customer_payments
    LEFT JOIN employees
    ON customer_payments.customer_id = employees.customer_id
)

SELECT 
        customer_id,
        first_name,
        last_name,
        first_order_date,
        most_recent_order_date,
        number_of_orders,
        lifetime_value_usd,
        employee_id
FROM customer_employee_payments