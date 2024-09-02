--lista das categorias por ordem alfabetica

SELECT 
    DISTINCT CASE WHEN product_category_name IS NULL THEN 'outros'
    
                WHEN product_category_name = 'alimentos' 
                    OR product_category_name = 'alimentos_bebidas' THEN 'alimentos'

                WHEN product_category_name in ('artes', 'artes_e_artesanato' ) then 'artes'

                WHEN product_category_name like "%artigo%" THEN "artigos"
                -- se em product_category_name conter qualquer string com "artigo" entao "artigos"

                ELSE product_category_name 
            END AS categoria_fillna
        
FROM tb_products

order BY product_category_name