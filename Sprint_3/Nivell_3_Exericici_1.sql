CREATE OR REPLACE VIEW sprint3_gold.v_marketing_kpis AS
SELECT
 c.company_name,
 c.phone,
 c.country,
 AVG(t.amount) AS avg_transaction,
 IF(AVG(t.amount) > 260, 'Premium', 'Standard') AS client_tier
FROM `sprint3_silver.companies_clean` c
INNER JOIN `sprint3_silver.transactions_clean` t ON c.company_id = t.business_id
WHERE t.declined = 0
GROUP BY c.company_id, c.company_name, c.phone, c.country;

SELECT *
FROM sprint3_gold.v_marketing_kpis v
ORDER BY v.client_tier ASC, v.avg_transaction DESC;

