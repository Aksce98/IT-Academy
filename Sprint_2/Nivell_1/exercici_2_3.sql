-- Identifica la companyia amb la mitjana més gran de vendes.
USE transactions;
SELECT c.id, c.company_name, AVG(t.amount) AS mitjana_preu_venut
FROM transaction t
INNER JOIN company c ON t.company_id = c.id
WHERE t.declined = 0
GROUP BY c.id, c.company_name
ORDER BY mitjana_preu_venut DESC
LIMIT 1;