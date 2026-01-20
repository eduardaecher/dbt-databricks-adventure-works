with source as (

    select
        stateprovinceid,
        name,
        countryregioncode
    from {{ source("adworks","person_stateprovince") }}

),

renamed as (

    select
        cast(stateprovinceid as int) as state_province_id
        ,cast(name as string) as state_province_name
        ,cast(countryregioncode as string) as country_region_code

    from source

)

select *
from renamed