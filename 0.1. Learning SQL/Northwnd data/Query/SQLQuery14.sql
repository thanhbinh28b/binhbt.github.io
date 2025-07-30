	-- Liệt kê ra toàn bộ sản phẩm
	SELECT
		[ProductID],
		[ProductName],
		[UnitPrice]
	FROM [dbo].[Products];
	
	-- Tìm giá trung bình của các sản phẩm
	SELECT AVG([UNitPrice])
	FROM [dbo].[Products];
	
	-- Lọc những sản phẩm có giá > giá trung bình
	SELECT
		[ProductID],
		[ProductName],
		[UnitPrice]
	FROM [dbo].[Products]
	WHERE [UnitPrice]>
	(SELECT AVG([UNitPrice])
	FROM [dbo].[Products]);
	
	-- Lọc ra những khách hàng có số đơn hàng > 10
	SELECT
		[c].[CustomerID],
		[c].[ContactName],
		COUNT([o].[OrderID]) AS [So luong don hang]
	FROM
		[dbo].[Customers] AS [c]
		LEFT JOIN [dbo].[Orders] AS [o]
		ON [c].[CustomerID]=[o].[CustomerID]
	GROUP BY
		[c].[CustomerID],
		[c].[ContactName]
	HAVING COUNT([o].[OrderID])>10
	
	-- Lọc ra những khách hàng có số đơn hàng > 10 (Sub query)
	SELECT *
	FROM [dbo].[Customers]
	WHERE [CustomerID] IN
		(SELECT [CustomerID]
		FROM [dbo].[Orders]
		GROUP BY [CustomerID]
		HAVING COUNT([OrderID])>10);
	
	-- Tính tổng tiền cho từng đơn hàng
	SELECT
		[o].*,
		(SELECT SUM([od].[Quantity]*[od].[UnitPrice])
		FROM [dbo].[Order Details] AS [od]
		WHERE [o].[OrderID]=[od].[OrderID]) AS [Total]
	FROM [dbo].[Orders] AS [o];
	
	
	-- Lọc ra tên sản phẩm và tổng số đơn hàng của snả phẩm
	SELECT 
		[p].[ProductName],
		(SELECT COUNT([od].[OrderID]) 
		FROM [dbo].[Order Details] AS [od]
		WHERE [p].ProductID=[od].[ProductID])
		AS [So luong don hang]
	FROM
		[dbo].[Products] AS [p]
	
	-- Hãy in ra Mã đơn hàng, và sô lượng sản phẩm của đơn hàng đó

	-- <Dữ liệu bổ sung sau>

	-- Lấy thông tin về các khách hàng có tổng giá trị đơn hàng lớn nhất
	SELECT *
	FROM [dbo].[Customers] AS [c]
	LEFT JOIN [dbo].[Orders] AS [o]
	ON [c].[CustomerID]=[o].[CustomerID]
	WHERE [o].[OrderID] IN
		(SELECT TOP 1 [OrderID]
		FROM
			(SELECT
				[od].[OrderID],
				SUM(([od].[UnitPrice]*[od].[Quantity])*(1-[od].[Discount])) AS [Amount]
			FROM [dbo].[Order Details] AS [od]
			GROUP BY [od].[OrderID])
			AS [OrderAmount]
		ORDER BY [Amount] DESC);