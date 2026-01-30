/* 
with CTE_name as (
    select abc
    from table_name
    where condition
union all
    select abc
    from CTE_name
    where terminating_condition
)

-- Generate a sequence of numbers from 1 to 20
WITH CTE_generate AS(
    SELECT 1 AS MyNumber

UNION ALL
    SELECT MyNumber+1
    FROM CTE_generate
    WHERE MyNumber <1000
)
SELECT *
FROM CTE_generate
OPTION(MAXRECURSION 5000)
*/

-- Show employee hierarchy by displaying each level within the organisation
WITH CTE_hierarchy AS(
-- Anchor query
SELECT 
EmployeeID,
FirstName,
ManagerID,
1 AS level
FROM Sales.Employees
WHERE ManagerID IS NULL
-- Recursive query
UNION ALL
SELECT e.EmployeeID,
e.FirstName,
e.ManagerID,
level+1
FROM Sales.Employees AS e
INNER JOIN CTE_hierarchy ceh
ON e.ManagerID = ceh.EmployeeID
)

SELECT *
FROM CTE_hierarchy
