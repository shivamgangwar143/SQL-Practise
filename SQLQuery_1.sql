-- Dsiplay full names of customers in a single field
-- By merging there firstName and LastName
-- Add 10 bonus points to each customer
SELECT CustomerID, 
FirstName,
LastName,
FirstName+ ' '+ COALESCE(LastName, ' ') as FullName,
Score,
score+ 10 as NewScore,
COALESCE(score, 0),
COALESCE(score, 0)+ 10 NewBonusScore
from Sales.Customers