select distinct

    {{ dbt_utils.generate_surrogate_key(['sales_reason_id']) }} as sales_reason_sk,

    sales_reason_id,

    sales_reason_name

from {{ ref('int_sales_order_items_join') }}
where sales_reason_id is not null