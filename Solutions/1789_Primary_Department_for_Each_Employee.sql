-- Write your PostgreSQL query statement below
WITH cte AS (SELECT
employee_id, COUNT(department_id) AS number_of_department_employee_belongs_to
FROM Employee
GROUP BY 1)

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y' OR employee_id IN (SELECT employee_id FROM cte WHERE number_of_department_employee_belongs_to = 1)*/

