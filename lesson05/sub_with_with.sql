-- a receita por estado do seller, por produto da categoria mais vendida
-- use apenas vendas entregues

-- este with esta criando uma taela temporaria e puxando os dados desejados 
-- traz a catgoria masi vendida
with tb_best_categoria as (

    select t2.product_category_name

    from tb_order_items as t1

    left join tb_products as t2
    on t1.product_id = t2.product_id

    group by t2.product_category_name
    order by count(*) desc

    limit 3
),

-- aqui fazendo outro with e pedimos da tabela orders tudo wue tiver o status enviado
-- o with so acaba no proximo parenteses fechado que nao tem virgula
tb_venda as (
    select *
    from tb_orders as t1
    where t1.order_status = 'delivered'
),

-- criamos outra tabela temporaria que seleciona estado, produto, categoria e soma o preco para retornar a receita
-- traz a receita 
tb_receita_estado_produto as (
    select
        t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price) as receita_total

    from tb_order_items as t1

    left join tb_sellers as t2
    on t1.seller_id = t2.seller_id

    left join tb_products as t3
    on t1.product_id = t3.product_id

    -- inner trazendo tudo que tem em comum entre items e vendas que sao o itens ai vem apenas os com 'delivered' pois a tabela so contem os com esta tag
    inner join tb_venda as t4
    on t1.order_id = t4.order_id

    group by t2.seller_state,
             t1.product_id,
             t3.product_category_name
)
-- aqui o with fechou

-- agrupa tb_receita_estado_produto com tb_best_categori trazendo tudo em comum
-- eles tem coisas em comum por conta dos cruzamentos 
select *
from tb_receita_estado_produto as t1

inner join tb_best_categoria as t2
on t1.product_category_name = t2.product_category_name