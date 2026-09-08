CREATE OR REPLACE TABLE `sprint3_silver.users_combined` AS
SELECT 
  id AS user_id,
  name,
  surname,
  phone,
  email,
  birth_date,
  country,
  city,
  postal_code,
  address,
  'american' AS origin
FROM 
  `sprint3_bronze.american_users_raw`

UNION ALL

SELECT 
  id AS user_id,
  name,
  surname,
  phone,
  email,
  birth_date,
  country,
  city,
  postal_code,
  address,
  'european' AS origin
FROM 
  `sprint3_bronze.european_users_raw`;