with
    source_salesorders as (
        select *
        from {{ source("adworks","sales_salesorderheader") }}
    )

, renamed as (
    select
        cast(sa)
)