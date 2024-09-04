with
    fonte_transportadoras as (
        select 
            cast(id as int) as pk_transportadora
            , cast(companyname as varchar) as nm_transportadora
        from {{ source('erp', 'SHIPPER') }}
    )

select *
from fonte_transportadoras