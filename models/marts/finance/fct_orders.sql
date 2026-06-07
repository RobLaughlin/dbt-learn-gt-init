SELECT order_id, customer_id, amount_usd FROM {{ ref('int_jaffle_shop_orders_joined_to__payments') }}
