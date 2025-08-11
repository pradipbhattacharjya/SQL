--SQL Ranking Window Functions
-- ROW_NUMBER
--Rank the orders based on their sales from highest to lowest

SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER (ORDER BY Sales DESC) SalesRank_Row
FROM Sales.Orders

--RANK
SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER (ORDER BY Sales DESC) SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) SaalesRank_Rank
FROM Sales.Orders

-- DENSE_RANK
SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER (ORDER BY Sales DESC) SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) SaalesRank_Rank,
	DENSE_RANK() OVER(ORDER BY Sales DESC) SalesDENSE_RANK
FROM Sales.Orders

--COMPARISON
-- Find the top highest sales for each product
SELECT *
FROM (
SELECT
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Sales DESC) RankByProduct
FROM Sales.Orders
) t WHERE RankByProduct = 1

--BOTTOM-N ANALYSIS
-- Find the lowest 2 customers based on their total sales
SELECT *
FROM (
SELECT 
	CustomerID,
	SUM(Sales) TotalSales,
	ROW_NUMBER() OVER (ORDER BY SUM(Sales)) RankCustomers
FROM Sales.Orders
GROUP BY
CustomerID
)t WHERE RankCustomers <= 2

--GENERATE UNIQUE IDs
-- Assign unique IDs to the roes of the 'Orders Archive' table
SELECT
ROW_NUMBER() OVER (ORDER BY OrderID,OrderDate) UniqueID,
*
FROM Sales.OrdersArchive;

--IDENTIFY DUPLICATES
--Identify duplicate rows in the table 'Orders Archive' and  return a clean  result without any duplicates
SELECT * FROM (
SELECT
ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime DESC) rn,
*
FROM Sales.OrdersArchive
)t WHERE rn= 1;

-- NTILE
SELECT
OrderID,
Sales,
NTILE(1) OVER (ORDER BY Sales DESC) OneBucket,
NTILE(2) OVER (ORDER BY Sales DESC) TwoBucket,
NTILE(3) OVER (ORDER BY Sales DESC) ThreeBucket,
NTILE(4) OVER (ORDER BY Sales DESC) FOURBucket
FROM Sales.Orders;

--NTILE| USE CASES
-- DATA Segmentaion
--Segment all orders into 3 categories:high,medium and low sales
SELECT
*,
CASE WHEN Buckets = 1 THEN 'High'
	 WHEN Buckets = 2 THEN 'Medium'
	 WHEN Buckets = 3 THEN 'Low'
END SalesSegmentations
FROM (
SELECT
	OrderID,
	Sales,
	NTILE(3) OVER (ORDER BY Sales DESC) Buckets
FROM Sales.Orders
)t
-- Equalizing load processing
-- In order to export the data,divide the orders into 2 groups
SELECT 
NTILE(2) OVER (ORDER BY OrderID) Buckets,
*
FROM Sales.Orders

--CUME_DIST
--PERCENT_RANK 
-- Find the products that fall within the highest 40% of prices
SELECT
*,
CONCAT(DistRank * 100, '%') DistRankPerc
FROM(
SELECT 
	Product,
	Price,
	CUME_DIST() OVER (ORDER BY Price DESC) DistRank,
	PERCENT_RANK() OVER (ORDER BY Price DESC) PERCENTRANK
FROM Sales.Products
)t
WHERE DistRank <= 0.4
