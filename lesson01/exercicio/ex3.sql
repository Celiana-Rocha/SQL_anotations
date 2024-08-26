-- Crie uma coluna nova que conteha a informa~cao de volume em m3

SELECT *,
    product_length_cm * product_height_cm * product_width_cm / 1000000 as product_m3

FROM tb_products