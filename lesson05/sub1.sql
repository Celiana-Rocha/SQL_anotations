-- a receita por estado do seller, por produto da categoria mais vendida

-- aqui ele seleciona as colunas que quer que mostre
select
        t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price) as receita_total

-- da tabela
from tb_order_items as t1

-- cruzando 
left join tb_sellers as t2
on t1.seller_id = t2.seller_id

left join tb_products as t3
on t1.product_id = t3.product_id

-- aqui uma sub query 
-- nesse where estamos passando uma qiry que entra em uma tabela e nos traz 
-- apenas os produtos que mais forma vendidos 
-- usamos = par auma string (retorna um valor no caso o primeiro) e "in" para uma lista (mais de uma valor)
where product_category_name in (
        
        -- esta selecionando product_category_name para ordenar por categoria
        select t2.product_category_name
        -- da tabela em que se encontra os itens
        from tb_order_items as t1
        -- para cruzar com produtos
        left join tb_products as t2
        on t1.product_id = t2.product_id
        -- agrupando pela categoria de nome 
        group by t2.product_category_name
        -- ordernando tudo pela ordem decrescente e contando cada cateria de nome 
        order by count(*) desc
        -- passando o limite de 3 itens que mais tem receita
        limit 3
)

-- aqui ele ordena por estado do vendedor, produto e categoria de nome
group by t2.seller_state,
         t1.product_id,
         t3.product_category_name