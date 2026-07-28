-- Crea una nova taula que reflecteixi l'estat de les targetes de crèdit basat en 
-- si les tres últimes transaccions han estat declinades aleshores és inactiu, 
-- si almenys una no és rebutjada aleshores és actiu. 
-- Partint d’aquesta taula respon: Quantes targetes estan actives?
CREATE TABLE IF NOT EXISTS estat_targetes AS
SELECT DISTINCT t.card_id, 
	IF((SELECT SUM(temp.declined)
		FROM (
			SELECT declined
			FROM transactions
			WHERE card_id = t.card_id
			ORDER BY timestamp DESC LIMIT 3) as temp ) = 3,
        'inactiu',
        'actiu') AS estat
FROM transactions t;

SELECT COUNT(*)
FROM estat_targetes 
WHERE estat = 'actiu';