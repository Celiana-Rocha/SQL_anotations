--lista das categorias por ordem alfabetica

SELECT 
    DISTINCT CASE WHEN product_category_name IS NULL THEN 'outros'
    -- caso este valor quando isso aqui for null entao outros
        ELSE product_category_name END AS categoria_fillna
        -- o else esta pondo o proptio valor caso nao for null
        -- end aqui indica o fim da case 

FROM tb_products

order BY product_category_name