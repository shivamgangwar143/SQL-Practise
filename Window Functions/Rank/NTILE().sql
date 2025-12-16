--NTEL():- Diveds the rows into specified number of approxomately equal groups(Buckets)
SELECT OrderID,
Sales,
NTILE(3) OVER(order by Sales desc)
from Sales.Orders