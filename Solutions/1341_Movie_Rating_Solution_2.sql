-- Write your PostgreSQL query statement below
-- Round brackets are required when using LIMIT before UNION ALL otherwise it gives an error
 
(SELECT
name AS results
FROM Movies
JOIN MovieRating USING(movie_id)
JOIN Users USING(user_id)
GROUP BY name
ORDER BY COUNT(movie_id) DESC, MIN(name) ASC LIMIT 1)

UNION ALL

(SELECT
title
FROM Movies
JOIN MovieRating USING(movie_id)
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 1
ORDER BY AVG(rating) DESC, MIN(title) ASC
LIMIT 1)
