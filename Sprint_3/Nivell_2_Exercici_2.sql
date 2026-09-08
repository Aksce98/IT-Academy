CREATE OR REPLACE TABLE `sprint3_silver.transactions_clean` AS
SELECT
  -- Estandardització de Noms
  id AS transaction_id,
  -- Camps que es conserven intactes de forma directa
  card_id,
  business_id,
  timestamp,
  -- Robustesa en Imports
  IFNULL(SAFE_CAST(amount AS FLOAT64), 0.0) AS amount,
  declined,
  -- Desglose de Productos
  ARRAY(
    SELECT SAFE_CAST(TRIM(id_item) AS INT64) 
    FROM UNNEST(SPLIT(product_ids, ',')) AS id_item
  ) AS product_ids,
  user_id,
  -- Coordenades
  SAFE_CAST(lat AS FLOAT64) AS lat,
  SAFE_CAST(longitude AS FLOAT64) AS longitude
FROM `sprint3_bronze.transactions_raw_native`;