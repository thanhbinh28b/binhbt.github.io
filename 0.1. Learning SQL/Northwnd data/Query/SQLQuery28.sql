-- Tạo View
CREATE VIEW MonthlySales AS
SELECT
	YEAR([OrderDate]) AS "Năm",
	MONTH([OrderDate]) AS "Tháng",
	COUNT([OrderID]) AS "Số lượng đơn hàng"
FROM [dbo].[Orders]
GROUP BY
	YEAR([OrderDate]),
	MONTH([OrderDate]);

-- Truy vấn đến VIEW
SELECT * FROM [dbo].[MonthlySales];

-- Trương đương câu lệnh sau
SELECT * FROM (
	SELECT
		YEAR([OrderDate]) AS "Năm",
		MONTH([OrderDate]) AS "Tháng",
		COUNT([OrderID]) AS "Số lượng đơn hàng"
	FROM [dbo].[Orders]
	GROUP BY
		YEAR([OrderDate]),
		MONTH([OrderDate])
) AS temp;
-- Giúp viết code ngắn gọn hơn nhưng tốc độ thì như nhau do view không phải bảng thực sự mà phải truy cập lại dữ liệu gốc

-- VD2: Tạo Viet kết hợp thông tin khách hàng và đơn hàng
CREATE VIEW CustomerOrder AS
SELECT
	[c].[CustomerID],
	[c].[CompanyName],
	[o].[OrderID],
	[o].[OrderDate],
	[o].[ShipCountry]
FROM [dbo].[Customers] AS [c]
INNER JOIN [dbo].[Orders] AS [o]
ON [c].[CustomerID]=[o].[CustomerID];

SELECT * FROM [CustomerOrder];

-- VD3: Tạo View hiển thị tổng giá trị của từng đơn hàng
CREATE VIEW [OrderTotalValue] AS
SELECT
	[o].[OrderID],
	[o].[CustomerID],
	[o].[OrderDate],
	SUM([od].[Quantity]*[od].[UnitPrice]*(1-[od].[Discount])) AS [TotalOrderValue]
FROM [dbo].[Orders] AS [o]
JOIN [Order Details] AS [od]
ON [o].[OrderID]=[od].[OrderID]
GROUP BY
	[o].[OrderID],
	[o].[CustomerID],
	[o].[OrderDate];

SELECT * FROM [OrderTotalValue];

-- VD1: Sử dụng CHECK OPTION để chỉ cho phép chèn dữ liệu thoả mãn điều kiện. Giả sử bạn có một View có tên "HighValueProducts" để hiển thị sản phẩm có giá trị cao hơn $500.
CREATE VIEW HighValueProducts1 AS
	SELECT [ProductID], [ProductName], [UnitPrice]
	FROM [Products]
	WHERE [UnitPrice]>500
WITH CHECK OPTION;

-- VD1: Cách Read only view
CREATE VIEW employee_view_read_only AS
	SELECT
		[e].[EmployeeID],
		[e].[FirstName],
		[e].[LastName]
	FROM [dbo].[Employees] AS [e]
	UNION ALL
	SELECT NULL, NULL, NULL
-- Vi phạm điều kiện sử dụng UNION

SELECT * FROM [employee_view_read_only]

-- Thực hành về view
-- 1. Tạo một view có tên "HighValueProducts" để hiển thị danh sách các sản phẩm có giá trị cao hơn $50.
CREATE VIEW [HighValueProducts2] AS
	SELECT [ProductID], [ProductName], [UnitPrice]
	FROM [Products]
	WHERE [UnitPrice]>50
WITH CHECK OPTION;

SELECT * FROM [HighValueProducts2];


-- 2. Tạo một view có tên "CustomerOrders" để hiển thị thôgn tin về khách hàng và số lượng hàng của họ.
CREATE VIEW [CustomerOrders3] AS
SELECT
	[c].[CustomerID],
	[c].[CompanyName],
	COUNT([o].[OrderID]) AS [Số lượng đơn đặt hàng]
FROM [dbo].[Customers] AS [c]
INNER JOIN [dbo].[Orders] AS [o]
ON [c].[CustomerID]=[o].[CustomerID]
GROUP BY
	[c].[CustomerID],
	[c].[CompanyName];

SELECT * FROM [CustomerOrders3];

-- 3. Tạo một view có tên "EmployeeSalesByYear" để hiển thị tổng doanh số bán hàng của từng nhân viên theo năm.
CREATE VIEW [EmployeeSalesByYear] AS
SELECT
	[o].[EmployeeID],
	YEAR([o].[OrderDate]) AS "Year",
	SUM([od].[Quantity]*[od].[UnitPrice]*(1-[od].[Discount])) AS [TotalOrderValue]
FROM [dbo].[Orders] AS [o]
JOIN [dbo].[Order Details] AS [od]
ON [o].[OrderID]=[od].[OrderID]
GROUP BY
	[o].[EmployeeID],
	YEAR([o].[OrderDate]);

SELECT * FROM [EmployeeSalesByYear]
ORDER BY [EmployeeID];
-- 4. Tạo một view có tên "CategoryProductCounts" để hiển thị số lượng sản phẩm trong mỗi danh mục sản phẩm.
CREATE VIEW [CategoryProductCounts] AS
SELECT
	[c].[CategoryID],
	[c].[CategoryName],
	COUNT([p].[ProductID]) AS [Số lượng sản phẩm]
FROM [dbo].[Categories] AS [c]
JOIN [dbo].[Products] AS [p]
ON [c].[CategoryID]=[p].[CategoryID]
GROUP BY
	[c].[CategoryID],
	[c].[CategoryName];

SELECT * FROM [CategoryProductCounts]

-- 5. Tạo một view có tên "CustomerOrderSummary" để hiển thị tổng giá trị đặt hàng của mỗi khách hàng.
CREATE VIEW [CustomerOrderSummary] AS
SELECT
	[o].[CustomerID],
	SUM([od].[Quantity]*[od].[UnitPrice]*(1-[od].[Discount])) AS [TotalOrderValue]
FROM [dbo].[Orders] AS [o]
JOIN [dbo].[Order Details] AS [od]
ON [o].[OrderID]=[od].[OrderID]
GROUP BY
	[o].[CustomerID];

SELECT * FROM [CustomerOrderSummary];