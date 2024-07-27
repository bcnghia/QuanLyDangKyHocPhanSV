------------------------------------------
------ KHÔNG ĐƯỢC CHỈNH SỬA FILE NÀY------
------ KHÔNG ĐƯỢC CHỈNH SỬA FILE NÀY------
------ KHÔNG ĐƯỢC CHỈNH SỬA FILE NÀY------
------ KHÔNG ĐƯỢC CHỈNH SỬA FILE NÀY------
------ KHÔNG ĐƯỢC CHỈNH SỬA FILE NÀY------
------------------------------------------
-- INSER DỮ LIỆU THÌ SỬ DỤNG FILE INSERT--

-- Tạo Database
CREATE DATABASE QuanLyDangKyHocPhanSV;
GO


-- Sử dụng cơ sở dữ liệu
USE QuanLyDangKyHocPhanSV;
GO

-- Tạo bảng RoleAccount
CREATE TABLE RoleAccount(
    TenRole VARCHAR(50) PRIMARY KEY
);
GO

-- Tạo bảng GiaoVu
CREATE TABLE GiaoVu (
    MaGiaoVu VARCHAR(8) PRIMARY KEY,
    TenGiaoVu NVARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh TINYINT NOT NULL,
    Email VARCHAR(50),
    MatKhau VARCHAR(50),
    RoleAccount VARCHAR(50),
    FOREIGN KEY (RoleAccount) REFERENCES RoleAccount(TenRole)
);
GO

-- Tạo bảng GiangVien
CREATE TABLE GiangVien (
    MaGV VARCHAR(8) PRIMARY KEY,
    TenGV NVARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh TINYINT NOT NULL,
    Email VARCHAR(50),
    HocHam NVARCHAR(50),
    MatKhau VARCHAR(50),
    RoleAccount VARCHAR(50),
    FOREIGN KEY (RoleAccount) REFERENCES RoleAccount(TenRole)
);

-- Tạo bảng MonHoc
CREATE TABLE MonHoc (
    MaMH VARCHAR(7) PRIMARY KEY,
    TenMH NVARCHAR(120) NOT NULL,
    SoTiet INT NOT NULL,
    SoTinChi INT NOT NULL,
    ThoiKhoaBieu NVARCHAR(300)
);
GO

-- Tạo bảng Lop
CREATE TABLE Lop (
    MaLop VARCHAR(50) PRIMARY KEY,
    MaMH VARCHAR(7),
    MaGV VARCHAR(8),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH),
    FOREIGN KEY (MaGV) REFERENCES GiangVien(MaGV)
);
GO

-- Tạo bảng SinhVien
CREATE TABLE SinhVien (
    MaSV VARCHAR(8) PRIMARY KEY,
    TenSV NVARCHAR(120) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh TINYINT NOT NULL,
    Email VARCHAR(50),
    Khoa NVARCHAR(50),
    Lop VARCHAR(50),
    MatKhau VARCHAR(50),
    RoleAccount VARCHAR(50),
    FOREIGN KEY (RoleAccount) REFERENCES RoleAccount(TenRole)
);
GO

-- Tạo bảng DangKyMonHoc
CREATE TABLE DangKyMonHoc (
    MaMH VARCHAR(7),
    MaSV VARCHAR(8),
    ThoiGianDangKy DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (MaMH, MaSV),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);
GO

-- Phân cách batch cho các view

--------------------------------------
-----------------View-----------------
--------------------------------------

-- Thông tin ĐĂNG NHẬP
CREATE VIEW vThongTinDangNhap 
AS
    SELECT 
        Email AS EmailNguoiDung,
		MaSV AS Id,
        MatKhau, 
        RoleAccount 
    FROM 
        SinhVien
    UNION ALL
    SELECT 
        Email AS EmailNguoiDung, 
		MaGiaoVu AS Id,
        MatKhau, 
        RoleAccount 
    FROM 
        GiaoVu
    UNION ALL
    SELECT 
        Email AS EmailNguoiDung, 
		MaGV AS Id,
        MatKhau, 
        RoleAccount
    FROM 
        GiangVien;
GO

-- Thông tin ĐĂNG KÝ MÔN HỌC
CREATE VIEW vThongTinDangKyMonHoc AS
SELECT 
    d.MaSV,
    s.TenSV,
    d.MaMH,
    m.TenMH,
    m.SoTiet,
    m.SoTinChi,
    d.ThoiGianDangKy
FROM 
    DangKyMonHoc d
JOIN 
    MonHoc m ON d.MaMH = m.MaMH
JOIN 
    SinhVien s ON d.MaSV = s.MaSV;
GO

-- Thông tin LỚP HỌC khi mở lớp
CREATE VIEW vThongTinLopHoc AS
SELECT 
    l.MaLop,
    l.MaGV,
    g.TenGV,
    l.MaMH,
    m.TenMH,
    m.SoTiet,
    m.ThoiKhoaBieu
FROM 
    Lop l
JOIN 
    MonHoc m ON l.MaMH = m.MaMH
JOIN 
    GiangVien g ON l.MaGV = g.MaGV;
GO
