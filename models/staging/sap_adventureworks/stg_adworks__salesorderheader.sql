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

),

renamed as (

    select
        cast(salesorderid as int) as order_id,

        to_date(substr(cast(orderdate as string), 1, 10)) as order_date,
        to_date(substr(cast(duedate   as string), 1, 10)) as due_date,
        to_date(substr(cast(shipdate  as string), 1, 10)) as ship_date,

        cast(status as int) as status_id,
        cast(onlineorderflag as boolean) as online_order,
        cast(customerid as int) as customer_id,
        cast(salespersonid as int) as salesperson_id,
        cast(territoryid as int) as territory_id,
        cast(billtoaddressid as int) as bill_to_address_id,
        cast(shiptoaddressid as int) as ship_to_address_id,
        cast(creditcardid as int) as credit_card_id,

        cast(subtotal as decimal(18,4)) as subtotal_amount,
        cast(taxamt   as decimal(18,4)) as tax_amount,
        cast(freight  as decimal(18,4)) as freight_amount,
        cast(totaldue as decimal(18,4)) as total_due_amount,

        cast(modifieddate as timestamp) as modified_at

    from source

)

select *
from renamed
