USE [master]
GO
/****** Object:  Database [InventoryManagementSystem_46]    Script Date: 9/11/2017 5:22:26 PM ******/
CREATE DATABASE [InventoryManagementSystem_46]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryManagementSystem_46', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\InventoryManagementSystem_46.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InventoryManagementSystem_46_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\InventoryManagementSystem_46_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InventoryManagementSystem_46] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryManagementSystem_46].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryManagementSystem_46] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryManagementSystem_46] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryManagementSystem_46] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [InventoryManagementSystem_46]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/11/2017 5:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerProduct]    Script Date: 9/11/2017 5:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_CustomerProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/11/2017 5:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Quantity] [float] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 9/11/2017 5:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_GetAllProductInformation]    Script Date: 9/11/2017 5:22:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_GetAllProductInformation]
AS
SELECT p.*, pc.Name AS ProductCategoryName FROM Product AS p 
INNER JOIN ProductCategory pc ON p.ProductCategoryId = pc.Id



GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name]) VALUES (1, N'Bishal')
INSERT [dbo].[Customer] ([Id], [Name]) VALUES (2, N'Moon')
INSERT [dbo].[Customer] ([Id], [Name]) VALUES (3, N'Hosen')
INSERT [dbo].[Customer] ([Id], [Name]) VALUES (4, N'Jannat')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerProduct] ON 

INSERT [dbo].[CustomerProduct] ([Id], [ProductId], [CustomerId]) VALUES (1, 1, 1)
INSERT [dbo].[CustomerProduct] ([Id], [ProductId], [CustomerId]) VALUES (2, 2, 1)
INSERT [dbo].[CustomerProduct] ([Id], [ProductId], [CustomerId]) VALUES (3, 6, 3)
INSERT [dbo].[CustomerProduct] ([Id], [ProductId], [CustomerId]) VALUES (4, 8, 4)
INSERT [dbo].[CustomerProduct] ([Id], [ProductId], [CustomerId]) VALUES (5, 9, 4)
INSERT [dbo].[CustomerProduct] ([Id], [ProductId], [CustomerId]) VALUES (6, 10, 3)
SET IDENTITY_INSERT [dbo].[CustomerProduct] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Code], [Quantity], [UnitPrice], [ProductCategoryId]) VALUES (1, N'Desktop Computer', N'123', 6, 50000, 1)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Quantity], [UnitPrice], [ProductCategoryId]) VALUES (2, N'HP', N'456', 1, 35000, 3)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Quantity], [UnitPrice], [ProductCategoryId]) VALUES (6, N'Dell Laptop', N'999', 2, 70000, 3)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Quantity], [UnitPrice], [ProductCategoryId]) VALUES (8, N'Samsung  s8', N'1234', 1, 90000, 2)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Quantity], [UnitPrice], [ProductCategoryId]) VALUES (9, N'I Phone 7+', N'001', 2, 110000, 2)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Quantity], [UnitPrice], [ProductCategoryId]) VALUES (10, N'I Phone 7-', N'002', 1, 80000, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (1, N'Dekstop')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (2, N'Mobile')
INSERT [dbo].[ProductCategory] ([Id], [Name]) VALUES (3, N'Laptop')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Product]    Script Date: 9/11/2017 5:22:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Product] ON [dbo].[Product]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerProduct]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProduct_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerProduct] CHECK CONSTRAINT [FK_CustomerProduct_Customer]
GO
ALTER TABLE [dbo].[CustomerProduct]  WITH CHECK ADD  CONSTRAINT [FK_CustomerProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[CustomerProduct] CHECK CONSTRAINT [FK_CustomerProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
USE [master]
GO
ALTER DATABASE [InventoryManagementSystem_46] SET  READ_WRITE 
GO
