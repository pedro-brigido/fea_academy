with
    rennamed as (
        select 
            cast(id as int) as pk_categoria
            , cast(categoryname as varchar) as nome_categoria
            , cast(description as varchar) as descricao_categoria
        from {{ source('erp', 'CATEGORY') }}
    )

select * 
from rennamed