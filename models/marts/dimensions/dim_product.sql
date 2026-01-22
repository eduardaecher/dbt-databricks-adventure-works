select distinct
    {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk,

    product_id,
    product_name,
    product_number,
    product_subcategory_id,
    product_subcategory_name,
    product_category_id,
    product_category_name

from {{ ref('int_sales_order_items_join') }}