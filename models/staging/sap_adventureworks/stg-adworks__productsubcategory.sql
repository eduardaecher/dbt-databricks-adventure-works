with source as (

    select
        productsubcategoryid,
        productcategoryid,
        name
    from {{ source("adworks","production_productsubcategory") }}

),

renamed as (

    select
        cast(productsubcategoryid as int) as product_subcategory_id
        ,cast(productcategoryid as int) as product_category_id
        ,cast(name as string) as product_subcategory_name

    from source

)

select *
from renamed