-- faça uma query que apresente o tamnho médio, máximo e mínimo do nome do objeto por categpria. 
-- Considere apenas os objetos que tenham a descrição maior que 100. 

SELECT  product_category_name,
        AVG(product_name_lenght) as tamanho_med_objt,
        MIN(product_name_lenght) as tamanho_min_pbjt,
        MAX(product_name_lenght) as tamaho_max_pbjt

FROM tb_products

WHERE product_description_lenght >= 100

GROUP BY product_category_name
