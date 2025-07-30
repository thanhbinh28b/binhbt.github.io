-- VD1: Trigger khi insert sẽ chuyển productName về viết hoa toàn bộ
CREATE TRIGGER MakeProductNameUpperCase
ON [dbo].[Products]
AFTER INSERT
AS
BEGIN
	UPDATE Products
	SET ProductName = UPPER(i.ProductName)
	FROM inserted i
	WHERE Products.ProductID = i.ProductID
END

INSERT [dbo].[Products]([ProductName], [SupplierID], [CategoryID])
VALUES ('test name', 1, 1)

-- VD2: Chặn không cho phép cập nhật Discontinued nhỏ hơn 0 (đề bài sai)
CREATE TRIGGER PreventDiscountinued
ON [dbo].[Products]
FOR UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM inserted WHERE [Discontinued]!=0 AND [Discontinued]!=1)
	BEGIN
		ROLLBACK;
		RAISERROR('[Discountined] không thể nhỏ hơn 0', -- Message text
		16, -- Severity
		1 -- State.
		);
	END
END

UPDATE [dbo].[Products]
SET [Discontinued]=2
WHERE [ProductID]=79

-- Viết mộg trigger trong CSDL để đảm bảo rằng mỗi khi có 1 chi tiết đơn hàng mới được thêm vào,
-- số lượng tồn kho phải được giảm đi 
CREATE TRIGGER UpdateProductInventory
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN
	UPDATE [dbo].[Products]
	SET [UnitsInStock] = [UnitsInStock]-(SELECT [Quantity] FROM inserted WHERE [dbo].[Products].ProductID = inserted.ProductID)
	WHERE [dbo].[Products].[ProductID] IN (SELECT [ProductID] FROM inserted)
END


INSERT INTO [dbo].[Order Details]([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
VALUES (10248, 78, 10, 50, 0);

-- Bài tập
-- BT1: Bổ sung thêm cột LastModified và tạo một trigger để sau khi một sản phẩm dược thêm vào hoặc cập nhật vào bảng "Products" tự động cập nhật trường "LastModified" với ngày và giờ hiện tại
-- Bổ sung thêm cột LastModified
ALTER TABLE [dbo].[Products]
DROP COLUMN  [LastModified];

ALTER TABLE [dbo].[Products]
ADD [LastModified] datetime;

CREATE TRIGGER AddLastModified
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE [Products]
	SET [LastModified]=GETDATE()
	FROM [Products]
	JOIN inserted i
	ON Products.ProductID = i.ProductID
END

UPDATE [dbo].[Products]
SET [UnitsInStock]=200
WHERE [ProductID]=79

-- BT2: Tạo một trigger "INSTEAD OF DELETE" để kiểm tra xem khách hàng có đơn hàng (Orders) không. Nếu có, trigger không cho phép xoá khách hàng. Nếu không có đơn hàng liên quan, trigger thực hiện xoá khách hàng.
CREATE TRIGGER DeleteCustomers
ON [dbo].[Customers]
INSTEAD OF DELETE
AS
BEGIN
	IF EXISTS(
		SELECT 1 
		FROM [Orders] WHERE [Orders].[CustomerID] IN (SELECT CustomerID FROM deleted))
	BEGIN
	-- Nếu khách hàng có đơn hàng khôgn cho phép xoá
		ROLLBACK;
		RAISERROR('Không thể xoá khách hàng vì có đơn hàng liên quan', -- Message text
		16, -- Severity
		1 -- State.
		);
	END
	ELSE
	BEGIN
		DELETE FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM deleted);
	END
END

DELETE FROM [dbo].[Customers]
WHERE [CustomerID] LIKE 'ALFKI'

-- BT3: Tạo một trigger trong cơ sở dữ liệu Northwind để kiểm tra và không cho phép đặt hàng (Order) với số lượng sản phẩm lớn hơn số lượng tồn kho