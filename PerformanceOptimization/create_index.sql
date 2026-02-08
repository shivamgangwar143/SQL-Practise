-- create [clusterred | nonclustered] index index_name on table_name(column1, column2....)
create CLUSTERED INDEX idx_DBCustomers_Customers_ID on Sales.DBCustomers (CustomerID)

create NONCLUSTERED INDEX ix_Customers_City on Customers (City)
-- by default clustered
CREATE INDEX ix_Customers_Name on Customers (Last Name asc, FirstName desc)
-- To drop index
drop index index_name on table_name
-- Leftmost rule for multivalued index
/* if columns are A B C D
-- Index will be used:-
A
A B
A B C
-- index will not be used:-
B
A C
A B D
*/