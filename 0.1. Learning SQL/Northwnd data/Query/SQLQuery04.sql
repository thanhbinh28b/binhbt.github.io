-- 4. Đếm số lượng, tính tổng, trung bình
	-- Đếm số lượng khách hàng có trong bảng Customers
	SELECT COUNT(*) AS [NumberOfCustomers]
	FROM [dbo].[Customers];
	
	SELECT COUNT([CustomerID]) AS [NumberOfCustomers]
	FROM [dbo].[Customers];
	
	-- Tính tổng số tiền vận chuyển (Freight) của tất cả các đơn đặt hàng.
	SELECT SUM([Freight]) AS [SumFreight]
	FROM [dbo].[Orders];
	
	-- Tính trung bình số lượng đặt hàng (Quantity) của tất cả các sản phẩm trong bảng [Order Details]
	SELECT AVG([Quantity]) AS [AvgQuantity]
	FROM [dbo].[Order Details];
	
	-- Đế số lượng, tính tổng số lượng trong kho và trung bình giá của các sản phẩm có trong bảng Product
	SELECT COUNT(*) AS [NumberOfProduct],
		   SUM([UnitsInStock]) AS [TotalUnitsInStock],
		   AVG([UnitPrice]) AS [AvgUnitPrice]
	FROM [dbo].[Products];
	
	-- Hãy đếm số lượng đơn hàng từ bảng (Orders) với 2 cách:
	-- Cách 1: dùng dấu *
	-- Cách 2: dùng mã đơn hàng
	SELECT COUNT(*) 
	FROM [dbo].[Orders];
	
	SELECT COUNT([OrderID])
	FROM [dbo].[Orders];
	
	-- Từ bảng [Order Details] hãy tính trung bình cho cột UnitPrice, và tính tổng cho cột Quantity
	SELECT AVG([UnitPrice]) AS [Trung binh UnitPrice],
	       SUM([Quantity]) AS [Tong Quantity]
	FROM [dbo].[Order Details];
