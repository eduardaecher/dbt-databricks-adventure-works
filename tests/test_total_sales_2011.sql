with gross_2011 as (

    select
        round(sum(cast(gross_amount as decimal(38,4))), 2) as gross_sales_2011
    from {{ ref('fct_sales') }}
    where year(cast(order_date as date)) = 2011

)

select *
from gross_2011
where gross_sales_2011 <> 12646112.16
