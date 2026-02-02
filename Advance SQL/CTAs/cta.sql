select CustomerID,
(COALESCE(firstname, '') + ' ' + COALESCE(lastname, '')) as FullName,
Country
into Sales.NewInfo
-- To create temporary table we use :-
-- into #Sales.NewInfo
from Sales.Customers

SELECT * from Sales.NewInfo

-- Delete rows from temporary table
DELETE FROM #NewInfo
WHERE OrderStatus = 'Delivered'

-- To store it as a permanent table
SELECT *
INTO Sales.Info
FROM #NewInfo