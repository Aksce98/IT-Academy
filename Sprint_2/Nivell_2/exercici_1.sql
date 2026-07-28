-- Identifica els cinc dies que es va generar la quantitat més gran d'ingressos a l'empresa per vendes. 
-- Mostra la data de cada transacció juntament amb el total de les vendes.
SELECT DATE (t.timestamp) as dia, SUM(t.amount) as total_ingressos
FROM transactions t
WHERE t.declined = FALSE
GROUP BY dia
ORDER BY total_ingressos DESC LIMIT 5;