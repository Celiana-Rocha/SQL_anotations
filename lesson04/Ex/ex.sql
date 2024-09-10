-- Qual o valor total se receita gerada por clientes de cada estado?
-- Considere a base completa, com apenas pedidos entregues

SELECT  t2.customer_state,  
        -- dividido por cliente
        sum(t3.price) / count(DISTINCT t1.customer_id) as receita_por_cliente
        

FROM tb_orders as t1

left JOIN tb_customers as t2
ON t1.customer_id = t2.customer_id

LEFT JOIN tb_order_items as t3
ON t1.order_id = t3.order_id

WHERE t1.order_status = 'delivered'

GROUP BY t2.customer_state