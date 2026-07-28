SELECT tp.product_id, COUNT(*) AS nombre_vendes
FROM transaction_product tp
GROUP BY tp.product_id;