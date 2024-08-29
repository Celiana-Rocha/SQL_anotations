-- Fcá uma query que apresente o tamanho médio, máximo e mínimo da descrição do obejto por categoria. 

SELECT  product_category_name,
        AVG(product_description_lenght) as tamanho_medio,
        MAX(product_description_lenght) as tamanho_maximo,
        min(product_description_lenght) as tamanho_minimo
        
    
from tb_products

GROUP BY product_category_name