-- Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.
SELECT DISTINCT t.company_id, c.company_name
FROM transaction t
JOIN company c ON t.company_id = c.id
WHERE t.declined = 0
GROUP BY t.company_id
HAVING MAX(t.amount) > (
	SELECT AVG(t1.amount) as amount_mitja_transaccions_realitzades
	FROM transaction t1
	WHERE t1.declined = 0 )