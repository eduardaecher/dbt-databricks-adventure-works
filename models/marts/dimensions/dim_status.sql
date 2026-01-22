with base as (

    select distinct
        status_id
    from {{ ref('int_sales_order_items_join') }}
    where status_id is not null

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['status_id']) }} as status_sk,
        status_id,

        case status_id
            when 1 then 'In process'
            when 2 then 'Approved'
            when 3 then 'Backordered'
            when 4 then 'Rejected'
            when 5 then 'Shipped'
            when 6 then 'Cancelled'
            else 'Unknown'
        end as status_description

    from base

)

select *
from final
