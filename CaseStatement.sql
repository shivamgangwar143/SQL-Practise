-- Generate the report showing total sales for each category
-- High: If the sales>50
-- Medium: If the sales greater then 2o and less than 50
-- Low: If the sales is equal or lower than 20
-- show the result from low to high
/* SELECT sum(o.sales) as totalSales,
COUNT(*),
case when o.Sales>50 then 'High' 
when o.Sales BETWEEN 20 and 50 then 'Medium'
else 'Low'
END category
FROM Sales.Products p
JOIN Sales.Orders o
ON p.ProductID=o.ProductID
GROUP by case when o.Sales>50 then 'High' 
when o.Sales BETWEEN 20 and 50 then 'Medium'
else 'Low'
END
ORDER BY totalSales desc */

--OR
SELECT category,
SUM(Sales) as totalSales
FROM
(
SELECT OrderID, 
Sales,
case when Sales>50 then 'High' 
when Sales BETWEEN 20 and 50 then 'Medium'
else 'Low'
END category
from sales.Orders
)t 
GROUP BY category
ORDER by totalSales DESC
