with fct_order as (
        select *
        from {{ ref('fct_order') }}
    )

    , dim_order_details as (
        select *
        from {{ ref('dim_order_details') }}
    )

    , dim_territory as (
        select *
        from {{ ref('dim_territory') }}
    )

    , joining as (
        select
            dim_territory.pk_territory as fk_territory
            , dim_territory.territory_name
            , dim_territory.country_name
            , fct_order.dt_order
            , count(fct_order.pk_sales_order) as qtd_orders
            , sum(fct_order.subtotal) as sum_subtotal
            , sum(fct_order.tax_amount) as sum_tax_amount
            , sum(fct_order.freight) as sum_freight
            , sum(fct_order.total_due) as sum_total_due
            , sum(dim_order_details.order_quantity) as sum_quantity
        from fct_order
        left join dim_order_details
            on fct_order.pk_sales_order = dim_order_details.fk_sales_order
        left join dim_territory
            on fct_order.fk_territory = dim_territory.pk_territory
        group by dim_territory.pk_territory, dim_territory.territory_name, dim_territory.country_name, fct_order.dt_order
    )

select *
from joining