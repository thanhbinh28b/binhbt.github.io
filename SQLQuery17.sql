-- 17. Truy vấn đệ quy
-- Tính Fibo
WITH fibo(prev_n, n) AS (
	-- Khởi tạo
	SELECT
		0 AS prev_n,
		1 AS n

	UNION ALL

	-- Đệ quy
	SELECT
		n AS prev_n,
		prev_n+n AS n
	FROM fibo
)
SELECT * FROM fibo
OPTION (MAXRECURSION 5);
-- Sn=S(n-1)+S(n-2)

-- Tính giai thừ
-- Sn=n*S(n-1)
WITH giaithua(i, n) AS (
	-- Khởi tạo
	SELECT
		1 AS i,
		1 AS n

	UNION ALL

	-- Đệ quy
	SELECT
		i+1 AS i,
		(i+1)*n AS n
	FROM giaithua
)
SELECT * FROM giaithua
OPTION (MAXRECURSION 5);

-- Sử dụng truy vấn đệ quy để tạo một cây cấu trúc quản lý của nhân viên trong bảng "Employees".
-- Trong đó "ReportsTo chính là mã của người quản lý
DECLARE @EmployeeID int
SET @EmployeeID=2;

WITH E_CTE AS (
	-- Khởi tạo
		SELECT
			[e].EmployeeID,
			[e].[FirstName]+' '+[e].[LastName] AS [Name],
			[e].[ReportsTo] AS [ManagerID],
			0 AS Level
		FROM [dbo].[Employees] AS [e]
		WHERE [e].[EmployeeID]=@EmployeeID
		
		UNION ALL
	-- Đệ quy
		SELECT
			[e1].EmployeeID,
			[e1].[FirstName]+' '+[e1].[LastName] AS [Name],
			[e1].[ReportsTo] AS [ManagerID],
			Level+1 AS Level
		FROM [dbo].[Employees] AS [e1]
		JOIN E_CTE ON [e1].[ReportsTo]=[E_CTE].[EmployeeID]
)
SELECT * FROM E_CTE
OPTION (MAXRECURSION 500);