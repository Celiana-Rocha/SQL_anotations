-- Fça uma query que apresente o tamnho médio, máximo e mínimo do nome do objeto por categoria.
-- Considere apenas os objetos que tenham a descrição maior que 100. 
-- Exiba apenas as categorias com tamanho médio de descrição do objeto maior que500 caracteres. 

SELECT product_category_name,
        AVG(product_name_lenght) as tamanho_med_objt,
        MIN(product_name_lenght) as tamanho_min_objt,
        MAX(product_name_lenght) as tamaho_max_objt
        

FROM tb_products

WHERE product_description_lenght >= 100

GROUP BY product_category_name

HAVING avg(product_description_lenght) > 500