with source as (

    select
        businessentityid,
        addressid
    from {{ source("adworks","person_businessentityaddress") }}

),

renamed as (

    select
        cast(businessentityid as int) as business_entity_id
        ,cast(addressid as int) as address_id

    from source

)

select *
from renamed