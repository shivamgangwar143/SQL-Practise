-- Show the employees with the highest salaries
/*
SELECT *,
FirstName+' '+LastName FullName
FROM(
SELECT *,
MAX(Salary) OVER() MaxSal
FROM Sales.Employees
)t
WHERE Salary = MaxSal
*/
-- Calculate the deviation of each sale from both minimum and maximum sales amount
SELECT OrderID,
Sales,
MIN(Sales) OVER() as MinSales,
MAX(Sales) OVER() as MaxSales,
MAX(Sales) OVER() - Sales as DeviationFromMax,
Sales - MIN(Sales) OVER() as DeviationFromMin
FROM Sales.Orders