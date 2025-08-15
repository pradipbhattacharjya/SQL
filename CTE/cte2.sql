--Multiple standalone CTE
--Step1:
-- Find the total Sales Per Customer
WITH CTE_Total_Sales AS
(
SELECT
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
-- Step2: Find the last order for each customer
,CTE_Last_Order AS
(
SELECT 
	CustomerID,
	MAX(OrderDate) AS Last_Order
FROM Sales.Orders
GROUP BY CustomerID
)
-- Main Query
SELECT
 c.CustomerID,
 c.FirstName,
 c.LastName,
 cts.TotalSales,
 clo.Last_Order
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales CTS
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID = c.CustomerID