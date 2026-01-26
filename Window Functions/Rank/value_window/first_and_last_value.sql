-- Find the lowest and the highest sales for each product
SELECT ProductID,
Sales,
FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales) as LowestValue,
LAST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales rows between current row and unbounded following) as HighestValue,
-- Another logic
FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales desc) as HighestValue2,
--Another logic
MIN(Sales) OVER(PARTITION BY ProductID) as LowestValue3,
MAX(Sales) OVER(PARTITION BY ProductID) as HighestValue3,
---Difference between current and lowest sales
sales-FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales) as DIfference
FROM Sales.Orders