with
    dim_produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , dim_funcionarios as (
        select *
        from {{ ref('dim_funcionarios') }}
    )

    , int_vendas as (
        select * 
        from {{ ref('int_comercial__detalhamento_ordens') }} 
    )

    , joined as (
        select
            sk_vendas
            , int_vendas.fk_produto
            , int_vendas.fk_funcionario
            , int_vendas.fk_cliente
            , int_vendas.fk_transportadora
            , dim_produtos.fk_fornecedor
            , int_vendas.data_do_pedido
            , int_vendas.data_do_envio
            , int_vendas.data_requerida_entrega
            , int_vendas.total_bruto
            , int_vendas.total_liquido
            , int_vendas.frete_rateado
            , int_vendas.lucro
            , int_vendas.frete
            , int_vendas.desconto_perc
            , int_vendas.preco_da_unidade
            , int_vendas.quantidade
            , int_vendas.fk_pedido as nota_fiscal
            , int_vendas.nm_destinatario
            , int_vendas.cidade_destinatario
            , int_vendas.regiao_destinatario
            , int_vendas.pais_destinatario
        from int_vendas
        left join dim_produtos
        on int_vendas.fk_produto = dim_produtos.pk_produto 
    )
select *
from joined