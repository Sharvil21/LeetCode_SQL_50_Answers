-- Write your PostgreSQL query statement below
SELECT
project_id, ROUND(AVG(1.0*experience_years),2) AS average_years
FROM Project
JOIN Employee
USING(employee_id)
GROUP BY 1
