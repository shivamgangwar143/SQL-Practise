-- Rank the orders based on their sales from highest to lowest
SELECT *,
ROW_NUMBER() OVER(order by sales desc) as SaleseRank_Row,
RANK() OVER(order by sales desc) as SaleseRank_Rank,
DENSE_RANK() OVER(order by sales desc) as SaleseRank_DenseRank
from Sales.Orders

-- Find the lowest 2 customers based on their total sales
SELECT *
FROM 
(
SELECT CustomerID,
SUM(Sales) as TotalSales,
ROW_NUMBER() OVER(ORDER BY SUM(Sales)) as RankCustomers
FROM Sales.Orders
GROUP BY CustomerID
)t
WHERE RankCustomers <=2