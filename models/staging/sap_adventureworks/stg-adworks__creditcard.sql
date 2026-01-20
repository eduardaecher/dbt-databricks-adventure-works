with source as (

    select
        creditcardid,
        cardtype
    from {{ source("adworks","sales_creditcard") }}

),

renamed as (

    select
        cast(creditcardid as int) as credit_card_id
        ,cast(cardtype as string) as card_type

    from source

)

select *
from renamed