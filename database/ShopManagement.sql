--USE [master]
GO
CREATE DATABASE [ShopManagement] 
USE [ShopManagement]
GO
--DROP DATABASE ShopManagement
GO
--Table Users
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--Table roles
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[rname] [nvarchar](50) NULL,	
CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--Table order
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[date] [datetime] NULL,
	[total] [int] NULL
CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--Table order detail
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [nvarchar](50) NOT NULL,	
	[quantity] [int] NULL,
	[price] [int] NULL
CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--Table product 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](50) NOT NULL,
	[proName] [nvarchar](50) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[images] [nvarchar](max) NULL,
	[categoryID] [int] NOT NULL
CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--Table Category
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--INSERT tblUsers
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'admin', N'Toi la admin', N'1', N'0152415514', N'Washington, DC 20500, United States', N'hacker@gmail.com', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'013415514', N'Tân Lập 1,Phường Hiệp Phú, Quận 9', N'hoadnt@gmail.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'SE130363', N'Vu Truong Giang', N'1', N'06817353', N'213 Đường 3/2, Phường 11, Quận 10', N'hoadnt@gmail.com', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'SE140103', N'Le The Khoi', N'1', N'0135787385', N'543 An Dương Vương, Phường 8, Quận 5', N'khoilt@gmail.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'SE140119', N'Le Quang Thanh', N'1', N'018648124', N'144 Bạch Đằng, Phường 3, Gò Vấp', N'thanhlq@gmail.com', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'SE140130', N'Ngo Thi Khanh Ly', N'1', N'071628524', N'135 Nam Kỳ Khởi Nghĩa, Phường Bến Thành, Quận 1', N'lynt@gmail.com', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'SE140201', N'Tran Le Bao Ngoc', N'1', N'01726512', N'2225 Phạm Thế Hiển, Phường 6, Quận 8', N'ngoctl@gmail.com', N'AD')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'SE140969', N'Doan Minh Tien', N'1', N'026262231', N'561 Điện Biên Phủ, Phường 25, Bình Thạnh', N'tiendm@gmail.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [phone], [address], [email], [roleID]) VALUES (N'SE150443', N'Ngo Gia Thuong', N'1', N'012345667', N'216  Võ Văn Ngân, Bình Thọ, Thủ Đức', N'thuongng@gmail.com', N'US')
--INSERT tblRoles
INSERT [dbo].[tblRoles] ([roleID], [rname]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [rname]) VALUES (N'US', N'User')
--INSERT tblOrder
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (1,N'SE140969',CAST(N'2022-06-12 13:49:50' AS DateTime),15)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (2,N'SE140201',CAST(N'2022-06-12 15:49:50' AS DateTime),24)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (3,N'SE140119',CAST(N'2022-06-12 17:49:50' AS DateTime),36)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (4,N'SE130363',CAST(N'2022-06-13 11:49:50' AS DateTime),40)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (5,N'SE140103',CAST(N'2022-06-13 18:49:50' AS DateTime),36)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (6,N'SE140130',CAST(N'2022-06-13 20:49:50' AS DateTime),54)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (7,N'SE150443',CAST(N'2022-06-13 23:49:50' AS DateTime),40)
--INSERT tblOrderDetail
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1, 4, 1, 1, CAST(40 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (2, 6, 4, 3, CAST(54 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (3, 5, 2, 2, CAST(36 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (4, 2, 12, 2, CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (5, 7, 9, 1, CAST(40 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (6, 3, 11, 3, CAST(36 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (7, 1, 5, 1, CAST(15 AS Decimal(18, 0)))
--INSERT tblProduct 
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (1, N'Strawberry Earl Grey Latte', CAST(20 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2018/08/Strawberry-Earl-grey-latte.png', 1)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (2, N'Black Pearl Milk Tea', CAST(18 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-s%E1%BB%AFa-Tr%C3%A2n-ch%C3%A2u-%C4%91en-1.png', 2)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (3, N'Taro Milk Tea', CAST(18 AS Decimal(18, 0)), 20,N'http://gongcha.com.vn/wp-content/uploads/2018/01/Tr%C3%A0-s%E1%BB%AFa-Khoai-m%C3%B4n-2.png', 2)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (4, N'Chocolate Smoothie', CAST(15 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2018/02/Chocolate-%C4%91%C3%A1-xay-2.png', 4)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (5, N'Strawberry Oreo Smoothie', CAST(15 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2018/08/Strawberry-Oreo-Smoothie.png', 4)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (6, N'Matcha Smoothie', CAST(15 AS Decimal(18, 0)), 20,N'http://gongcha.com.vn/wp-content/uploads/2018/02/Matcha-%C4%91%C3%A1-xay-2.png', 4)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (7, N'Okinawa Milk Tea', CAST(18 AS Decimal(18, 0)), 20,N'http://gongcha.com.vn/wp-content/uploads/2018/10/Hinh-Web-OKINAWA-TR%C3%80-S%E1%BB%AEA.png', 2)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (8, N'Creme Brulee Matcha', CAST(20 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2022/01/matcha-creme-brulee.png', 1)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (9, N'Creme Brulee Latte', CAST(20 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2022/01/creme-brulee-late.png', 1)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (10, N'Winter Melon Tea', CAST(12 AS Decimal(18, 0)), 20,N'http://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-B%C3%AD-%C4%90ao-2.png', 3)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (11, N'Olong Tea', CAST(12 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Oolong-2.png', 3)
INSERT [dbo].[tblProduct] ([productID], [proName], [price], [quantity], [images], [categoryID]) VALUES (12, N'Green Tea', CAST(12 AS Decimal(18, 0)), 30,N'http://gongcha.com.vn/wp-content/uploads/2018/02/Tr%C3%A0-Xanh-2.png', 3)
--INSERT tblCategory
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (1, N'Latte')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (2, N'Milk tea')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (3, N'Brewed tea')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (4, N'Smoothie')

