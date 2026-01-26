with base as (

    select distinct
        order_detail_id,
        sales_reason_id
    from {{ ref('int_sales_order_items_denormalized') }}
    where sales_reason_id is not null

),

surrogate_keys as (

    select
        -- FK para a fato
        {{ dbt_utils.generate_surrogate_key(['order_detail_id']) }} as sales_sk,

        -- FK para a dimensão de motivo de venda
        {{ dbt_utils.generate_surrogate_key(['sales_reason_id']) }} as sales_reason_sk,

        -- chave da própria bridge
        {{ dbt_utils.generate_surrogate_key([
            'order_detail_id',
            'sales_reason_id'
        ]) }} as sales_reason_bridge_sk,

        order_detail_id,
        sales_reason_id

    from base
)

select *
from surrogate_keys
