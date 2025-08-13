--SUBQUERY | IN OPERATOR
/* TASK 6:
   Show the details of orders made by customers in Germany.
*/
SELECT
    *
FROM Sales.Orders
WHERE CustomerID IN (
    -- Subquery
    SELECT
        CustomerID
    FROM Sales.Customers
    WHERE Country = 'Germany'
);