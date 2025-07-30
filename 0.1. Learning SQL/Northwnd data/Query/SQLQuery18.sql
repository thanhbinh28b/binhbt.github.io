-- 19. Tính toán trên một tập dữ liệu con (window) của bảng dữ liệu

-- VD: Xếp hạng sản phẩm theo giá giảm dần trên toàn bộ table
SELECT
	[ProductID],
	[ProductName],
	[CategoryID],
	[UnitPrice],
	RANK() OVER (ORDER BY [UnitPrice] DESC) AS [Ranking]
FROM [dbo].[Products];

-- VD: Xếp hạng sản phẩm theo giá giảm dần trên thể loại
SELECT
	[ProductID],
	[ProductName],
	[CategoryID],
	[UnitPrice],
	RANK() OVER (PARTITION BY [CategoryID] ORDER BY [UnitPrice] DESC) AS [Ranking]
FROM [dbo].[Products];

-- Tạo bảng "sinh_vien"
CREATE TABLE [sinh_vien] (
    [ma_sinh_vien] INT PRIMARY KEY,
    [ho_ten] NVARCHAR(255),
    [diem_trung_binh] DECIMAL(3, 2),
    [ma_lop_hoc] INT
);
-- Chèn 20 dòng dữ liệu thực tế vào bảng
INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])
VALUES
    (1, N'Nguyễn Văn A', 3.75, 101),
    (2, N'Trần Thị B', 3.88, 102),
    (3, N'Phạm Văn C', 3.75, 101),
    (4, N'Huỳnh Thị D', 3.92, 103),
    (5, N'Lê Văn E', 3.60, 102),
    (6, N'Ngô Thị F', 3.78, 101),
    (7, N'Trịnh Văn G', 3.65, 102),
    (8, N'Võ Thị H', 3.80, 103),
    (9, N'Đặng Văn I', 3.55, 101),
    (10, N'Hoàng Thị K', 3.95, 102),
    (11, N'Mai Thị L', 3.70, 103),
    (12, N'Lý Thị M', 3.62, 101),
    (13, N'Chu Thị N', 3.85, 102),
    (14, N'Đỗ Thị P', 3.58, 103),
    (15, N'Dương Văn Q', 3.72, 101),
    (16, N'Lâm Thị R', 3.85, 102),
    (17, N'Nguyễn Văn S', 3.68, 101),
    (18, N'Nguyễn Thị T', 3.75, 103),
    (19, N'Nguyễn Văn U', 3.93, 102),
    (20, N'Nguyễn Thị V', 3.67, 101);

-- Xếp hạng sinh viên toàn trường dựa trên điểm tb giảm dần
SELECT
	[ma_sinh_vien],
	[ho_ten],
	[diem_trung_binh],
	[ma_lop_hoc],
	RANK() OVER (ORDER BY [diem_trung_binh] DESC) AS [Ranking]
FROM [dbo].[sinh_vien];

-- Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần
SELECT
	[ma_sinh_vien],
	[ho_ten],
	[diem_trung_binh],
	[ma_lop_hoc],
	RANK() OVER (PARTITION BY [ma_lop_hoc] ORDER BY [diem_trung_binh] DESC) AS [Ranking]
FROM [dbo].[sinh_vien];
-- Với RANK nếu sử dụng có 2 hạng 2 thì nó sẽ không có hạng 3 mà sang luôn hạng 4

-- Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần, không nhảy xếp hạng
SELECT
	[ma_sinh_vien],
	[ho_ten],
	[diem_trung_binh],
	[ma_lop_hoc],
	DENSE_RANK() OVER (PARTITION BY [ma_lop_hoc] ORDER BY [diem_trung_binh] DESC) AS [Ranking]
FROM [dbo].[sinh_vien];
-- Với RANK nếu sử dụng có 2 hạng 2 thì hạng sau đó vẫn là 3

-- Xếp hạng sinh viên theo từng lớp học dựa trên điểm tb giảm dần, không bị trùng hạng
SELECT
	[ma_sinh_vien],
	[ho_ten],
	[diem_trung_binh],
	[ma_lop_hoc],
	ROW_NUMBER() OVER (PARTITION BY [ma_lop_hoc] ORDER BY [diem_trung_binh] DESC) AS [Ranking]
FROM [dbo].[sinh_vien];
-- Xếp số lần lượt từ trên xuống, k trùng hay bỏ qua số nào

-- Chúng ta sẽ sử dụng hàm LAG() để lấy thông tin về đơn đặt hàng và ngày đặt hàng của đơn đặt hàng trước đó cho mỗi khách hàng.
SELECT
	[CustomerID],
	[OrderID],
	[OrderDate],
	LAG([OrderDate]) OVER (PARTITION BY [CustomerID] ORDER BY [OrderDate] ASC) AS [PreviousOrderDate]
FROM [dbo].[Orders]
ORDER BY [CustomerID], [OrderDate];

-- Tính tổng doanh số bán hàng năm cho mỗi khách hàng và xếp hạng khách hàng dựa trên doanh số bán hàng
WITH [TotalAmount] AS (
	SELECT
		[o].[CustomerID],
		SUM([od].[UnitPrice]*[od].[Quantity]*(1-[od].[Discount])) AS [Amount],
		YEAR([o].[OrderDate]) AS [Year]

	FROM [dbo].[Order Details] AS [od]
	INNER JOIN [dbo].[Orders] AS [o]
	ON [od].[OrderID]=[o].[OrderID]
	GROUP BY
		[o].[CustomerID],
		YEAR([o].[OrderDate])
	)
SELECT
	[c].[CustomerID],
	[c].[CompanyName],
	[TotalAmount].[Year],
	[TotalAmount].[Amount],
	RANK() OVER (PARTITION BY [TotalAmount].[Year] ORDER BY [TotalAmount].[Amount] DESC) AS [Ranking]
FROM [dbo].[Customers] AS [c]
	INNER JOIN [TotalAmount]
	ON [c].[CustomerID]=[TotalAmount].[CustomerID]
	
