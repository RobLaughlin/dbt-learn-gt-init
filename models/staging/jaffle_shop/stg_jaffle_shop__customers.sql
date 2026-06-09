SELECT
    id::NUMBER AS customer_id,
    first_name::VARCHAR AS first_name,
    last_name::VARCHAR AS last_name
FROM {{ source('jaffle_shop', 'customers') }}
