-- Write your PostgreSQL query statement below
SELECT
a.employee_id, a.name, COUNT(COALESCE(a.reports_to,0)) AS reports_count, ROUND(AVG(b.age),0) AS average_age
FROM Employees a
JOIN Employees b
ON a.employee_id = b.reports_to
GROUP BY 1,2
ORDER BY 1;
