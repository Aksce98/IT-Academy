-- Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.
SELECT c.id, c.company_name
FROM company c
WHERE c.id NOT IN (
	SELECT DISTINCT t.company_id
    FROM transaction t 
    WHERE t.declined = 0 )