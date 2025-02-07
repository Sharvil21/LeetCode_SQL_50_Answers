-- Have to use Regular Expressions REGEX in this
-- Write your PostgreSQL query statement below
SELECT
*
FROM Users
WHERE mail ~* '^[A-Za-z][A-Za-z0-9_\.\-]*@leetcode\.com$'
