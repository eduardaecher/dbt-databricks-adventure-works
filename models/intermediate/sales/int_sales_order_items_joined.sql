with joined as (

    select
        orders.order_detail_id,
        orders.order_id,
        orders.product_id,
        orders.order_quantity,
        orders.unit_price,
        orders.unit_price_discount,

        products.product_name,
        products.product_subcategory_id

    from {{ ref('stg-adworks__salesorderdetail') }} orders
    left join {{ ref('stg-adworks__product') }} products
        on orders.product_id = products.product_id

)

select *
from joined