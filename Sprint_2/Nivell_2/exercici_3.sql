-- Necessitem optimitzar l'assignació dels recursos i dependrà de la capacitat operativa que es requereixi, 
-- per la qual cosa et demanen la informació sobre la quantitat de transaccions que realitzen les empreses, 
-- però el departament de recursos humans és exigent i vol un llistat de les empreses on especifiquis si 
-- tenen igual o més de 400 transaccions o menys.
SELECT t.business_id, COUNT(*) AS quanitat_transaccions, IF(COUNT(*) >= 400, 'Si', 'No') AS te_mes_de_400_transaccions
FROM transactions t
WHERE t.declined = FALSE
GROUP BY t.business_id;