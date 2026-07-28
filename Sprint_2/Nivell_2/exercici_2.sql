-- Presenta el nom, telèfon, país, data i amount, d'aquelles empreses que van realitzar transaccions amb un valor comprès entre 350 i 400 euros 
-- i en alguna d'aquestes dates: 29 d'abril del 2015, 20 de juliol del 2018 i 13 de març del 2024. Ordena els resultats de major a menor quantitat.
SELECT c.company_name, c.phone, c.country, t.timestamp, t.amount
FROM companies c
INNER JOIN transactions t ON t.business_id = c.company_id
WHERE (t.amount BETWEEN 350 AND 400) AND (DATE(t.timestamp) IN ('2015-04-29', '2018-07-20', '2024-03-13')) AND (t.declined = FALSE)
ORDER BY t.amount DESC;