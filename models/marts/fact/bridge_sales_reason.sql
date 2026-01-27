with fact_sales as (

    select
        sales_sk,
        order_detail_id
    from {{ ref('fct_sales') }}

),

reasons as (

    select distinct
        order_detail_id,
        sales_reason_id
    from {{ ref('int_sales_order_items_denormalized') }}
    where sales_reason_id is not null

),

joined as (

    select
        fs.sales_sk,

        {{ dbt_utils.generate_surrogate_key(['r.sales_reason_id']) }} as sales_reason_sk,

        {{ dbt_utils.generate_surrogate_key([
            'fs.sales_sk',
            'r.sales_reason_id'
        ]) }} as sales_reason_bridge_sk,

        r.order_detail_id,
        r.sales_reason_id

    from reasons r
    inner join fact_sales fs
        on r.order_detail_id = fs.order_detail_id

)

select *
from joined
