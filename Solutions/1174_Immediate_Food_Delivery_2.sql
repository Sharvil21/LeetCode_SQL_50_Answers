-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
*, DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date ASC) AS rnk
FROM Delivery)

SELECT
ROUND(100.0*(SELECT COUNT(*) FROM cte WHERE rnk = 1 AND order_date = customer_pref_delivery_date)/(SELECT COUNT(*) FROM cte WHERE rnk = 1),2)
AS immediate_percentage
