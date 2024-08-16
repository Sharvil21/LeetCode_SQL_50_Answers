-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
*, ROW_NUMBER() OVER(ORDER BY id DESC) AS row_num
FROM
Seat
ORDER BY id ASC)

SELECT
CASE WHEN row_num = 1 AND id %2 <> 0 THEN id
WHEN id%2 = 0 THEN id-1
WHEN id%2 <> 0 THEN id+1 END AS id, student
FROM cte
ORDER BY 1 ASC;
