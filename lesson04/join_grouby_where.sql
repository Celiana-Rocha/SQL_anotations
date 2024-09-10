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
        -- contando os produtos
        COUNT(*) as itens_vendidos,
        -- trazendo e contando todos os pedidos diferentes de order_id
        COUNT(DISTINCT t1.order_id) as pedidos,
        -- contando e dividindo quantas unidades de vendas por pedido trazendo a media
        -- trazendo a media de produto mais vendido, (entra em pedido e conta os produtos do pedido)
        -- Ex por pedido o que mais e comumente comprado em  grande quantidade é tal
        COUNT(*) / CAST( count(DISTINCT t1.order_id) as FLOAT) as avg_media_item_por_pedido

-- da tabela 
-- esta tabela nos trazera os produtos/items de pedidos 
FROM    tb_order_items AS   t1

-- cruzando com a tabela tb_products com uma coluna presnte nas duas tabelas 
-- eta tabela nos trazara as acategorias de produtos 
LEFT JOIN   tb_products AS t2
ON  t1.product_id = t2.product_id

-- cruzando com esta outra tabela com essas keys
-- esta nova tabela nos trazera as vendas de 2017
LEFT JOIN tb_orders as t3 
ON t1.order_id = t3.order_id

-- aonde na tabela order_status fro igula a delevered E em order_approved seja igula a 2017
-- o cast aqui serve para transformar o 2017 em int pois na tabela estava como str
WHERE t3.order_status = 'delivered'
AND CAST(strftime('%Y',t3.order_approved_at) as int) = 2017

-- agruprando por categoria de nome 
group BY t2.product_category_name

-- ordenando de forma aonde o o item que mais e vendido sai em primeiro
ORDER BY COUNT(*) / CAST( count(DISTINCT t1.order_id) as FLOAT) DESC