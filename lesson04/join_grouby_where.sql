-- considerando as venas de 2017 e pedidos entregues 
-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e em pedidos?

-- selecione tudo de t2.product_category_name
SELECT  
        -- trazendo da tabela t2 os nomes da categoria
        t2.product_category_name,
        -- trazendo e somando o preços dos produtos
        sum(t1.price) AS receita,
        -- contando todos eles
        COUNT(*) as itens_vendidos,
        -- trazendo e contando todos os pedidos diferentes de order_id
        COUNT(DISTINCT t1.order_id) as pedidos,
        -- contando e dividindo quantas unidades de vendas por pedido
        COUNT(*) / CAST( count(DISTINCT t1.order_id) as FLOAT) as avg_item_por_pedido

-- da tabela 
FROM    tb_order_items AS   t1

-- cruzando com a tabela tb_products com essa keys
LEFT JOIN   tb_products AS t2
ON  t1.product_id = t2.product_id

-- cruzando com esta outra tabela com essas keys
LEFT JOIN tb_orders as t3 
ON t1.order_id = t3.order_id

-- aonde na tabela order_status fro igula a delevered E em order_approved seja igula a 2017
WHERE t3.order_status = 'delivered'
AND CAST(strftime('%Y',t3.order_approved_at) as int) = 2017

-- agruprando por categoria de nome 
group BY t2.product_category_name

-- ordenando por order_id diferentes de forma decrescente
ORDER BY COUNT(*) / CAST( count(DISTINCT t1.order_id) as FLOAT) DESC