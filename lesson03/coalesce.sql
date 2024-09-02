SELECT DISTINCT coalesce(product_category_name, 'outros') as categoria_fillna

FROM tb_products

ORDER BY  product_category_name