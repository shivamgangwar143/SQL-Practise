/* 
with CTE_name as (
    select abc
    from table_name
    where condition
union all
    select abc
    from CTE_name
    where terminating_condition
)
*/

-- Generate a sequence of numbers from 1 to 20
WITH CTE_generate AS(
    SELECT 1 AS MyNumber

UNION ALL
    SELECT MyNumber+1
    FROM CTE_generate
    WHERE MyNumber <>20
)
SELECT *
FROM CTE_generate

