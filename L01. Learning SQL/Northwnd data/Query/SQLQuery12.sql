-- 12. Kết hợp các kết quả
--	1. Truy vấn I
--	Từ bảng Order Details hãy liệt kê các đơn đặt hàng có Unit Price nằm trong phạm vi từ 100 đến 200.
	
	SELECT OrderID
	FROM [dbo].[Order Details]
	WHERE [UnitPrice] BETWEEN 100 AND 200;
	
--	2. Truy vấn II
--	Đưa ra các đơn đặt hàng có Quantity bằng 10 hoặc 20
	
	SELECT OrderID
	FROM [dbo].[Order Details]
	WHERE [Quantity] IN (10,20);
	
--	3. Truy vấn III
--	Từ bảng Order Details hãy liệt kê các đơn đặt hàng có Unit Price nằm trong phạm vi từ 100 đến 200 và đơn hàng phải có Quantity bằng 10 hoặc 20
	
	SELECT [OrderID]
	FROM [dbo].[Order Details]
	WHERE
		[UnitPrice] BETWEEN 100 AND 200 AND
		[Quantity] IN (10,20);
	
--	4. Truy vấn IV
--	Từ bảng Order Details hãy liệt kê các đơn đặt hàng có Unit Price nằm trong phạm vi từ 100 đến 200 hoặc đơn hàng phải có Quantity bằng 10 hoặc 20
	
	SELECT [od].*
	FROM [dbo].[Order Details] AS [od]
	WHERE
		([UnitPrice] BETWEEN 100 AND 200) OR
		([Quantity] IN (10,20));
		
--	5. Từ bảng Order Details hãy liệt kê các đơn đặt hàng có Unit Price nằm trong phạm vi từ 100 đến 200 hoặc đơn hàng phải có Quantity bằng 10 hoặc 20, có sử dụng DISTINCT
	
	SELECT DISTINCT [od].*
	FROM [dbo].[Order Details] AS [od]
	WHERE
		([UnitPrice] BETWEEN 100 AND 200) OR
        ([Quantity] IN (10,20));