-- 3. Nhỏ nhất (MIN) - Lớn nhất (MAX)
	-- Tìm giá thấp nhất của các sản phẩm trong Product
	SELECT MIN([UnitPrice]) -- AS [MinPrice]
	FROM [dbo].[Products];
	
	SELECT MIN([UnitPrice]) AS [MinPrice]
	FROM [dbo].[Products];
	
	-- Lấy ra ngày đặt hàng gần đây nhất từ bảng Orders
	SELECT MAX([OrderDate]) AS [MaxOrderDate]
	FROM [dbo].[Orders];
	
	-- Tìm ra sản phẩm (lấy mã và tên sản phẩm) có số lượng hàng tồn kho (UnitsInStock) lớn nhất.
	
	-- Tìm số lượng hàng tồn kho (UnitsInStock) lớn nhất
	SELECT MAX([UnitsInStock]) AS [MaxUnitsInStock]
	FROM [dbo].[Products];
	
	-- Tìm ngày sinh của nhân viên có tuổi đời lớn nhất công ty
	SELECT MIN([BirthDate])
	FROM [dbo].[Employees];
	
