with source as (

    select
        productid,
        name,
        productsubcategoryid
    from {{ source("adworks","production_product") }}

),

renamed as (

    select
        cast(productid as int) as product_id
        ,cast(name as string) as product_name
        ,cast(productsubcategoryid as int) as product_subcategory_id

    from source

)

select *
from renamed