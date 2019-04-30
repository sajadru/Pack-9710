USE AdventureWorks2017
GO
--01
SELECT TOP 1 OrderQty
FROM
(
SELECT TOP 10 WITH TIES LineTotal, OrderQty
FROM Sales.SalesOrderDetail ss
ORDER BY LineTotal DESC) S
ORDER BY OrderQty DESC
GO
--02
SELECT TOP 1 OrderQty, Category
FROM
(
SELECT TOP 10 WITH TIES LineTotal, OrderQty, pc.Name 'Category'
FROM Sales.SalesOrderDetail ss
INNER JOIN Production.Product pp
ON pp.ProductID=ss.ProductID
INNER JOIN Production.ProductSubcategory psc
ON psc.ProductSubcategoryID=pp.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
ON pc.ProductCategoryID=psc.ProductCategoryID
ORDER BY LineTotal DESC) S
ORDER BY OrderQty DESC
GO
--03
SELECT Category,FORMAT((SumTotal/SumPoll*100),'0.00')+'%'
FROM
(
SELECT pc.Name 'Category', SUM(sd.LineTotal) 'SumTotal',(SELECT SUM(LineTotal)
FROM Sales.SalesOrderDetail
) 'SumPoll'
FROM Production.ProductCategory pc
INNER JOIN Production.ProductSubCategory psc
ON psc.ProductCategoryID=pc.ProductCategoryID
INNER JOIN Production.Product pp
ON pp.ProductSubcategoryID=psc.ProductSubcategoryID
INNER JOIN Sales.SalesOrderDetail sd
ON sd.ProductID=pp.ProductID
GROUP BY pc.Name) S
GO
--04
SELECT Name, Category
FROM(
SELECT RANK() OVER(PARTITION BY Category ORDER BY SUMTotal) 'RankTotal', Category, Name
FROM(
SELECT SUM( sd.LineTotal) 'SUMTotal', pp.Name 'Name', pc.Name 'Category'
FROM Production.Product pp
INNER JOIN Production.ProductSubcategory psc
ON psc.ProductSubcategoryID=pp.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
ON pc.ProductCategoryID=psc.ProductCategoryID
INNER JOIN Sales.SalesOrderDetail sd
ON sd.ProductID=pp.ProductID
GROUP BY pp.Name, pc.Name) S)P
WHERE RankTotal=1
GO
--05
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%%'