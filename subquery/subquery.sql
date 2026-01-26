/* Products which have price greater than the average price
SELECT ProductID,
       Product
 from 
(
    select AVG(Price) OVER() as avg_price,
    Price,
    ProductID,
    Product
    from Sales.Products
)
as t
where Price> avg_price


-- Rank the customers based on their amount of sales
select CustomerID,
total_sales,
RANK() OVER(ORDER BY total_sales desc) as Rank
FROM
(
    select CustomerID,
    SUM(Sales) as total_sales
    from Sales.Orders
    GROUP BY CustomerID
)t 
*/

-- Show the product ids, product names, prices, and the total number of orders
SELECT ProductID,
Product as product_name,
Price,
(select COUNT(*) from Sales.Orders) as Total_orders
from Sales.Products
