-- 7. Mệnh đề Where
-- Các phép so sánh
	-- Liệt kê tất cả các nhân viên đến từ thành phố London
	SELECT *
	FROM [dbo].[Employees]
	WHERE [City]='London';
	
	-- Liệt kê tất cả các nhân viên đến từ thành phố London
	-- Sắp xếp theo Lastname
	SELECT *
	FROM [dbo].[Employees]
	WHERE [City]='London'
	ORDER BY [LastName] ASC;
	
	-- Liệt kê tất cả các đơn hàng bị giao muộn, biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate.
	SELECT
		[OrderID],
		[RequiredDate],
		[ShippedDate]
	FROM [dbo].[Orders]
	WHERE [ShippedDate]>[RequiredDate];
	
	-- Đếm tất cả các đơn hàng bị giao muộn, biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate.
	SELECT COUNT(*) AS [So don giao hang muon]
	FROM [dbo].[Orders]
	WHERE [ShippedDate]>[RequiredDate];
	
	-- Tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%
	-- (Discount > 0.1)
	SELECT *
	FROM [dbo].[Order Details]
	WHERE [Discount]>0.1;
	
	-- Tất cả các đơn hàng chi tiết được giảm giá từ 10% đến 20%
	-- (Discount > 0.1 và Discount <0.2)
	SELECT *
	FROM [dbo].[Order Details]
	WHERE [Discount]>=0.1 AND [Discount]<0.2;
	
	-- Liệt kê tất cả cads đơn hàng được gửi đến quốc gia là "France"
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry]='France'
	
	-- Liệt kê sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20
	SELECT *
	FROM [dbo].[Products]
    WHERE [UnitsInStock]>20;

-- Và, hoặc, phủ định
-- AND - VÀ
-- OR - HOẶC
-- NOT - PHỦ ĐỊNH  
	-- Liệt kê tất cả các sản phẩm có số lượng trong kho (UnitsInStock) thuộc khoảng nhỏ hơn 50 hoặc lớn hơn 100
	SELECT *
	FROM [dbo].[Products]
	WHERE [UnitsInStock]<50 OR [UnitsInStock]>100;
	
	-- Liệt kê tất các đơn hàng được giao đến Brazil, đã bị giao muộn, biết rằng ngày cần phải giao hàng là RequiredDate
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry]='Brazil' AND [RequiredDate]<[ShippedDate];
	
	--Lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khác 1
	SELECT *
	FROM [dbo].[Products]
	WHERE [UnitPrice]>=100 OR [CategoryID]=1;
	
	SELECT *
	FROM [dbo].[Products]
	WHERE NOT([UnitPrice]>=100 OR [CategoryID]=1);
	
	-- Liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50,100] đô la
	SELECT *
	FROM [dbo].[Orders]
	WHERE [Freight]>=50 AND [Freight]<=100;
	
	-- Liệt các sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20
	-- và số lượng hàng trong đơn hàng (UnitsOnOrder) nhỏ hơn 20.
	SELECT *
	FROM [dbo].[Products]
    WHERE [UnitsInStock]>20 AND [UnitsOnOrder]<20;

-- Toán tử Between
	-- Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la
	SELECT *
	FROM [dbo].[Products]
	WHERE [UnitPrice] BETWEEN 10 AND 20;
	
	SELECT *
	FROM [dbo].[Products]
	WHERE [UnitPrice]>=10 AND [UnitPrice]<=20;
	
	-- Lấy trong danh sách các đơn đặt hàng được đặt trong khoảng thời gian từ ngày 1996-07-01 đến ngày 1996-07-31
	SELECT *
	FROM [dbo].[Orders]
	WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31';
	
	-- Tính tổng Freight của các đơn đặt hàng được đặt trong khoản thời gian từ 1996-07-01 đến ngày 1996-07-31
	SELECT SUM([Freight]) AS [Tong Freight]
	FROM [dbo].[Orders]
	WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31';
	
	-- Lấy danh sách đơn đặt hàng có ngày đặt hàng trong khoảng từ ngày 1/1/1997 đến ngày 31/12/1997
	-- và được vận chuyện bằng đường tàu thuỷ (ShipVia=3)
	SELECT *
	FROM [dbo].[Orders]
	WHERE ([OrderDate] BETWEEN '1997-01-01' AND '1997-12-31') AND ([ShipVia]=3);

