WITH months AS (
    SELECT 
        a.owner_id, 
        COUNT(DISTINCT savings_id) AS total_transactions, 
        PERIOD_DIFF(DATE_FORMAT(CURDATE(), '%Y%m'), DATE_FORMAT(b.date_joined, '%Y%m')) + 1 AS total_months
    FROM savings_savingsaccount a
    JOIN users_customuser b ON a.owner_id = b.id
    GROUP BY a.owner_id, b.date_joined
),

averages AS (
    SELECT 
        owner_id,
        total_transactions,
        total_months,
        ROUND(total_transactions / total_months, 2) AS average_transactions
    FROM months
),

categories AS (
    SELECT 
        owner_id,
        average_transactions,
        CASE 
            WHEN average_transactions >= 10 THEN 'High frequency'
            WHEN average_transactions >= 3 THEN 'Medium frequency'
            ELSE 'Low frequency'
        END AS frequency_category
    FROM averages
)

SELECT 
    frequency_category, 
    COUNT(*) AS customer_count, 
    ROUND(AVG(average_transactions), 2) AS avg_transactions_per_month
FROM categories
GROUP BY frequency_category;
