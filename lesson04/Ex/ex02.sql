-- Qual o valor total de receita gerada por seller de cada estado?
-- considere a base completa, com apenas pedidos entregues

SELECT  t3.seller_state,
        sum(t2.price) / count(distinct t2.seller_id) as avg_receita_por_seller,
        count(distinct t2.seller_id) as qtd_seller


FROM tb_orders as t1

LEFT JOIN tb_order_items as t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_sellers as t3
ON t2.seller_id = t3.seller_id

WHERE t1.order_status = 'delivered'

GROUP BY seller_state