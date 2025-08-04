-- 9. Hàm lấy ngày, tháng, năm
    -- Số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
	SELECT
		[CustomerID],
		COUNT([OrderID]) AS [So luong don dat hang]
	FROM [dbo].[Orders]
	WHERE YEAR([OrderDate])=1997
	GROUP BY [CustomerID];
	
	SELECT
		[CustomerID],
		YEAR([OrderDate]) AS [Nam],
		COUNT([OrderID]) AS [So luong don dat hang]
	FROM [dbo].[Orders]
	WHERE YEAR([OrderDate])=1997
	GROUP BY [CustomerID],YEAR([OrderDate]);
	
	-- Loc ra cac don hang được đặt hàng vào tháng 5 năm 1997
	SELECT *
	FROM [dbo].[Orders]
	WHERE (MONTH([OrderDate])=5) AND (YEAR([OrderDate])=1997);
	
	-- Loc ra cac don hang được đặt hàng vào ngày 4 tháng 9 năm 1996
	SELECT *
	FROM [dbo].[Orders]
	WHERE (DAY([OrderDate])=4) AND
		  (MONTH([OrderDate])=9) AND
		  (YEAR([OrderDate])=1996);
	
	-- Lấy danh sách khách hàng đặt hàng trong năm 1998 và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần
	SELECT [CustomerID],
		   YEAR([OrderDate]) AS [Nam],
		   MONTH([OrderDate]) AS [Thang],
		   COUNT(*) AS [So luong don hang]
	FROM [dbo].[Orders]
	WHERE YEAR([OrderDate])=1998
	GROUP BY [CustomerID],
		     YEAR([OrderDate]),
		     MONTH([OrderDate])
	ORDER BY [CustomerID] ASC,
	         MONTH([OrderDate]) ASC;
	
	-- Lọc các đơn đặt hàng đã được giao vào tháng 5 và sắp xếp tăng dần theo năm
	SELECT *
	FROM [dbo].[Orders]
	WHERE MONTH([ShippedDate])=5
ORDER BY YEAR([ShippedDate]) ASC;