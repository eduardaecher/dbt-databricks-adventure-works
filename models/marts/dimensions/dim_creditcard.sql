with source as (

    select distinct
        card_type
    from {{ ref('stg_adworks__creditcard') }}
    where card_type is not null

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['card_type']) }} as credit_card_sk,
        card_type
    from source

)

select *
from final
