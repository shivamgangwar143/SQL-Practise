-- Identify the customers who have no scores

SELECT CustomerID, FirstName, Score
from Sales.Customers
where score is not null