-- Toán tử Like
	-- Lọc ra tất cả các khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ 'A'
	SELECT *
	FROM [dbo].[Customers]
	WHERE [Country] LIKE 'A%';
	
	-- Lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ 'a'
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCity] LIKE '%a%';
	
	-- Hãy lọc ra tất cả các đơn hàng với điều kiện:
	-- ShipCountry LIKE 'U_'
	-- ShipCountry LIKE 'U%'
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] LIKE 'U_';
	
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] LIKE 'U%';
	
	-- Lấy ra tất cả các nhà cung cấp có chữ 'b' trong tên của công ty
	SELECT *
	FROM [dbo].[Suppliers]
	WHERE [CompanyName] LIKE '%b%';

-- 	6. Ký tự đại diện - WILDCARD
	-- Lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'A'
	SELECT *
	FROM [dbo].[Customers]
	WHERE [ContactName] LIKE 'A%';
	
	-- Lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'H'
	-- và có chữ thứ 2 là bất kỳ ký tự nào
	SELECT *
	FROM [dbo].[Customers]
	WHERE [ContactName] LIKE 'H_%';
	
	-- Lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ cái thứ hai là u hoặc o
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCity] LIKE 'L[u,o]%';
	
	-- Lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ cái thứ hai không là u hoặc o
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCity] LIKE 'L[^u,o]%';
	
	-- Lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ cái thứ hai không là các ký tự từ a đến e
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCity] LIKE 'L[a-e]%';
	
	-- Lấy ra tất cả các NCC có tên công ty bắt đàu bằng chữ A và không chứa ký tự b
	SELECT *
	FROM [dbo].[Suppliers]
	WHERE ([CompanyName] LIKE 'A%') AND NOT([CompanyName] LIKE '%b%')

-- Tìm kiếm giá trị trong danh sách (IN và NOT IN)
	-- Hãy lọc ra tất cả các đơn hàng với điều kiện:
	-- a. Đơn hàng được giao đến Germany, UK, Brazil
    SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] IN ('Germany','UK','Brazil');
	-- b. Đơn hàng được giao đến các quốc gia khác Germany, UK, Brazil
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] NOT IN ('Germany','UK','Brazil');
	
	-- Lấy ra các sản phẩm có mã thể loại khác với 2, 3 và 4.
	SELECT *
	FROM [dbo].[Products]
	WHERE [CategoryID] NOT IN (2,3,4);
	
	-- Liệt kê các nhân viên không pahri là nữ từ bảng nhân viên
	SELECT *
	FROM [dbo].[Employees]
	WHERE [TitleOfCourtesy] NOT IN ('Ms.','Mrs.');
	
	-- Liệt kê các nhân viên là nữ từ bảng nhân viên
	SELECT *
	FROM [dbo].[Employees]
	WHERE [TitleOfCourtesy] IN ('Ms.','Mrs.');
	
	-- Lấy ra tất cả các khách hàng đến từ các thành phố: Berlin, London, Warszawa
	SELECT *
	FROM [dbo].[Customers]
	WHERE [City] IN ('Berlin','London''Warszawa');

-- Kiểm tra giá trị Null (IS NULL, IS NOT NULL)
	-- Lấy ra tất cả các đơn hàng chưa được giao hàng
	-- (ShippedDate => NULL)
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShippedDate] IS NULL;
	
	SELECT COUNT(*) AS [So don hang chua duoc giao hang]
	FROM [dbo].[Orders]
	WHERE [ShippedDate] IS NULL;
	
	-- Lấy danh sach các khách hàng có khu vực (Region) không bị NULL
	SELECT *
	FROM [dbo].[Customers]
	WHERE [Region] IS NOT NULL;
	
	-- Lấy danh sách các khách hàng không có CompanyName
	SELECT *
	FROM [dbo].[Customers]
	WHERE [CompanyName] IS NULL;
	
	-- Hãy lấy ra tất cả các đơn hàng chưa được giao hàng và có khu vực giao hàng (ShipRegion) không bị NULL
	SELECT *
	FROM [dbo].[Orders]
    WHERE ([ShippedDate] IS NULL) AND ([ShipRegion] IS NOT NULL);