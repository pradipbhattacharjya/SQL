/* TASK 1:
   Find the products that have a price higher than the average price of all products.
*/
SELECT
*
FROM (
    -- Subquery
    SELECT
        ProductID,
        Price,
        AVG(Price) OVER () AS AvgPrice
    FROM Sales.Products
) AS t
WHERE Price > AvgPrice;