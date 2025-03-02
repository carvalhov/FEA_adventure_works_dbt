with
    sources as (
        select *
        from {{ source('sales', 'salesterritory') }}
    )

    , casting as (
        select
            cast(TerritoryID as int) as pk_territory
            , cast(Name as string) as territory_name
            , cast(CountryRegionCode as string) as fk_country_region_code
            , cast("group" as string) as territory_group
            , cast(SalesYTD as decimal(10, 2)) as sales_ytd
            , cast(SalesLastYear as decimal(10, 2)) as sales_last_year
            , cast(CostYTD as decimal(10, 2)) as cost_ytd
            , cast(CostLastYear as decimal(10, 2)) as cost_last_year
            , cast(rowguid as string) as row_guid
            , cast(ModifiedDate as date) as dt_modified_at
        from sources
    )

select *
from casting
