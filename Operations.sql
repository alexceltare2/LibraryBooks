USE librarybooks;

-- SELECT DateOfBorrow FROM activeBorrows;

-- This will show all customers with the same post code
SELECT DISTINCT FirstName, LastName, PostCode FROM customers
WHERE PostCode IN(
SELECT PostCode FROM customers GROUP BY PostCode HAVING count(*) > 1
);
