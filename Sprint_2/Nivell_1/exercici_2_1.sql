-- Llistat dels països que estan generant vendes.
USE transactions;
SELECT DISTINCT c.country
FROM company c
INNER JOIN transaction t ON t.company_id = c.id
WHERE t.declined = 0;