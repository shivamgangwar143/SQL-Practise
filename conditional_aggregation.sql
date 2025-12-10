-- Count how many times each customer has made an order greater than 30


SELECT CustomerID,
SUM(case when Sales>30 then 1
else 0
END) SalesFlag,
COUNT(*) TotalOrders
from Sales.Orders
group by CustomerID
