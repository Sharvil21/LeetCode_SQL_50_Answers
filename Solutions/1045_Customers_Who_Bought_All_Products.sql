-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
customer_id, COUNT(DISTINCT product_key) AS keys_bought
FROM Customer 
LEFT JOIN PRODUCT USING(product_key)
GROUP BY 1)

SELECT
customer_id
FROM cte
WHERE keys_bought IN (SELECT COUNT(DISTINCT product_key) FROM Product) 
