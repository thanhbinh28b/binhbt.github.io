-- 8. Nhóm các dòng dữ liệu với nhau
    -- Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng
	SELECT
		[CustomerID],
		COUNT([OrderID]) AS [So luong don hang]
	FROM [dbo].[Orders]
	GROUP BY [CustomerID];
	
	-- Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm
	SELECT
		[SupplierID],
		AVG([UnitPrice]) AS [Don gia trung binh]
	FROM [dbo].[Products]
	GROUP BY [SupplierID];
	
	-- Hãy cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsInStock)
	SELECT
		[CategoryID],
		SUM([UnitsInStock]) AS [Tong so san pham trong kho]
	FROM [dbo].[Products]
	GROUP BY [CategoryID];
	
	-- Hãy cho biết giá vận chuyển thấp nhất và lớn nhất của các đơn hàng theo từng thành phố và quốc gia khác nhau
	SELECT
		[ShipCountry],
		[ShipCity],
		MIN([Freight]) AS [Gia van chuyen thap nhat],
		MAX([Freight]) AS [Gia van chuyen lon nhat]
	FROM [dbo].[Orders]
	GROUP BY [ShipCountry],[ShipCity]
	ORDER BY [ShipCountry] ASC,[ShipCity] ASC;
	
	-- Thống kê số lượng nhân viên theo từng quốc gia khác nhau
	SELECT
		[Country],
		COUNT([EmployeeID]) AS [So luong nhan vien]
	FROM [dbo].[Employees]
	GROUP BY [Country];
