SELECT
    current_timestamp() AS test_run_at,
    status AS order_status,
    count(*) AS affected_rows
FROM {{ ref('stg_jaffle_shop__orders') }}
WHERE status NOT IN (
    SELECT order_status
    FROM {{ ref('jaffle_shop_order_statuses') }}
)
GROUP BY current_timestamp(), order_status
