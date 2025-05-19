SELECT 
    a.id AS customer_id, 
    CONCAT(a.first_name, ' ', a.last_name) AS name,
    TIMESTAMPDIFF(MONTH, a.created_on, NOW()) AS tenure_months,
    ROUND(SUM(b.confirmed_amount) / 100,2) AS total_transactions,
    ROUND(
        (
            (SUM(b.confirmed_amount) / 100) / NULLIF(TIMESTAMPDIFF(MONTH, a.created_on, NOW()), 0)
        ) * 12 * 0.001, 
        2
    ) AS estimated_clv
FROM 
    users_customuser a
JOIN 
    savings_savingsaccount b ON a.id = b.owner_id
GROUP BY 
    a.id, a.first_name, a.last_name
ORDER BY 
    estimated_clv DESC;
