-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
*, LEAD(event_date,1) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS next_log_in_date,
DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS rnk
FROM Activity)

SELECT
ROUND(1.0*COUNT(DISTINCT player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM cte
WHERE next_log_in_date IS NOT NULL AND rnk = 1 AND next_log_in_date - event_date = 1


