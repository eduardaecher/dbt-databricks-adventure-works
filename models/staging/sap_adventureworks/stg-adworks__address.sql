with source as (

    select
        addressid,
        city,
        stateprovinceid
    from {{ source("adworks","person_address") }}

),

renamed as (

    select
        cast(addressid as int) as address_id
        ,cast(city as string) as city_name
        ,cast(stateprovinceid as int) as state_province_id

    from source

)

select *
from renamed