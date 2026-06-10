SELECT
    CAST(id AS INT64) AS customer_id,
    CAST(first_name AS STRING) AS first_name,
    CAST(last_name AS STRING) AS last_name
FROM {{ source('jaffle_shop', 'customers') }}
