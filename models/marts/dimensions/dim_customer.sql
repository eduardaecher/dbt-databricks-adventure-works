select distinct
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,

    customer_id,
    first_name,
    last_name

from {{ ref('int_sales_order_items_denormalized') }}