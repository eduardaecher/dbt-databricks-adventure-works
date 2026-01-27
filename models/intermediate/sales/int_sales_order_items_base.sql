with sales_order_detail as (

    select *
    from {{ ref('stg_adworks__salesorderdetail') }}

),

sales_order_header as (

    select *
    from {{ ref('stg_adworks__salesorderheader') }}

),

credit_card as (

    select
        credit_card_id,
        card_type
    from {{ ref('stg_adworks__creditcard') }}

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
    cc.card_type,
    soh.status_id,

    sod.order_quantity,
    sod.unit_price,
    sod.unit_price_discount,

    -- header values (para cálculo na fato)
    soh.subtotal_amount,
    soh.tax_amount,
    soh.freight_amount,
    soh.total_due_amount

from sales_order_detail sod

left join sales_order_header soh
    on sod.order_id = soh.order_id

left join credit_card cc
    on soh.credit_card_id = cc.credit_card_id
