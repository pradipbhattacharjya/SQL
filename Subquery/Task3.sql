-- Show the product IDs, names,prices and total number of ordrts.

SELECT
	ProductID,
	Product,
	Price,
	--Subquery
	(SELECT COUNT(*) TotalOrders FROM Sales.Orders) AS TotalOrders
FROM Sales.Products;



