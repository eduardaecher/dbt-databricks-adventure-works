select distinct

    {{ dbt_utils.generate_surrogate_key(['card_type']) }} as credit_card_sk,

    card_type

from {{ ref('int_sales_order_items_join') }}
where card_type is not null
