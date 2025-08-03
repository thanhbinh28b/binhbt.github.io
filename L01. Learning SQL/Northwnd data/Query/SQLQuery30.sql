-- VD1: Tạo một stored procedure để lấy thông tin về sản phẩm dựa trên sản phẩm được cung cấp
CREATE PROCEDURE GetProductByName
	@ProductName NVARCHAR(100)
AS
BEGIN
	SELECT *
	FROM [dbo].[Products]
	WHERE [ProductName] = @ProductName
END

-- Sử dụng:
EXEC GetProductByName @ProductName='Chai'

-- Tạo một stored procedure để tính tổng doanh số bán hàng của một nhân viên dựa trên EmployeeID
CREATE PROCEDURE GetAmountByEmployee
	@EmployeeID INT
AS
BEGIN
	SELECT
		[o].[EmployeeID],
		SUM([od].[Quantity]*[od].[UnitPrice]*(1-[od].[Discount])) AS [Amount]
	FROM [dbo].[Orders] AS [o]
	JOIN [dbo].[Order Details] AS [od]
	ON [o].[OrderID]=[od].[OrderID]
	WHERE [o].[EmployeeID]=@EmployeeID
	GROUP BY [o].[EmployeeID]
END

-- Sử dụng:
EXEC GetAmountByEmployee @EmployeeID=1

-- Tạo một stored procedure để thêm mới khách hàng vào bảng Customers
CREATE PROCEDURE AddCustomer
	@CustomerID NVARCHAR(5),
	@CompanyName NVARCHAR(40),
	@ContactName NVARCHAR(30),
	@ContactTitle NVARCHAR(30)
AS
BEGIN
	INSERT INTO [dbo].[Customers] (
		[CustomerID],
		[CompanyName],
		[ContactName],
		[ContactTitle]
	)
	VALUES (
		@CustomerID,
		UPPER(@CompanyName),
		@ContactName,
		@ContactTitle
	)
END

EXEC AddCustomer
	@CustomerID='NEWN',
	@CompanyName='titv.vn',
	@ContactName='Tung Le',
	@ContactTitle='Mr.'

-- Tạo một stord procedure để cập nhật giá của tất cả
-- các sản phẩm thuộc một danh mục cụ thể.
CREATE PROCEDURE IncreasePrice
	@ProductId INT,
	@PriceIncrease DECIMAL(10,2)
AS
BEGIN
	UPDATE [dbo].[Products]
	SET [UnitPrice]=[UnitPrice]+@PriceIncrease
	WHERE [ProductID] = @ProductId
END

EXEC IncreasePrice
	@ProductID=1,
	@PriceIncrease=100;

-- BT1: Viết một Stored Procedure để truy xuất danh sách các đơn đặt hàng cho một khách hàng dựa trên tên khách hàng. Tham số đầu vào là tên khách hàng, và Stored Procedure sẽ trả về danh sách các đơn đặt hàng liên quân
CREATE PROCEDURE OrderIDbyCustomer
	@CompanyName NVARCHAR(40)
AS
BEGIN
	SELECT
		[c].[CompanyName],
		[o].*
	FROM [dbo].[Customers] AS [c]
	JOIN [dbo].[Orders] AS [o]
	ON [c].[CustomerID]=[o].[CustomerID]
	WHERE [c].[CompanyName]=@CompanyName
END

EXEC OrderIDbyCustomer @CompanyName='Around the Horn'
-- BT2: Viết một Stored Procedure để cập nhật số lượng hàng tồn kho cho một sản phẩm cụ thể dựa trên ID sản phẩm và số lượng mới. Stored Procedure này sẽ nhận vào ID sản phẩm và số lượng mới, sau đó cập nhật số lượng tồn kho trong bảng Products,
CREATE PROCEDURE ChangeUnitsInStock
	@ProductId INT,
	@NewUnitsInStock SMALLINT
AS
BEGIN
	UPDATE [dbo].[Products]
	SET [UnitsInStock]=@NewUnitsInStock
	WHERE [ProductID] = @ProductId
END

EXEC ChangeUnitsInStock
	@ProductID=1,
	@NewUnitsInStock=100;
-- BT3: Viết một Stored Procedure để truy xuất danh sách các sản phẩm thuộc một danh mục cụ thể và giới hạn số lượng sản phẩm trả về. Tham số đầu vào bao gồm ID danh mục và số lượng sản phẩm cần trả về.
CREATE PROCEDURE SelectTopProductFromCategory
	@CategoryID INT,
	@TopProduct INT
AS
BEGIN
	SELECT TOP(@TopProduct) *
	FROM [dbo].[Products]
	WHERE [CategoryID]=@CategoryID
END

EXEC SelectTopProductFromCategory
	@CategoryID=1,
	@TopProduct=2
-- BT4: Viết một Stored Procedure để truy xuất danh sách khách hàng dựa trên khu vực địa lý (Region) hoặc quốc gia (Country) của họ
CREATE PROCEDURE CustomerFromCountry
	@Country NVARCHAR(15)
AS
BEGIN
	SELECT *
	FROM [dbo].[Customers]
	WHERE [Country]=@country
END

EXEC CustomerFromCountry
	@Country='UK'