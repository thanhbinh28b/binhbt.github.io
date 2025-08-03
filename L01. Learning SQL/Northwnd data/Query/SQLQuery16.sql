-- 16. Nâng cao hiệu suất truy vấn SQL với Common Table Expression (CTE)
WITH [short_e] AS
	(SELECT [EmployeeID], [LastName], [FirstName]
	FROM [dbo].[Employees])
SELECT * FROM [short_e];

-- VD1: Lấy thông tin về các sản phẩm (Products) có dùng thể loại với 1 sản phẩm cụ thể
-- Sử dụng Sub Query
SELECT ProductName, CategoryID
FROM Products
WHERE CategoryID=
	(SELECT CategoryID
	FROM Products
	WHERE ProductName='Product_Name');
-- Đối với PP này, mỗi lần chạy kiểm tra điều kiện (WHERE) thì Sub Query sẽ phải chạy lại 1 lần
-- => Tốn tài nguyên

-- Sử dụng Sub Query + JOIN
SELECT p.ProductName, p.CategoryID
FROM Products AS p
LEFT JOIN
	(SELECT CategoryID
	FROM Products
	WHERE ProductName='Product_Name')
	AS Subquery
ON p.CategoryID=Subquery.CategoryID;
-- Đối với PP này thì subquery chỉ càn chạy 1 lần, tuy nhiên nếu cần dùng lại thì phải viết lại


-- Sử dụng CTE
WITH ProductCategory AS
	(SELECT CategoryID
	FROM Products
	WHERE ProductName='Product_Name')
SELECT p.ProductName, p.CategoryID
FROM Products AS p
JOIN ProductCategory AS pc
ON p.CategoryID=pc.CategoryID


-- VD2: Lấy thông tin về đơn hàng (Orders) cùng với tổng giá trị đơn hàng và tỷ lệ giữa tổng giá trị và phí giao hàng
-- Phần tự làm
-- Sử dụng SubQuery
SELECT
	[o].[OrderID],
	[Total_Amount].[Amount],
	[o].[Freight]/[Total_Amount].[Amount] AS [Freight/Amount]
FROM
	[dbo].[Orders] AS [o]
	INNER JOIN
		(SELECT
			[od].[OrderID],
			SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount]
		FROM
			[dbo].[Order Details] AS [od]
		GROUP BY [od].[OrderID])
		AS [Total_Amount]
	ON [o].[OrderID]=[Total_Amount].OrderID;


-- Sử dụng INNER JOIN
SELECT
	[o].[OrderID],
	SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount],
	[o].[Freight]/SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Freight/Amount]
FROM
	[dbo].[Orders] AS [o]
	INNER JOIN [dbo].[Order Details] AS [od]
	ON [o].[OrderID]=[od].[OrderID]
GROUP BY [o].[OrderID], [o].[Freight];

-- Sử dụng CTE
WITH [Total_Amount] AS
	(SELECT
		[od].[OrderID],
		SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount]
	FROM
		[dbo].[Order Details] AS [od]
	GROUP BY [od].[OrderID])
SELECT
	[o].[OrderID],
	[Total_Amount].[Amount],
	[o].[Freight]/[Total_Amount].[Amount] AS [Freight/Amount]
FROM
	[dbo].[Orders] AS [o]
	INNER JOIN [Total_Amount]
	ON [o].[OrderID]=[Total_Amount].OrderID;

-- Bài chữa:
SELECT
	[OrderID],
	[OrderDate],
	[Freight],
		(SELECT SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) 
		FROM [dbo].[Order Details] AS [od]
		WHERE [od].[OrderID]=[o].[OrderID]
		GROUP BY [od].[OrderID])
		AS [Amount],
		(SELECT SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) 
		FROM [dbo].[Order Details] AS [od]
		WHERE [od].[OrderID]=[o].[OrderID]
		GROUP BY [od].[OrderID])/[Freight]
		AS [Amount/Freight]
FROM [dbo].[Orders] AS [o];
-- Tốn đoạn code và khối dữ liệu không sử dụng lại được

-- Sử dụng CTE
WITH [Total_Amount] AS
	(SELECT
		[od].[OrderID],
		SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount]
	FROM
		[dbo].[Order Details] AS [od]
	GROUP BY [od].[OrderID])
SELECT
	[o].[OrderID],
	[o].[OrderDate],
	[o].[Freight],
	[Total_Amount].[Amount],
	[Total_Amount].[Amount]/[o].[Freight] AS [Freight/Amount]
FROM
	[dbo].[Orders] AS [o]
	INNER JOIN [Total_Amount]
	ON [o].[OrderID]=[Total_Amount].OrderID;

-- Bài tập:
--1. Sử dụng CTE để tính ôtngr doanh số bán hàng cho từng sản phẩm từ hai bảng "Order Details" và "Products" trong cơ sở dữ liệu NorthWind.
WITH [Total_Amount] AS
	(SELECT
		[od].[ProductID],
		SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount]
	FROM
		[dbo].[Order Details] AS [od]
	GROUP BY [od].[ProductID])
SELECT
	[p].[ProductID],
	[p].[ProductName],
	[Total_Amount].[Amount]
FROM
	[dbo].[Products] AS [p]
	INNER JOIN [Total_Amount]
	ON [p].[ProductID]=[Total_Amount].[ProductID];

--2. Sử dụng CTE đẻ tính toán tổng doanh số bán hàng theo từng khách hàng và sau đó sắp xếp danh sách khách hàng theo tổng doanh số giảm dần.
WITH [Total_Amount] AS
	(SELECT
		[o].[CustomerID],
		SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount]
	FROM
		[dbo].[Order Details] AS [od]
		INNER JOIN [dbo].[Orders] AS [o]
		ON [od].[OrderID]=[o].[OrderID]
	GROUP BY [o].[CustomerID])
SELECT
	[c].[CustomerID],
	[c].[CompanyName],
	[Total_Amount].[Amount]
FROM
	[dbo].[Customers] AS [c]
	INNER JOIN [Total_Amount]
	ON [c].[CustomerID]=[Total_Amount].[CustomerID]
ORDER BY [Total_Amount].[Amount] DESC;

--3. Sử udngj CTE tính tổng doanh số bán hàng theo năm từ bảng "Orders" và "Order Details"
WITH [Total_Amount] AS
	(SELECT
		[od].[OrderID],
		SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount]
	FROM
		[dbo].[Order Details] AS [od]
	GROUP BY [od].[OrderID])
SELECT
	YEAR([o].[OrderDate]),
	SUM([Total_Amount].[Amount])
FROM
	[dbo].[Orders] AS [o]
	INNER JOIN [Total_Amount]
	ON [o].[OrderID]=[Total_Amount].[OrderID]
GROUP BY YEAR([o].[OrderDate]);