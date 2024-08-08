-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT
a.id, a.name, a.managerid, b.name AS manager_name
FROM Employee a
JOIN Employee b ON a.managerId = b.id),
cte2 AS (SELECT managerid, manager_name, COUNT(managerid) AS cnt FROM cte1
GROUP BY 1,2)

SELECT manager_name AS "name" FROM cte2
WHERE cnt > 4
