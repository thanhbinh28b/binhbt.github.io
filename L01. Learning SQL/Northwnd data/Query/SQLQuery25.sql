-- 25. DELETE - Câu lệnh xoá dữ liệu

-- Copy Customer sang bảng mới và xoá đi khach hàng 'ALFKI'
SELECT *
INTO Customers_1
FROM Customers;

DELETE FROM [dbo].[Customers_1]
WHERE [CustomerID] LIKE 'ALFKI';

-- Xoá đi toàn bộ khách hàng có quốc gia bắt đầu bằng 'U'
DELETE FROM [dbo].[Customers_1]
WHERE [Country] LIKE 'U%';

-- Xoá sạch 1 bảng
DELETE FROM [dbo].[Customers_1]

-- BT: Từ CSDL NORTHWIND Sử dụng SELECT INTO để tạo ra bảng tạm thời trước khi thực hành câu lệnh DELETE
-- 1. Trong CLSD, làm thế nào để viết một câu lệnh DELETE để xoá một đơn đặt hàng cụ thể dựa trên Order ID? Ví dụ: Xoá đơn đặt hàng có Order ID là 10248
SELECT *
INTO Orders_1
FROM Orders;
DELETE FROM [dbo].[Orders_1]
WHERE [OrderID]='10248';

-- 2. Xoá tất cả sản phẩm từ bảng Products có số lượng tồn kho (UnitsInStock) bằng 0
SELECT *
INTO Products_1
FROM Products;
DELETE FROM [dbo].[Products_1]
WHERE [UnitsInStock]=0;
-- 3. Xoá tất cả đơn hàng và chi tiết đặt hàng liên quan đến một khách hàng cụ thể dựa trên CustomerID.
SELECT *
INTO [Order Detail_1]
FROM [dbo].[Order Details];

DELETE FROM [dbo].[Order Detail_1]
WHERE [OrderID] IN (
	SELECT [OrderID]
	FROM [Orders]
	WHERE [CustomerID]='ERNSH'
);

DELETE FROM [dbo].[Orders_1]
WHERE [CustomerID]='ERNSH';


