with
    rennamed as (
        select 
            cast(id as int) as pk_funcionario
            , cast(firstname as varchar) || ' ' || cast(firstname as varchar) as nome_funcionario
            , cast(title as varchar) as funcao_funcionario
            , cast(birthdate as date) as dt_nascimento
            , cast(hiredate as date) as dt_contratacao
            , cast(city as varchar) as cidade_funcionario
            , cast(country as varchar) as pais_funcionario
        from {{ source('erp', 'EMPLOYEE') }}
    )

select * from rennamed