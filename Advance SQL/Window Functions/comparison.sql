SELECT ProductID,
OrderID,
Sales,
SUM(Sales) OVER(partition by ProductID) as TotalSales,
SUM(Sales) OVER() as TotalSales,
round(CAST(Sales as float)/SUM(Sales) OVER() *100, 2) as PercentContri

from Sales.Orders