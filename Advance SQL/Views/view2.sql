-- To make changes to a view which is already created 
-- In postgres we use Create OR Replace but in sql server we have to fiest drop the existing view and then make the new view with the desired changes
-- Using T-SQl
IF OBJECT_ID('Sales.cte_temp', 'V') IS NOT NULL
DROP VIEW Sales.cte_temp;
GO
CREATE VIEW Sales.cte_temp AS(
    SELECT 
    CustomerID,
    SUM(Sales) as Total_sales,
    COUNT(OrderID) as Total_order
    FROM Sales.Orders
    GROUP BY CustomerID
)