-- Des de quants països es generen les vendes.
USE transactions;
SELECT COUNT(DISTINCT c.country) AS paises_con_ventas
FROM company c
INNER JOIN transaction t ON t.company_id = c.id
WHERE t.declined = 0;