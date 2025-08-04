--SQL Date & Time Functions | Format, Convert, Cast
--FORMAT
SELECT 
	OrderID,
	CreationTime,
	FORMAT(CreationTime,'MM-dd-yyyy') UAA_Format,
	FORMAT(CreationTime,'dd-mm-yyyy') EURO_Format,
	FORMAT(CreationTime,'dd') dd,
	FORMAT(CreationTime,'ddd') ddd,
	FORMAT(CreationTime,'dddd') dddd,
	FORMAT(CreationTime,'MM') MM,
	FORMAT(CreationTime,'MMM') MMM,
	FORMAT(CreationTime,'MMMM') MMMM

FROM Sales.Orders;

--Show Creation Time Using the following format:
-- Day Wed Jan Q1 2025 12:32:56 PM
SELECT
	OrderID,
	CreationTime,
	'Day ' + FORMAT(CreationTime,'ddd mmm') +
	'Q' + DATENAME(quarter,CreationTime) + ' ' + FORMAT(CreationTime, 'yyy hh:mm:ss tt') AS CustomerFormat
FROM Sales.Orders;

-- Date Aggregations
SELECT 
	FORMAT(OrderDate, 'MMM yy') OrderDate,
	COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy')

-- CONVERT()
SELECT
	CONVERT(INT, '123') AS[String to Int CONVERT],
	CONVERT( DATE, '2025-08-20') AS [String to Int CONVERT],
	CreationTime,
	CONVERT (DATE, CreationTime) AS [Detetime to Date CONVERT]
FROM Sales.Orders


SELECT
CONVERT (DATE, CreationTime) AS [Detetime to Date CONVERT],
CONVERT (VARCHAR, CreationTime, 32) AS [USA Std.Style:32],
CONVERT (VARCHAR, CreationTime, 34) AS [EURO Std.Style:34]
FROM Sales.Orders

--CAST
SELECT 
	CAST('123' AS INT) AS [String to Int],
	CAST(123 AS VARCHAR) AS [Int to STRING],
    CAST('2025-08-20' AS DATE) AS [String to Date],
	CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
	CreationTime,
	CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders
