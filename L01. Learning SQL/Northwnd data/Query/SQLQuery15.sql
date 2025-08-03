-- SQL Query: Thứ tự thực thi trong câu truy vấn SQL và các vấn đề cần lưu ý
SELECT [p].[ProductID], [p].[ProductName] --2
FROM [dbo].[Products] AS [p]; --1

SELECT [p].[ProductID], [p].[ProductName] --3
FROM [dbo].[Products] AS [p] --1
WHERE [p].[CategoryID]=1; --2


SELECT [p].[CategoryID], COUNT([p].[ProductID]) AS [TotalProducts] --4
FROM [dbo].[Products] AS [p] --1
WHERE [p].[CategoryID] IN (1,2,3) --2
GROUP BY [p].[CategoryID]; --3

SELECT [p].[CategoryID], COUNT([p].[ProductID]) AS [TotalProducts] --5
FROM [dbo].[Products] AS [p] --1
WHERE [p].[CategoryID] IN (1,2,3) --2
GROUP BY [p].[CategoryID] --3
HAVING [TotalProducts]>=13; --4 [TotalProducts] chưa tồn tại

SELECT [p].[CategoryID], COUNT([p].[ProductID]) AS [TotalProducts] --5
FROM [dbo].[Products] AS [p] --1
WHERE [p].[CategoryID] IN (1,2,3) --2
GROUP BY [p].[CategoryID] --3
HAVING COUNT([p].[ProductID])>=13; --4 

SELECT [p].[CategoryID], COUNT([p].[ProductID]) AS [TotalProducts] --5
FROM [dbo].[Products] AS [p] --1
WHERE [p].[CategoryID] IN (1,2,3,4,5,6,7) --2
GROUP BY [p].[CategoryID] --3
HAVING COUNT([p].[ProductID])>=10 --4 [TotalProducts] chưa tồn tại
ORDER BY [TotalProducts] ASC; --6  [TotalProducts] đã tồn tại

SELECT TOP 3 p.ProductID, o.Discount, o2.ShipCountry --9 --10 
FROM [dbo].[Products] AS [p] --1
INNER JOIN [dbo].[Order Details] o --4 --2
ON p.ProductID=o. ProductID   -- 3
INNER JOIN [dbo].[Orders] o2 --7 --5
ON o.OrderID=o2.OrderID --6
WHERE o.Discount=0.25 and o2.ShipCountry='Germany' --8
ORDER BY p.ProductID DESC; -- 11