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
        cast(salesorderid as int) as order_id
        , cast(orderdate as date) as order_date
        , cast(duedate as date) as due_date
        , cast(shipdate as date) as ship_date
        , cast(status as int) as status_id
        , cast(onlineorderflag as boolean) as online_order
        , cast(customerid as int) as customer_id
        , cast(salespersonid as int) as salesperson_id
        , cast(territoryid as int) as territory_id
        , cast(billtoaddressid as int) as bill_to_address_id
        , cast(shiptoaddressid as int) as ship_to_address_id
        , cast(creditcardid as int) as credit_card_id
        , cast(subtotal as numeric) as subtotal_amount
        , cast(taxamt as numeric) as tax_amount
        , cast(freight as numeric) as freight_amount
        , cast(totaldue as numeric) as total_due_amount
        , cast(modifieddate as date) as modified_at
    from source

)

select *
from renamed