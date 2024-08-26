-- Ex1; Quantos produtos temos da categoria 'artes'?

-- contagem
select 
      count(*) as linhas,
      count(product_id) as produtos,
      count(DISTINCT product_id) as prdutos_diferentes,
      count(DISTINCT product_category_name) as categorias
      

FROM tb_products 

WHERE product_category_name = 'artes'