-- 2. Đặt tên Alias
    -- Lay "CompanyName" và đặt tên thay thế là "Công ty"; "PostalCode" và đặt tên thay thế là "Mã bưu điện"
	SELECT [CompanyName] As [Tên công ty],
		   [PostalCode] As "Mã bưu điện",
		   [City] "Thành phố"
	FROM [dbo].[Customers]
	
	-- Lấy ra "LastName" và đặt tên thay thế là "Họ"; "FirstName" và đặt tên thay thế là "Tên"
	SELECT [LastName] AS [Họ],
		   [FirstName] AS [Tên]
	FROM [dbo].[Employees]
	
	-- Lấy ra 15 dòng đầu tiên của tất cả các cột trong bảng Order, đặt tên thay thế cho bảng Orders là "o"
	SELECT TOP 15 [o].*
	FROM [dbo].[Orders] AS [o]
	
	-- Viết câu lệnh SQL lấy ra các cột và đặt tên thay thế như sau:
	-- ProductName => Tên sản phẩm
	-- SupplierID => Mã nhà cung cấp
	-- CategoryID => Mã thể loại
	-- Và đặt tên thay thế cho bảng Products là "p", sử dụng tên thay thế khi truy vấn các cột bên trên.
	-- Và chỉ lấy ra 5 sản phẩm đầu tiên trong bảng
	
	SELECT TOP 5 [p].[ProductName] AS [Tên sản phẩm],
			     [p].[SupplierID] AS [Mã nhà cung cấp],
				 [p].[CategoryID] AS [Mã thể loại]
    FROM [dbo].[Products] AS [p];