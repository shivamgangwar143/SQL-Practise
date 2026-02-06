ALTER PROCEDURE GetCustomerSummary
    @Country NVARCHAR(50) = 'USA'
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @TotalCustomers INT,
        @AvgScore FLOAT;

    BEGIN TRY

        -- Cleanup
        IF EXISTS (
            SELECT 1
            FROM Sales.Customers
            WHERE Score IS NULL
              AND Country = @Country
        )
        BEGIN
            PRINT 'Updating null scores to 0';

            UPDATE Sales.Customers
            SET Score = 0
            WHERE Score IS NULL
              AND Country = @Country;
        END
        ELSE
        BEGIN
            PRINT 'No null scores found';
        END;

        -- Summary
        SELECT
            @TotalCustomers = COUNT(*),
            @AvgScore = AVG(Score)
        FROM Sales.Customers
        WHERE Country = @Country;

        PRINT 'Total customers from ' + @Country + ': ' + CAST(@TotalCustomers AS NVARCHAR);
        PRINT 'Average score from ' + @Country + ': ' + CAST(@AvgScore AS NVARCHAR);

        -- Orders report (intentional error for TRY/CATCH testing)
        SELECT
            COUNT(o.OrderID) AS TotalOrders,
            SUM(o.Sales) AS TotalSales,
            1 / 0 AS ForceError
        FROM Sales.Orders o
        JOIN Sales.Customers c
            ON c.CustomerID = o.CustomerID
        WHERE c.Country = @Country;

    END TRY
    BEGIN CATCH
        PRINT 'An error occurred.';
        PRINT 'Error message: ' + ERROR_MESSAGE();
        PRINT 'Error number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error line: ' + CAST(ERROR_LINE() AS NVARCHAR);
        PRINT 'Error procedure: ' + ISNULL(ERROR_PROCEDURE(), 'N/A');
    END CATCH

END
GO


    EXEC GetCustomerSummary;
    EXEC GetCustomerSummary @Country='Germany';