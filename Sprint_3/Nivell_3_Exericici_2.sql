CREATE OR REPLACE TABLE sprint3_gold.product_sales_ranking AS
SELECT
 p.product_id,
 p.name,
 p.price,
 p.colour,
 count(p_id) AS total_sold
FROM sprint3_silver.products_clean p
LEFT JOIN (
 SELECT p_id
 FROM sprint3_silver.transactions_clean t, UNNEST(t.product_ids) AS p_id
) ON p.product_id = p_id
GROUP BY p.product_id, p.name, p.price, p.colour