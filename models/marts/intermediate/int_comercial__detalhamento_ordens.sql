with 
    ordens as (
        select *
        from {{  ref('stg_erp__ordens')  }}
    )

    , ordens_detalhes as (
        select *
        from {{  ref('stg_erp__ordens_detalhes')  }}       
    )
    , joined as (
        select
            ordens_detalhes.fk_pedido
            , ordens_detalhes.fk_produto
            , ordens.fk_funcionario
            , ordens.fk_cliente
            , ordens.fk_transportadora
            , ordens.data_do_pedido
            , ordens.data_do_envio
            , ordens.data_requerida_entrega
            , ordens.frete
            , ordens.nm_destinatario
            , ordens.cidade_destinatario
            , ordens.regiao_destinatario
            , ordens.pais_destinatario
            , ordens_detalhes.desconto_perc
            , ordens_detalhes.preco_da_unidade
            , ordens_detalhes.quantidade
        from ordens_detalhes
        left join ordens
            on ordens_detalhes.fk_pedido = ordens.pk_pedido

    )

    , metricas as (
        select
            *
            , preco_da_unidade * quantidade as total_bruto
            , preco_da_unidade * (1 - desconto_perc) * quantidade as total_liquido
            , frete / count(*) over(partition by fk_pedido) as frete_rateado
            , preco_da_unidade
                * (1 - desconto_perc)
                * quantidade
                - frete / count(*) over(partition by fk_pedido) as lucro
            from joined
    )

    , chave_primaria as (
        select  fk_pedido::varchar || '-' || fk_produto::varchar as sk_vendas
        , *
        from metricas
    )
    
select *
from chave_primaria