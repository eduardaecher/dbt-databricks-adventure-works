with source as (

    select
        countryregioncode,
        name
    from {{ source("adworks","person_countryregion") }}

),

renamed as (

    select
        cast(countryregioncode as string) as country_region_code
        ,cast(name as string) as country_name

    from source

)

select *
from renamed