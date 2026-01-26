with dates as (

    select distinct
        order_date
    from {{ ref('stg_adworks__salesorderheader') }}

),

date_attributes as (

    select

        cast(date_format(order_date, 'yyyyMMdd') as int) as date_id,

        order_date as date,

        extract(day from order_date)     as day,
        extract(month from order_date)   as month,
        extract(year from order_date)    as year,
        extract(quarter from order_date) as quarter,

        date_format(order_date, 'MMMM')  as month_name,
        date_format(order_date, 'EEEE')  as day_name

    from dates

)

select *
from date_attributes
