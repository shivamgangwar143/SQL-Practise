-- Find average sales across all products
-- Find average sales for each product
-- Additionally provide detills such as OrderID, OrderDate
/*
SELECT OrderID,
OrderDate,
ProductID,
Sales,
AVG(sales) OVER(),
AVG(Sales) OVER(partition by ProductID)
from Sales.Orders


-- Find average scores of customers
-- Additionally provide details such as CustomerID and LastName

SELECT CustomerID,
LastName, 
Score,
AVG(score) OVER() as avg,
AVG(coalesce(Score, 0)) OVER() as NewAvgScore
from Sales.Customers
*/

-- Find all the orders where sales is higher than the average sales across all oders
SELECT OrderID,
Sales
from(
SELECT OrderID, 
Sales,
AVG(coalesce(Sales, 0)) OVER() as AvgSales
from Sales.Orders)t 
where Sales> AvgSales
