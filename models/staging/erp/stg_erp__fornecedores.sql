with
    fonte_fornecedores as (
        select
            cast(id as int) as pk_fornecedor
            , cast(companyname as varchar) as nm_fornecedor
            , cast(city as varchar) as cidade_fornecedor
            , cast(country as varchar) as pais_fornecedor
        from {{ source('erp', 'SUPPLIER') }}
    )

select *
from fonte_fornecedores