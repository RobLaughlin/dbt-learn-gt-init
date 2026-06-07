SELECT
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    amount / 100.0 AS amount_usd,
    created::date AS created_at,
    _batched_at
FROM {{ source('stripe', 'payment') }}
