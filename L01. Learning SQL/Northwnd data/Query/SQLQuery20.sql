-- 20. Cách tạo cơ sở dữ liệu trong SQL Server
-- VD1:
CREATE DATABASE mydatabase

-- VD2:
CREATE DATABASE employees
ON
(NAME = 'employees_data',
	FILENAME = 'C:\Users\DataSQL\Employees\employees_data.mdf',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=5MB)
LOG ON
(NAME = 'employees_log',
	FILENAME = 'C:\Users\DataSQL\Employees\employees_log.ldf',
	SIZE=5MB,
	MAXSIZE=50MB,
	FILEGROWTH=1MB)

-- VD2:
CREATE DATABASE NVDB
ON
(NAME = 'nvdb_data',
	FILENAME = 'C:\Users\Public\Data_SQL\nvdb\nvdb_data.mdf',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=5MB)
LOG ON
(NAME = 'nvdb_log',
	FILENAME = 'C:\Users\Public\Data_SQL\nvdb\nvdb_log.ldf',
	SIZE=5MB,
	MAXSIZE=50MB,
	FILEGROWTH=5MB)