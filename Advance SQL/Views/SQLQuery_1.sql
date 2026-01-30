WITH CTE_hierarchy AS (
    SELECT 
        EmployeeID,
        FirstName,
        ManagerID,
        1 AS level,
        CAST(EmployeeID AS VARCHAR(100)) AS path
    FROM Sales.Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.ManagerID,
        ceh.level + 1,
        CAST(ceh.path + ' → ' + CAST(e.EmployeeID AS VARCHAR(100)) AS VARCHAR(100))
    FROM Sales.Employees e
    JOIN CTE_hierarchy ceh
        ON e.ManagerID = ceh.EmployeeID
)
SELECT *
FROM CTE_hierarchy
ORDER BY level
OPTION (MAXRECURSION 100);

