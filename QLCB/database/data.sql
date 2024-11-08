USE [master]
GO
/****** Object:  Database [QuanlyBanVe]    Script Date: 12/10/2020 2:39:22 PM ******/
CREATE DATABASE [QuanlyBanVe]
 CONTAINMENT = NONE
 ON  PRIMARY  
( NAME = N'QuanlyBanVe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanlyBanVe.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanlyBanVe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanlyBanVe_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanlyBanVe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanlyBanVe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanlyBanVe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanlyBanVe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanlyBanVe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanlyBanVe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanlyBanVe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanlyBanVe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanlyBanVe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanlyBanVe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanlyBanVe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanlyBanVe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanlyBanVe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanlyBanVe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanlyBanVe] SET QUERY_STORE = OFF
GO
USE [QuanlyBanVe]
GO
/****** Object:  Table [dbo].[CCHUYENBAY]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCHUYENBAY](
	[MACHUYENBAY] [nvarchar](50) NOT NULL,
	[SANBAYDI] [nvarchar](50) NULL,
	[SANBAYDEN] [nvarchar](50) NULL,
	[NGAYGIO] [date] NULL,
	[THOIGIANBAY] [int] NULL,
	[SOLUONGGHEHANG1] [int] NULL,
	[SOLUONGGHEHANG2] [int] NULL,
 CONSTRAINT [PK_CCHUYENBAY] PRIMARY KEY CLUSTERED 
(
	[MACHUYENBAY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATCHO]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATCHO](
	[MAPHIEU] [nvarchar](50) NOT NULL,
	[MAKH] [nvarchar](50) NULL,
	[MACHUYENBAY] [nvarchar](50) NULL,
	[MATUYENBAY] [nvarchar](50) NULL,
	[MAHANGVE] [nvarchar](50) NULL,
	[SOGHEDAT] [int] NULL,
	[NGAYDAT] [date] NULL,
	[GIATIEN] [int] NULL,
 CONSTRAINT [PK_DATCHO] PRIMARY KEY CLUSTERED 
(
	[MAPHIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGVE]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGVE](
	[mahangve] [nvarchar](10) NOT NULL,
	[tenhangve] [nvarchar](50) NULL,
 CONSTRAINT [PK_HANGVE] PRIMARY KEY CLUSTERED 
(
	[mahangve] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KKHACHHANG]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KKHACHHANG](
	[MAKH] [nvarchar](50) NOT NULL,
	[CMND] [nvarchar](50) NULL,
	[TENKH] [nvarchar](50) NULL,
	[DIENTHOAI] [nvarchar](50) NULL,
 CONSTRAINT [PK_KKHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[manv] [nvarchar](10) NOT NULL,
	[tennv] [nvarchar](50) NULL,
	[dienthoai] [nvarchar](12) NULL,
	[diachi] [nvarchar](255) NULL,
	[matkhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANBAY]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANBAY](
	[masanbay] [nvarchar](10) NOT NULL,
	[tensanbay] [nvarchar](255) NULL,
 CONSTRAINT [PK_SANBAY] PRIMARY KEY CLUSTERED 
(
	[masanbay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TTHAMSO]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTHAMSO](
	[ThoiGianBayToiThieu] [nvarchar](50) NULL,
	[SoSanBayTrungGianToiDa] [nvarchar](50) NULL,
	[ThoiGianDungToiThieu] [nvarchar](50) NULL,
	[ThoiGianDungToiDa] [nvarchar](50) NULL,
	[TGChamNhatDatVe] [nvarchar](50) NULL,
	[TGChamNhatHuyDatVe] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUYENBAY]    Script Date: 12/10/2020 2:39:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUYENBAY](
	[matuyenbay] [nvarchar](20) NOT NULL,
	[masanbaydi] [nvarchar](10) NULL,
	[masanbayden] [nvarchar](10) NULL,
 CONSTRAINT [PK_TUYENBAY] PRIMARY KEY CLUSTERED 
(
	[matuyenbay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'QH214', N'Nội Bài', N'Cần Thơ', CAST(N'2020-07-08' AS Date), 1, 55, 50)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'QH290', N'Đà Nẵng', N'Pleiku', CAST(N'2020-11-06' AS Date), 3, 55, 50)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'VJ260', N'Điện Biên Phủ', N'Thọ Xuân', CAST(N'2020-01-01' AS Date), 1, 50, 50)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'VNA1336', N'Tân Sơn Nhất', N'Đồng Hới', CAST(N'2020-11-12' AS Date), 2, 50, 60)
INSERT [dbo].[CCHUYENBAY] ([MACHUYENBAY], [SANBAYDI], [SANBAYDEN], [NGAYGIO], [THOIGIANBAY], [SOLUONGGHEHANG1], [SOLUONGGHEHANG2]) VALUES (N'VNA2001', N'Thọ Xuân', N'Cà Mau', CAST(N'2020-04-19' AS Date), 4, 55, 65)
GO
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'1002', N'QH214', N'1', N'DAD -PXU', N'Vé hạng 1', 2, CAST(N'2020-12-10' AS Date), 5000000)
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'1106', N'VNA1336', N'thu456', N'VDO-CXR', N'Vé hạng 1', 2, CAST(N'2020-12-10' AS Date), 9135780)
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'1904', N'QH290', N'kien123', N'SGN-VDH', N'Vé hạng 1', 4, CAST(N'2020-12-10' AS Date), 4480808)
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'2020', N'VNA2001', N'trangthu123', N'HAN-VCA', N'Vé hạng 1', 3, CAST(N'2020-12-10' AS Date), 4155000)
INSERT [dbo].[DATCHO] ([MAPHIEU], [MAKH], [MACHUYENBAY], [MATUYENBAY], [MAHANGVE], [SOGHEDAT], [NGAYDAT], [GIATIEN]) VALUES (N'2021', N'VJ260', N'maihoa116', N'DAD -PXU', N'Vé hạng 2', 1, CAST(N'2020-12-10' AS Date), 1300000)
GO
INSERT [dbo].[HANGVE] ([mahangve], [tenhangve]) VALUES (N'1', N'Vé hạng 1')
INSERT [dbo].[HANGVE] ([mahangve], [tenhangve]) VALUES (N'2', N'Vé hạng 2')
GO
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'1', N'11111', N'lê hồng quân', N'1111')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'abcxyz', N'044301001666', N'Phạm Thị Trang Thu', N'0372024845')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'avab', N'044301001444', N'Nguyễn Văn A', N'0372024843')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'kien123', N'044301001222', N'Nguyễn Phạm Trung Kiên', N'0372024841')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'maihoa116', N'044301001333', N'Nguyễn Thị Mai Hoa', N'0372024842')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'maybay', N'044301001555', N'Nguyễn Văn B', N'0372024844')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'thu456', N'044301001666', N'Nguyễn Văn C', N'0372024845')
INSERT [dbo].[KKHACHHANG] ([MAKH], [CMND], [TENKH], [DIENTHOAI]) VALUES (N'trangthu123', N'044301001305', N'Phạm Thị Trang Thu', N'0372024840')
GO
INSERT [dbo].[NHANVIEN] ([manv], [tennv], [dienthoai], [diachi], [matkhau]) VALUES (N'kien1904', N'Nguyễn Phạm Trung Kiên', N'0399087024', N'86/40 Âu Cơ', N'123456789')
INSERT [dbo].[NHANVIEN] ([manv], [tennv], [dienthoai], [diachi], [matkhau]) VALUES (N'lehongquan', N'Lê Hồng Quân', N'0814789455', N'351A Lạc Long Quân', N'123')
INSERT [dbo].[NHANVIEN] ([manv], [tennv], [dienthoai], [diachi], [matkhau]) VALUES (N'maihoa', N'Nguyễn Thị Mai Hoa', N'0365815001', N'10 Trần Thiện Chánh', N'123456789')
INSERT [dbo].[NHANVIEN] ([manv], [tennv], [dienthoai], [diachi], [matkhau]) VALUES (N'trangthu78', N'Phạm Thị Trang Thu', N'0372024840', N'86/40 Âu Cơ', N'123456789')
GO
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'BMV', N'Buôn Ma Thuột')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'CAH', N'Cà Mau')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'CXR', N'Cam Ranh')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'DAD ', N'Đà Nẵng')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'DIN', N'Điện Biên Phủ')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'DLI', N'Liên Khương')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'HAN', N'Nội Bài')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'HPH', N'Cát Bi')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'HUI', N'Phú Bài')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'PQC', N'Phú Quốc')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'PXU', N'Pleiku')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'SGN', N'Tân Sơn Nhất')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'TBB', N'Tuy Hòa')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'THD', N'Thọ Xuân')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'UIH', N'Phù Cát')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VCA', N'Cần Thơ')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VCL', N'Chu Lai')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VCS', N'Côn Đảo')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VDH', N'Đồng Hới')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VDO', N'Vân Đồn')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VII', N'Vinh')
INSERT [dbo].[SANBAY] ([masanbay], [tensanbay]) VALUES (N'VKG', N'Rạch Giá')
GO
INSERT [dbo].[TTHAMSO] ([ThoiGianBayToiThieu], [SoSanBayTrungGianToiDa], [ThoiGianDungToiThieu], [ThoiGianDungToiDa], [TGChamNhatDatVe], [TGChamNhatHuyDatVe]) VALUES (N'1 giờ', N'2', N'0.5 giờ', N'2 giờ', N'Trước 1 ngày', N'Trước 2 ngày')
GO
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DAD -PXU', N'DAD ', N'PXU')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DIN-DAD ', N'DIN', N'DAD ')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DIN-THD', N'DIN', N'THD')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DIN-VCL', N'DIN', N'VCL')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'DLI-DIN', N'DLI', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'HAN-VCA', N'HAN', N'VCA')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'HPH-HUI', N'HPH', N'HUI')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'HPH-THD', N'HPH', N'THD')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'PQC-VCL', N'PQC', N'VCL')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'PXU-DIN', N'PXU', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-BMV', N'SGN', N'BMV')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-HAN', N'SGN', N'HAN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-PQC', N'SGN', N'PQC')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-VCA', N'SGN', N'VCA')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'SGN-VDH', N'SGN', N'VDH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'TBB-DIN', N'TBB', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'TBB-VCS', N'TBB', N'VCS')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'THD-CAH', N'THD', N'CAH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VCA-DIN', N'VCA', N'DIN')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VCA-HPH', N'VCA', N'HPH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VCA-VDH', N'VCA', N'VDH')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VDH-THD', N'VDH', N'THD')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VDO-CXR', N'VDO', N'CXR')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VDO-DAD ', N'VDO', N'DAD ')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VII-CXR', N'VII', N'CXR')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VKG-DLI', N'VKG', N'DLI')
INSERT [dbo].[TUYENBAY] ([matuyenbay], [masanbaydi], [masanbayden]) VALUES (N'VKG-VII', N'VKG', N'VII')
GO
USE [master]
GO
ALTER DATABASE [QuanlyBanVe] SET  READ_WRITE 
GO
