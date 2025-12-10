-- List all details for customers who have not placed any order
SELECT c.CustomerID, c.FirstName, o.OrderID
from sales.Customers c 
LEFT JOIN sales.Orders o 
ON c.CustomerID = o.CustomerID
WHERE o.OrderID is NULL