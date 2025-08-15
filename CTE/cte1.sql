--SQL CTE
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
-- Main Query
SELECT
 c.CustomerID,
 c.FirstName,
 c.LastName,
 cts.TotalSales
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales CTS
ON cts.CustomerID = c.CustomerID