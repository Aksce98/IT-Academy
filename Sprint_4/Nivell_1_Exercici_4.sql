CREATE OR REPLACE MATERIALIZED VIEW sprint3_gold.mv_daily_sales AS
SELECT
 DATE(t.timestamp) AS dia,
 SUM(t.amount) AS total_vendes
FROM sprint3_gold.fact_transactions_optimized t
WHERE t.declined = 0
GROUP BY dia;

SELECT *
FROM sprint3_gold.mv_daily_sales;