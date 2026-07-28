-- Mostra totes les transaccions realitzades per empreses d'Alemanya.
USE transactions;
SELECT t.*
FROM transaction t
WHERE t.company_id IN 
	(SELECT c.id
     FROM company c
     WHERE c.country = "Germany")