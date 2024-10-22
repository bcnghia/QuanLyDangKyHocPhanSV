USE [master]
GO
/****** Object:  Database [QuanLyDangKyHocPhanSV]    Script Date: 07/27/2024 1:58:48 PM ******/
CREATE DATABASE [QuanLyDangKyHocPhanSV]
 CONTAINMENT = NONE
 COLLATE Latin1_General_100_CI_AI_SC_UTF8
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyDangKyHocPhanSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyDangKyHocPhanSV', N'ON'
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyDangKyHocPhanSV]
GO
USE [QuanLyDangKyHocPhanSV]
GO
/****** Object:  Sequence [dbo].[lophocSeq]    Script Date: 07/27/2024 1:58:48 PM ******/
CREATE SEQUENCE [dbo].[lophocSeq] 
 AS [bigint]
 START WITH 0
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [varchar](6) NOT NULL,
	[TenGV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[GioiTinh] [tinyint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[HocHam] [nvarchar](50) NOT NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[ngayTao] [datetime] NULL,
	[nguoiTao] [varchar](30) NULL,
	[ngayCapnhat] [datetime] NULL,
	[nguoiCapnhat] [varchar](30) NULL,
	[MaGiaoVu] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[RoleAccount] [varchar](50) NULL,
	[IsLoggedIn] [bit] NULL,
 CONSTRAINT [PK_GiangVien_1] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoVu]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVu](
	[MaGiaoVu] [varchar](50) NOT NULL,
	[TenGiaoVu] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[GioiTinh] [tinyint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[RoleAccount] [varchar](50) NULL,
	[IsLoggedIn] [bit] NULL,
 CONSTRAINT [PK_GiaoVu] PRIMARY KEY CLUSTERED 
(
	[MaGiaoVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](8) NOT NULL,
	[TenSV] [nvarchar](120) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [tinyint] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Khoa] [varchar](50) NOT NULL,
	[Lop] [nvarchar](50) NOT NULL,
	[ngayTao] [datetime] NULL,
	[nguoiTao] [varchar](30) NULL,
	[ngayCapnhat] [datetime] NULL,
	[nguoiCapnhat] [varchar](30) NULL,
	[MaGiaoVu] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[RoleAccount] [varchar](50) NULL,
	[IsLoggedIn] [bit] NULL,
 CONSTRAINT [PK_tblSinhVien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vThongTinDangNhap]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vThongTinDangNhap] 
AS
	SELECT 
		Email AS EmailNguoiDung, 
		MatKhau, 
		RoleAccount 
	FROM 
		SinhVien
UNION ALL
	SELECT 
		Email AS EmailNguoiDung, 
		MatKhau, 
		RoleAccount 
	FROM 
		GiaoVu
UNION ALL
	SELECT 
		Email AS EmailNguoiDung, 
		MatKhau, 
		RoleAccount
	FROM 
		GiangVien;
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [varchar](7) NOT NULL,
	[TenMH] [nvarchar](120) NOT NULL,
	[SoTiet] [int] NOT NULL,
	[SoTinChi] [int] NOT NULL,
	[ThoiKhoaBieu] [nvarchar](300) NOT NULL,
	[ngayTao] [datetime] NULL,
	[nguoiTao] [varchar](30) NULL,
	[ngayCapnhat] [datetime] NULL,
	[nguoiCapnhat] [varchar](30) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLopHoc](
	[MaLop] [varchar](50) NOT NULL,
	[MaGV] [varchar](6) NOT NULL,
	[MaMH] [varchar](7) NOT NULL,
	[ngayTao] [datetime] NULL,
	[nguoiTao] [varchar](30) NULL,
	[ngayCapnhat] [datetime] NULL,
	[nguoiCapnhat] [varchar](30) NULL,
	[trangthai] [tinyint] NULL,
 CONSTRAINT [PK_tblLopHoc] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vThongTinLopHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vThongTinLopHoc] AS
SELECT 
    l.MaLop,
    l.MaGV,
	g.TenGV,
    l.MaMH,
    m.TenMH,
    m.SoTiet,
    m.ThoiKhoaBieu
FROM 
    tblLopHoc l
JOIN 
    MonHoc m ON l.MaMH = m.MaMH
JOIN 
    GiangVien g ON l.MaGV = g.MaGV;
