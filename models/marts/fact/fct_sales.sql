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
        credit_card_id,
        status_id,

        order_quantity,
        unit_price,
        unit_price_discount,

        order_quantity * unit_price as gross_amount,
        order_quantity * unit_price * (1 - unit_price_discount) as net_amount

    from base
),

surrogate_keys as (

    select

        {{ dbt_utils.generate_surrogate_key(['order_detail_id']) }} as sales_sk,
        {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk,
        {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,
        {{ dbt_utils.generate_surrogate_key(['credit_card_id']) }} as credit_card_sk,
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
