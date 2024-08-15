-- Write your PostgreSQL query statement belo
-- Took a lot of time to solve.
SELECT
product_id, 10 AS price
FROM Products
GROUP BY 1 HAVING MIN(change_date) > '2019-08-16'
UNION
SELECT
product_id, new_price AS price
FROM Products WHERE (product_id,change_date) IN 
(SELECT product_id, MAX(change_date) AS last_change_date
FROM products
WHERE change_date <= '2019-08-16'
GROUP BY 1)


