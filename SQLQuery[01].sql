USE AdventureWorks2017
----------------------01
SELECT SUM (Subtotal)
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = 283
----------------------02
SELECT SalesPersonID, Subtotal
FROM Sales.SalesOrderHeader
WHERE Subtotal in
(
SELECT MAX (Subtotal)
FROM Sales.SalesOrderHeader
)
----------------------03
SELECT CustomerID, SubTotal
FROM Sales.SalesOrderHeader
WHERE OnlineOrderFlag = 0 AND Subtotal in
(
SELECT MAX (Subtotal)
FROM Sales.SalesOrderHeader
)
----------------------04
SELECT SUM (Quantity)
FROM Production.ProductInventory
WHERE ProductID = 366
----------------------05
SELECT AVG (Quantity)
FROM Production.ProductInventory
WHERE ProductID = 444
----------------------06
SELECT FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID in
(
SELECT BusinessEntityID
FROM HumanResources.Employee
WHERE BirthDate in
(
SELECT MAX (BirthDate)
FROM HumanResources.Employee
)
)
----------------------07
SELECT FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID in
(
SELECT BusinessEntityID
FROM HumanResources.Employee
WHERE HireDate in
(
SELECT MIN (HireDate)
FROM HumanResources.Employee
)
)
----------------------08
SELECT FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID in
(
SELECT BusinessEntityID
FROM HumanResources.Employee
WHERE VacationHours in
(
SELECT MAX (VacationHours)
FROM HumanResources.Employee
)
)
----------------------09
SELECT FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID in
(
SELECT BusinessEntityID
FROM HumanResources.Employee
WHERE SickLeaveHours in
(
SELECT MIN (SickLeaveHours)
FROM HumanResources.Employee
)
)
----------------------10
SELECT FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID in
(
SELECT BusinessEntityID
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Engineer%'
)
----------------------11
SELECT FirstName, LastName
FROM Person.Person
WHERE BusinessEntityID in
(
SELECT BusinessEntityID
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Supervisor%' OR JobTitle LIKE '%Manager%'
)