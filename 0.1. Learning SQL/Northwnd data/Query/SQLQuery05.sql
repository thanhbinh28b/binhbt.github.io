-- 5. Sắp xếp kết quả trả về của truy vấn - ORDER BY
	-- Liệt kê tất cả các NCC theo thứ tự đơn vị CompanyName từ A-Z
	SELECT [CompanyName]
	FROM [dbo].[Suppliers]
	ORDER BY [CompanyName] ASC;
	
	SELECT [CompanyName]
	FROM [dbo].[Suppliers]
	ORDER BY [CompanyName];
	
	-- Liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
	SELECT *
	FROM [dbo].[Products]
	ORDER BY [UnitPrice] DESC;
	
	-- Liệt kê tất cả các nhân viên thoe thứ tự họ và tên đệm A-Z, không dùng ASC|DESC
	SELECT *
	FROM [dbo].[Employees]
	ORDER BY [LastName] ASC, [FirstName] ASC;
	
	SELECT *
	FROM [dbo].[Employees]
	ORDER BY [LastName], [FirstName];
	
	-- Lấy ra một sản phẩm có số lượng bán cao nhất từ bảng [Order Details]
	-- Không được dùng MAX
	SELECT *
	FROM [Order Details]
	ORDER BY [Quantity] DESC;
	
	SELECT TOP 1 *
	FROM [Order Details]
	ORDER BY [Quantity] DESC;
	
	-- Hãy liệt kê danh sách các đơn đặt hàng (Order ID) trong bảng Orders theo thứ tự giảm dần của ngày đặt hàng (OrderDate)
	SELECT *
	FROM [dbo].[Orders]
	ORDER BY [OrderDate] DESC;
	
	-- Liệt kê tên, đơn giá, số lượng tồn kho (UnitsInStock) của tất cả các sản phẩm trong bảng Products, theo thứ tự giảm dần của UnitsInStock
	SELECT [ProductName], [UnitPrice],[UnitsInStock]
	FROM [dbo].[Products]
	ORDER By [UnitsInStock] DESC;
