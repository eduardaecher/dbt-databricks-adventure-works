with source as (

    select
        salesreasonid,
        name
    from {{ source("adworks","sales_salesreason") }}

),

renamed as (

    select
        cast(salesreasonid as int) as sales_reason_id
        ,cast(name as string) as sales_reason_name

    from source

)

select *
from renamed