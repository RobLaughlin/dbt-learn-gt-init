SELECT order_id, customer_id, amount_usd FROM {{ ref('int_orders_joined_to__payments') }}
