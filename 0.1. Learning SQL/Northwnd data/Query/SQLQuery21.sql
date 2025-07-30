-- 21. Cách tạo, thay đổi và xoá Table trong SQL Server
-- VD1:
CREATE TABLE [NhanVien] (
	[MaNV] INT NOT NULL PRIMARY KEY,
	[HoTen] VARCHAR(50) NOT NULL,
	[Phai] VARCHAR(10),
	[NgaySinh] DATE,
	[DiaChi] VARCHAR(255),
	[SDT] VARCHAR(10)
);

-- VD2: Tạo table khách hàng
CREATE TABLE KhachHang (
	MaKH INT IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE KhachHang_1 (
MaKH INT IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK (LEN(SDT)=10 AND PATINDEX('%[^0-9]%', SDT)=0)
);

-- VD3: Thêm cột Email vào bảng NhanVien với kiểu dữ liệu VARCHAR(100)
ALTER TABLE NhanVien
ADD Email VARCHAR(100);

-- VD3: Thay đổi kiểu dữ liệu cột Hoten thành VARCHAR(100)
ALTER TABLE NhanVien
ALTER COLUMN HoTen VARCHAR(100);

-- VD4: Tạo điều kiện nhập liệu cho cột
ALTER TABLE NhanVien
ADD CONSTRAINT NgaySinhCheck CHECK (NgaySinh <= GETDATE());

-- VD5: Xoá bảng bằng TRUNCATE và DROP
TRUNCATE TABLE NhanVien;

DROP TABLE NhanVien;

-- BT:
-- 1. Tạo bảng SinhVien với các cột sau
-- MaSV: Kiểu dữ liệu INT, khoá chính, không thể chứa giá trị null, tự động tăng dần
-- HoTen: Kiểu dữ liệu VARCHAR(50), không thể chứa giá trị null
-- Lop: Kieẻu dữ liệu VARCHAR(20)
-- Nganh: Kiểu dữ liệu VARCHAR(20)
-- DiemTB: Kiểu dữ liệu FLOAT

CREATE TABLE [SinhVien] (
	[MaSV] INT IDENTITY(1000,1) NOT NULL PRIMARY KEY,
	[HoTen] VARCHAR(50) NOT NULL,
	[Lop] VARCHAR(20),
	[Nganh] VARCHAR(20),
	[DiemTB] FLOAT
);

-- 2. Thêm cột Email vào bảng SinhVien với kiểu dữ liệu VARCHAR(100).
ALTER TABLE SinhVien
ADD Email VARCHAR(100);
-- 3. Sửa đổi kiểu dữ liệu của cột DiemTB trong bảng SinhVien thành kiểu dữ liệu DECIMAL(2,1)
ALTER TABLE SinhVien
ALTER COLUMN DiemTB DECIMAL(2,1);
-- 4. Xoá cột Nganh khỏi bảng SinhVien
ALTER TABLE SinhVien
DROP COLUMN  Nganh;
-- 5. Thêm ràng buộc kiểm tra cho cột DiemTB trong bảng SinhVien để giá trị phải lớn hơn hoặc bằng 0.
ALTER TABLE SinhVien
ADD CONSTRAINT DiemTBCheck CHECK (DiemTB>=0);
-- 6. Thêm ràng buộc duy nhất cho cột MaSV trong bảng SinhVien
ALTER TABLE SinhVien
ADD CONSTRAINT MaSVCheck UNIQUE(MaSV);
-- 7. Thêm dữ liệu vào bảng SinhVien với một số thông tin thủ công
-- 8. Xoá dữ liệu trong bản SinhVien
TRUNCATE TABLE SinhVien;
-- 9. Xoá bảng SinhVien
DROP TABLE SinhVien;
-- 10. Tạo lại bảng SinhVien với cấu trúc ban đầu
CREATE TABLE [SinhVien] (
	[MaSV] INT IDENTITY(1000,1) NOT NULL PRIMARY KEY,
	[HoTen] VARCHAR(50) NOT NULL,
	[Lop] VARCHAR(20),
	[Nganh] VARCHAR(20),
	[DiemTB] FLOAT
);
