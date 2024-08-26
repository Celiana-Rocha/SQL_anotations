SELECT seller_state,
        COUNT(*) as qtde_sellers

FROM tb_sellers

-- filtrando antes da agregacao
WHERE seller_state in ('SP', 'RJ', 'PR', 'AC')

-- agregação
group by seller_state

-- filtrando pós agregação
HAVING COUNT(*) > 10