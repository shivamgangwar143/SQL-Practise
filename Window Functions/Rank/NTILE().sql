--NTEL():- Diveds the rows into specified number of approxomately equal groups(Buckets)
/*
SELECT OrderID,
Sales,
NTILE(3) OVER(order by Sales desc)
from Sales.Orders
*/
-- Segment all orders into three categories : High, medium and low sales
WITH div AS (
SELECT OrderID,
ProductID,
Sales,
NTILE(3) OVER(order by sales) as SalesDiv
FROM Sales.Orders)
SELECT OrderID,
ProductID,
case when SalesDiv=1 then 'Low'
when SalesDiv=2 then 'Medium'
else 'High'
END Priority
from div