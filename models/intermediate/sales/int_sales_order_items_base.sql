with sales_order_detail as (

    select *
    from {{ ref('stg_adworks__salesorderdetail') }}

),

sales_order_header as (

    select *
    from {{ ref('stg_adworks__salesorderheader') }}

)

select

    sod.order_detail_id,
    sod.order_id,

    soh.order_date,
    soh.due_date,
    soh.ship_date,

    sod.product_id,
    soh.customer_id,
    soh.credit_card_id,
    soh.status_id,

    sod.order_quantity,
    sod.unit_price,
    sod.unit_price_discount

from sales_order_detail sod

left join sales_order_header soh
    on sod.order_id = soh.order_id
