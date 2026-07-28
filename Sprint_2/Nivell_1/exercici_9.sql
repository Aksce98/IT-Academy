-- Realitza una subconsulta que mostri tots els usuaris amb més de 80 transaccions utilitzant almenys 2 taules.
SELECT u.id, u.name, u.surname
FROM users u
WHERE u.id IN (
	SELECT t.user_id
	FROM transactions t
	WHERE t.declined = FALSE
	GROUP BY t.user_id
	HAVING COUNT(*) > 80 )