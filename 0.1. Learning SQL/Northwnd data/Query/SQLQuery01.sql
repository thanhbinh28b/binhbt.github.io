	-- 1. Câu lệnh truy vấn SELECT
    -- SELECT … FROM …
    -- Viet cau lenh SQL lay ra ten cua tat ca cac san pham
	SELECT [ProductName]
	FROM [dbo].[Products]
	
    -- Viet cau lenh lay ra ten san pham, gia ban trn moi don vi, so lung san pham tren don vij
	SELECT [ProductName], [UnitPrice], [QuantityPerUnit]
	FROM [dbo].[Products];
	
    -- Viet cau lenh lay ra ten cong ty va quoc gia cuar cac khach hang do
	SELECT [CompanyName], [Country]
	FROM [dbo].[Customers];
	
	SELECT CompanyName, Country
	FROM dbo.Customers;
	
	-- Viet cau lenh lay ra ten cong ty va sdt cua tat ca cac khach hang do
	SELECT CompanyName, Phone
	FROM dbo.Suppliers;

    -- Câu lệnh SELECT * FROM
	-- Lay ra tat ca du lieu tu bang Products
	select *
	from [dbo].[Products];
	
	-- Lay ra tat ca du lieu tu bang khach hang
	select *
	from [dbo].[Customers];
	
	-- Lay ra tat ca du lieu tu bang ncc
	select *
	from [dbo].[Suppliers];

    -- Câu lệch SELECT DISTINCT
	-- Lay ra Country khac nhau tu bang Customers
	SELECT DISTINCT [Country]
	FROM [dbo].[Customers];
	
	-- Lay ra PostalCode khac   nhau tu bang Suppliers
	SELECT DISTINCT [PostalCode]
	FROM [dbo].[Suppliers];
	
	-- Lay du lieu khac nhau ve ho nhan vien (LastName) va cach goi danh hieu lich su (TitleOfCourtesy) cuar nhan vien tu bang Employees
	SELECT DISTINCT [LastName], [TitleOfCourtesy]
	FROM [dbo].[Employees];

    -- SELECT … TOP … FROM …
	-- Lay ra 05 dong dau tien trong bang Customers
	SELECT TOP 5 *
	FROM [dbo].[Customers];
	
	-- Lay ra 30% nhan vien của cong ty
	SELECT TOP 30 PERCENT *
	FROM [dbo].[Employees];
	
	-- lay ra các don hang vơi ma khach hang khong duoc trung lap, chi lay 5 dong dau tien
	SELECT DISTINCT TOP 5 [CustomerID]
	FROM [dbo].Orders
	
	-- Lay ra cac san pham co ma the loai khong bi trung lap, va chi lay ra 3 dong dau tien
	SELECT DISTINCT TOP 3 [categoryid]
	FROM [dbo].[Products];

