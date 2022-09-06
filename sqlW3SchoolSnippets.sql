/*SQL Structured Query Language*/

/*
SELECT
UPDATE
DELETE
INSERT INTO - INSERT NEW DATA IN TABLE
CREATE DATABASE
ALTER DATABASE - MODIFIS A DATABASE
CREATE TABLE
ALTER TABLE 
DROP TABLE - DETELE TABLE
CREATE INDEX - SECONDARY KEY FOR SEARCH
DROP INDEX
*/

SELECT DISTINCT /*TEKRARLARI YOK SAYAR*/

SELECT COUNT(DISTINCT Country) FROM Customers; /*UNIC OLACAK SEKILDE ULKELERI LISTELE*/

SELECT * FROM Customers WHERE CustomerId=1;

/*
= EQUAL 
> GRETTER THAN
< LESS THAN
>=, <=
<> OR !=
*/

SELECT * FROM Product WHERE Price BETWEEN 50 AND 60;

SELECT * FROM CUSTOMERS WHERE CITY LIKE 'sA'; /*San Fr, Salzburg*/

SELECT * FROM CUSTOMERS WHERE CITY IN ('PARIS', 'LONDON');

SELECT * FROM CUSTOMERS WHERE NOT COUNTRY='GERMANY' AND COUNTRY='USA';

SELECT * FROM CUSTOMERS WHERE COUNTRY='GERMANY' AND (CITY='BERLIN' OR CITY='MUNCHEN');
SELECT * FROM CUSTOMERS WHERE COUNTRY='GERNABY' AND CITY IN ('BERLIN', 'MUNCHEN');

SELECT * FROM CUSTOMERS ORDER BY CustomerId DESC; /*VARSAYILAN ESC YANI ARTAN*/

INSERT INTO TABLENAME (COL1, COL3, COL2)
    VALUES (VAL1, VAL3, VAL2);
/*EGER SIRALAMAYI BOZMAYACAKSAN YAZMADA BU SEFER COLUMN`LARI BELIRTMEK ZORUNDA DEGILSIN*/
INSERT INTO TABLENAME
    VALUES (VAL1, VAL2, VAL3);

UPDATE CUSTOMERS
    SET ADDRESS='NEWADDRES'
    WHERE CustomerId=1;

DELETE FROM CUSTOMERS
    WHERE CITY IS NULL;

SELECT MIN/MAX(CustomerId) AS NEWNAMEFORCOLLUMN
    FROM CUSTOMERS;

SELECT SUM(ProductId) AS SUMID FROM Products;

SELECT * FROM Customers
    WHERE CustomerName LIKE '%a';
/*
WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"
*/


/*

%	Represents zero or more characters	                            bl% finds bl, black, blue, and blob
_	Represents a single character	                                h_t finds hot, hat, and hit
[]	Represents any single character within the brackets	            h[oa]t finds hot and hat, but not hit
^	Represents any character not in the brackets	                h[^oa]t finds hit, but not hot and hat
-	Represents any single character within the specified range	    c[a-b]t finds cat and cbt

*/
SELECT * FROM Customers
    WHERE City LIKE '%hi%';

SELECT * FROM Customers
    WHERE City LIKE '%hi%' and CustomerId between 90 and 99 and City like '_h%' and PostalCode Not like '%4';
/*92	sapec	a	45a	Khisinau	2636	MD*/

/*
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
*/

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
    FROM Orders
    INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
    FROM ((Orders
    INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID) 
    INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

SELECT Customers.CustomerName, Orders.OrderID
    FROM Customers
    LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    ORDER BY Customers.CustomerName;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
    FROM Orders
    RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
    ORDER BY Orders.OrderID;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
    FROM Orders
    RIGHT JOIN Employees
    ON Orders.EmployeeID = Employees.EmployeeID
    ORDER BY Orders.OrderID;


SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;
/*kayitlar tek halde doner, tekrarlananlari gormek istersen union all kullan*/


SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

select * from Customers where CustomerId between 90 and 100 order by CustomerId desc;

select max(CustomerId) as a from Customers;
delete from Customers where Country is null;
