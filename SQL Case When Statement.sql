--SQL Case When Statement
-- Generate a report showing the total sales for each category:
--High (sales over 50), Medium (sales 21-50), and Low (sales 20 or less)
-- sort the categories from highest sales to lowest.
SELECT
Category,
SUM(Sales) AS TotalSales
FROM (
SELECT 
OrderID,
Sales,
CASE
	WHEN Sales > 50 THEN 'High'
	WHEN Sales > 20 THEN 'Medium'
	ELSE 'Low'
END Category
FROM Sales.Orders

)t
GROUP BY Category
ORDER BY TotalSales DESC;

-- MAPPING
-- Retrive employee details with gender displayed as full text
SELECT
EmployeeID,
FirstName,
LastName,
Gender,
CASE
	WHEN Gender = 'F' THEN 'Female'
	WHEN Gender = 'M' THEN 'Male'
	ELSE 'Not Avaiable'
END GenderFullText
FROM Sales.Employees

-- Retrive customers details with abbreviated country code
SELECT
CustomerID,
FirstName,
LastName,
Country,
CASE
	WHEN Country = 'Germany' THEN 'GE'
	WHEN Country = 'USA' THEN 'US'
	ELSE 'Not Avaiable'
END abbreviatedCountry
FROM Sales.Customers;

SELECT DISTINCT country
FROM Sales.Customers;

-- QUICK FORM

-- Retrive customers details with abbreviated country code
SELECT
CustomerID,
FirstName,
LastName,
Country,
CASE Country 
	WHEN 'Germany' THEN 'GE'
	WHEN 'USA' THEN 'US'
	ELSE 'Not Avaiable'
END abbreviatedCountry
FROM Sales.Customers;

--HANDLING NULLS
-- Find the average scores of customers and treat Nulls as 0
-- Additionally provide details such CustomerID and LastName

SELECT
CustomerID,
LastName,
Score,
CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END ScoreClen,
AVG(CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END) OVER() AvgCustomerClean,
	
AVG(Score) OVER() AvgCustomer
FROM Sales.Customers;

--CONDITIONAL AGGREGATION
-- Count how many times each customer has made an order with sales greater then 30

SELECT
CustomerID,
SUM(CASE
	WHEN Sales > 30 THEN 1
	ELSE 0
END) TotalOrdersHighSales,
COUNT(*)  TotalOrders
FROM Sales.Orders
ORDER BY CustomerID;

