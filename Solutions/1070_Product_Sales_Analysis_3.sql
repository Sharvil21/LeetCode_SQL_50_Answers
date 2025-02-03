-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
    *, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year ASC) AS year_rnk
    FROM Sales
)

SELECT
product_id, year AS first_year, quantity, price
FROM cte
WHERE year_rnk = 1
