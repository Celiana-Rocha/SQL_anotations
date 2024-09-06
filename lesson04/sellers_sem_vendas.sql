-- Quais são os sellers que não venderam em dez 2017?
-- considere vendas válidas (entregues)

-- selecione seller_id
SELECT  t2.seller_id,
        t2.seller_state,
        -- fazendo o maximo caso order_approved_at seja igual a 2017-12 faca 1
        -- se nao 0
         max(CASE WHEN strftime( '%Y-%m' , t1.order_approved_at) = '2017-12' THEN 1
            else 0
        END) as flag_compra_12_2017

-- da tabela tb_orders
FROM tb_orders AS  t1

-- cruzando com tb_order_items
LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_sellers as t3
ON t3.seller_id = t2.seller_id

-- aonde o order_approved_at for menor que 2018-01-01 E o order_status seja igual delivered
WHERE order_approved_at < '2018-01-01'
AND order_status = 'delivered'

-- agruprando por seller_id
GROUP BY t2.seller_id

-- filtrando pro apenas os que sejam igual a zero apareçam
HAVING MAX(CASE WHEN strftime( '%Y-%m' , t1.order_approved_at) = '2017-12' THEN 1
            else 0
        END) = 0