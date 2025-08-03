--SQL SET Operators: UNION, UNION ALL, EXCEPT (MINUS), INTERSECT
SELECT 
	CustomerID AS ID,
	FirstName,
	LastName
FROM Sales.Customers

UNION

SELECT
	EmployeeID,
	FirstName,
	LastName
FROM Sales.Employees;

-- Combine the data from employees and customers into one table.
SELECT 
	FirstName,
	LastName
FROM Sales.Customers
UNION
SELECT
	FirstName,
	LastName
FROM Sales.Employees;

--UNION ALL
-- Combine the data from employees and customers into one table, including duplictes

SELECT 
	FirstName,
	LastName
FROM Sales.Customers
UNION ALL
SELECT
	FirstName,
	LastName
FROM Sales.Employees;

-- EXCEPT
-- Find the employees who are not customers at the same time
SELECT 
	FirstName,
	LastName
FROM Sales.Customers
EXCEPT
SELECT
	FirstName,
	LastName
FROM Sales.Employees;

--INTERSECT
--Find the Employees,who are also customers
SELECT 
	FirstName,
	LastName
FROM Sales.Customers
INTERSECT
SELECT
	FirstName,
	LastName
FROM Sales.Employees;

/* Orders data are stored in separte tables(orders and ordersArchive).
Combine all orders data into one repoer without duplicates.*/

SELECT
	'Orders' AS SourceTable,
	   [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT
	'OrdersArchive' AS SourceTable,
	   [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID;

-- DELTA DETECTION
