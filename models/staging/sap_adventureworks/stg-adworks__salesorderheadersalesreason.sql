with source as (

    select
        salesorderid,
        salesreasonid
    from {{ source("adworks","sales_salesorderheadersalesreason") }}

),

renamed as (

    select
        cast(salesorderid as int) as order_id
        ,cast(salesreasonid as int) as sales_reason_id

    from source

)

select *
from renamed