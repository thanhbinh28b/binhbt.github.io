-- 27. INDEX trong DATABASE
-- VD1: Đánh index cho cột "CustomerName" trong bảng "Customers"
CREATE INDEX idx_CustomerName ON Customers(CompanyName);

-- VD2: Đánh index cho cột "ProductName" trong bảng "Products"
CREATE INDEX idx_ProductName ON Customers(CompanyName);

-- VD3: Tạo composite index cho cột "CustomerID" và "OrderDate" trong bảng "Orders"
CREATE INDEX idx_CustomerID_OrderDate ON Orders (CustomerID, OrderDate);

-- Thực hành 1:
-- Bước 1: Hãy restore lại CSDL theo hướng dẫn bên dưới

-- Bước 2: Thử truy cập câu truy vấn trước khi đánh index
SELECT *
FROM [Sales].[SalesOrderDetail]

SELECT COUNT(*)
FROM [Sales].[SalesOrderDetail]

-- Bật hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO ON;

-- Truy vấn
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE [CarrierTrackingNumber]='1B2B-492F-A9';

-- Tắt hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO OFF;

-- Tạo index cho [CarrierTrackingNumber]
CREATE INDEX inx_CarrierTrackingNumber
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber]);

-- Thực hành 2:
-- Tạo index trên bảng Person.Address, cootj AddressLine1 và đánh giá hiệu suất truy vấn

SELECT *
FROM [Person].[Address];

-- Bật hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO ON;

-- Truy vấn
SELECT *
FROM [Person].[Address]
WHERE [AddressLine1]='Downshire Way';

-- Tắt hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO OFF;

-- Tạo index cho [CarrierTrackingNumber]
CREATE INDEX inx_AddressLine1
ON [Person].[Address] ([AddressLine1]);

-- Tạo index cho cột "ProductName" trong bảng "Production.Product" và đánh giá hiệu suất truy vấn
SELECT *
FROM [Production].[Product];

-- Bật hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO ON;

-- Truy vấn
SELECT *
FROM [Production].[Product]
WHERE [Name]='Chainring Bolts';

-- Tắt hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO OFF;

-- Tạo index cho [CarrierTrackingNumber]
CREATE INDEX inx_Name
ON [Production].[Product] ([Name]);
