-- create [clusterred | nonclustered] index index_name on table_name(column1, column2....)
create CLUSTERED INDEX ix_Customers_ID on Customers (ID)

create NONCLUSTERED INDEX ix_Customers_City on Customers (City)
-- by default clustered
CREATE INDEX ix_Customers_Name on Customers (Last Name asc, FirstName desc)