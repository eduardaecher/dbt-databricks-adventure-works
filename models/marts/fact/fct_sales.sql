with base as (

    select *
    from {{ ref('int_sales_order_items_base') }}

),

metrics as (

    select

        order_id,
        order_detail_id,
        order_date,

        product_id,
        customer_id,
        card_type,
        status_id,

        cast(order_quantity as decimal(18,4)) as order_quantity,
        cast(unit_price as decimal(18,4)) as unit_price,
        cast(coalesce(unit_price_discount, 0) as decimal(18,6)) as unit_price_discount,

        cast(
            cast(order_quantity as decimal(18,4)) * cast(unit_price as decimal(18,4))
            as decimal(18,4)
        ) as gross_amount,


        cast(
            cast(order_quantity as decimal(18,4))
            * cast(unit_price as decimal(18,4))
            * (1 - cast(coalesce(unit_price_discount, 0) as decimal(18,6)))
            as decimal(18,4)
        ) as net_amount

    from base

),

surrogate_keys as (

    select

        {{ dbt_utils.generate_surrogate_key(['order_detail_id']) }} as sales_sk,
        {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk,
        {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,
        {{ dbt_utils.generate_surrogate_key(['card_type']) }} as credit_card_sk,
        {{ dbt_utils.generate_surrogate_key(['status_id']) }} as status_sk,

        order_id,
        order_detail_id,
        order_date,

        order_quantity,
        unit_price,
        unit_price_discount,
        gross_amount,
        net_amount

    from metrics

)

select *
from surrogate_keys
