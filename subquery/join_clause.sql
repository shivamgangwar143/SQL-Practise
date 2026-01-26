/*-- Show all customer details and find the total orders for each customers

WITH orders AS(
    SELECT CustomerID,
    COUNT(*) as total_orders
    from Sales.Orders
    GROUP BY CustomerID
)
SELECT c.*,
o.total_orders
FROM Sales.Customers c 
LEFT JOIN orders o
ON o.CustomerID = c.CustomerID


-- subqueries in where clause
-- Find the products that have price higher than the average price off all products

SELECT ProductID,
Product,
Price
FROM Sales.Products
WHERE Price>(select AVG(Price) FROM Sales.Products)


-- where clause in
-- Show the details of the orders made by the customers in Germany

SELECT *
FROM Sales.Orders
WHERE CustomerID IN (select CustomerID from Sales.Customers where Country='Germany') 
*/

-- Find the female employees whose salary are greater than any of the male employee
SELECT EmployeeID,
FirstName,
LastName
from Sales.Employees
WHERE Gender='F' AND Salary > ANY (select Salary FROM Sales.Employees where Gender='M') 