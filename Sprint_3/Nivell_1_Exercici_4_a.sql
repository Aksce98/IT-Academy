-- Write an SQL query to create a new table called transactions_raw_native in the sprint3_bronze dataset. It should contain all data from the transactions_raw table. Use "CREATE OR REPLACE TABLE" so that it can be executed more than once without errors.
CREATE OR REPLACE TABLE
  `sprint3-analytics-adnan-507517`.`sprint3_bronze`.`transactions_raw_native` AS
SELECT
  id,
  card_id,
  business_id,
  timestamp,
  amount,
  declined,
  product_ids,
  user_id,
  lat,
  longitude
FROM
  `sprint3-analytics-adnan-507517`.`sprint3_bronze`.`transactions_raw`;