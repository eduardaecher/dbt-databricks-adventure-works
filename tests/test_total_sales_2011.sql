with sales_2011 as (

    select
        sum(gross_amount) as total_gross_amount
    from {{ ref('fct_sales') }}
    where year(order_date) = 2011

)

select *
from sales_2011
where total_gross_amount <> 12646112.16
