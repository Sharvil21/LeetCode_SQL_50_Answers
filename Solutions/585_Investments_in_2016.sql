-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT
tiv_2015, COUNT(*) AS total_times_tiv_repeated
FROM Insurance
GROUP BY 1),

cte2 AS (
SELECT
lat, lon, COUNT(*) AS total_times_loc_repeated
FROM Insurance
GROUP BY 1,2)

SELECT
ROUND(1.0*SUM(tiv_2016)::DECIMAL,2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (SELECT tiv_2015 FROM cte1 WHERE total_times_tiv_repeated > 1)
AND (lat,lon) NOT IN (SELECT lat,lon FROM cte2 WHERE total_times_loc_repeated > 1)
