WITH payments AS (
    SELECT * FROM {{ ref("stg_stripe__payment") }}
),

final AS (
    SELECT SUM(amount_usd) AS total_revenue_usd
    FROM payments
    WHERE status = 'success'
)

SELECT total_revenue FROM final
