-- CUME_DIST(): Calculates the distribution of the data points within a window
-- Find the products that fall within the highest 40% of prices
WITH perc as(
SELECT ProductID,
Product,
Price,
CUME_DIST() over (ORDER BY Price desc) dist
FROM Sales.Products)
SELECT ProductID,
Product,
Price,
CONCAT(dist*100,'%') as Percentage
from perc
WHERE dist<=0.4