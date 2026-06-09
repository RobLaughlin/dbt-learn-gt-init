SELECT
    current_timestamp AS test_run_at,
    status AS payment_status,
    count(*) AS affected_rows
FROM {{ ref('stg_stripe__payment') }}
WHERE payment_status NOT IN (
    SELECT payment_status
    FROM {{ ref('stripe_payment_statuses') }}
)
GROUP BY current_timestamp, payment_status