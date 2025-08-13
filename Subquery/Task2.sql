/* TASK 2:
   Rank Customers based on their total amount of sales.
*/
SELECT
*,
RANK() OVER (ORDER BY TotalSales DESC) CustomerRank
FROM
	(SELECT 
	CustomerID,
	SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID)t