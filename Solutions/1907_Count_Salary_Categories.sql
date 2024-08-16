-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT account_id,
CASE WHEN income < 20000 THEN 'Low Salary'
WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
WHEN income > 50000 THEN 'High Salary' END AS category
FROM Accounts
UNION SELECT NULL, 'Low Salary'
UNION SELECT NULL, 'Average Salary'
UNION SELECT NULL, 'High Salary'
)
SELECT
category, COUNT(account_id) AS accounts_count
FROM cte1
GROUP BY 1


