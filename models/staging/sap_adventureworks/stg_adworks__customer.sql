with source as (

    select
        customerid,
        personid,
        territoryid
    from {{ source("adworks","sales_customer") }}

),

renamed as (

    select
        cast(customerid as int) as customer_id
        ,cast(personid as int) as person_id
        ,cast(territoryid as int) as territory_id

    from source

)

select *
from renamed