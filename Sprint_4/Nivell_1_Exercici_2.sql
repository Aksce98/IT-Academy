-- Pas 1: Generacio de Dades Recents (Mocking Data) 
CREATE OR REPLACE TABLE sprint3_silver.transactions_recent AS
SELECT
 * EXCEPT (timestamp),
 TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL CAST(RAND() * 50 AS INT64) DAY) AS timestamp
FROM `sprint3_silver.transactions_clean`;

-- Pas 2: Creacio de la Taula Optimitzada (Partitioning & Clustering) 
CREATE OR REPLACE TABLE sprint3_gold.fact_transactions_optimized
PARTITION BY DATE(timestamp)
CLUSTER BY business_id
AS
SELECT *
FROM sprint3_silver.transactions_recent;