with 
    categorias as (
        select *
        from {{ ref('stg_erp__categorias') }}
    )

    , produtos as (
        select *
        from {{  ref('stg_erp__produtos')  }}
    )

    , joined as (
        select
            pk_produto
            , produtos.fk_fornecedor
            , produtos.nm_produto
            , categorias.nome_categoria
            , produtos.quantidade_por_unidade
            , produtos.preco_por_unidade
            , produtos.unidade_em_estoque
            , produtos.unidade_por_pedido
            , produtos.nivel_de_pedido
            , produtos.eh_descontinuado
        from produtos as produtos
        left join categorias as categorias
            on produtos.fk_categoria = categorias.pk_categoria

    )

select *
from joined