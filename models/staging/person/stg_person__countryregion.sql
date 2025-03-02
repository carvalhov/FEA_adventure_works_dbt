with
    sources as (
        select *
        from {{ source( 'person' , 'countryregion') }}
    )

    , casting as (
        select
            cast(CountryRegionCode as string) as pk_country_region
            , cast(name as string) as contry_region_name
            , cast(ModifiedDate as date) as dt_modified_at
        from sources
    )

select *
from casting