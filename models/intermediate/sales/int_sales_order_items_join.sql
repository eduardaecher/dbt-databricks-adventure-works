with sales_order_detail as (

    select *
    from {{ ref('stg_adworks__salesorderdetail') }}

),

sales_order_header as (

    select *
    from {{ ref('stg_adworks__salesorderheader') }}

),

product as (

    select *
    from {{ ref('stg_adworks__product') }}

),

product_subcategory as (

    select *
    from {{ ref('stg_adworks__productsubcategory') }}

),

customer as (

    select *
    from {{ ref('stg_adworks__customer') }}

),

credit_card as (

    select *
    from {{ ref('stg_adworks__creditcard') }}

),

sales_order_reason_bridge as (

    select *
    from {{ ref('stg_adworks__salesorderheadersalesreason') }}

),

sales_reason as (

    select *
    from {{ ref('stg_adworks__salesreason') }}

),

address as (

    select *
    from {{ ref('stg_adworks__address') }}

),

state_province as (

    select *
    from {{ ref('stg_adworks__stateprovince') }}

),

country_region as (

    select *
    from {{ ref('stg_adworks__countryregion') }}

),

joined as (

    select

        sod.order_detail_id,
        sod.order_id,


        soh.order_date,
        soh.due_date,
        soh.ship_date,


        sod.product_id,
        p.product_name,
        p.product_number,
        p.product_subcategory_id,
        psc.product_subcategory_name,


        soh.customer_id,

        soh.credit_card_id,
        cc.card_type,


        soh.status_id,


        sr.sales_reason_id,
        sr.sales_reason_name,


        addr.city_name,
        sp.state_province_name,
        cr.country_name,


        sod.order_quantity,
        sod.unit_price,
        sod.unit_price_discount


    from sales_order_detail sod


    left join sales_order_header soh
        on sod.order_id = soh.order_id


    left join product p
        on sod.product_id = p.product_id

    left join product_subcategory psc
        on p.product_subcategory_id = psc.product_subcategory_id


    left join customer c
        on soh.customer_id = c.customer_id


    left join credit_card cc
        on soh.credit_card_id = cc.credit_card_id


    left join sales_order_reason_bridge sorb
        on soh.order_id = sorb.order_id

    left join sales_reason sr
        on sorb.sales_reason_id = sr.sales_reason_id


    left join address addr
        on soh.ship_to_address_id = addr.address_id

    left join state_province sp
        on addr.state_province_id = sp.state_province_id

    left join country_region cr
        on sp.country_region_code = cr.country_region_code

)

select *
from joined
