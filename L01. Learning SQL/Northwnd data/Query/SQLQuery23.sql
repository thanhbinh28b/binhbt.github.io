-- 23. INSERT INTO - Câu lệnh thêm dữ liệu

-- Thêm một khách hàng mới
INSERT INTO [dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES ('KH123', 'TITV.VN', 'Le Nhat Tung', '0123456789');

-- Thêm một khách hàng mới đầy đủ các cột
INSERT INTO [dbo].[Customers]
VALUES ('KH125', 'TITV.VN', 'Le Nhat Tung',null,null,null,null,null,null, '0123456789',null);

-- Thêm nhiều khách hàng cùng lúc
INSERT INTO [dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES
	('KH001', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
	('KH002', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
	('KH003', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
	('KH004', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
	('KH005', 'TITV.VN', 'Le Nhat Tung', '0123456789');

-- Thêm một sản phẩm mới vào bảng Products
INSERT INTO [dbo].[Products]([ProductName],[SupplierID],[CategoryID],[QuantityPerUnit],[UnitPrice],[UnitsInStock])
VALUES('New Product',1,2,'24 bottles',10.99,100);

-- BT1: Viết một câu lệnh INSERT INTO để thêm ncc sau vào bảng Suppliers
-- SupplierName: "New Supplier"
-- ContactName: "John Smith"
-- ContactTitle: "Sales Manager"
-- Address: "123 Supplier Street"
-- City: "New York"
-- Region: "NY"
-- PostalCode: "10001"
-- Country: "USA"
-- Phone: "555-555-5555"
-- Fax: "555-555-5556"
-- HomePage: "http://www.newsupplier.com"
INSERT INTO [dbo].[Suppliers]([CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[Fax],[HomePage])
VALUES ('New Supplier','John Smith','Sales Manager','123 Supplier Street','New York','NY','10001','USA','555-555-5555','555-555-5556','http://www.newsupplier.com')

-- BT2: Hãy viết một câu lệnh INSERT INTO để thêm đơn hàng sau:
-- CustomerID: Chọn một ãm KH hiện có trong bảng Customers.
-- EmployeeID: Chọn một mã nhân viên hiện có trong bảng Employees
-- OrderDate: Sử dụng ngày hiện tại
-- ShipVia: Chọn một mã Shipper hiện có trong bảng Shippers.

INSERT INTO [dbo].[Orders]([CustomerID],[EmployeeID],[OrderDate],[ShipVia])
VALUES ('TOMSP',4,GETDATE(),1);