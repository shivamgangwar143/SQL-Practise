SELECT * from Sales.Orders
SELECT * from Sales.OrdersArchive
SELECT * from Sales.Customers
SELECT * from Sales.Employees
select o.CustomerID,
    c.FirstName,
    p.Product as Product_Name,
    p.Category,
    p.Price,
    e.Department,
    e.FirstName,
    e.Salary

from Sales.Orders as o 
left join Sales.Customers as c on o.CustomerID = c.CustomerID
left join Sales.Products as p on o.ProductID = p.ProductID
LEFT join Sales.Employees as e on o.CustomerID = e.EmployeeID