GO
/****** Object:  Table [dbo].[DangkyMonHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangkyMonHoc](
	[MaSV] [varchar](8) NOT NULL,
	[MaMH] [varchar](7) NOT NULL,
	[ngayTao] [datetime] NULL,
	[nguoiTao] [varchar](30) NULL,
	[ngayCapnhat] [datetime] NULL,
	[nguoiCapnhat] [varchar](30) NULL,
	[ThoiGianDangKy] [datetime] NULL
) ON [PRIMARY]
GO
-- vThongTinDangKyMonHoc
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VThongTinDangKyMonHoc] AS
SELECT 
    d.MaSV,
    s.TenSV,
    d.MaMH,
    m.TenMH,
    m.SoTiet,
    m.SoTinChi,
    d.ThoiGianDangKy
FROM 
    [dbo].[DangkyMonHoc] d
JOIN 
    MonHoc m ON d.MaMH = m.MaMH
JOIN 
    SinhVien s ON d.MaSV = s.MaSV;
GO
/****** Object:  Table [dbo].[RoleAccount]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAccount](
	[TenRole] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTK] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050007', N'INF0083', CAST(N'2023-07-09T20:40:59.787' AS DateTime), N'21050007', CAST(N'2023-07-09T20:40:59.787' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050007', N'INF0083', CAST(N'2023-07-09T20:41:02.153' AS DateTime), N'21050007', CAST(N'2023-07-09T20:41:02.153' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050007', N'INF0083', CAST(N'2023-07-09T20:41:04.180' AS DateTime), N'21050007', CAST(N'2023-07-09T20:41:04.180' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050007', N'INF0083', CAST(N'2023-07-10T07:58:42.810' AS DateTime), N'21050007', CAST(N'2023-07-10T07:58:42.810' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050046', N'INF0083', CAST(N'2023-07-08T20:31:41.390' AS DateTime), N'21050046', CAST(N'2023-07-08T20:31:41.390' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050046', N'INF0083', CAST(N'2023-07-08T20:32:14.943' AS DateTime), N'21050046', CAST(N'2023-07-08T20:32:14.943' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050046', N'INF0083', CAST(N'2023-07-08T20:32:18.773' AS DateTime), N'21050046', CAST(N'2023-07-08T20:32:18.773' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'21050046', N'INF0083', CAST(N'2023-07-08T20:20:48.557' AS DateTime), N'21050046', CAST(N'2023-07-08T20:20:48.557' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22040440', N'INF0083', CAST(N'2023-07-09T19:42:50.270' AS DateTime), N'22040440', CAST(N'2023-07-09T19:42:50.270' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22040440', N'INF0083', CAST(N'2023-07-09T19:42:58.733' AS DateTime), N'22040440', CAST(N'2023-07-09T19:42:58.733' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22050006', N'ENG0964', CAST(N'2023-07-09T10:49:04.627' AS DateTime), N'22050006', CAST(N'2023-07-09T10:49:04.627' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22050006', N'ENG0964', CAST(N'2023-07-09T10:49:06.723' AS DateTime), N'22050006', CAST(N'2023-07-09T10:49:06.723' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22050006', N'ENG0964', CAST(N'2023-07-09T10:49:09.037' AS DateTime), N'22050006', CAST(N'2023-07-09T10:49:09.037' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22050006', N'ENG0964', CAST(N'2023-07-09T19:54:27.493' AS DateTime), N'22050006', CAST(N'2023-07-09T19:54:27.493' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22050006', N'ENG0964', CAST(N'2023-07-09T10:49:11.050' AS DateTime), N'22050006', CAST(N'2023-07-09T10:49:11.050' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22050007', N'ENG0964', CAST(N'2023-07-09T00:14:21.553' AS DateTime), N'22050007', CAST(N'2023-07-09T00:14:21.553' AS DateTime), N'admin', NULL)
INSERT [dbo].[DangkyMonHoc] ([MaSV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [ThoiGianDangKy]) VALUES (N'22050006', N'ENG0964', CAST(N'2024-07-27T13:02:44.483' AS DateTime), N'22050006', CAST(N'2024-07-27T13:02:44.483' AS DateTime), N'admin', CAST(N'2024-07-27T13:02:44.483' AS DateTime))
GO
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [NgaySinh], [DiaChi], [GioiTinh], [Email], [HocHam], [TinhTrang], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'A24OU4', N'Nguyễn Thái Sơn', CAST(N'1981-11-11' AS Date), N'Quận 4, TP.HCM', 1, N'thaison@gmail.com', N'Tiến sĩ', N'Hoạt động', CAST(N'2023-07-03T16:39:16.627' AS DateTime), N'admin', CAST(N'2023-07-03T16:39:16.627' AS DateTime), N'admin', NULL, N'Th@ison8273', N'teacher', NULL)
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [NgaySinh], [DiaChi], [GioiTinh], [Email], [HocHam], [TinhTrang], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'E81UO0', N'Nguyễn Đình Bảo Uyên', CAST(N'2000-01-14' AS Date), N'Thanh Hóa', 0, N'nguyendinhbaouyen@gmail.com', N'Tiến sĩ', N'Hoạt động', CAST(N'2023-06-29T16:16:07.413' AS DateTime), N'admin', CAST(N'2023-06-29T16:16:07.413' AS DateTime), N'admin', NULL, N'123', N'teacher', NULL)
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [NgaySinh], [DiaChi], [GioiTinh], [Email], [HocHam], [TinhTrang], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'G22TW3', N'Nguyễn Đình Phúc', CAST(N'1968-11-27' AS Date), N'TP.HCM', 1, N'nguyendinhphuc@gmail.com', N'Kỹ sư', N'Hoạt động', CAST(N'2023-06-29T16:14:04.960' AS DateTime), N'admin', CAST(N'2023-06-29T16:14:04.960' AS DateTime), N'admin', NULL, N'123', N'teacher', NULL)
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [NgaySinh], [DiaChi], [GioiTinh], [Email], [HocHam], [TinhTrang], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'K64EX1', N'Trần Văn Đức', CAST(N'2000-08-28' AS Date), N'Bình Dương', 1, N'tranvanduc@gmail.com', N'Tiến sĩ', N'Hoạt động', CAST(N'2023-07-03T17:34:24.420' AS DateTime), N'admin', CAST(N'2023-07-03T17:34:24.420' AS DateTime), N'admin', NULL, N'123', N'teacher', NULL)
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [NgaySinh], [DiaChi], [GioiTinh], [Email], [HocHam], [TinhTrang], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'O59YP9', N'Nguyễn Thị Hải Yến', CAST(N'1974-04-05' AS Date), N'Nha Trang', 0, N'nguyenthihaiyen@gmail.com', N'Thạc sĩ', N'Hoạt động', CAST(N'2023-06-29T16:14:04.960' AS DateTime), N'admin', CAST(N'2023-06-29T16:14:04.960' AS DateTime), N'admin', NULL, N'123', N'teacher', NULL)
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [NgaySinh], [DiaChi], [GioiTinh], [Email], [HocHam], [TinhTrang], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'Q13UE9', N'Bùi Văn Phúc', CAST(N'1984-01-01' AS Date), N'Long An', 1, N'buivanphuc@gmail.com', N'Thạc sĩ', N'Hoạt động', CAST(N'2023-06-29T16:08:22.840' AS DateTime), N'admin', CAST(N'2023-06-29T16:08:22.840' AS DateTime), N'admin', NULL, N'123', N'teacher', NULL)
INSERT [dbo].[GiangVien] ([MaGV], [TenGV], [NgaySinh], [DiaChi], [GioiTinh], [Email], [HocHam], [TinhTrang], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'X95AB4', N'Nguyễn Thị Hằng', CAST(N'1991-10-15' AS Date), N'Đồng Tháp', 0, N'hangkoll47@gmail.com', N'Cử nhân', N'Ngưng hoạt động', CAST(N'2023-07-03T16:37:30.497' AS DateTime), N'admin', CAST(N'2023-07-03T16:37:30.497' AS DateTime), N'admin', NULL, N'ngh@ngA55799', N'teacher', NULL)
GO
INSERT [dbo].[GiaoVu] ([MaGiaoVu], [TenGiaoVu], [NgaySinh], [DiaChi], [GioiTinh], [Email], [TrangThai], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'A83LP7', N'Nguyễn Hoàng Sơn', CAST(N'2000-08-19' AS Date), N'Bình Dương', 1, N'ringoc49@gmail.com', N'Hoạt động', N'Ringoch@n455', N'admin', NULL)
INSERT [dbo].[GiaoVu] ([MaGiaoVu], [TenGiaoVu], [NgaySinh], [DiaChi], [GioiTinh], [Email], [TrangThai], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'F87C2X', N'Lê Văn Tùng', CAST(N'1985-02-03' AS Date), N'Số 456, Đường Lê Lợi, Quận Hải Châu, Đà Nẵng', 1, N'tungl56789@gmail.com', N'Hoạt động', N'123', N'admin', NULL)
INSERT [dbo].[GiaoVu] ([MaGiaoVu], [TenGiaoVu], [NgaySinh], [DiaChi], [GioiTinh], [Email], [TrangThai], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'H93K6A', N'Võ Thị Mai', CAST(N'1995-05-20' AS Date), N'Số 567, Đường Lê Duẩn, Quận Ninh Kiều, Cần Thơ', 0, N'maivo567@gmail.com', N'Hoạt động', N'123', N'admin', NULL)
INSERT [dbo].[GiaoVu] ([MaGiaoVu], [TenGiaoVu], [NgaySinh], [DiaChi], [GioiTinh], [Email], [TrangThai], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'ITC4HZ', N'Thành Paml', CAST(N'1991-10-23' AS Date), N'Cù Lao', 1, N'thanhpalm@gmail.com', N'Hoạt động', N'123', N'admin', NULL)
INSERT [dbo].[GiaoVu] ([MaGiaoVu], [TenGiaoVu], [NgaySinh], [DiaChi], [GioiTinh], [Email], [TrangThai], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'K52P9D', N'Nguyễn Thị Hương', CAST(N'1990-07-15' AS Date), N'Số 123, Đường Hoàng Hoa Thám, Quận Tân Bình, TP.HCM', 1, N'huongnguyen@gmail.com', N'Hoạt động', N'123', N'admin', NULL)
GO
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'ABC0792', N'Pháp Luật đại cương', 60, 2, N'Thứ 2, từ 7 giờ đến 10 giờ 45.
Thứ 4, từ 7 giờ đến 10 giờ 45.', CAST(N'2023-07-07T14:50:15.307' AS DateTime), N'admin', CAST(N'2023-07-07T14:50:15.307' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'ENG0964', N'Anh văn cơ bản 2', 60, 3, N'Thứ 6, từ 7 giờ đến 10 giờ, (19/05/23 đến 25/08/23.)', CAST(N'2023-06-29T15:54:53.580' AS DateTime), N'admin', CAST(N'2023-06-29T15:54:53.580' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'ENG0965', N'Anh Văn Căn Bản 5', 60, 4, N'cc', CAST(N'2024-07-25T22:19:03.507' AS DateTime), N'admin', CAST(N'2024-07-25T22:19:03.507' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'INF0083', N'Cơ sở dữ liệu', 60, 3, N'Thứ 7, từ 13 giờ đến 16 giờ 45, (01/07/23 đến 05/08/23.)', CAST(N'2023-06-29T15:54:53.580' AS DateTime), N'admin', CAST(N'2023-06-29T15:54:53.580' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'INF0203', N'Lập trình hướng đối tượng và ứng dụng', 60, 3, N'Thứ 2, từ 7 giờ đến 10 giờ 45. (02/01/23 - 27/02/23)', CAST(N'2023-07-09T19:52:44.197' AS DateTime), N'admin', CAST(N'2023-07-09T19:52:44.197' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'INF0273', N'Cấu trúc dữ liệu và giải thuật', 60, 4, N'Thứ 6, từ 7 giờ đến 10 giờ 45. (02/04/25)', CAST(N'2023-07-06T10:53:13.673' AS DateTime), N'admin', CAST(N'2023-07-06T10:53:13.673' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'INF0283', N'Lập trình .NET và C#', 60, 4, N'Thứ 2, từ 7 giờ đến 10 giờ 45, (15/05/23 đến 29/05/23). Thứ 4, từ 7 giờ đến 10 giờ 45 (17/05/23 đến 31/06/23).', CAST(N'2023-06-29T15:54:53.580' AS DateTime), N'admin', CAST(N'2023-06-29T15:54:53.580' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'INF0823', N'Thiết kế Website', 60, 4, N'Thứ 6, từ 13 đến 16:45, (19/05/23 đến 23/06/23
). Thứ 6, từ 13 đến 16:45, (30/06/23 đến 04/08/23).', CAST(N'2023-06-29T16:22:37.367' AS DateTime), N'admin', CAST(N'2023-06-29T16:22:37.367' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'PE0415', N'Giáo dục quốc phòng', 60, 1, N'Thứ 2 đến Thứ 6, Từ 4 giờ 30 đến 6 giờ. (31/07/23) đến (06/08/23).', CAST(N'2023-07-06T11:13:08.337' AS DateTime), N'admin', CAST(N'2023-07-06T11:13:08.337' AS DateTime), N'admin')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet], [SoTinChi], [ThoiKhoaBieu], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat]) VALUES (N'PE0419', N'Giáo dục quốc phòng 2', 60, 1, N'Thứ 6, từ 13h đến 15h15, (19/08/23 đến 23/09/23 ). ', CAST(N'2024-07-26T14:55:29.520' AS DateTime), N'admin', CAST(N'2024-07-26T14:55:29.520' AS DateTime), N'admin')
GO
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'21050007', N'Nguyễn Minh Trí', CAST(N'2003-01-03' AS Date), 1, N'Thủ Dầu Một, Bình Dương', N'21050007@student.bdu.edu.vn', N'FIRA', N'25TH01', CAST(N'2023-07-09T20:17:20.830' AS DateTime), N'admin', CAST(N'2023-07-09T20:17:20.830' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'21050009', N'Lương Thanh Hoàn', CAST(N'2000-07-02' AS Date), 1, N'Cà Mau', N'21050009@student.bdu.edu.vn', N'FIRA', N'25TH01', CAST(N'2023-07-07T08:06:36.560' AS DateTime), N'admin', CAST(N'2023-07-07T08:06:36.560' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'21050046', N'Nguyễn Thị Thu Khuyên', CAST(N'2003-09-07' AS Date), 0, N'Tân Đông Hiệp', N'anonymous@gmail.com', N'FIRA', N'25TH01', CAST(N'2023-06-29T22:02:12.920' AS DateTime), N'admin', CAST(N'2023-06-29T22:02:12.920' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'22040440', N'Nguyễn Thị Yến Nhi', CAST(N'2004-07-02' AS Date), 0, N'Vĩnh Long', N'nhinguyen@gmail.com', N'QHX12', N'25JB55', CAST(N'2023-07-09T14:05:33.593' AS DateTime), N'admin', CAST(N'2023-07-09T14:05:33.593' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'22050006', N'Nguyễn Quốc Duy Khang', CAST(N'2003-02-03' AS Date), 1, N'Dĩ An, Bình Dương', N'khangksp@gmail.com', N'FIRA', N'25TH01', CAST(N'2023-06-29T17:06:22.233' AS DateTime), N'admin', CAST(N'2023-06-29T17:06:22.233' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'22050007', N'Ngô Lê Thanh Hải', CAST(N'2004-05-07' AS Date), 1, N'Bình Dương', N'22050007@student.bdu.edu.vn', N'FIRA', N'25TH01', CAST(N'2023-07-02T11:45:52.637' AS DateTime), N'admin', CAST(N'2023-07-02T11:45:52.637' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'22050024', N'Nguyễn Công Đức', CAST(N'2003-06-04' AS Date), 1, N'Bình Dương', N'22050024@student.bdu.edu.vn', N'FIRA', N'25TH01', CAST(N'2023-07-03T08:41:33.513' AS DateTime), N'admin', CAST(N'2023-07-03T08:41:33.513' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'22050107', N'Trần Trọng Quang', CAST(N'2002-01-13' AS Date), 1, N'Tân Đông Hiệp', N'test456@gmail.com', N'FIRA', N'25TH01', CAST(N'2023-06-29T22:02:12.907' AS DateTime), N'admin', CAST(N'2023-06-29T22:02:12.907' AS DateTime), N'admin', NULL, N'123', N'student', NULL)
INSERT [dbo].[SinhVien] ([MaSV], [TenSV], [NgaySinh], [GioiTinh], [DiaChi], [Email], [Khoa], [Lop], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [MaGiaoVu], [MatKhau], [RoleAccount], [IsLoggedIn]) VALUES (N'22050210', N'Trần Nhật Nam', CAST(N'2003-04-05' AS Date), 1, N'Dĩ An, Bình Dương', N'trannhatnam@student.edu.vn', N'FIRA', N'25TH01', CAST(N'2023-06-29T22:02:12.920' AS DateTime), N'admin', CAST(N'2023-06-29T22:02:12.920' AS DateTime), N'admin', NULL, N'nhatn@m456', N'student', NULL)
GO
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau], [Email]) VALUES (N'admin', N'admIn@7999', N'admin@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau], [Email]) VALUES (N'admin45', N'admin@A24', N'adminA24@gmail.com')
INSERT [dbo].[TaiKhoan] ([TenTK], [MatKhau], [Email]) VALUES (N'guess456', N'guEss@56', N'admin456@gmail.com')
GO
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH107', N'A24OU4', N'INF0273', CAST(N'2023-07-06T10:53:45.137' AS DateTime), N'admin', CAST(N'2023-07-06T10:53:45.137' AS DateTime), N'admin', 0)
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH108', N'O59YP9', N'ENG0964', CAST(N'2023-07-06T11:03:25.517' AS DateTime), N'admin', CAST(N'2023-07-06T11:03:25.517' AS DateTime), N'admin', 0)
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH109', N'X95AB4', N'PE0415', CAST(N'2023-07-06T11:13:36.197' AS DateTime), N'admin', CAST(N'2023-07-06T11:13:36.197' AS DateTime), N'admin', 0)
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH110', N'E81UO0', N'ENG0964', CAST(N'2023-07-09T19:41:35.757' AS DateTime), N'admin', CAST(N'2023-07-09T19:41:35.757' AS DateTime), N'admin', 0)
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH113', N'A24OU4', N'INF0823', CAST(N'2023-07-09T19:42:14.450' AS DateTime), N'admin', CAST(N'2023-07-09T19:42:14.450' AS DateTime), N'admin', 0)
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH114', N'X95AB4', N'INF0203', CAST(N'2023-07-09T19:54:03.677' AS DateTime), N'admin', CAST(N'2023-07-09T19:54:03.677' AS DateTime), N'admin', 0)
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH120', N'A24OU4', N'ABC0792', CAST(N'2023-07-10T07:56:44.820' AS DateTime), N'admin', CAST(N'2023-07-10T07:56:44.820' AS DateTime), N'admin', 0)
INSERT [dbo].[tblLopHoc] ([MaLop], [MaGV], [MaMH], [ngayTao], [nguoiTao], [ngayCapnhat], [nguoiCapnhat], [trangthai]) VALUES (N'MMH57', N'A24OU4', N'INF0283', CAST(N'2023-07-05T09:00:44.720' AS DateTime), N'admin', CAST(N'2023-07-05T09:00:44.720' AS DateTime), N'admin', 0)
GO
ALTER TABLE [dbo].[DangkyMonHoc] ADD  CONSTRAINT [DF_DangkyMonHoc_ngayTao]  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[DangkyMonHoc] ADD  CONSTRAINT [DF_DangkyMonHoc_nguoiTao]  DEFAULT ('admin') FOR [nguoiTao]
GO
ALTER TABLE [dbo].[DangkyMonHoc] ADD  CONSTRAINT [DF_DangkyMonHoc_ngayCapnhat]  DEFAULT (getdate()) FOR [ngayCapnhat]
GO
ALTER TABLE [dbo].[DangkyMonHoc] ADD  CONSTRAINT [DF_DangkyMonHoc_nguoiCapnhat]  DEFAULT ('admin') FOR [nguoiCapnhat]
GO
ALTER TABLE [dbo].[DangkyMonHoc] ADD  DEFAULT (getdate()) FOR [ThoiGianDangKy]
GO
ALTER TABLE [dbo].[GiangVien] ADD  CONSTRAINT [DF_GiaoVu_ngayTao_1]  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[GiangVien] ADD  CONSTRAINT [DF_GiaoVu_nguoiTao_1]  DEFAULT ('admin') FOR [nguoiTao]
GO
ALTER TABLE [dbo].[GiangVien] ADD  CONSTRAINT [DF_GiaoVu_ngayCapnhat_1]  DEFAULT (getdate()) FOR [ngayCapnhat]
GO
ALTER TABLE [dbo].[GiangVien] ADD  CONSTRAINT [DF_GiaoVu_nguoiCapnhat_1]  DEFAULT ('admin') FOR [nguoiCapnhat]
GO
ALTER TABLE [dbo].[GiangVien] ADD  DEFAULT ('123') FOR [MatKhau]
GO
ALTER TABLE [dbo].[GiangVien] ADD  DEFAULT ((0)) FOR [IsLoggedIn]
GO
ALTER TABLE [dbo].[GiaoVu] ADD  DEFAULT ('123') FOR [MatKhau]
GO
ALTER TABLE [dbo].[GiaoVu] ADD  DEFAULT ((0)) FOR [IsLoggedIn]
GO
ALTER TABLE [dbo].[MonHoc] ADD  CONSTRAINT [DF_MonHoc_ngayTao]  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[MonHoc] ADD  CONSTRAINT [DF_MonHoc_nguoiTao_1]  DEFAULT ('admin') FOR [nguoiTao]
GO
ALTER TABLE [dbo].[MonHoc] ADD  CONSTRAINT [DF_MonHoc_ngayCapnhat]  DEFAULT (getdate()) FOR [ngayCapnhat]
GO
ALTER TABLE [dbo].[MonHoc] ADD  CONSTRAINT [DF_MonHoc_nguoiCapnhat]  DEFAULT ('admin') FOR [nguoiCapnhat]
GO
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngayTao]  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoiTao]  DEFAULT ('admin') FOR [nguoiTao]
GO
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [DF_tblSinhVien_ngayCapnhat]  DEFAULT (getdate()) FOR [ngayCapnhat]
GO
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [DF_tblSinhVien_nguoiCapnhat]  DEFAULT ('admin') FOR [nguoiCapnhat]
GO
ALTER TABLE [dbo].[SinhVien] ADD  DEFAULT ('123') FOR [MatKhau]
GO
ALTER TABLE [dbo].[SinhVien] ADD  DEFAULT ((0)) FOR [IsLoggedIn]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_ngayTao]  DEFAULT (getdate()) FOR [ngayTao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_nguoiTao]  DEFAULT ('admin') FOR [nguoiTao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_ngayCapnhat]  DEFAULT (getdate()) FOR [ngayCapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_nguoiCapnhat]  DEFAULT ('admin') FOR [nguoiCapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  CONSTRAINT [DF_tblLopHoc_trangthai]  DEFAULT ((0)) FOR [trangthai]
GO
ALTER TABLE [dbo].[DangkyMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_DangkyMonHoc_tblLopHoc] FOREIGN KEY([MaLop])
REFERENCES [dbo].[tblLopHoc] ([MaLop])
GO
ALTER TABLE [dbo].[DangkyMonHoc] CHECK CONSTRAINT [FK_DangkyMonHoc_tblLopHoc]
GO
ALTER TABLE [dbo].[DangkyMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_DangkyMonHoc_tblSinhVien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[DangkyMonHoc] CHECK CONSTRAINT [FK_DangkyMonHoc_tblSinhVien]
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [FK_GiangVien_GiaoVu] FOREIGN KEY([MaGiaoVu])
REFERENCES [dbo].[GiaoVu] ([MaGiaoVu])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [FK_GiangVien_GiaoVu]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_tblSinhVien_GiaoVu] FOREIGN KEY([MaGiaoVu])
REFERENCES [dbo].[GiaoVu] ([MaGiaoVu])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_tblSinhVien_GiaoVu]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_GiangVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_MonHoc] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_MonHoc]
GO
/****** Object:  StoredProcedure [dbo].[ChonTatCaGiangVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChonTatCaGiangVien]
AS
	SELECT
		MaGV,
		TenGV,
		CONVERT(VARCHAR(10),NgaySinh,103) AS ngaySinh,
		DiaChi,
		CASE 
			WHEN GioiTinh = 1 THEN N'Nam'
			ELSE N'Nữ'
		END AS GioiTinh,
		Email,
		HocHam,
		TinhTrang
	FROM GiangVien
GO;
GO
/****** Object:  StoredProcedure [dbo].[ChonTatCaGiaoVu]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChonTatCaGiaoVu]
AS
	SELECT
		MaGiaoVu,
		TenGiaoVu,
		CONVERT(VARCHAR(10),NgaySinh,103) AS ngaySinh,
		DiaChi,
		CASE 
			WHEN GioiTinh = 1 THEN N'Nam'
			ELSE N'Nữ'
		END AS GioiTinh,
		Email,
		TrangThai
	FROM GiaoVu
GO;
GO
/****** Object:  StoredProcedure [dbo].[ChonTatCaLopHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChonTatCaLopHoc]
AS
BEGIN
	SELECT 
		lop.MaLop,
		giangvien.MaGV,
		giangvien.TenGV,
		monhoc.MaMH,
		monhoc.TenMH,
		monhoc.SoTiet,
		monhoc.SoTinChi,
		monhoc.ThoiKhoaBieu
	FROM tblLopHoc lop
	INNER JOIN MonHoc monhoc ON lop.MaMH = monhoc.MaMH -- Kết hợp bảng tblLopHoc với MonHoc dựa vào MaMH
	INNER JOIN GiangVien giangvien ON lop.MaGV = giangvien.MaGV -- Kết hợp bảng GiangVien dựa theo MaGV
END
GO
/****** Object:  StoredProcedure [dbo].[ChonTatCaMonHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChonTatCaMonHoc]
AS
	SELECT
		MaMH,
		TenMH,
		SoTiet,
		SoTinChi,
		ThoiKhoaBieu
	FROM MonHoc
GO;
GO
/****** Object:  StoredProcedure [dbo].[ChonTatCaSinhVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChonTatCaSinhVien]
AS
	SELECT
		MaSV,
		TenSV,
		CONVERT(VARCHAR(10),NgaySinh,103) AS ngaysinh, --Định dạng dd/mm/yyyy
	CASE
		WHEN GioiTinh = 1 THEN N'Nam'
		ELSE N'Nữ' END AS gioiTinh, -- hiển thị 1 là Nam, 0 là nữ
		DiaChi,
		Email,
		Khoa,
		Lop
	FROM SinhVien
GO;
GO
/****** Object:  StoredProcedure [dbo].[DangNhap]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DangNhap]
    @TenTK VARCHAR(20),
    @MatKhau VARCHAR(50)
AS
BEGIN
    DECLARE @LoaiTK VARCHAR(15)
    DECLARE @TenDangNhap VARCHAR(50)
    
    -- Kiểm tra bảng tblSinhVien
    IF EXISTS (SELECT 1 FROM SinhVien WHERE MaSV = @TenTK AND MatKhau = @MatKhau)
    BEGIN
        SET @LoaiTK = N'Sinh Viên'
        SET @TenDangNhap = (SELECT MaSV FROM SinhVien WHERE MaSV = @TenTK)
    END
    -- Kiểm tra bảng GiangVien
    ELSE IF EXISTS (SELECT 1 FROM GiangVien WHERE MaGV = @TenTK AND MatKhau = @MatKhau)
    BEGIN
        SET @LoaiTK = N'Giảng Viên'
        SET @TenDangNhap = (SELECT MaGV FROM GiangVien WHERE MaGV = @TenTK)
    END
    -- Kiểm tra bảng GiaoVu
    ELSE IF EXISTS (SELECT 1 FROM GiaoVu WHERE MaGiaoVu = @TenTK AND MatKhau = @MatKhau)
    BEGIN
        SET @LoaiTK = N'Giáo Vụ'
        SET @TenDangNhap = (SELECT MaGiaoVu FROM GiaoVu WHERE MaGiaoVu = @TenTK)
    END
    
    -- Kiểm tra bảng TaiKhoan
    ELSE IF EXISTS (SELECT 1 FROM TaiKhoan WHERE TenTK = @TenTK AND MatKhau = @MatKhau)
    BEGIN
        SET @LoaiTK = 'Admin'
        SET @TenDangNhap = (SELECT TenTK FROM TaiKhoan WHERE TenTK = @TenTK)
    END
    
    SELECT @LoaiTK AS LoaiTK, @TenDangNhap AS TenDangNhap
END
GO
/****** Object:  StoredProcedure [dbo].[DanhSachLopHocChuaDangKy]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachLopHocChuaDangKy]
	@MaSV varchar(50)
as
begin
	select
		lop.MaLop,
		giangVien.TenGV,
		lop.MaMH,
		monhoc.TenMH,
		monhoc.SoTiet,
		monhoc.SoTinChi,
		monhoc.ThoiKhoaBieu
	from tblLopHoc lop
	inner join GiangVien giangVien on lop.MaGV = giangVien.MaGV
	inner join MonHoc monhoc on lop.MaMH = monhoc.MaMH
	where lop.trangthai = 0 -- lấy các lớp đang mở
	and lop.MaLop not in ( select MaLop from DangkyMonHoc where MaSV = @MaSV);
end
GO
/****** Object:  StoredProcedure [dbo].[DanhSachSinhVienDangKyMon]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachSinhVienDangKyMon]
    @MaLop VARCHAR(50) = NULL,
    @MaSV VARCHAR(50) = NULL,
    @MaGV VARCHAR(50) = NULL,
    @TenGV NVARCHAR(100) = NULL,
    @MaMH VARCHAR(50) = NULL,
    @TenMH NVARCHAR(100) = NULL
AS
BEGIN
    SELECT
        lop.MaLop,
        dangky.MaSV,
        giangvien.MaGV,
        giangvien.TenGV,
        monhoc.MaMH,
        monhoc.TenMH,
        monhoc.SoTiet,
        monhoc.SoTinChi
    FROM DangkyMonHoc dangky
    INNER JOIN tblLopHoc lop ON dangky.MaLop = lop.MaLop
    INNER JOIN MonHoc monhoc ON lop.MaMH = monhoc.MaMH
    INNER JOIN GiangVien giangvien ON lop.MaGV = giangvien.MaGV
    WHERE (@MaLop IS NULL OR lop.MaLop = @MaLop)
        AND (@MaSV IS NULL OR dangky.MaSV = @MaSV)
        AND (@MaGV IS NULL OR giangvien.MaGV = @MaGV)
        AND (@TenGV IS NULL OR giangvien.TenGV LIKE '%' + @TenGV + '%')
        AND (@MaMH IS NULL OR monhoc.MaMH = @MaMH)
        AND (@TenMH IS NULL OR monhoc.TenMH LIKE '%' + @TenMH + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[Dk_monhoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dk_monhoc]
	@MaSV varchar(50),
	@MaLop varchar(50)
AS
BEGIN
	DECLARE @MaMH varchar(7),
			@DaDangKy int;
	-- lấy mã môn học dựa vào mã lớp
	SELECT @MaMH = MaMH 
	FROM tblLopHoc
	WHERE MaLop = @MaLop;

	-- kiểm tra xem sinh viên có đăng ký lớp khác học cùng 1 môn hay không
	select @DaDangKy = count(*)
	from DangkyMonHoc dangky
	inner join tblLopHoc lop on dangky.MaLop = lop.MaLop
	where lop.trangthai = 0 --> lớp đang mở
	and lop.MaMH = @MaMH --> môn học này đã đăng ký
	and dangky.MaSV = @MaSV; --> sinh viên xác định

	if @DaDangKy > 0 return -1; -- Nếu kết quả trả về lớn hơn 0 
	--> Sinh viên này hiện tại đã đăng ký 1 lớp học cùng môn này
	
	insert into DangkyMonHoc(nguoiTao, MaSV, MaLop)
	values (@MaSV, @MaSV, @MaLop); --sinh viên đăng ký -> người tạo = mã sinh viên

	if @@ROWCOUNT > 0 return 1 else return 0;
end
GO
/****** Object:  StoredProcedure [dbo].[HuyDangKyMonHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HuyDangKyMonHoc]
	@MaSV varchar(50),
	@MaLop varchar(50)
AS
BEGIN
	DELETE FROM DangkyMonHoc
	WHERE MaSV = @MaSV AND MaLop = @MaLop;

	IF @@ROWCOUNT > 0
		RETURN 1; -- Hủy đăng ký thành công
	ELSE
		RETURN 0; -- Không tìm thấy đăng ký để hủy
END
GO
/****** Object:  StoredProcedure [dbo].[lophoc_dangday]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[lophoc_dangday]
	@MaGV varchar(7)
as
begin
	select
		tb.MaLop,
		tb.MaMH,
		tb.TenMH,
		tb.SoTiet,
		tb.SoTinChi,
		count(dky.MaSV) as siso
	from
	(
		select
			lop.MaLop,
			lop.MaMH,
			monhoc.TenMH,
			monhoc.SoTiet,
			monhoc.SoTinChi
		from tblLopHoc lop
		inner join MonHoc monhoc on lop.MaMH = monhoc.MaMH
		where trangthai = 0
		and MaGV = @MaGV
	)
	AS tb
	inner join DangkyMonHoc dky on dky.MaLop = tb.MaLop
	group by tb.MaLop, tb.MaMH, tb.TenMH, tb.SoTiet, tb.SoTinChi;
end
GO
/****** Object:  StoredProcedure [dbo].[MonDangKy]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MonDangKy]
    @MaSV varchar(50)
AS
BEGIN
     SELECT 
        lop.MaLop,
        giangvien.TenGV,
        monhoc.MaMH,
        monhoc.TenMH,
        monhoc.SoTiet,
        monhoc.SoTinChi,
        monhoc.ThoiKhoaBieu
    FROM DangkyMonHoc dangky
	INNER JOIN tblLopHoc lop ON dangky.MaLop = lop.MaLop
    INNER JOIN MonHoc monhoc ON lop.MaMH = monhoc.MaMH
    INNER JOIN GiangVien giangvien ON lop.MaGV = giangvien.MaGV
    WHERE dangky.MaSV = @MaSV
    AND lop.trangthai = 0
END

GO
/****** Object:  StoredProcedure [dbo].[SinhVienTrongLop]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SinhVienTrongLop]
    @MaLop VARCHAR(50)
AS
BEGIN
    SELECT sv.MaSV,
	sv.TenSV,
	CONVERT(VARCHAR(10), sv.NgaySinh, 103) AS NgaySinh,
	CASE
	WHEN sv.GioiTinh = 1 THEN N'Nam'
		ELSE N'Nữ' END AS GioiTinh,
	sv.Email,
	sv.Khoa
    FROM SinhVien sv
    INNER JOIN DangkyMonHoc ON sv.MaSV = DangkyMonHoc.MaSV
    WHERE DangkyMonHoc.MaLop = @MaLop
END
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinGiangVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SuaThongTinGiangVien]
-- khai báo ds tham số truyền vào
	@MaGV varchar(8),
	@TenGV nvarchar(120),
	@NgaySinh date,
	@GioiTinh tinyint,
	@DiaChi nvarchar(50),
	@Email varchar(50),
	@TrangThai varchar(50),
	@HocHam nvarchar(50)
AS
BEGIN
-- Thêm dữ liệu cho sinh viên
	UPDATE GiangVien
	SET
		TenGV = @TenGV,
		NgaySinh = @NgaySinh,
		GioiTinh = @GioiTinh,
		DiaChi = @DiaChi,
		Email = @Email,
		TinhTrang = @TrangThai,
		HocHam = @HocHam

	WHERE MaGV = @MaGV;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END
END
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinGiaoVu]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SuaThongTinGiaoVu]
-- khai báo ds tham số truyền vào
	@MaGiaoVu varchar(50),
	@TenGiaoVu nvarchar(50),
	@NgaySinh date,
	@GioiTinh tinyint,
	@DiaChi nvarchar(50),
	@Email varchar(50),
	@TrangThai varchar(50)
AS
BEGIN
-- Thêm dữ liệu cho sinh viên
	UPDATE GiaoVu
	SET
		TenGiaoVu = @TenGiaoVu,
		NgaySinh = @NgaySinh,
		GioiTinh = @GioiTinh,
		DiaChi = @DiaChi,
		Email = @Email,
		TrangThai = @TrangThai
	WHERE MaGiaoVu = @MaGiaoVu;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END
END
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinMonHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SuaThongTinMonHoc]
-- khai báo ds tham số truyền vào
	@MaMH varchar(7),
	@TenMH nvarchar(120),
	@SoTiet int,
	@SoTinChi int,
	@ThoiKhoaBieu nvarchar(300)
AS
BEGIN
	UPDATE MonHoc
	SET
		TenMH = @TenMH,
		SoTiet = @SoTiet,
		SoTinChi = @SoTinChi,
		ThoiKhoaBieu = @ThoiKhoaBieu
	WHERE MaMH = @MaMH;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END
END
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinSinhVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SuaThongTinSinhVien]
-- khai báo ds tham số truyền vào
	@MaSV varchar(8),
	@TenSV nvarchar(120),
	@NgaySinh date,
	@GioiTinh tinyint,
	@DiaChi nvarchar(50),
	@Email varchar(50),
	@Khoa varchar(50),
	@Lop nvarchar(50)
AS
BEGIN
-- Thêm dữ liệu cho sinh viên
	UPDATE SinhVien
	SET
		TenSV = @TenSV,
		NgaySinh = @NgaySinh,
		GioiTinh = @GioiTinh,
		DiaChi = @DiaChi,
		Email = @Email,
		Khoa = @Khoa,
		Lop = @Lop
	WHERE MaSV = @MaSV;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END
END
GO
/****** Object:  StoredProcedure [dbo].[ThemGiangVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemGiangVien]
-- khai báo ds tham số truyền vào
	@MaGV varchar(8),
	@TenGV nvarchar(120),
	@NgaySinh date,
	@GioiTinh tinyint,
	@DiaChi nvarchar(50),
	@Email varchar(50),
	@HocHam varchar(50),
	@TrangThai nvarchar(50)
AS
BEGIN
-- Thêm dữ liệu cho sinh viên
	INSERT INTO GiangVien
	(
		MaGV, TenGV, NgaySinh, GioiTinh,
		DiaChi, Email, HocHam, TinhTrang
	) VALUES (
		@MaGV, @TenGV, @NgaySinh, @GioiTinh,
		@DiaChi, @Email, @HocHam, @TrangThai
	)
	if @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
/****** Object:  StoredProcedure [dbo].[ThemGiaoVu]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemGiaoVu]
-- khai báo ds tham số truyền vào
	@MaGiaoVu varchar(50),
	@TenGiaoVu nvarchar(50),
	@NgaySinh date,
	@GioiTinh tinyint,
	@DiaChi nvarchar(50),
	@Email varchar(50),
	@TrangThai nvarchar(50)
AS
BEGIN
-- Thêm dữ liệu cho sinh viên
	INSERT INTO GiaoVu
	(
		MaGiaoVu, TenGiaoVu, NgaySinh, GioiTinh,
		DiaChi, Email, TrangThai
	) VALUES (
		@MaGiaoVu, @TenGiaoVu, @NgaySinh, @GioiTinh,
		@DiaChi, @Email, @TrangThai
	)
	if @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
/****** Object:  StoredProcedure [dbo].[ThemLopHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemLopHoc]
	@nguoiTao varchar(30),
	@MaGV varchar(6),
	@MaMH varchar(7)
AS
BEGIN
	DECLARE @MaLop varchar(50);
	SET @MaLop = 'MMH' + FORMAT(NEXT VALUE FOR lophocSeq, '00');

	INSERT INTO tblLopHoc(nguoiTao, MaLop, MaGV, MaMH)
	VALUES (@nguoiTao, @MaLop, @MaGV, @MaMH);

	IF @@ROWCOUNT > 0
		RETURN 1;
	ELSE
		RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[ThemMonHoc]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemMonHoc]
-- khai báo ds tham số truyền vào
	@MaMH varchar(7),
	@TenMH nvarchar(120),
	@SoTiet int,
	@SoTinChi int,
	@ThoiKhoaBieu nvarchar(300)
AS
BEGIN
-- Thêm dữ liệu cho sinh viên
	INSERT INTO MonHoc
	(
		MaMH, TenMH, SoTiet, SoTinChi, ThoiKhoaBieu
	) VALUES (
		@MaMH, @TenMH, @SoTiet, @SoTinChi, @ThoiKhoaBieu
	)
	if @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
/****** Object:  StoredProcedure [dbo].[ThemSinhVien]    Script Date: 07/27/2024 1:58:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemSinhVien]
-- khai báo ds tham số truyền vào
	@MaSV varchar(8),
	@TenSV nvarchar(120),
	@NgaySinh date,
	@GioiTinh tinyint,
	@DiaChi nvarchar(50),
	@Email varchar(50),
	@Khoa varchar(50),
	@Lop nvarchar(50)
AS
BEGIN
-- Thêm dữ liệu cho sinh viên
	INSERT INTO SinhVien
	(
		MaSV, TenSV, NgaySinh, GioiTinh,
		DiaChi, Email, Khoa, Lop
	) VALUES (
		@MaSV, @TenSV, @NgaySinh, @GioiTinh,
		@DiaChi, @Email, @Khoa, @Lop
	)
	if @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
USE [master]
GO
ALTER DATABASE [QuanLyDangKyHocPhanSV] SET  READ_WRITE 
GO


