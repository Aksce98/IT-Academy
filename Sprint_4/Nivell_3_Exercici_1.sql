CREATE OR REPLACE TABLE sprint3_gold.dim_transactions_flat AS
SELECT
 t.transaction_id,
 t.timestamp,
 t.amount AS total_ticket,
 p.product_id AS product_sku,
 p.name AS product_name,
 p.price AS product_price
FROM sprint3_gold.fact_transactions_optimized t
CROSS JOIN UNNEST (product_ids) AS product_id
JOIN sprint3_silver.products_clean p ON CAST(product_id AS INT64) = p.product_id;

SELECT *
FROM sprint3_gold.dim_transactions_flat
ORDER BY transaction_id ASC;