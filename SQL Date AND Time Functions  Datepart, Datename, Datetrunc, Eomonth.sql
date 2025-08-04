--SQL Date & Time Functions | Datepart, Datename, Datetrunc, Eomonth
USE SalesDB;

SELECT
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime
FROM Sales.Orders;

--VALUES
SELECT
	OrderID,
	CreationTime,
	'2025-08-20' HardCoded,
	GETDATE() Today
FROM Sales.Orders;

--FUNCTION OVERVIEW
SELECT
	OrderID,
	CreationTime,
	YEAR(CreationTime) Year,
	MONTH(CreationTime) Month,
	DAY(CreationTime) Day
FROM Sales.Orders;

--DATEPART()

SELECT
	OrderID,
	CreationTime,
	DATEPART(year,CreationTime) Year_dp,
	DATEPART(month,CreationTime) Month_dp,
	DATEPART(day,CreationTime) Day_dp,
	DATEPART(hour,CreationTime) Hour_dp,
	DATEPART(quarter,CreationTime) quarter_dp,
	DATEPART(WEEK,CreationTime) Week_dp,
	YEAR(CreationTime) Year,
	MONTH(CreationTime) Month,
	DAY(CreationTime) Day
FROM Sales.Orders;

-- DATENAme()

SELECT
	OrderID,
	CreationTime,
	DATENAME(MONTH,CreationTime) Month_dn,
	DATENAME(WEEKDAY,CreationTime) WEEKday_dn,
	DATENAME(DAY,CreationTime) Day_dn,
	DATENAME(YEAR,CreationTime) year_dn,
	YEAR(CreationTime) Year,
	MONTH(CreationTime) Month,
	DAY(CreationTime) Day
FROM Sales.Orders;

--DATETRUNC()

SELECT
	OrderID,
	CreationTime,
	DATETRUNC(YEAR,CreationTime) year_dt,
	DATETRUNC(DAY,CreationTime) Day_dt,
	DATETRUNC(MINUTE,CreationTime) Minute_dt,
	YEAR(CreationTime) Year,
	MONTH(CreationTime) Month,
	DAY(CreationTime) Day
FROM Sales.Orders;
-----------------------------------------------
SELECT
	DATETRUNC(MONTH,CreationTime) Creation,
	COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH,CreationTime)

-- EOMONTH()
SELECT
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) EndOfMonth,
	CAST(DATETRUNC(MONTH,CreationTime) AS DATE) StartOfMonth,
	YEAR(CreationTime) Year,
	MONTH(CreationTime) Month,
	DAY(CreationTime) Day
FROM Sales.Orders;

--Date Aggregations
--How many orders were placed each year?
SELECT
	YEAR(OrderDate),
	COUNT(*) NrOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)

-- HOW many orders were placed each month?
SELECT
    DATENAME(MONTH,OrderDate) AS OrderDate,
	COUNT(*) NrOfOrders
FROM Sales.Orders
GROUP BY DATENAME(MONTH,OrderDate)

--Date Filtering
--Show all orders that were placed during the month of february
SELECT
*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2

--Functions Comparison
