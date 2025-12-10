WITH Orders AS (
    SELECT 1 Id, 'A' as Category UNION
    SELECT 2, NULL UNION
    SELECT 3, '' UNION
    SELECT 4, ' ' 
)
SELECT *,
DATALENGTH(TRIM(Category)) as length
from Orders