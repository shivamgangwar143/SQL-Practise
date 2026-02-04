alter procedure GetCustomerSummary @Country NVARCHAR(50)= 'USA' as
    begin 
    DECLARE @TotalCustomers INT, @AvgScore FLOAT;
-- Preparing & clean up dataselect 1 from Sales.Customers where Score is null and @Country = 'USA'
IF EXISTS (select 1 from Sales.Customers where Score is null and Country = @Country)
BEGIN
print 'Updating nulls into 0';
update Sales.Customers
set Score = 0
where Score is null and Country = @Country
END

ELSE
BEGIN
print 'No null scores are found';
END;

-- Generating report

    SELECT
    @TotalCustomers = COUNT(*),
    @AvgScore = SUM(Score)
    FROM Sales.Customers
    where Country = @Country;

    PRINT 'Total customers from '+ @Country+ ':'+ CAST(@TotalCustomers as NVARCHAR);
    PRINT 'Average score from'+ @Country+ ':'+ CAST(@AvgScore as NVARCHAR);

    SELECT
    COUNT(OrderID) as TotalOrders,
    SUM(Sales) as TotalSales,
    1/0
    FROM Sales.Orders o 
    JOIN Sales.Customers c 
    ON c.CustomerID = o.CustomerID
    WHERE c.Country = @Country

    END

    EXEC GetCustomerSummary;
    EXEC GetCustomerSummary @Country='Germany';

select * from Sales.Customers