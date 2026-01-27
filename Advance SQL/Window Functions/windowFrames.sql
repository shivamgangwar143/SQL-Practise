SELECT OrderID,
ProductID,
OrderDate,
OrderStatus,
Sales,
SUM(Sales) OVER(partition by OrderStatus order by OrderDate rows between current row and 2 following)
from Sales.Orders