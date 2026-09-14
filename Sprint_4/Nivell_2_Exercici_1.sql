WITH VIP_Stats AS (
 SELECT
   user_id,
   SUM(amount) AS total_spent,
   COUNT(transaction_id) AS transaction_count,
   ROUND(AVG(amount),2) AS avg_transaction_amount,
   MAX(amount) AS max_transaction_amount
 FROM sprint3_gold.fact_transactions_optimized
 WHERE declined = 0
 GROUP BY user_id
 HAVING total_spent > 500
)
SELECT
 u.user_id AS user_id,
 u.name AS nom_complet,
 u.email AS email,
 v.transaction_count AS num_compres,
 v.avg_transaction_amount AS tiquet_mig,
 v.max_transaction_amount AS max_compra,
 v.total_spent AS total_gastat
FROM sprint3_silver.users_combined u
INNER JOIN VIP_Stats v ON u.user_id = v.user_id
ORDER BY total_gastat DESC;