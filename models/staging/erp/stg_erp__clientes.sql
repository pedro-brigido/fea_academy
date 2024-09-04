with
    fonte_clientes as (
        select
            cast(id as varchar) as pk_cliente
            , cast(companyname as varchar) as nm_empresa_cliente
            , cast(city as varchar) as cidade_cliente
            , cast(region as varchar) as regiao_cliente
            , cast(country as varchar) as pais_cliente
        from {{ source('erp', 'customer') }}
    )

select *
from fonte_clientes