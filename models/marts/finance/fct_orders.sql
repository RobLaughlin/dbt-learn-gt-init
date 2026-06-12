{{
    config (
        materialized='incremental',
        incremental_strategy='insert_overwrite',
        unique_key='order_id',
        partition_by={
            'field': 'order_date',
            'data_type': 'date',
            'granularity': 'month',
        },
        cluster_by=['order_id', 'customer_id']
    )
}}

SELECT order_id, customer_id, amount_usd, order_date FROM {{ ref('int_jaffle_shop_orders_joined_to__payments') }}
{% if is_incremental() %}
    WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}
