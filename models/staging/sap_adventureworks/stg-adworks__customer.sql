with source as (

    select
        customerid,
        territoryid,
        personid
    from {{ source("adworks","sales_customer") }}

),

renamed as (

    select
        cast(customerid as int) as customer_id
        ,cast(territoryid as int) as territory_id
        ,cast(personid as int) as person_id

    from source

)

select *
from renamed