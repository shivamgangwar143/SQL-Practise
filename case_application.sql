-- Retrieve customer details with abbreviated country code
SELECT CustomerID,
FirstName,
case when Country='Germany' then 'Germ'
when Country='USA'then 'US'
end countryName
from Sales.Customers

--OR

SELECT CustomerID,
FirstName,
case Country
when 'Germany' then 'Germ'
when 'USA'     then 'US'
end countryName
from Sales.Customers

-- Find the average score of customers and treat Null as 0
-- Addditionally provide details like CustomerID and LastName

SELECT CustomerID,
LastName,
AVG(case when Score is null then 0
else score
end) OVER () AverageCustomerClean,
AVG(Score) OVER () AvgSCore
from Sales.Customers





/*SELECT EmployeeID,
FirstName,
case when Gender='M' then 'Male'
else 'Female'
END Gender
FROM Sales.Employees */