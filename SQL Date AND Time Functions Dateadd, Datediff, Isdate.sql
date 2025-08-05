--SQL Date & Time Functions | Dateadd, Datediff, Isdate
--DATEADD()
SELECT
	OrderID,
	OrderDate,
	DATEADD(DAY,-10, OrderDate) AS TenDaysBefore,
	DATEADD(MONTH,3, OrderDate) AS ThreeMonthsLater,
	DATEADD(YEAR,2, OrderDate) AS TWOYearsLater
FROM Sales.Orders;

--DATEDIFE()
-- Calculate the age of employees
SELECT	
	EmployeeID,
	BirthDate,
	DATEDIFF(YEAR,BirthDate, GETDATE()) Age
FROM Sales.Employees;

-- Find the average shipping duration in days for each month
SELECT
	MONTH(OrderDate) AS OrderDate,
	AVG(DATEDIFF(day,OrderDate,ShipDate)) AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

-- Time Gap Analysis
--Find the number of days between each order and the previous order
SELECT 
	OrderID,
	OrderDate CurrentOrderDate,
	LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
	DATEDIFF(day,LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) NrOfDays
FROM Sales.Orders;

--ISDATE()
SELECT 
ISDATE('123') DateCheck1,
ISDATE('2025-08-20') DateCheck2,
ISDATE('20-08-2025') DateCheck3,
ISDATE('2025') DateCheck4,
ISDATE('08') DateCheck5


SELECT
	--CAST(OrderDate AS DATE) OrderDate,
	OrderDate,
	ISDATE(OrderDate),
	CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
	ELSE '9999-01-01'
	END NewOrderDate
FROM
(
	SELECT '2025 -08-20' AS OrderDate UNION
	SELECT '2025-08-21' UNION
	SELECT '2025-08-23' UNION
	SELECT '2025-08'
)t
--WHERE ISDATE(OrderDate)=0
