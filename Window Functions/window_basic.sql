-- Find total sales across all orders

SELECT ProductID,
SUM(Sales) TotalSales
from Sales.Orders
group by ProductID

--Using window function

SELECT ProductID,
OrderID,
OrderDate,
SUM(Sales) OVER () TotalSales
from Sales.Orders
ORDER BY ProductID

--OR
SELECT ProductID,
OrderID,
OrderDate,
SUM(Sales) OVER (partition by ProductID) TotalSales
from Sales.Orders
