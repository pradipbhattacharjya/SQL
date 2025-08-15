--Nested CTE
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
--step3: Rank Customers based on total sales per customer.
,CTE_Customer_Rank AS
(
SELECT
	CustomerID,
	TotalSales,
	RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales

)
--SELECT * FROM CTE_Customer_Rank
--Step4: segment customers based on their total sales
,CTE_Customer_segments AS
(
SELECT
CustomerID,
TotalSales,
CASE WHEN TotalSales > 100 THEN 'High'
	 WHEN TotalSales > 80 THEN 'Medium'
	 ELSE 'Low'
END CustomerSegments
FROM CTE_Total_Sales
)
--SELECT * FROM CTE_Customer_segments
-- Main Query
SELECT
 c.CustomerID,
 c.FirstName,
 c.LastName,
 cts.TotalSales,
 clo.Last_Order,
 ccr.CustomerRank,
 ccs.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales CTS
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_segments ccs
ON ccs.CustomerID = c.CustomerID