-- La secció de màrqueting desitja tenir accés a informació específica per a realitzar anàlisi i estratègies efectives. 
-- S'ha sol·licitat crear una vista que proporcioni detalls clau sobre les companyies i les seves transaccions. 
-- Serà necessària que creïs una vista anomenada VistaMarketing que contingui la següent informació: 
-- Nom de la companyia. Telèfon de contacte. País de residència. Mitjana de compra realitzat per cada companyia. 
-- Presenta la vista creada, ordenant les dades de major a menor mitjana de compra.
CREATE OR REPLACE VIEW VistaMarketing AS
SELECT c.company_name, c.phone, c.country, AVG(t.amount) AS mitjana_de_compra
FROM companies c
INNER JOIN transactions t ON c.company_id = t.business_id
WHERE t.declined = FALSE
GROUP BY c.company_id, c.company_name, c.phone, c.country;
SELECT * FROM VistaMarketing
ORDER BY mitjana_de_compra DESC;