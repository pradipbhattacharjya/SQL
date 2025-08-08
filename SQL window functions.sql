--SQL Window Functions Basics 
-- Find the total Sales Across all orders
-- Find the total Sales for each product
--Additionally provide details such order Id,order date
USE SalesDB
SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY 
	OrderID,
	OrderDate,
	ProductID;

SELECT
	ProductID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM Sales.Orders;

/*Find the total sales across all orders
additionally provide details such order id & order date
*/
SELECT
	OrderID,
	OrderDate,
	SUM(Sales) OVER () TotalSales
FROM Sales.Orders

/*Find the total sales for each product
Additionaily provide details such Order Id, Order date */
SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER (PARTITION BY ProductID) TotalSalesByProducts
FROM Sales.Orders;
/*Find the total sales for each combination of 
product and order status*/
SELECT 
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER (PARTITION BY ProductID) SalesByProducts,
	SUM(Sales) OVER (PARTITION BY ProductID,OrderStatus) SalesByProductsAndStatus
FROM Sales.Orders;

/*Rank each order  based on their sales from highest to lowest
Additionally provide details such order Id, order date*/

SELECT
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER (ORDER BY Sales DESC) RankSales
FROM Sales.Orders;

-----
SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) TotalSales
FROM SALES.Orders;

-- preceding
SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS 2 PRECEDING) TotalSales
FROM SALES.Orders;

--Unbounded
SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS 1 PRECEDING) TotalSales
FROM SALES.Orders;
--
SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate
	ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) TotalSales
FROM SALES.Orders;

--RULE
SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus) TotalSales
FROM SALES.Orders
ORDER BY SUM(Sales) OVER (PARTITION BY OrderStatus)

/* Find the total sales for each order status,
only for two products 101 and 102*/

SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus) TotalSales
FROM SALES.Orders
WHERE ProductID IN (101,102);

-- Rank Customers based on their total sales

SELECT
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM SALES.Orders
GROUP BY CustomerID;