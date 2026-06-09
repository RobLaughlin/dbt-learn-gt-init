SELECT
    current_timestamp AS test_run_at,
    payment_method,
    count(*) AS affected_rows
FROM {{ ref('stg_stripe__payment') }}
WHERE payment_method NOT IN (
    SELECT payment_method
    FROM {{ ref('stripe_payment_methods') }}
)
GROUP BY current_timestamp, payment_method