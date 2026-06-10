SELECT
    CAST(id AS INT64) AS order_id,
    CAST(user_id AS INT64) AS customer_id,
    CAST(order_date AS DATE) AS order_date,
    CAST(status AS STRING) AS status
FROM {{ source('jaffle_shop', 'orders' )}}
