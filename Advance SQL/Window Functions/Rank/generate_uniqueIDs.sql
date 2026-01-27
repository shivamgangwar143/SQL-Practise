-- Assign unique IDs to the rows of the 'Orders Archieve' table
SELECT ROW_NUMBER() OVER(ORDER BY OrderID, OrderDate) as UniqueID,
*
FROM Sales.OrdersArchive