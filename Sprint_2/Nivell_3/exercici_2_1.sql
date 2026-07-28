-- Crea una taula amb la qual puguem unir les dades de l'arxiu de products.csv amb la base de dades creada (ja que fins ara no podíem fer-ho)
-- tenint en compte que des de transaction tens product_ids. Genera la següent consulta:

-- Creem la taula per unir transaccio amb producte
CREATE TABLE transaction_product (
    transaction_id VARCHAR(100) NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (transaction_id, product_id),
    CONSTRAINT fk_transaction FOREIGN KEY (transaction_id) REFERENCES transactions(id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Inserim els valors a la nova taula
INSERT INTO transaction_product (transaction_id, product_id)
SELECT t.id, jt.product_id
FROM transactions t
JOIN JSON_TABLE( -- creem una taula virtual
	-- Eliminem els espais i concatenem '1, 2, 3' -> [1,2,3]
    CONCAT('[', REPLACE(t.product_ids, ' ', ''), ']'),
    -- $[*] fa que iterem sobre cada element de la columna product_ids separat per commas
    -- COLUMNS li dona el nom 'product_id' a la columna de l'element sobre el que iterem
    '$[*]' COLUMNS(product_id INT PATH '$') 
) AS jt
WHERE t.product_ids IS NOT NULL AND t.product_ids != '';

-- Eliminem la columa product_ids de la taula transactions
ALTER TABLE transactions DROP COLUMN product_ids;