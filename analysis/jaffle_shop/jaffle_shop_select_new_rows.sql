SELECT * FROM {{ source('raw_jaffle_shop', 'orders') }}
WHERE id >= 100
ORDER BY id