-- Calculate the moving average of sales of each product over time
/*
SELECT OrderID,
ProductID,
OrderDate,
Sales,
AVG(sales) OVER(partition by ProductID) as Avg,
AVG(sales) OVER(partition by ProductID order by OrderDate) as MovingAvg
from Sales.Orders
*/

-- Calculate the moving average of sales of each product over time, including only the next order
SELECT OrderID,
ProductID,
OrderDate,
Sales,
AVG(sales) OVER(partition by ProductID) as Avg,
AVG(sales) OVER(partition by ProductID order by OrderDate rows between current row and 1 following ) as MovingAvg
from Sales.Orders