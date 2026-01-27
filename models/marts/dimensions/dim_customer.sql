with source as (

    select distinct
        customer_id,
        first_name,
        last_name,
        city_name,
        state_province_name,
        country_name

    from {{ ref('int_sales_order_items_denormalized') }}
    where customer_id is not null

),

final as (

    select

        {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,

        customer_id,

        first_name,
        last_name,
        concat(first_name, ' ', last_name) as customer_name,

        city_name,
        state_province_name,
        country_name

    from source

)

select *
from final
