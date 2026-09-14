SELECT *
FROM sprint3_silver.transactions_recent t
WHERE DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) < DATE(t.timestamp);

SELECT *
FROM sprint3_gold.fact_transactions_optimized t
WHERE DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) < DATE(t.timestamp);