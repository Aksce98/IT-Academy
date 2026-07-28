-- Mostra la mitjana d'amount per IBAN de les targetes de crèdit a la companyia Donec Ltd, utilitza almenys 2 taules.
SELECT cc.iban, AVG(t.amount) AS mitjana_amount
FROM transactions t
INNER JOIN credit_cards cc ON t.card_id = cc.id
INNER JOIN companies c ON t.business_id = c.company_id
WHERE c.company_name = "Donec Ltd" AND t.declined = FALSE
GROUP BY cc.iban
ORDER BY mitjana_amount DESC