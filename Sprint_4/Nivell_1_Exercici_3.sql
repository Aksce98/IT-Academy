SELECT *
FROM sprint3_silver.transactions_recent t
JOIN sprint3_silver.companies_clean c ON t.business_id = c.company_id
WHERE DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) < DATE(t.timestamp);

SELECT *
FROM sprint3_gold.fact_transactions_optimized t
JOIN sprint3_silver.companies_clean c ON t.business_id = c.company_id
WHERE DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY) < DATE(t.timestamp);