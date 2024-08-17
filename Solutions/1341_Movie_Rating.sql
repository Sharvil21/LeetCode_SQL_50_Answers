-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT
name, user_id, DENSE_RANK() OVER(ORDER BY COUNT(movie_id) DESC, MIN(name) ASC) AS rnk
FROM Movies
JOIN MovieRating USING(movie_id)
JOIN Users USING(user_id)
GROUP BY 1,2),

cte2 AS (SELECT
title, DENSE_RANK() OVER(ORDER BY AVG(rating)DESC, MIN(title) ASC) AS rnk
FROM Movies
JOIN MovieRating USING(movie_id)
WHERE EXTRACT(MONTH FROM created_at) = 02 AND EXTRACT(YEAR FROM created_at) = 2020
GROUP BY 1)

SELECT
name AS results
FROM cte1 WHERE rnk = 1
UNION ALL
SELECT
title AS results FROM cte2 WHERE rnk = 1 
ORDER BY 1 ASC
LIMIT 2
