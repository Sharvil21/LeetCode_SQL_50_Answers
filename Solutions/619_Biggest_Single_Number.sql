-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT num, COUNT(num) AS total, DENSE_RANK() OVER(ORDER BY COUNT(num) ASC) as rnk
    FROM MyNumbers
    GROUP BY num
)
SELECT
MAX(CASE WHEN rnk = 1 AND total = 1 THEN num ELSE NULL END) AS num
FROM cte
