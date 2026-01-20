with source as (

    select
        salesorderid,
        orderdate,
        duedate,
        shipdate,
        status,
        onlineorderflag,
        customerid,
        salespersonid,
        territoryid,
        billtoaddressid,
        shiptoaddressid,
        creditcardid,
        subtotal,
        taxamt,
        freight,
        totaldue,
        modifieddate
    from {{ source("adworks","sales_salesorderheader") }}
    )

, renamed as (
    select
        cast(salesorderid as int) as order_pk
        , cast(orderdate as date) as order_date
        , cast(duedate as date) as due_date
        , cast(shipdate as date) as ship_date
        , cast(status as int) as status_fk
        , cast(onlineorderflag as boolean) as online_order
        , cast(customerid as int) as customer_fk
        , cast(salespersonid as int) as salesperson_fk
        , cast(territoryid as int) as territory_fk
        , cast(billtoaddressid as int) as bill_to_address_fk
        , cast(shiptoaddressid as int) as ship_to_address_fk
        , cast(creditcardid as int) as credit_card_fk
        , cast(subtotal as numeric) as subtotal_amount
        , cast(taxamt as numeric) as tax_amount
        , cast(freight as numeric) as freight_amount
        , cast(totaldue as numeric) as total_due_amount
        , cast(modifieddate as date) as modified_at
    from source

)

select *
from renamed