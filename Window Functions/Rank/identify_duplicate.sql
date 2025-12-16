-- Identify duplicate rows in the table 'OrdersArchive' and return the clean result without any duplicates
with cte as (SELECT 
ROW_NUMBER() OVER(partition by OrderID ORDER BY CreationTime desc) rn,
*
FROM Sales.OrdersArchive)
SELECT *
FROM cte
WHERE rn>1