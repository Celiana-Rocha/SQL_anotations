-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do obejto por categoria 

SELECT  product_category_name,
        AVG(product_name_lenght) as tam_medio_name,
        MIN(product_name_lenght) as tam_minimo_name,
        MAX(product_name_lenght) as tam_maximo_name

FROM tb_products

GROUP BY product_category_name