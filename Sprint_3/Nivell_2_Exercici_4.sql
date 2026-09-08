CREATE OR REPLACE TABLE `sprint3_silver.companies_clean` AS
SELECT *
FROM `sprint3_bronze.companies_raw`;

CREATE OR REPLACE TABLE `sprint3_silver.credit_cards_clean` AS
SELECT 
  id AS card_id,
  * EXCEPT(id) -- Seleccionem la resta de columnes sense modificarles
FROM `sprint3_bronze.credit_cards_raw`;