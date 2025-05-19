WITH counts AS (
  SELECT 
    owner_id, 
    COUNT(CASE WHEN is_a_fund = 1 THEN id END) AS investment_count,
    COUNT(CASE WHEN is_regular_savings = 1 THEN id END) AS savings_count
  FROM plans_plan
  GROUP BY owner_id
),

amount AS (
  SELECT 
    owner_id, 
    ROUND(SUM(confirmed_amount)/100, 2) AS total_deposits
  FROM savings_savingsaccount
  GROUP BY owner_id
  HAVING SUM(confirmed_amount) > 0
)

SELECT 
  a.id, 
  CONCAT(a.first_name, ' ', a.last_name) AS name,
  b.savings_count, 
  b.investment_count,  
  c.total_deposits
FROM users_customuser a
JOIN counts b ON a.id = b.owner_id
JOIN amount c ON a.id = c.owner_id
WHERE b.investment_count > 0 
  AND b.savings_count > 0
ORDER BY c.total_deposits DESC;
