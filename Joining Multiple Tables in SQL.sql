--Joining Multiple Tables in SQL
/*Using SalesDB,Retrieve a list of all orders,along with
the related customer,product,and employee details.
For each order,display:
-Order ID
-Customer's name
-Product name
-Sales amount
-Product price
-Salesperson's name
*/

USE SalesDB;

SELECT 
	o.OrderID,
	o.Sales,
	c.FirstName AS customerFIRSTNAME,
	c.LastName AS customerLASTNAME,
	p.Product AS Productname,
	p.Price,
	e.FirstName AS Employeefastname,
	E.LastName AS Employeelastname
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID;



SELECT * FROM Sales.Customers;

SELECT * FROM Sales.Employees;

SELECT * FROM Sales.Orders;

SELECT * FROM Sales.OrdersArchive;

SELECT * FROM Sales.Products