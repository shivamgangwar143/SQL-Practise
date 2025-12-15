--TOP-N Analysis
-- Find the top highest sale for each product
/*
SELECT OrderID,
ProductID,
CustomerID,
Sales
FROM (
SELECT OrderID,
ProductID,
CustomerID,
Sales,
ROW_NUMBER() OVER(PARTITION BY ProductID order by Sales desc) as SalesRank
FROM Sales.Orders
)t
WHERE SalesRank=1


-- BOTTOM-N Analysis
-- Find the lowest 2 customers based on their total sales

SELECT OrderID,
ProductID,
CustomerID,
FROM (
SELECT OrderID,
ProductID,
CustomerID,
SUM(Sales),
ROW_NUMBER() OVER(PARTITION BY CustomerID order by Sales) as SalesRank
FROM Sales.Orders
GROUP BY CustomerID
)t
WHERE SalesRank <=2
*/