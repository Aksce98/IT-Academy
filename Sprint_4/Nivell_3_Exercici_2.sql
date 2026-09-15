SELECT
 product_sku,
 product_name,
 COUNT(*) AS sold_quantity
FROM sprint3_gold.dim_transactions_flat
GROUP BY product_sku, product_name
ORDER BY sold_quantity DESC
LIMIT 5;