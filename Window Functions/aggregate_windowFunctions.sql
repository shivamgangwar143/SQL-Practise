-- Find the total numbers of orders for each customer
-- Addtionally provide details such as orderID and OrderDate

SELECT Score,
SUM(Score) OVER(partition by CustomerID) TotalOrders,
COUNT(*) OVER() TotalSCore,
COUNT(Score) OVER() NewTotalScore,
CustomerID

FROM Sales.Customers