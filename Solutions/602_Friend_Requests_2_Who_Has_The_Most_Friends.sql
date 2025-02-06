-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
requester_id, accepter_id
FROM RequestAccepted

UNION ALL

SELECT accepter_id, requester_id
FROM RequestAccepted)

SELECT
requester_id AS id, COUNT(accepter_id) AS num
FROM cte
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
