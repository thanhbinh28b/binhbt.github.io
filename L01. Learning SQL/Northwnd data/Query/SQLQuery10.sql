-- 10. Lọc dữ liệu sau GROUP BY - HAVING
	-- Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, sắp xếp theo thứ tự tổng số đơn hàng giảm dần
	SELECT
		[CustomerID],
		COUNT(*) AS [So luong don hang]
	FROM [dbo].[Orders]
	GROUP BY [CustomerID]
	HAVING COUNT(*)>20
	ORDER BY [So luong don hang] DESC;
	-- Đối với HAVING không được sửa dụng Alias
	SELECT
		[CustomerID],
		COUNT(*) AS [So luong don hang]
	FROM [dbo].[Orders]
	GROUP BY [CustomerID]
	HAVING COUNT(*)>20
	ORDER BY COUNT(*) DESC;
	
	-- Hãy lọc ra những NCC sản phẩm có tổng số lượng hàng trong kho (UnitsInStock) lớn hơn 30,
	-- và có trung bình đơn giá (UnitPrice) có giá trị dưới 50
	SELECT
		[SupplierID],
		SUM([UnitsInStock]) AS [Tong SL HTK],
		AVG([UnitPrice]) AS [Trung binh don gia]
	FROM [dbo].[Products]
	GROUP BY [SupplierID]
	HAVING
		SUM([UnitsInStock])>30 AND
		AVG([UnitPrice])<50;
	
	-- Hãy cho biết tổng số tiền vận chuyể của từng tháng, trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần
	SELECT
		YEAR([ShippedDate]) AS [Year],
		MONTH([ShippedDate]) AS [Month],
		SUM([Freight]) AS [Total Freight]
	FROM [dbo].[Orders]
	GROUP BY YEAR([ShippedDate]),MONTH([ShippedDate])
	HAVING
		YEAR([ShippedDate])=1996 AND
		MONTH([ShippedDate])>6
	ORDER BY [Month] ASC;
	
	SELECT
		YEAR([ShippedDate]) AS [Year],
		MONTH([ShippedDate]) AS [Month],
		SUM([Freight]) AS [Total Freight]
	FROM [dbo].[Orders]
	WHERE 
		YEAR([ShippedDate])=1996 AND
		MONTH([ShippedDate])>6
	GROUP BY YEAR([ShippedDate]),MONTH([ShippedDate])
	ORDER BY [Month] ASC;
	
	SELECT
		YEAR([ShippedDate]) AS [Year],
		MONTH([ShippedDate]) AS [Month],
		SUM([Freight]) AS [Total Freight]
	FROM [dbo].[Orders]
	WHERE [ShippedDate] BETWEEN '1996-07-01' AND '1996-12-31'
	GROUP BY YEAR([ShippedDate]),MONTH([ShippedDate])
	ORDER BY [Month] ASC;
	
	-- Hãy cho biết tổng số tiền vận chuyển của từng tháng,
	-- trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần
	-- tổng tiền vận chuyển lớn hơn 1000$
	SELECT
		YEAR([ShippedDate]) AS [Year],
		MONTH([ShippedDate]) AS [Month],
		SUM([Freight]) AS [Total Freight]
	FROM [dbo].[Orders]
	WHERE [ShippedDate] BETWEEN '1996-07-01' AND '1996-12-31'
	GROUP BY YEAR([ShippedDate]),MONTH([ShippedDate])
	HAVING SUM([Freight])>1000
	ORDER BY [Month] ASC;
	
	-- Lọc ra những thành phố có số lượng đơn hàng > 16 và sắp xếp theo tổng số lượng giảm dần
	SELECT
		[ShipCity],
		COUNT(*) AS [Total Order]
	FROM [dbo].[Orders]
	GROUP BY [ShipCity]
	HAVING COUNT(*)>16
	ORDER BY [Total Order] DESC;
