-- Find the running total of sales for each customers
-- Using CTE
/*
WITH cte_temp AS(
    SELECT 
    CustomerID,
    SUM(Sales) as Total_sales
    FROM Sales.Orders
    GROUP BY CustomerID
)
SELECT
CustomerID,
SUM(Total_sales) OVER(ORDER BY CustomerID) as running_total
FROM cte_temp

-- Using views
CREATE VIEW Sales.cte_temp AS(
    SELECT 
    CustomerID,
    SUM(Sales) as Total_sales,
    COUNT(OrderID) as Total_order,
    SUM(Quantity) as Total_quantity
    FROM Sales.Orders
    GROUP BY CustomerID
)
*/
-- Using the view now
SELECT *
FROM cte_temp
