-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
id, num, LEAD(num,1) OVER() AS next_number, LEAD(num,2) OVER() AS next_number_2
FROM Logs)

SELECT DISTINCT num AS ConsecutiveNums
FROM cte WHERE num = next_number AND num = next_number_2
