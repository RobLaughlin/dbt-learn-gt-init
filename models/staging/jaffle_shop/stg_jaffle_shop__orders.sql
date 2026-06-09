SELECT
    id::NUMBER AS order_id,
    user_id::NUMBER AS customer_id,
    order_date::DATE AS order_date,
    status::VARCHAR AS status
FROM {{ source('jaffle_shop', 'orders' )}}
