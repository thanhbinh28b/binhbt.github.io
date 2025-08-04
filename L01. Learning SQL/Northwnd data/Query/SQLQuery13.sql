-- 13. Các câu lệnh JOIN trong SQL
-- INNER JOIN
	-- VD1: Sử dụng INNER JOIN, hãy in ra các thông tin sau đây:
	-- Mã đơn hàng
	-- Tên công ty khách hàng
	
	SELECT
		[o].[OrderID],
		[c].[CompanyName]
	FROM [dbo].[Orders] AS [o]
	INNER JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID];
	
	-- VD2: Sử dụng INNER JOIN
	-- Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
	-- Mã thể loại
	-- Tên thể loại
	-- Mã sản phẩm
	-- Tên sản phẩm
	
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		[p].[ProductID],
		[p].[ProductName]
	FROM [dbo].[Categories] AS [c]
	INNER JOIN [dbo].[Products] AS [p]
	ON [c].[CategoryID]=[p].[CategoryID];
	
	-- VD3: Sử dụng INNER JOIN
	-- Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
	-- Mã thể loại
	-- Tên thể loại
	-- Số lượng sản phẩm
	
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		COUNT([p].[ProductID]) AS [Số lượng sản phẩm]
	FROM [dbo].[Categories] AS [c]
	INNER JOIN [dbo].[Products] AS [p]
	ON [c].[CategoryID]=[p].[CategoryID]
	GROUP BY
		[c].[CategoryID],
		[c].[CategoryName];

-- LEFT JOIN
	-- VD4: Sử dụng INNER JOIN, LEFT JOIN sau khi thêm Mã thể loại mới
	-- Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
	-- Mã thể loại
	-- Tên thể loại
	-- Số lượng sản phẩm
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		COUNT([p].[ProductID]) AS [Số lượng sản phẩm]
	FROM [dbo].[Categories] AS [c]
	INNER JOIN [dbo].[Products] AS [p]
	ON [c].[CategoryID]=[p].[CategoryID]
	GROUP BY
		[c].[CategoryID],
		[c].[CategoryName];
	
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		COUNT([p].[ProductID]) AS [Số lượng sản phẩm]
	FROM [dbo].[Categories] AS [c]
	LEFT JOIN [dbo].[Products] AS [p]
	ON [c].[CategoryID]=[p].[CategoryID]
	GROUP BY
		[c].[CategoryID],
		[c].[CategoryName];

-- RIGHT JOIN
	-- VD5: Sử dụng INNER JOIN, RIGHT JOIN hãy in ra các thông tin sau đây:
	-- Mã đơn hàng
	-- Tên công ty khách hàng
	
	SELECT
		[o].[OrderID],
		[c].[CompanyName]
	FROM [dbo].[Orders] AS [o]
	INNER JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID];
	
	SELECT
		[o].[OrderID],
		[c].[CompanyName]
	FROM [dbo].[Orders] AS [o]
	RIGHT JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID];
	
