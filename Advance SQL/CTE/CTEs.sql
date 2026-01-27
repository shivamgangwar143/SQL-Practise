-- Find the total sales per customers
with CTE_total_sale AS(
    SELECT CustomerID,
    SUM(sales) as total_sale
    from Sales.Orders
    GROUP BY CustomerID
),
--Find the last order date per customer
 CTE_last_order AS(
    select CustomerID,
    MAX(OrderDate) as last_orderDate
    from Sales.Orders
    GROUP BY CustomerID
),
-- Rank the customers based on their total sales
 CTE_rank AS(
    SELECT total_sale,
    CustomerID,
    RANK() OVER(ORDER BY total_sale desc) as Rank
    from CTE_total_sale
 ),

-- Segment the customers based on their total sales
 CTE_segment AS(
    SELECT CustomerID,
    case when total_sale > 100 then 'High'
    when total_sale > 50 then 'Medium'
    when total_sale <= 50 then 'Low'
    end Customer_Segment
    from CTE_total_sale
 )

-- Main query
SELECT c.CustomerID,
    c.FirstName,
    c.LastName,
    ts.total_sale,
    lo.last_orderDate,
    rn.Rank,
    sg.Customer_Segment
from Sales.Customers c 
LEFT JOIN CTE_total_sale ts 
ON c.CustomerID = ts.CustomerID
LEFT JOIN CTE_last_order lo 
on c.CustomerID = lo.CustomerID
LEFT JOIN CTE_rank rn 
ON c.CustomerID = rn.CustomerID
LEFT JOIN CTE_segment sg
ON c.CustomerID = sg.CustomerID