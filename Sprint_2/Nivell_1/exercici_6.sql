INSERT INTO company (id, company_name, phone, email, country, website)
	VALUES ('b-9999', 'Exercici_6', '06 12 34 56 78', 'exemple@exemple.com', 'Spain', 'https://itacademy.barcelonactiva.cat/');
INSERT INTO credit_card (id, iban, pan, pin, cvv, expiring_date)
	VALUES ('CcU-9999', 'TR301950312123576817638661', '5424465566813633', '1234', '123', '01/01/00');
INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined)
	VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A9DD', 'CcU-9999', 'b-9999', '9999', '829.999', '-117.999', '111.11', '0 ');