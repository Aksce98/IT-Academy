SET GLOBAL local_infile = 1;

CREATE DATABASE IF NOT EXISTS bancs;
USE bancs;

CREATE TABLE IF NOT EXISTS users (
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    surname VARCHAR(100),
    phone VARCHAR(30),
    email VARCHAR(200),
    birth_date VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    postal_code VARCHAR(50),
    address VARCHAR(200),
    signup_date DATE,
    user_segment VARCHAR(50),
    income_band VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS companies (
	company_id VARCHAR(15) NOT NULL PRIMARY KEY,
	company_name VARCHAR(100),
	phone VARCHAR(30),
	email VARCHAR(200),
	country VARCHAR(50),
	website VARCHAR(200),
	merchant_category VARCHAR(20),
	merchant_price_position VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS credit_cards (
	id VARCHAR(15) NOT NULL PRIMARY KEY,
	user_id	INT NOT NULL,
    iban VARCHAR(50),
	pan VARCHAR(20),
	pin VARCHAR(4),
	cvv VARCHAR(4),
	track1 VARCHAR(100),	
    track2 VARCHAR(100),
	expiring_date VARCHAR(50),
    card_type VARCHAR(20),
    card_renewal_flag BOOLEAN,
    CONSTRAINT fk_credit_cards_user_id FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS transactions (
	id VARCHAR(100) NOT NULL PRIMARY KEY,
    card_id VARCHAR(15),
    business_id VARCHAR(15),
    timestamp TIMESTAMP,
    amount DECIMAL(10, 2),
    declined BOOLEAN,
    product_ids VARCHAR(50),
    user_id INT,
    lat DOUBLE,
    longitude DOUBLE,
    discount_amount	DECIMAL(10, 2),
    tax_amount DECIMAL(10, 2),
    shipping_amount DECIMAL(10, 2),
    channel	VARCHAR(15),
    campaign_id	VARCHAR(30),
    device_type	VARCHAR(30),
    is_international BOOLEAN,
    decline_reason VARCHAR(500),
    distance_km DECIMAL(10,4),
    CONSTRAINT fk_transactions_card_id FOREIGN KEY (card_id) REFERENCES credit_cards(id),
    CONSTRAINT fk_transactions_business_id FOREIGN KEY (business_id) REFERENCES companies(company_id),
    CONSTRAINT fk_transactions_user_id FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS products (
	id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(100),
    price VARCHAR(20),
    colour VARCHAR(7),
    weight DECIMAL(10,2),
    warehouse_id VARCHAR(10),
    category VARCHAR(30),
    brand VARCHAR(30),
    cost VARCHAR(20),
    launch_date DATE
);


LOAD DATA LOCAL INFILE 'C:/Users/formacio/Downloads/N1-Ex.8__american_users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	id,
    name,
    surname,
    phone,
    email,
    birth_date,
    country,
    city,
    postal_code,
    address,
    signup_date,
    user_segment,
    income_band
);

LOAD DATA LOCAL INFILE 'C:/Users/formacio/Downloads/N1-Ex.8__european_users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	id,
    name,
    surname,
    phone,
    email,
    birth_date,
    country,
    city,
    postal_code,
    address,
    signup_date,
    user_segment,
    income_band
);

LOAD DATA LOCAL INFILE 'C:/Users/formacio/Downloads/N1-Ex.8__companies.csv'
INTO TABLE companies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	company_id,
    company_name,
    phone,
    email,
    country,
    website,
    merchant_category,
    merchant_price_position
);

LOAD DATA LOCAL INFILE 'C:/Users/formacio/Downloads/N1-Ex.8__credit_cards.csv'
INTO TABLE credit_cards
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	id,
    user_id,
    iban,
    pan,
    pin,
    cvv,
    track1,
    track2,
    expiring_date,
    card_type,
    card_renewal_flag
);

LOAD DATA LOCAL INFILE 'C:/Users/formacio/Downloads/N1-Ex.8__transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	id,
    card_id,
    business_id,
    timestamp,
    amount,
    declined,
    product_ids,
    user_id,
    lat,
    longitude,
    discount_amount,
    tax_amount,
    shipping_amount,
    channel,
    campaign_id,
    device_type,
    is_international,
    decline_reason,
    distance_km
);

LOAD DATA LOCAL INFILE 'C:/Users/formacio/Downloads/N1-Ex.8__products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
	id,
    product_name,
    price,
    colour,
    weight,
    warehouse_id,
    category,
    brand,
    cost,
    launch_date
);

UPDATE products
SET price = CAST(SUBSTRING(price, 2) AS DECIMAL)
WHERE id > 0;

ALTER TABLE products 
MODIFY COLUMN price DECIMAL(10,2);

UPDATE products
SET cost = CAST(SUBSTRING(cost, 2) AS DECIMAL)
WHERE id > 0;

ALTER TABLE products 
MODIFY COLUMN cost DECIMAL(10,2);