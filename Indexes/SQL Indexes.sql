--SQL Indexes
SELECT *
FROM Sales.DBCustomers
WHERE CustomerID = 1

CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID
ON Sales.DBCustomers (CustomerID)

CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID
ON Sales.DBCustomers (FirstName)

DROP INDEX idx_DBCustomers_CustomerID ON Sales.DBCustomers

SELECT 
*
FROM Sales.DBCustomers
WHERE LastName = 'Brown'

CREATE NONCLUSTERED INDEX idx_DBCustomers_LastName
ON Sales.DBCustomers (LastName)

SELECT 
*
FROM Sales.DBCustomers
WHERE FirstName = 'Anna'

CREATE  INDEX idx_DBCustomers_FastName
ON Sales.DBCustomers (FastName)


SELECT 
*
FROM Sales.DBCustomers
WHERE Country = 'USA' AND Score > 500


CREATE  INDEX idx_DBCustomers_CountryScore
ON Sales.DBCustomers (Country, Score)
