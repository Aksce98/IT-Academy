SELECT 
  EXTRACT(DATE FROM timestamp) AS dia,
  SUM(amount) AS ingressos_totals
FROM `sprint3-analytics-adnan-507517.sprint3_bronze.transactions_raw_native`
WHERE EXTRACT(YEAR FROM timestamp) = 2021
GROUP BY dia
ORDER BY ingressos_totals DESC
LIMIT 5;