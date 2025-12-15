-- Rank the orders based on their sales from highest to lowest
SELECT *,
ROW_NUMBER() OVER(order by sales desc) as SaleseRank_Row,
RANK() OVER(order by sales desc) as SaleseRank_Rank,
DENSE_RANK() OVER(order by sales desc) as SaleseRank_DenseRank
from Sales.Orders

