SELECT OrderID,
    CreationTime,
    'Day'+ ' '+
FORMAT(CreationTime,'ddd MMM')+ ' '+'Q'+
DATENAME(QUARTER, CreationTime)+ ' '+
FORMAT(CreationTime,'yyyy hh:mm:ss tt') AS customFormat
from Sales.Orders