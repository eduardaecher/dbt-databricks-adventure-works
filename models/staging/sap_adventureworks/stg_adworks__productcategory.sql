with source as (

    select
        productcategoryid,
        name
    from {{ source("adworks","production_productcategory") }}

),

renamed as (

    select
        cast(productcategoryid as int) as product_category_id
        ,cast(name as string) as product_category_name

    from source

)

select *
from renamed