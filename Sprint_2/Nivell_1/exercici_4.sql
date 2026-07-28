CREATE TABLE IF NOT EXISTS credit_card (
	id VARCHAR(15) PRIMARY KEY,
	iban VARCHAR(50),
    pan VARCHAR(25), 
    pin VARCHAR(4),
    cvv VARCHAR(4), 
    expiring_date VARCHAR(10)
);

ALTER TABLE transaction
ADD CONSTRAINT credit_card_id
FOREIGN KEY (credit_card_id) REFERENCES credit_card(id);