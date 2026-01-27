-- Use Rank with GROUP BY
-- Rank customers based on there total sales

SELECT CustomerID,
SUM(Sales) as TotalSales,
RANK()OVER (ORDER BY SUM(Sales) desc) AS RankCustomers
from Sales.Orders
GROUP BY CustomerID