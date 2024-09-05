-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e em pedidos?

SELECT  
        t2.product_category_name,
        sum(t1.price) AS receita,
        COUNT(*) as itens_vendidos,
        COUNT(DISTINCT t1.order_id) as pedidos,
        COUNT(*) / CAST( count(DISTINCT t1.order_id) as FLOAT) as avg_item_por_pedido

-- selecione product_category_name somando os precos de t1.price      
-- contando tudo (produtos)
-- contando cada pedido diferente [por id de pedido, distinct pois o id pode repetir]
-- e items por pedido [cast foi usado para tranformar em float]

FROM    tb_order_items AS   t1
-- da tabela 

LEFT JOIN   tb_products AS t2
ON  t1.product_id = t2.product_id
--cruzando com tb_products, por estas chaves

GROUP BY  t2.product_category_name
-- agrupando a categoria nome 

ORDER BY COUNT(*) DESC 
-- na ordem de preço decrescente (torna ate o nome de produto nesta ordem)

-- mostre apenas 10 linhas
--LIMIT 10