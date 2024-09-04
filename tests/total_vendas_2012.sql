with
    vendas_em_2012 as (
        select sum(total_bruto) as total_bruto_2012
        from {{ ref('fct_vendas') }}
        where data_do_pedido between '2012-01-01' and '2012-12-31'
    )

select total_bruto_2012
from vendas_em_2012
where total_bruto_2012 not between 226298.45 and 226298.55