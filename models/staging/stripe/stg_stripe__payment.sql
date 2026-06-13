SELECT
    CAST(id AS INT64) AS payment_id,
    CAST(orderid AS INT64) AS order_id,
    CAST(paymentmethod AS STRING) AS payment_method,
    CAST(status AS STRING) AS status,
    CAST({{cents_to_dollars('amount')}} AS NUMERIC) AS amount_usd,
    CAST(created AS DATE) AS created_at,
    CAST(_batched_at AS TIMESTAMP) AS _batched_at
FROM {{ source('raw_stripe', 'payment') }}
