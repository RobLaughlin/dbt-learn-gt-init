SELECT
    id::NUMBER AS payment_id,
    orderid::NUMBER AS order_id,
    paymentmethod::VARCHAR AS payment_method,
    status::VARCHAR AS status,
    (amount / 100.0)::NUMBER AS amount_usd,
    created::DATE AS created_at,
    _batched_at::TIMESTAMP AS _batched_at
FROM {{ source('stripe', 'payment') }}
