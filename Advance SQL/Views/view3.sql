-- Create a view that combines data from orders, products, customers and employees table
CREATE VIEW Sales.combined_data AS(
    SELECT 
    o.OrderID,
    o.OrderDate,
    o.Quantity,
    o.Sales,
    p.ProductID,
    p.Product,
    p.Price,
    c.CustomerID,
    c.FirstName,
    e.EmployeeID,
    e.FirstName as Sales_name,
    e.Department,
    e.Salary
    from Sales.Orders o
    left join Sales.Products p
    on p.ProductID = o.ProductID
    left join Sales.Customers c
    on c.CustomerID = o.CustomerID
    left join Sales.Employees e
    on e.EmployeeID = o.SalesPersonID
)
SELECT 
CustomerID,
FirstName,
OrderID,
OrderDate,
ProductID,
Product,
Price
from Sales.combined_data