-- FULL JOIN
	-- VD7: Sử dụng INNER JOIN, FULL JOIN sau khi thêm sản phẩm mới
	-- Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
	-- Mã thể loại
	-- Tên thể loại
	-- Mã sản phẩm
	-- Tên sản phẩm
	
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		[p].[ProductID],
		[p].[ProductName]
	FROM [dbo].[Categories] AS [c]
	INNER JOIN [dbo].[Products] AS [p]
	ON [c].[CategoryID]=[p].[CategoryID];
	
	SELECT
		[c].[CategoryID],
		[c].[CategoryName],
		[p].[ProductID],
		[p].[ProductName]
	FROM [dbo].[Categories] AS [c]
	FULL JOIN [dbo].[Products] AS [p]
	ON [c].[CategoryID]=[p].[CategoryID];

	-- CH 1: Hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng "Orders".
	SELECT
		[oc].[OrderID],
		[oc].[ContactName],
		[e].[LastName],
		[e].[FirstName]
		FROM
		(SELECT
			[o].[OrderID],
			[o].[EmployeeID],
			[c].[ContactName]
			FROM
			[dbo].[Orders] AS [o]
			INNER JOIN [dbo].[Customers] AS [c]
			ON [o].[CustomerID]=[c].[CustomerID]) AS [oc]
		INNER JOIN [dbo].[Employees] AS [e]
		ON [oc].[EmployeeID]=[e].[EmployeeID];
	
	SELECT
		[o].[OrderID],
		[c].[ContactName],
		[e].[LastName],
		[e].[FirstName]
	FROM
		[dbo].[Orders] AS [o]
		INNER JOIN [dbo].[Customers] AS [c]
		ON [o].[CustomerID]=[c].[CustomerID]
		INNER JOIN [dbo].[Employees] AS [e]
		ON [o].[EmployeeID]=[e].[EmployeeID];
	
	-- CH2: hãy liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng "Products", bao gồm cả các sản phẩm không có nhà cung cấp.
	SELECT
		[s].[ContactName],
		[p].[ProductName]
	FROM
		[dbo].[Products] AS [p]
		LEFT JOIN [dbo].[Suppliers] AS [s]
		ON [p].[SupplierID]=[s].[SupplierID];
	
	-- CH3: Hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng "Orders", bao gồm cả các khách hàng không có đơn hàng.
	SELECT
		[c].[ContactName],
		[o].[OrderID]
	FROM
		[dbo].[Orders] AS [o]
		RIGHT JOIN [dbo].[Customers] AS [c]
		ON [o].[CustomerID]=[c].[CustomerID];
	
	-- CH4: Hãy liệt kê tên danh mục và tên nhà cung capá của các sản phẩm trong bảng "Products", bao gồm cả các dnah mục và nhà cung cấp không có sản phẩm
	SELECT
		[c].[CategoryName],
		[s].[ContactName],
		[p].[ProductName]
	FROM
		[dbo].[Products] AS [p]
		FULL JOIN [dbo].[Categories] AS [c]
		ON [p].[CategoryID]=[c].[CategoryID]
		FULL JOIN [dbo].[Suppliers] AS [s]
		ON [p].[SupplierID]=[s].[SupplierID];
	
	
	Bài tập luyện tập:
	
-- CH 1: Hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng "Orders".
SELECT
	[oc].[OrderID],
	[oc].[ContactName],
	[e].[LastName],
	[e].[FirstName]
	FROM
	(SELECT
		[o].[OrderID],
		[o].[EmployeeID],
		[c].[ContactName]
		FROM
		[dbo].[Orders] AS [o]
		INNER JOIN [dbo].[Customers] AS [c]
		ON [o].[CustomerID]=[c].[CustomerID]) AS [oc]
	INNER JOIN [dbo].[Employees] AS [e]
	ON [oc].[EmployeeID]=[e].[EmployeeID];

SELECT
	[o].[OrderID],
	[c].[ContactName],
	[e].[LastName],
	[e].[FirstName]
FROM
	[dbo].[Orders] AS [o]
	INNER JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID]
	INNER JOIN [dbo].[Employees] AS [e]
	ON [o].[EmployeeID]=[e].[EmployeeID];

-- CH2: hãy liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng "Products", bao gồm cả các sản phẩm không có nhà cung cấp.
SELECT
	[s].[ContactName],
	[p].[ProductName]
FROM
	[dbo].[Products] AS [p]
	LEFT JOIN [dbo].[Suppliers] AS [s]
	ON [p].[SupplierID]=[s].[SupplierID];

-- CH3: Hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng "Orders", bao gồm cả các khách hàng không có đơn hàng.
SELECT
	[c].[ContactName],
	[o].[OrderID]
FROM
	[dbo].[Orders] AS [o]
	RIGHT JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID];

-- CH4: Hãy liệt kê tên danh mục và tên nhà cung capá của các sản phẩm trong bảng "Products", bao gồm cả các dnah mục và nhà cung cấp không có sản phẩm
SELECT
	[c].[CategoryName],
	[s].[ContactName],
	[p].[ProductName]
FROM
	[dbo].[Products] AS [p]
	FULL JOIN [dbo].[Categories] AS [c]
	ON [p].[CategoryID]=[c].[CategoryID]
	FULL JOIN [dbo].[Suppliers] AS [s]
	ON [p].[SupplierID]=[s].[SupplierID];

-- Bài tập ôn luyện:
-- BT1 (INNER JOIN): Liệt kê tên sản phẩm và tên nhà cung cấp của các sản phẩm đã được đặt hàng trong bảng "Order Details". Sử dụng INNER JOIN để kết hợp bảng "Order Details" với các bảng liên quan để lấy thông tin sản phẩm và nhà cung cấp
SELECT DISTINCT
	[od].[ProductID],
	[p].[ProductName],
	[s].[ContactName]
FROM
	[dbo].[Order Details] AS [od]
	INNER JOIN [dbo].[Products] AS [p]
	ON [od].[ProductID]=[p].[ProductID]
	INNER JOIN [dbo].[Suppliers] AS [s]
	ON [p].[SupplierID]=[s].[SupplierID];

