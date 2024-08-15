-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
*,
SUM(weight) OVER(ORDER BY turn) AS rolling_sum
FROM Queue)

SELECT
person_name
FROM cte WHERE rolling_sum <=1000 
ORDER BY rolling_sum DESC LIMIT 1
