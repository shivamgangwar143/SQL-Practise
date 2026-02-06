/*
CREATE TRIGGER name On table_name
WHEN ----> after insert, update and delete
begin
what ----> sql statements 
end


create table Sales.EmployeeLogs (
    logId int PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    logMessage VARCHAR(255),
    logDate DATE

-- Creating trigger
CREATE TRIGGER trig_AfterInsertEmployee on Sales.Employees
AFTER INSERT
AS
    BEGIN 
    INSERT into Sales.EmployeeLogs (EmployeeID, logMessage, logDate)
        SELECT
        employeeID,
        'New Employee added ='+ CAST(EmployeeID as VARCHAR),
        GETDATE()
        from INSERTED
    END
    )
*/
select * from Sales.EmployeeLogs
INSERT into Sales.Employees
VALUES
(7, 'Maria', 'Doe', 'HR', '1988-01-12', 'F', 80000, 3)