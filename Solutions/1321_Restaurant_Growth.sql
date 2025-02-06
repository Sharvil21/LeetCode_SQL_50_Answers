-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT
visited_on, SUM(amount) AS amount
FROM Customer
GROUP BY 1
ORDER BY 1 ASC),
cte2 AS (
SELECT
visited_on,
SUM(amount) OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
ROUND(1.0*AVG(amount) OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount,
LAG(visited_on,6) OVER() AS day_window
FROM cte1
ORDER BY 1)

SELECT
visited_on, amount, average_amount 
FROM cte2 WHERE day_window IS NOT NULL;
