-- 24. SELECT INTO - Sao chép dữ liệu từ một bảng hiện có

-- Tạo ra bảng mới với các sản phẩm có giá >50:
SELECT *
INTO HighValueProducts
FROM Products
WHERE [UnitPrice]>50;

-- Tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO USAOrder
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'USA';

-- BT1: Tạo một bảng tạm thời "DustomersInLondon" từ bảng "Customers" trong CSDL NorthWind để chứa thông tin các khách hàng có địa chỉ ở London
SELECT *
INTO CustomerInLondon
FROM [dbo].[Customers]
WHERE [City] LIKE 'London';

DROP TABLE CustomerInLondon;

-- BT2: Tạo một bảng tạm thời "HighValueOrders" để chứa thông tin về cá đơn hàng có tổng giá trị đặt hàng lớn hơn 1000 đô la
WITH [ValueOrders] AS (
	SELECT
		[OrderID],
		SUM([UnitPrice]*[Quantity]*(1-[Discount])) AS [Value]
	FROM [dbo].[Order Details]
	GROUP BY [OrderID]
)
SELECT DISTINCT [o].*
INTO HighValueOrders
FROM [dbo].[Orders] AS [o]
INNER JOIN [ValueOrders]
ON [o].[OrderID]=[ValueOrders].[OrderID]
WHERE [ValueOrders].[Value]>1000;




