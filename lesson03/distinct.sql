--lista das categorias por ordem alfabetica

SELECT DISTINCT product_category_name

FROM tb_products

WHERE product_category_name is NOT NULL
-- selecione aonde NAO E nulo(NULL)

ORDER BY  product_category_name
