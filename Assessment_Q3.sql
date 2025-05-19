SELECT 
    a.id AS plan_id, 
    a.owner_id,
    CASE 
        WHEN a.is_regular_savings = 1 THEN 'Savings'
        WHEN a.is_a_fund = 1 THEN 'Investment'
    END AS type,
    MAX(b.transaction_date) AS last_transaction_date,
    DATEDIFF(NOW(), MAX(b.transaction_date)) AS inactivity_days
FROM 
    plans_plan a
LEFT JOIN 
    savings_savingsaccount b ON a.id = b.plan_id
WHERE 
    a.is_deleted = 0 
    AND (a.is_regular_savings = 1 OR a.is_a_fund = 1)
GROUP BY 
    a.id, a.owner_id, a.is_regular_savings, a.is_a_fund
HAVING 
    last_transaction_date IS NULL 
    OR inactivity_days > 365;
