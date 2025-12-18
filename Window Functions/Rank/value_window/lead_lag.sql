-- Analyse the Month-Over_Month(MoM) performance by finding the percentage in sale between the current and previous month
/*
WITH change AS(
SELECT 
MONTH(OrderDate) as OrderMonth,
SUM(Sales) as CurrentMonthSales,
LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) as PreviousMonthSales
from Sales.Orders
GROUP BY MONTH(OrderDate)
)
SELECT *,
CurrentMonthSales-PreviousMonthSales as Mom_change,
ROUND(CAST((CurrentMonthSales-PreviousMonthSales) AS FLOAT)/PreviousMonthSales*100,2) as Percent_MoM_change
from change
*/

--Customer Retension Analysis
--Analyse customer loyalty by ranking based on their average number of days between orders
WITH cte AS (
  SELECT
    CustomerID,
    OrderDate,
    LEAD(OrderDate) OVER (
      PARTITION BY CustomerID
      ORDER BY OrderDate, OrderID
    ) AS NextOrderDate
  FROM Sales.Orders
)
SELECT
  CustomerID,
  AVG(DATEDIFF(day, OrderDate, NextOrderDate)) AS Avg_days,
  RANK() OVER(ORDER BY AVG(DATEDIFF(day, OrderDate, NextOrderDate))) as Rank
FROM cte
GROUP BY CustomerID;

-- Another logic

SELECT CustomerID,
AVG(Differnce_in_days) as Avg_days,
RANK() OVER(ORDER BY AVG(Differnce_in_days)) as Rank
FROM(
SELECT CustomerID,
OrderID,
OrderDate,
LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) as NextOrderDate,
DATEDIFF(day, OrderDate, LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) as Differnce_in_days
from Sales.Orders
)t

GROUP BY CustomerID