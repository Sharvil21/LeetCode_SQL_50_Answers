-- Write your PostgreSQL query statement below
SELECT
a.product_id, CASE WHEN SUM(units) IS NOT NULL THEN ROUND(1.0*SUM(price*units)/SUM(units),2) ELSE 0 END AS average_price
FROM Prices a
LEFT JOIN UnitsSold b
ON a.product_id = b.product_id
AND b.purchase_date BETWEEN a.start_date AND a.end_date
GROUP BY 1
