with source as (

    select
        salesorderdetailid,
        salesorderid,
        productid,
        orderqty,
        unitprice,
        unitpricediscount
    from {{ source('adworks', 'sales_salesorderdetail') }}

),

renamed as (

    select
        cast(salesorderdetailid as int) as order_detail_id
        ,cast(salesorderid as int) as order_id
        ,cast(productid as int) as product_id
        ,cast(orderqty as int) as order_quantity
        ,cast(unitprice as numeric) as unit_price
        ,cast(unitpricediscount as numeric) as unit_price_discount
    from source

)

select *
from renamed