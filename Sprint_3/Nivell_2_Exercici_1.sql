CREATE OR REPLACE TABLE `sprint3-analytics-adnan-507517.sprint3_silver.products_clean` AS
SELECT
  id AS product_id,
  product_name AS name,
  CAST(REPLACE(warehouse_id, 'WH-', '') AS INT64) AS warehouse_id,
  price, -- price ja és un float a products_raw, per tant no fa falta cap conversió
  colour,
  weight,
  category,
  brand,
  cost,
  launch_date
FROM `sprint3-analytics-adnan-507517.sprint3_bronze.products_raw`;