-- BT2 (LEFT JOIN):Liệt kê tến khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng "Orders". Bao gồm cả các đơn hàng không có nhân viên phu trách. Sử dụng LEFT JOIN để kết hợp bảng "Orders" với bảng "Employees" để lấy thông tin về khách hàng và nhân viên phụ trách
SELECT
	[c].[ContactName],
	[e].[LastName],
	[e].[FirstName]
FROM
	[dbo].[Orders] AS [o]
	LEFT JOIN [dbo].[Customers] AS [c]
	ON [c].[CustomerID]=[o].[CustomerID]
	LEFT JOIN [dbo].[Employees] AS [e]
	ON [o].[EmployeeID]=[e].[EmployeeID];

-- BT3 (RIGHT JOIN): Liệt kê tên khách hàng và ên nhân viên phụ trách của các đơn hàng trong bảng "Orders". Bao gồm cả các khách hàng không có đơn hàng. Sử dụng RIGHT JOIN để kết hơp bảng "Orders" với bảng "Customers" để lấy thông tin về khách hàng và nhân viên phụ trách
SELECT
	[c].[ContactName],
	[e].[LastName],
	[e].[FirstName]
FROM
	[dbo].[Orders] AS [o]
	RIGHT JOIN [dbo].[Employees] AS [e]
	ON [o].[EmployeeID]=[e].[EmployeeID]
	RIGHT JOIN [dbo].[Customers] AS [c]
	ON [c].[CustomerID]=[o].[CustomerID];

SELECT
	[c].[ContactName],
	[e].[LastName],
	[e].[FirstName]
FROM
	[dbo].[Orders] AS [o]
	RIGHT JOIN [dbo].[Customers] AS [c]
	ON [c].[CustomerID]=[o].[CustomerID]
	FULL JOIN [dbo].[Employees] AS [e]
	ON [o].[EmployeeID]=[e].[EmployeeID];

-- BT4 (FULL JOIN): Liệt kê tên dnah mục và tên nahf cung cấp của các sản phẩm trong bảng "Products". Bao gồm cả các danh mục và nhà cung cấp không có sản phẩm. Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN và RIGHT JOIN để lấy thông tin về danh mục và nhà cung cấp.
SELECT
	[p].[ProductID],
	[p].[ProductName],
	[c].[CategoryName],
	[s].[ContactName]
FROM
	[dbo].[Products] AS [p]
	FULL JOIN [dbo].[Categories] AS [c]
	ON [p].[CategoryID]=[c].[CategoryID]
	FULL JOIN [dbo].[Suppliers] AS [s]
	ON [p].[SupplierID]=[s].[SupplierID];

-- BT5 (INNER JOIN): Liệt kê tên khách hàng và tên sản phẩm đã được đặt hàng trong bảng "Orders" và "Order Details". Sử dụng INNER JOIN để kết hợp bảng "Order Details". Sử dụng INNER JOIN để kết hoăpj bảng "Orders" và "Order Details" để lấy thông tin khách hàng và sản phẩm đã được đặt hàng.
SELECT
	[c].[ContactName],
	[p].[ProductName]
FROM
	[dbo].[Orders] AS [o]
	INNER JOIN [dbo].[Order Details] AS [od]
	ON [o].[OrderID]=[od].[OrderID]
	LEFT JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID]
	LEFT JOIN [dbo].[Products] AS [p]
	ON [od].[ProductID]=[p].[ProductID];

-- BT6 (FULL JOIN): Liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng "Orders". Bao gồm cả các đơn hàng không có nhân viên hoặc khách hàng tương ứng. Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN và RIGHT JOIN để kết hợp bảng "Orders" với bảng "Employees" và "Customers" để lấy thông tin về nhân viên và khách hàng
SELECT
	[o].[OrderID],
	[e].[LastName],
	[e].[FirstName],
	[c].[ContactName]
FROM
	[dbo].[Orders] AS [o]
	LEFT JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID]
	LEFT JOIN [dbo].[Employees] AS [e]
	ON [o].[EmployeeID]=[e].[EmployeeID];

SELECT
	[o].[OrderID],
	[e].[LastName],
	[e].[FirstName],
	[c].[ContactName]
FROM
	[dbo].[Orders] AS [o]
	FULL JOIN [dbo].[Customers] AS [c]
	ON [o].[CustomerID]=[c].[CustomerID]
	FULL JOIN [dbo].[Employees] AS [e]
	ON [o].[EmployeeID]=[e].[EmployeeID];
