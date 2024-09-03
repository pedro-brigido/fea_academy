with 
    stg_funcionarios as (
        select *
        from {{  ref('stg_erp__funcionarios')  }}
    )

    , joined as (
        select
            funcionarios.pk_funcionario
            , funcionarios.nome_funcionario as nome_gerente
            , funcionarios.funcao_funcionario
            , funcionarios.dt_nascimento
            , funcionarios.dt_contratacao
            , funcionarios.cidade_funcionario
            , funcionarios.pais_funcionario
        from stg_funcionarios as funcionarios
        left join stg_funcionarios as gerentes
            on funcionarios.fk_gerente = gerentes.pk_funcionario

    )

select *
from joined