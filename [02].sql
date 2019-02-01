USE AdventureWorks2017
----01
SELECT PL.NAME,(
SELECT  ListPrice
FROM Production.Product PP
WHERE PP.ProductID=PI.ProductID
) 'List Price', PI.Quantity
FROM Production.Location PL
LEFT OUTER JOIN Production.ProductInventory PI
ON PL.LocationID=PI.LocationID
----02
SELECT Category, Depot,SUM(Quantity) OVER(Partition BY Depot)/SUM(Quantity) OVER(Partition BY Category)
FROM(
SELECT PC.NAME 'Category', PL.NAME 'Depot',PI.Quantity 'Quantity'
FROM Production.ProductCategory PC
INNER JOIN Production.ProductsubCategory PSC
ON PSC.ProductCategoryID=PC.ProductCategoryID
INNER JOIn Production.Product PP
ON PP.ProductSubcategoryID=PSC.ProductSubcategoryID
INNER JOIN Production.ProductInventory PI
ON PI.ProductID=PP.ProductID
INNER JOIN Production.Location PL
ON PL.LocationID=PI.LocationID) s
GROUP BY Category, Depot
----03
SELECT PP.Name,PI.Quantity
FROM Production.ProductInventory PI
INNER JOIN Production.Product PP
ON PI.Quantity<=PP.SafetyStockLevel


SELECT PP.Name,PI.Quantity
FROM Production.ProductInventory PI
INNER JOIN Production.Product PP
ON PI.Quantity-100=PP.SafetyStockLevel
----04
SELECT PP.Name,PI.Quantity, PP.SafetyStockLevel
FROM Production.ProductInventory PI
INNER JOIN Production.Product PP
ON PI.Quantity<=PP.SafetyStockLevel

SELECT PP.Name,PI.Quantity, PP.SafetyStockLevel
FROM Production.ProductInventory PI
INNER JOIN Production.Product PP
ON PI.Quantity-100=PP.SafetyStockLevel
----05-06
SELECT ProductID, DaysToManufacture
FROM Production.Product
WHERE ProductID=766 AND DaysToManufacture*70<=2

SELECT ProductID, DaysToManufacture
FROM Production.Product
WHERE ProductID=776 AND DaysToManufacture*12<=2

SELECT ProductID, DaysToManufacture
FROM Production.Product
WHERE ProductID=780 AND DaysToManufacture*30<=2

SELECT ProductID, DaysToManufacture
FROM Production.Product
WHERE ProductID=517 AND DaysToManufacture*20<=2

SELECT ProductID, DaysToManufacture
FROM Production.Product
WHERE ProductID=514 AND DaysToManufacture*300<=2

SELECT ProductID, DaysToManufacture
FROM Production.Product
WHERE ProductID=524 AND DaysToManufacture*100<=2
