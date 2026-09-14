WITH first_3_purchases AS (
 SELECT
   user_id,
   amount,
   timestamp,
   ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp) AS row_num
 FROM sprint3_gold.fact_transactions_optimized
 WHERE declined = 0
 QUALIFY row_num <= 3
), user_metrics AS (
 SELECT
   user_id,
   MAX(CASE WHEN row_num = 3 THEN timestamp END) AS third_purchase_date,
   MAX(CASE WHEN row_num = 3 THEN amount END) AS third_purchase_amount,
   AVG(amount) AS average_first_3_purchases
 FROM first_3_purchases
 GROUP BY user_id
 HAVING COUNT(*) = 3
)


SELECT
 u.user_id,
 u.name,
 u.email,
 m.third_purchase_date,
 m.third_purchase_amount,
 m.average_first_3_purchases
FROM user_metrics m
JOIN sprint3_silver.users_combined u ON m.user_id = u.user_id;