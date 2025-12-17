-- Analyse the Month-Over_Month(MoM) performance by finding the percentage in sale between the current and previous month
SELECT CustomerID,
Sales,
OrderDate,
CreationTime,
CUME_DIST() OVER(ORDER BY Sales)
from Sales.Orders