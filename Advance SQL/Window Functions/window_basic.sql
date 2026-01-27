-- Find total sales across all orders
/*
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


-- Find the total sales for each product
-- Additionally provide details such as OrderID, OrderDate

SELECT OrderID,
ProductID,
OrderDate,
SUM(Sales) OVER(partition by ProductID) TotalSales
From Sales.Orders


-- Find total sales across all orders
-- Find the total sales for each product
-- Additionally provide details such as OrderID, OrderDate

SELECT OrderID,
ProductID,
OrderDate,
SUM(Sales) OVER() as TotalSalesByOrders,
SUM(Sales) OVER(partition by ProductID) as TotalSalesByProduct
From Sales.Orders
*/

-- Find the total sales for each combination of products and order status
SELECT OrderID,
OrderStatus,
ProductID,
OrderDate,
Sales,
--SUM(Sales) OVER(partition by ProductID,OrderStatus) as TotalSalesByOrders,
SUM(Sales) OVER(partition by ProductID) as TotalSalesByProduct
From Sales.Orders
GROUP BY ProductID,OrderStatus,OrderID,Sales,OrderDate

