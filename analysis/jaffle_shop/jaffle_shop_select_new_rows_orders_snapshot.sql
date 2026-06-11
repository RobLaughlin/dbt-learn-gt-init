SELECT * FROM {{ ref('orders_snapshot') }}
WHERE id >= 100