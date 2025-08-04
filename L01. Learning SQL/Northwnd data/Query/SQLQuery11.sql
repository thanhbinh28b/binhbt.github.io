-- 11. Truy vấn đữ liệu từ nhiều bảng
	-- VD1:
	--Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
	-- Mã thể loại
	-- Tên thể loại
	-- Mã sản phẩm
	-- Tên sản phẩm
	
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		[p].[ProductID],
		[p].[ProductName]
	FROM
		[dbo].[Products] AS [p],
		[dbo].[Categories] AS [c]
	WHERE [c].[CategoryID] = [p].[CategoryID];
	
	-- VD2:
	-- Từ bảng Employees và Orders, hãy in ra các thông tin sau đây:
	-- Mã nhân viên:
	-- Tên nhân viên
	-- Số lượng đơn hàng mà nhân viên đã bán được
	
	SELECT
		[e].[EmployeeID],
		[e].[LastName],
		[e].[FirstName],
		COUNT([o].[OrderID]) AS [Tong so don hang]
	FROM
		[dbo].[Employees] AS [e],
		[dbo].[Orders] AS [o]
	WHERE [e].[EmployeeID] = [o].[EmployeeID]
	GROUP BY 
		[e].[EmployeeID],
		[e].[LastName],
		[e].[FirstName];
	
	-- VD3:
	-- Từ bảng Customers và Orders, hãy in ra các thông tin sau đây:
	-- Mã số khách hàng
	-- Tên công ty
	-- Tên liên hệ
	-- Số lượng đơn hàng đã mua
	-- Với điều kiện: quốc gia của khách hàng là UK
	
	SELECT
		[c].[CustomerID],
		[c].[CompanyName],
		[c].[ContactName],
		COUNT([o].[OrderID]) AS [So luong don hang]
	FROM
		[dbo].[Customers] AS [c],
		[dbo].[Orders] AS [o]
	WHERE [c].[CustomerID]=[o].[CustomerID]
	GROUP BY
		[c].[CustomerID],
		[c].[CompanyName],
		[c].[ContactName];
	
	-- VD4:
	-- Từ bảng Orders và Shippers, hãy in ra các thông tin sau đây:
	-- Mã nhà vận chuyển
	-- Tên công ty vận chuyển
	-- Tổng số tiền được vận chuyển (Sum Freight)
	-- Và in ra màn hình theo thứ tự sắp xếp thổng số tiền vận chuyển giảm dần
	
	SELECT
		[s].[ShipperID],
		[s].[CompanyName],
		SUM([o].[Freight]) AS [Tong tien van chuyen]
	FROM
		[dbo].[Shippers] AS [s],
		[dbo].[Orders] AS [o]
	WHERE [s].[ShipperID]=[o].[ShipVia]
	GROUP BY
		[s].[ShipperID],
		[s].[CompanyName]
	ORDER BY SUM([o].[Freight]) DESC;
	
	-- VD5:
	-- Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây:
	-- Mã nhà cung cáp
	-- Tên công ty
	-- Tổng số các sản phẩm khác nhau đã cung cấp
	-- Và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất.
	
	SELECT TOP 1
		[s].[SupplierID],
		[s].[CompanyName],
		COUNT([p].[ProductID]) AS [Tong so san pham khac nhau]
	FROM
		[dbo].[Suppliers] AS [s],
		[dbo].[Products] AS [p]
	WHERE [s].[SupplierID]=[p].[SupplierID]
	GROUP BY
		[s].[SupplierID],
		[s].[CompanyName]
	ORDER BY COUNT([p].[ProductID]) DESC;
	
	-- VD6:
	-- Từ bảng Orders và Orders Details, hãy in ra các thông tin sau đây:
	-- Mã đơn hàng
	-- Tổng số tiền sản phẩm của đơn hàng đó
	SELECT
		[o].[OrderID],
		[o].[CustomerID],
		SUM([od].[UnitPrice]*[od].[Quantity]) AS [Tong tien don hang]
	FROM
		[dbo].[Orders] AS [o],
		[dbo].[Order Details] AS [od]
	WHERE [o].[OrderID]=[od].[OrderID]
	GROUP BY [o].[OrderID],[o].[CustomerID];
	
	-- VD7: Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
	-- Mã đơn hàng
	-- Tên nhân viên
	-- Tổng số tiền sản phẩm của đơn hàng
	SELECT
		[o].[OrderID],
		[e].[LastName],
		[e].[FirstName],
		SUM([od].[UnitPrice]*[od].[Quantity]) AS [Tong tien don hang]
	FROM
		[dbo].[Orders] AS [o],
		[dbo].[Employees] AS [e],
		[dbo].[Order Details] AS [od]
	WHERE
		[o].[OrderID]=[od].[OrderID] AND
		[o].[EmployeeID]=[e].[EmployeeID]
	GROUP BY
		[o].[OrderID],
		[e].[LastName],
		[e].[FirstName];
	
	-- BT1:
	-- Từ 3 bảng tỏng hình hãy in ra các thông tin sau đây:
	-- Mã đơn hàng
	-- Tên khách hàng
	-- Tên công ty vận chuyển
	-- Và chỉ in ra các đơn hàng được giao đến 'UK' trong năm 1997
	
	SELECT
		[o].[OrderID] AS [Ma don hang],
		[c].[CompanyName] AS [Ten khach hang],
		[s].[CompanyName] AS [Ten cong ty van chuyen]
	FROM
		[dbo].[Orders] AS [o],
		[dbo].[Shippers] AS [s],
		[dbo].[Customers] AS [c]
	WHERE
		[o].[CustomerID]=[c].[CustomerID] AND
		[o].[ShipVia]=[s].[ShipperID] AND
		[o].[ShipCountry]='UK' AND
		YEAR([o].[ShippedDate])='1997';
	
	-- BT1:
	-- Từ bảng Products và Categories, hãy tìm các sản phẩm thuộc danh mục 'Seafood' (Đồ hải sản) in ra các thông tin sau đây:
	-- Mã thể loại
	-- Tên thể loại
	-- Mã sản phẩm
	-- Tên sản phẩm
	
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		[p].[ProductID],
		[p].[ProductName]
	FROM
		[dbo].[Categories] AS [c],
		[dbo].[Products] AS [p]
	WHERE
		[c].[CategoryID]=[p].[CategoryID] AND
		[c].[CategoryName]='Seafood';
	
	-- BT2:
	-- Từ bảng Products và Suppliers, hãy tìm các sản phẩm thuộc được cung cấp từ nước 'Germany' (Đức):
	-- Mã nhà cung cấp
	-- Quốc gia
	-- Mã sản phẩm
	-- Tên sản phẩm
	
	SELECT
		[s].[SupplierID],
		[s].[Country],
		[p].[ProductID],
		[p].[ProductName]
	FROM
		[dbo].[Suppliers] AS [s],
		[dbo].[Products] AS [p]
	WHERE
		[s].[SupplierID]=[p].[SupplierID] AND
		[s].[Country]='Germany';
	
	-- BT3:
	-- Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
	-- Mã đơn hàng
	-- Tên khách hàng
	-- Tên công ty vận chuyển
	-- Vả chỉ in ra các đơn hàng của các khách hàng đến từ thành phố 'London'
	
	SELECT
		[o].[OrderID],
		[c].[ContactName],
		[s].[CompanyName]
	FROM
		[dbo].[Orders] AS [o],
		[dbo].[Customers] AS [c],
		[dbo].[Shippers] AS [s]
	WHERE
		[o].[CustomerID]=[c].[CustomerID] AND
		[o].[ShipVia]=[s].[ShipperID] AND
		[c].[City]='London';
	
	-- BT4:
	-- Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
	-- Mã đơn hàng
	-- Tên khách hàng
	-- Tên công ty vận chuyển
	-- Ngày yêu cầu chuyển hàng
	-- Ngày giao hàng
	-- Và chỉ in ra các đơn hàng bị giao muộn hơn quy định
	-- RequiredDate > ShippedDate
	
	SELECT
		[o].[OrderID],
		[c].[ContactName],
		[s].[CompanyName],
		[o].[RequiredDate],
		[o].[ShippedDate]
	FROM
		[dbo].[Orders] AS [o],
		[dbo].[Customers] AS [c],
		[dbo].[Shippers] AS [s]
	WHERE
		[o].[CustomerID]=[c].[CustomerID] AND
		[o].[ShipVia]=[s].[ShipperID] AND
		[o].[RequiredDate]<[o].[ShippedDate];
	
	-- Exercie
	-- Give these shipcountries for which customers don't come from the United States.
	-- Select only this countries which iss over than 100 orrders.
	-- Display Shipcountry and Number off orders.
	
	SELECT
		[o].[ShipCountry],
		COUNT([o].[OrderID]) AS [Number of orders]
	FROM
		[dbo].[Orders] AS [o],
		[dbo].[Customers] AS [c],
		[dbo].[Shippers] AS [s]
	WHERE
		[o].[CustomerID]=[c].[CustomerID] AND
		[o].[ShipVia]=[s].[ShipperID] AND
		[c].[Country]<>'USA'
	GROUP BY [o].[ShipCountry]
	HAVING COUNT([o].[OrderID])>100;
