-- 6. Cộng, trừ, nhân, chia, chia lấy dư
	-- Tính số lượng sản phẩm còn lại trong kho (UnitsInStock) sau khi bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder).
	-- StockRemaining = UnitsInStock - UnitsOnOrder
	SELECT [ProductID],
		   [ProductName],
		   [UnitsInStock],
		   [UnitsOnOrder],
		   ([UnitsInStock] - [UnitsOnOrder]) AS [StockRemaining]
	FROM [dbo].[Products];
	
	-- Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
	SELECT
		*,
		([UnitPrice]*[Quantity]) AS [OrderDetailValue]
	FROM [dbo].[Order Details];
	
	-- Tính tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình của các đơn hàng trong bảng Orders so với giá trị vận chuyển của đơn hàng lớn nhất (MaxFreight)
	-- FreightRatio = AVG(Freight)/Max(Freight)
	SELECT (AVG([Freight])/MAX(Freight)) AS [FreightRatio]
	FROM [dbo].[Orders];
	
	-- Hãy liệt kê danh sách các sản phẩm và giá (UnitPrice) của từng sản phẩm sẽ được giảm đi 10%
	-- C1: dùng phép nhân + phép chia
	-- C2: chỉ được dùng phép nhân
	SELECT 
		*,
		([UnitPrice]*90/100) AS [SaleUnitPrice]
	FROM [dbo].[Products];
	
	SELECT 
		*,
		([UnitPrice]*0.9) AS [SaleUnitPrice]
	FROM [dbo].[Products];
