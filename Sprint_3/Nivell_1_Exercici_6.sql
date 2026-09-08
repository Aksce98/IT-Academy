SELECT 
    c.company_name AS nom, 
    c.country AS pais, 
    EXTRACT(DATE FROM t.timestamp) AS data_transaccio
FROM `sprint3-analytics-adnan-507517.sprint3_bronze.transactions_raw_native` AS t
INNER JOIN `sprint3-analytics-adnan-507517.sprint3_bronze.companies_raw` AS c ON t.business_id = c.company_id
WHERE t.amount BETWEEN 100 AND 200 AND EXTRACT(DATE FROM t.timestamp) IN ('2015-04-29', '2018-07-20', '2024-03-13')
ORDER BY data_transaccio DESC;