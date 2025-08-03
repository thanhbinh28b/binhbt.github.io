-- 26. UPDATE - Câu lệnh cập nhật dữ liệu

SELECT *
INTO Customers_1
FROM Customers;

-- Cập nhật thông tin của 1 khách hàng trong bảng Customers. Dưới đây là cách cập nhật địa chỉ của khách hàng có CustomerID là "ALFKI"
UPDATE [dbo].[Customers_1]
SET [Address]='New Address'
WHERE [CustomerID]='ALFKI';

SELECT *
INTO [dbo].[Products_1]
FROM [dbo].[Products];

-- Tăng giá toàn bộ sản phẩm lên 10%
UPDATE [dbo].[Products_1]
SET [UnitPrice]=[UnitPrice]+[UnitPrice]*0.1;

UPDATE [dbo].[Products_1]
SET [UnitPrice]=[UnitPrice]*110/100;

UPDATE [dbo].[Products_1]
SET [UnitPrice]=[UnitPrice]*1.1;

-- Cấp nhật thông tin của sản phẩm có ProductID là 7 trong bảng Products để thay đổi ten sản phẩm thành "Máy tính xách tay mới" và cập nhật giá bán thành 999.99  đô la.
UPDATE [dbo].[Products_1]
SET
	[ProductName]='Máy tính xách tay mới',
	[UnitPrice]=999.99
WHERE [ProductID]=7;

-- BT
-- Cập nhật thông tin của tất cả các khách hàng trong bảng Customers có thành phố (City) là "Paris" để thay đổi quốc gia (Country) của họ thành "Pháp"
UPDATE [dbo].[Customers_1]
SET [Country]='Pháp'
WHERE [City]='Paris';

-- Cập nhật thông tin của một sản phẩm cụ thể trong bảng Products dựa trên ProductName
UPDATE [dbo].[Products_1]
SET [UnitsInStock]=200
WHERE [ProductName]='Máy tính xách tay mới';