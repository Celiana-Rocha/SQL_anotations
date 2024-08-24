-- bebes acima de 1 foto 
-- ou perfumaria acima de 5 fotos

SELECT t1.product_id,
       t1.product_photos_qty,
       t1.product_category_name


FROM tb_products t1

WHERE (t1.product_category_name = 'bebes'
    AND t1.product_photos_qty > 1)
OR (t1.product_category_name = 'perfumaria'
    AND t1.product_photos_qty > 5)
