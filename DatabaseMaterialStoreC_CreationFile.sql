USE [master]
GO
/****** Object:  Database [MaterialStoreC]    Script Date: 5/20/2022 4:58:00 AM ******/
CREATE DATABASE [MaterialStoreC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MaterialStoreC', FILENAME = N'D:\Database\MSSQL15.MSSQLSERVER\MSSQL\DATA\MaterialStoreC.mdf' , SIZE = 40960KB , MAXSIZE = UNLIMITED, FILEGROWTH = 20%)
 LOG ON 
( NAME = N'MaterialStoreC_log', FILENAME = N'D:\Database\MSSQL15.MSSQLSERVER\MSSQL\DATA\MaterialStoreC_log.ldf' , SIZE = 15360KB , MAXSIZE = 2048GB , FILEGROWTH = 20%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MaterialStoreC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MaterialStoreC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MaterialStoreC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MaterialStoreC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MaterialStoreC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MaterialStoreC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MaterialStoreC] SET ARITHABORT OFF 
GO
ALTER DATABASE [MaterialStoreC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MaterialStoreC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MaterialStoreC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MaterialStoreC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MaterialStoreC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MaterialStoreC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MaterialStoreC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MaterialStoreC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MaterialStoreC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MaterialStoreC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MaterialStoreC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MaterialStoreC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
--ALTER DATABASE [MaterialStoreC] SET TRUSTWORTHY OFF 
--GO
ALTER DATABASE [MaterialStoreC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MaterialStoreC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MaterialStoreC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
--ALTER DATABASE [MaterialStoreC] SET HONOR_BROKER_PRIORITY OFF 
--GO
ALTER DATABASE [MaterialStoreC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MaterialStoreC] SET  MULTI_USER 
GO
ALTER DATABASE [MaterialStoreC] SET PAGE_VERIFY CHECKSUM  
GO
--ALTER DATABASE [MaterialStoreC] SET DB_CHAINING OFF 
--GO
ALTER DATABASE [MaterialStoreC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MaterialStoreC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MaterialStoreC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MaterialStoreC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MaterialStoreC', N'ON'
GO
ALTER DATABASE [MaterialStoreC] SET QUERY_STORE = OFF
GO
USE [MaterialStoreC]
GO
/****** Object:  User [xuj8]    Script Date: 5/20/2022 4:58:01 AM ******/
CREATE USER [xuj8] FOR LOGIN [xuj8] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MaterialStoreC123]    Script Date: 5/20/2022 4:58:01 AM ******/
--CREATE USER [MaterialStoreC123] FOR LOGIN [MaterialStoreC123] WITH DEFAULT_SCHEMA=[dbo]
--GO
/****** Object:  User [Kennymm]    Script Date: 5/20/2022 4:58:01 AM ******/
CREATE USER [Kennymm] FOR LOGIN [kennymm] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [xuj8]
GO
--ALTER ROLE [db_owner] ADD MEMBER [MaterialStoreC123]
--GO
ALTER ROLE [db_owner] ADD MEMBER [Kennymm]
GO
/****** Object:  Table [dbo].[Made]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Made](
	[CompanyID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK__Made__E6D7D022DBBDFE36] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[Field] [varchar](30) NOT NULL,
	[RepName] [varchar](50) NOT NULL,
	[RepNumber] [varchar](11) NOT NULL,
	[AddressID] [int] NULL,
	[RegDate] [date] NULL,
	[Type] [varchar](30) NULL,
	[LevelOfInterest] [smallint] NULL,
	[Notes1] [varchar](500) NULL,
	[Notes2] [varchar](500) NULL,
	[Notes3] [varchar](500) NULL,
 CONSTRAINT [PK__Company__3214EC27027D1BC8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[SellPrice] [money] NULL,
	[Description] [varchar](300) NULL,
	[StockQuantity] [int] NULL,
 CONSTRAINT [PK__Product__3214EC27F8EFEAEE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Product__737584F6126733D1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Import_MadeView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Import_MadeView]
AS
SELECT comp.Name as CompanyName, prod.Name as ProductName, cost
FROM Made
Join Company comp on Made.CompanyID = comp.ID
Join Product prod on Made.ProductID = prod.ID
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[SSN] [char](18) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[AddressID] [int] NULL,
	[Position] [varchar](30) NULL,
	[EmployedYear] [int] NULL,
	[EmployedMonth] [smallint] NULL,
	[BirthYear] [int] NULL,
	[BirthMonth] [smallint] NULL,
	[PhoneNumber] [char](11) NOT NULL,
	[Salary] [money] NULL,
	[CreditCardNumber] [varchar](19) NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UniquePhoneNumberCheck] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[SSN] [char](18) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Import_DriverView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Import_DriverView]
As
Select d.SSN, e.Name
From Driver d
Join Employee e on e.SSN = d.SSN
GO
/****** Object:  Table [dbo].[Contacter]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacter](
	[SSN] [char](18) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Import_ContacterView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Import_ContacterView]
As
Select c.SSN, e.Name
From Contacter c
Join Employee e on e.SSN = c.SSN
GO
/****** Object:  Table [dbo].[Manage]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manage](
	[SuperiorSSN] [char](18) NOT NULL,
	[EmployeeSSN] [char](18) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SuperiorSSN] ASC,
	[EmployeeSSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Import_ManageView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Import_ManageView]
As
Select e.Name as Employee, e2.Name as Superior
From Manage m
Join Employee e on e.SSN = m.EmployeeSSN
Join Employee e2 on e2.SSN = m.SuperiorSSN
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[OrderUnitPrice] [money] NULL,
	[DriverSSN] [char](18) NULL,
	[DateOfOrder] [date] NULL,
	[ArriveDeadline] [date] NULL,
	[DateArrived] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Province] [varchar](24) NOT NULL,
	[City] [varchar](24) NOT NULL,
	[District] [varchar](24) NULL,
	[Street] [varchar](24) NULL,
	[ZipCode] [char](6) NULL,
 CONSTRAINT [PK__Address__3214EC27728E488C] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Import_OrderView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[Import_OrderView]
as
Select com.RepName, a.Province, a.City, a.District, a.Street, a.ZipCode, com.Name as Company, pro.Name as Product, o.OrderUnitPrice, e.Name as Driver, DateOfOrder, ArriveDeadline, DateArrived
From [Order] o
Join Company com on o.CompanyID = com.ID
Join Product pro on o.ProductID = pro.ID
Join Employee e on o.DriverSSN = e.SSN
Join [Address] a on o.AddressID = a.ID
GO
/****** Object:  Table [dbo].[ContactWith]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactWith](
	[ContacterSSN] [char](18) NOT NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContacterSSN] ASC,
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Import_ContactWithView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Import_ContactWithView]
as
Select c.Name as Company, e.Name as Contacter
From ContactWith cw
Join Company c on c.ID = cw.CompanyID
Join Employee e on e.SSN = cw.ContacterSSN
GO
/****** Object:  View [dbo].[EmployeeSalaryView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create View [dbo].[EmployeeSalaryView]
As
Select e.Name, e.Salary, e.CreditCardNumber, e.SSN, e.Position
From Employee e
GO
/****** Object:  View [dbo].[EmployeeMainView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[EmployeeMainView]
As
SELECT e.Name, e.SSN, e.Position, e.PhoneNumber, e.Salary, a.Province, a.City, a.District, a.Street, a.ZipCode, CAST(e.EmployedMonth AS varchar(2)) AS EmployedMonth, CAST(e.EmployedYear AS Char(4)) AS EmployedYear, CAST(e.BirthMonth AS varchar(2)) AS BirthMonth, 
             CAST(e.BirthYear AS char(4)) AS BirthYear, e.CreditCardNumber, e2.Name AS Manager
FROM   dbo.Employee AS e LEFT OUTER JOIN
             dbo.Address AS a ON e.AddressID = a.ID LEFT OUTER JOIN
             dbo.Manage AS m ON m.EmployeeSSN = e.SSN LEFT OUTER JOIN
             dbo.Employee AS e2 ON e2.SSN = m.SuperiorSSN
GO
/****** Object:  View [dbo].[EmployeeAddressView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create View [dbo].[EmployeeAddressView]
As
Select e.Name, a.Province, a.City, a.District, a.Street, a.ZipCode, e.SSN
From Employee e
Join [Address] a on e.AddressID = a.ID
GO
/****** Object:  View [dbo].[CompanyMainView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[CompanyMainView]
AS
SELECT c.Name, c.RepName, c.RepNumber, c.Field, a.Province, a.City, a.District, c.Type, c.LevelOfInterest, c.RegDate, c.Notes1, c.Notes2, c.Notes3
FROM     dbo.Company AS c LEFT JOIN
                  dbo.Address AS a ON c.AddressID = a.ID
GO
/****** Object:  View [dbo].[ContactView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[ContactView]
As
Select c.Name as Company, c.RepName as Representative, c.RepNumber, e.Name as Contacter, e.PhoneNumber as ContacterNumber, c.LevelOfInterest
From Company c
Join ContactWith cw on cw.CompanyID = c.ID
Join Employee e on e.SSN = cw.ContacterSSN
GO
/****** Object:  View [dbo].[ProductMainView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    view [dbo].[ProductMainView]
As
SELECT p.ID, p.Name AS Name, m.Cost AS BuyingCost, p.SellPrice, p.Description, p.StockQuantity, c.Name AS MadeBy
FROM   dbo.Product AS p INNER JOIN
             dbo.Made AS m ON p.ID = m.ProductID INNER JOIN
             dbo.Company AS c ON c.ID = m.CompanyID
GO
/****** Object:  View [dbo].[OrderMainView]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE View [dbo].[OrderMainView]
as
SELECT o.ID, p.Name AS Product, o.ProductID, o.Quantity, o.OrderUnitPrice, o.DateOfOrder, e.Name AS Driver, c.Name AS SellTo, o.AddressID, a.Province, a.City, a.District, a.Street, a.ZipCode, o.ArriveDeadline, o.DateArrived
FROM   dbo.[Order] AS o left JOIN
             dbo.Address AS a ON o.AddressID = a.ID left JOIN
             dbo.Company AS c ON c.ID = o.CompanyID left JOIN
             dbo.Product AS p ON p.ID = o.ProductID left JOIN
             dbo.Employee AS e ON e.SSN = o.DriverSSN
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Username] [varchar](50) NULL,
	[token] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserList]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserList](
	[Username] [nvarchar](50) NOT NULL,
	[PasswordSalt] [varchar](50) NULL,
	[PasswordHash] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK__Company__Address__4242D080] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK__Company__Address__4242D080]
GO
ALTER TABLE [dbo].[Contacter]  WITH CHECK ADD FOREIGN KEY([SSN])
REFERENCES [dbo].[Employee] ([SSN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ContactWith]  WITH CHECK ADD  CONSTRAINT [FK__ContactWi__Compa__5832119F] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[ContactWith] CHECK CONSTRAINT [FK__ContactWi__Compa__5832119F]
GO
ALTER TABLE [dbo].[ContactWith]  WITH CHECK ADD FOREIGN KEY([ContacterSSN])
REFERENCES [dbo].[Contacter] ([SSN])
GO
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD FOREIGN KEY([SSN])
REFERENCES [dbo].[Employee] ([SSN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__Addres__4C0144E4] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__Addres__4C0144E4]
GO
ALTER TABLE [dbo].[Manage]  WITH CHECK ADD FOREIGN KEY([EmployeeSSN])
REFERENCES [dbo].[Employee] ([SSN])
GO
ALTER TABLE [dbo].[Manage]  WITH CHECK ADD FOREIGN KEY([SuperiorSSN])
REFERENCES [dbo].[Employee] ([SSN])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__AddressID__06ED0088] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__AddressID__06ED0088]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([DriverSSN])
REFERENCES [dbo].[Driver] ([SSN])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [LevelOfInterestCheck] CHECK  (([LevelOfInterest]>=(1) AND [LevelOfInterest]<=(5)))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [LevelOfInterestCheck]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [BirthMonthCheck] CHECK  (([BirthMonth]>=(1) AND [BirthMonth]<=(12)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [BirthMonthCheck]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [BirthYearCheck] CHECK  (([BirthYear]>=(1900) AND [BirthYear]<=(2099)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [BirthYearCheck]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [EmployedMonthCheck] CHECK  (([EmployedMonth]>=(1) AND [EmployedMonth]<=(12)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [EmployedMonthCheck]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [EmployedYearCheck] CHECK  (([EmployedYear]>=(1945) AND [EmployedYear]<=(2099)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [EmployedYearCheck]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [SalaryPositiveCheck] CHECK  (([Salary]>=(0)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [SalaryPositiveCheck]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [DateCheck] CHECK  (([DateOfOrder]<=[DateArrived]))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [DateCheck]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [SellPricePositiveCheck] CHECK  (([SellPrice]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [SellPricePositiveCheck]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [StockPositiveCheck] CHECK  (([StockQuantity]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [StockPositiveCheck]
GO
/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AddAddress](
@Province varchar(24),
@City varchar(24),
@District varchar(24) = null,
@Street varchar(24) = null,
@ZipCode char(6)=null
)
As
BEGIN

IF(@Province is null or @Province = '')
Begin
	Raiserror('Province can not be null or empty', 12, 1)
	Return 1
End

IF(@City is null or @City = '')
Begin
	Raiserror('City can not be null or empty', 12, 2)
	Return 2
End

INSERT INTO Address(ZipCode, Province, City, Street, District)
VALUES(@ZipCode, @Province, @City, @Street, @District)
Return SCOPE_IDENTITY()
Print'Insertion Succeed'

END
GO
/****** Object:  StoredProcedure [dbo].[AddCompany]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Beta version
--just working for now,
--not perfect

CREATE Procedure [dbo].[AddCompany](
	@Name varchar(60),
	@Field varchar(30),
	@RepName varchar(50),
	@RepNumber char(11),
	@Province varchar(24) = '',
	@City varchar(24) = '',
	@District varchar(24) = '',
	@RegDate date = null,
	@Type varchar(30) = null,
	@LevelOfInterest smallint,
	@Notes1 varchar(500) = null,
	@Notes2 varchar(500) = null,
	@Notes3 varchar(500) = null
)
AS


Begin

Declare @AddressID int = null;

IF(@Name is null or @RepName is null or @RepNumber is null or @Field is null)
Begin
	Raiserror('CompanyName, RepName, RepNumber, Field cannot be null', 12, 1)
	Return 1
End


IF(EXISTS (SELECT [Name] FROM Company WHERE Name = @Name))
BEGIN 
RAISERROR('Company already exists', 13,2)
RETURN 2
END

IF((@RepName is null or @RepNumber = '') and (@RepNumber is not null and @RepNumber <> '')) or ((@RepName is not null and @RepName <> '') and (@RepNumber is null or @RepNumber = ''))
Begin
	RAISERROR('RepName and RepNumber must be both null or not null', 13,3)
	RETURN 3
End

IF((@Province is null or @Province = '') and (@City is not null and @City <> '')) or ((@Province is not null and @Province <> '') and (@City is null or @City = ''))
Begin
	RAISERROR('province and city must be both null or not null', 13,4)
	RETURN 4
End

If((@Province is not null and @Province <> '') and (@City is not null and @City <> '')) -- if province and city both is not empty
Begin
	INSERT INTO Address(Province, City, District)
	VALUES(@Province, @City, @District)
	set @AddressID = SCOPE_IDENTITY()
	print @AddressID

INSERT INTO [Company](RegDate,AddressID, [Name], RepNumber, RepName, [Type], Field, LevelOfInterest, Notes1, Notes2, Notes3)
VALUES(@RegDate,@AddressID, @Name, @RepNumber, @RepName, @Type, @Field, @LevelOfInterest, @Notes1, @Notes2, @Notes3)

End
IF(@District = '' or @District is null) and (@Province is null or @Province = '') and (@City is null or @City = '') -- if all address are empty
BEGIN
INSERT INTO [Company](RegDate,AddressID, [Name], RepNumber, RepName, [Type], Field, LevelOfInterest, Notes1, Notes2, Notes3)
VALUES(@RegDate,@AddressID, @Name, @RepNumber, @RepName, @Type, @Field, @LevelOfInterest, @Notes1, @Notes2, @Notes3)

Print'Insertion Succeed'
return 0;
END

END
GO
/****** Object:  StoredProcedure [dbo].[AddContactWith]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   Procedure [dbo].[AddContactWith](
	@Contacter varchar(30),
	@Company varchar(60)
)
AS

Begin

IF(not EXISTS (SELECT [Name] FROM Employee WHERE [Name] = @Contacter))
BEGIN 
	RAISERROR('Employee does not exists', 13,1)
	RETURN 1
END

IF(not EXISTS (SELECT [Name] FROM Employee WHERE [Name] = @Contacter and Position = 'Contacter'))
BEGIN 
	RAISERROR('Employee is not a contactor', 13,2)
	RETURN 2
END

IF(not EXISTS (SELECT [Name] FROM Company WHERE Name = @Company))
BEGIN 
	RAISERROR('Compnay does not exist', 13,3)
	RETURN 3
END

IF(EXISTS (SELECT * FROM ContactView WHERE Contacter = @Contacter and Company = @Company))
BEGIN 
	RAISERROR('ContactWith relation already existed!', 13,4)
	RETURN 4
END

	DECLARE @ContacterSSN char(18)
	SET @ContacterSSN = (SELECT [SSN] FROM Employee WHERE [Name] = @Contacter)

	DECLARE @CompanyID int
	SET @CompanyID = (SELECT ID FROM Company WHERE [Name] = @Company)

	INSERT INTO [ContactWith]
	VALUES(@ContacterSSN, @CompanyID)
	Print'Insertion Succeed'
	return 0;


END
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[AddEmployee](
	@Name varchar(30),
	@SSN char(18),
	@Position varchar(30) = null,
	@PhoneNumber char(11),
	@Salary MONEY = null,
	@Province varchar(24) = null,
	@City varchar(24) = null,
	@District varchar(24) = null,
	@Street varchar(24) = null,
	@ZipCode char(6) = null,
	@EmployedYear int = null,
	@EmployedMonth smallint = null,
	@BirthYear int = null,
	@BirthMonth smallint = null,
	@CreditCardNumber varchar(19) = null,
	@Manager varchar(30) = null
)
AS

Begin

Begin Transaction

Declare @AddressID int = null;
Declare @errorOccured smallint = 0;
----------------------------------------------------------------------------------------
Declare @hasManager smallint;
IF(@Manager is not null and @Manager <> '') 
Begin
	set @hasManager = 1
End
Else
Begin
	set @hasManager = 0
End
----------------------------------------------------------------------------------------
Declare @hasAddress smallint; -- if province and city both is not empty
IF((@Province is not null and @Province <> '') and (@City is not null and @City <> ''))
Begin
	set @hasAddress = 1
End
Else
Begin
	set @hasAddress = 0
End
------------------------------------------------------------------------------------------
Declare @hasPosition smallint;
IF(@Position is not null and @Position <> '') 
Begin
	set @hasPosition = 1
End
Else
Begin
	set @hasPosition = 0
End
-------------------------------------------------------------------------------------------
Declare @hasPerson smallint--if this manager is an employee
SELECT @hasPerson = count(*) FROM Employee WHERE [Name] = @Manager
Declare @tmpPosition varchar(30);
Select @tmpPosition = Position From Employee e Where e.Name = @Manager

IF(EXISTS (SELECT [Name] FROM Employee WHERE [Name] = @Name))
BEGIN 
	RAISERROR('Employee already exists', 13,1)
	RollBack Transaction
	RETURN 1
END

IF(EXISTS (SELECT [SSN] FROM Employee WHERE SSN = @SSN))
BEGIN 
	RAISERROR('SSN already exists', 13,2)
	RollBack Transaction
	RETURN 2
END

IF(EXISTS (SELECT [PhoneNumber] FROM Employee WHERE PhoneNumber = @PhoneNumber))
BEGIN 
	RAISERROR('PhoneNumber already exists', 13,3)
	RollBack Transaction
	RETURN 3
END

IF((@Province is null or @Province = '') and (@City is not null and @City <> '')) or ((@Province is not null and @Province <> '') and (@City is null or @City = ''))
Begin
	RAISERROR('province and city must be both null or not null', 13,4)
	RollBack Transaction
	RETURN 4
End

if((@District <> '' and @District is not null) or (@ZipCode <> '' and @ZipCode is not null) or (@Street <> '' and @Street is not null)) and (@Province is null or @Province = '') and (@City is null or @City = '')
Begin
	Raiserror('if province or city is empty, then plz dont provide other address properties', 13, 5)
	RollBack Transaction
	return 5
End

If(@hasManager = 1 and @hasPerson = 0)--if manager field is provided but can't find this manager as an employee.
Begin
	Raiserror('Provided Manager does not exists as an Employee', 13, 6)
	RollBack Transaction
	return 6
End

If(@hasManager = 1 and (@tmpPosition = null OR (@tmpPosition <> 'Manager' and @tmpPosition <> 'Boss')))--if provided manager's position is not 'Manager'
Begin
	Raiserror('Provided Manager is not a manager or Boss', 13, 6)
	RollBack Transaction
	return 7
End

Declare @ManagerSSN char(18)
Select @ManagerSSN = SSN From Employee Where [Name] = @Manager


If(@hasAddress = 1 and @hasManager = 0)
Begin
	INSERT INTO Address(ZipCode, Province, City, Street, District)
	VALUES(@ZipCode, @Province, @City, @Street, @District)
	set @AddressID = SCOPE_IDENTITY()
	print @AddressID

	IF(@@ERROR <>0 ) set @errorOccured = 1

	INSERT INTO [Employee](SSN, [Name], AddressID, Position, EmployedYear, EmployedMonth, BirthYear, BirthMonth, PhoneNumber, Salary, CreditCardNumber)
	VALUES(@SSN, @Name, @AddressID, @Position, @EmployedYear, @EmployedMonth, @BirthYear, @BirthMonth, @PhoneNumber, @Salary, @CreditCardNumber)

	IF(@@ERROR <>0 ) set @errorOccured = 1
End
If(@hasAddress = 0 and @hasManager = 0)
Begin
	INSERT INTO [Employee](SSN, [Name], Position, EmployedYear, EmployedMonth, BirthYear, BirthMonth, PhoneNumber, Salary, CreditCardNumber)
	VALUES(@SSN, @Name, @Position, @EmployedYear, @EmployedMonth, @BirthYear, @BirthMonth, @PhoneNumber, @Salary, @CreditCardNumber)

	IF(@@ERROR <>0 ) set @errorOccured = 1
End
If(@hasAddress = 1 and @hasManager = 1)
Begin
	INSERT INTO Address(ZipCode, Province, City, Street, District)
	VALUES(@ZipCode, @Province, @City, @Street, @District)
	set @AddressID = SCOPE_IDENTITY()
	print @AddressID

	IF(@@ERROR <>0 ) set @errorOccured = 1

	INSERT INTO [Employee](SSN, [Name], AddressID, Position, EmployedYear, EmployedMonth, BirthYear, BirthMonth, PhoneNumber, Salary, CreditCardNumber)
	VALUES(@SSN, @Name, @AddressID, @Position, @EmployedYear, @EmployedMonth, @BirthYear, @BirthMonth, @PhoneNumber, @Salary, @CreditCardNumber)

	IF(@@ERROR <>0 ) set @errorOccured = 1

	INSERT INTO Manage(SuperiorSSN, EmployeeSSN)
	VALUES(@ManagerSSN, @SSN)

	IF(@@ERROR <>0 ) set @errorOccured = 1
End
If(@hasAddress = 0 and @hasManager = 1)
Begin

	INSERT INTO [Employee](SSN, [Name], Position, EmployedYear, EmployedMonth, BirthYear, BirthMonth, PhoneNumber, Salary, CreditCardNumber)
	VALUES(@SSN, @Name, @Position, @EmployedYear, @EmployedMonth, @BirthYear, @BirthMonth, @PhoneNumber, @Salary, @CreditCardNumber)

	IF(@@ERROR <>0 ) set @errorOccured = 1

	INSERT INTO Manage(SuperiorSSN, EmployeeSSN)
	VALUES(@ManagerSSN, @SSN)

	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@hasPosition = 1)
Begin
	IF(@tmpPosition = 'Driver' or @tmpPosition = 'driver')
	Begin
		Insert Into Driver(SSN)
		Values(@SSN)
		IF(@@ERROR <>0 ) set @errorOccured = 1
	End
	IF(@tmpPosition = 'Contacter' or @tmpPosition = 'contacter')
	Begin
		Insert Into Contacter(SSN)
		Values(@SSN)
		IF(@@ERROR <>0 ) set @errorOccured = 1
	End
End

IF(@errorOccured = 1)
Begin
	RollBack Transaction
	Print 'Insertion Failed'
End
Else
Begin
	Commit Transaction
	Print'Insertion Succeed'
	return 0;
End

END
GO
/****** Object:  StoredProcedure [dbo].[AddMade]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[AddMade](
	@CompanyName varchar(60),
	@ProductName varchar(60),
	@BuyingCost money

)
AS

Begin

Begin Transaction

Declare @errorOccured smallint = 0;

Declare @CompanyID int = null;
Declare @ProductID int = null;

Select @CompanyID = ID From Company Where [Name] = @CompanyName
Select @ProductID = ID From Product Where [Name] = @ProductName

IF(EXISTS (SELECT * FROM Made WHERE @CompanyID = CompanyID and @ProductID = ProductID))
BEGIN 
	RAISERROR('This Made info Already Exists', 13,1)
	RollBack Transaction
	RETURN 1
END

Insert Into Made(CompanyID, ProductID, Cost)
Values(@CompanyID, @ProductID, @BuyingCost)
IF(@@ERROR <>0 ) set @errorOccured = 1


IF(@errorOccured = 1)
Begin
	RollBack Transaction
	Print 'Insertion Failed'
End
Else
Begin
	Commit Transaction
	Print'Insertion Succeed'
	return 0;
End



End
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   Procedure [dbo].[AddOrder](
@ProductID int,
@Company varchar(60),
@Quantity int,
@OrderUnitPrice money,
@DateOfOrder date,
@Driver varchar(30),
@Province varchar(24),
@City varchar(24),
@District varchar(24),
@Street varchar(24),
@ZipCode char(6),
@ArriveDeadline date,
@DateArrived date
)
AS

Begin

Begin Transaction

Declare @errorOccured smallint = 0;

Declare @CompanyID int  = null
Select @CompanyID = ID From Company c Where c.[Name] = @Company

Declare @DriverSSN bigint = null
Select @DriverSSN = SSN From Employee e Where e.[Name] = @Driver and e.[Position] = 'Driver'


Declare @AddressID int = null;


IF(@ProductID is null or @ProductID = '')
Begin 
	RAISERROR('Must specify ProductID for the order', 13, 1)
	RollBack Transaction
	RETURN 1
End

--IF(@ProductID is null)
--Begin 
--	RAISERROR('Provided Product does not exists in Product Table', 13, 2)
--	RollBack Transaction
--	RETURN 2
--End

IF(@Company is null or @Company = '')
Begin 
	RAISERROR('Must specify Company Name for the order', 13, 3)
	RollBack Transaction
	RETURN 3
End

IF(@CompanyID is null)
Begin 
	RAISERROR('Provided Company does not exists in Company Table', 13, 4)
	RollBack Transaction
	RETURN 4
End

IF(@Province is null or @Province = '' or @City is null or @City = '' or @District is null or @District = '' or @Street is null or @Street = '' or @ZipCode is null or @ZipCode = '')
Begin
	RAISERROR('Must Provide Full Detail Of Address', 13, 5)
	RollBack Transaction
	RETURN 5
End

IF(@Driver is null)
Begin 
	RAISERROR('Must specify driver for the order', 13, 6)
	RollBack Transaction
	RETURN 6
End

IF(@DriverSSN is null)
Begin 
	RAISERROR('Provided driver is not a driver', 13, 7)
	RollBack Transaction
	RETURN 7
End

--------------------------------------------------------------------------------------------

Insert Into[Address](Province, City, District, Street, ZipCode)
values(@Province, @City, @District, @Street, @ZipCode)
set @AddressID = SCOPE_IDENTITY()
IF(@@ERROR <>0 ) set @errorOccured = 1

IF(@Driver is null or @Driver = '')
Begin
	Insert Into [Order](AddressID, CompanyID, ProductID, Quantity, OrderUnitPrice, DateOfOrder, ArriveDeadline, DateArrived)
	Values(@AddressID, @CompanyID, @ProductID, @Quantity, @OrderUnitPrice, @DateOfOrder, @ArriveDeadline, @DateArrived)
	IF(@@ERROR <>0 ) set @errorOccured = 1
End
Else
Begin
	Insert Into [Order](AddressID, CompanyID, ProductID, Quantity, OrderUnitPrice, DriverSSN, DateOfOrder, ArriveDeadline, DateArrived)
	Values(@AddressID, @CompanyID, @ProductID, @Quantity, @OrderUnitPrice, @DriverSSN, @DateOfOrder, @ArriveDeadline, @DateArrived)
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

IF(@errorOccured = 1)
Begin
	RollBack Transaction
	Print 'Insertion Failed'
End
Else
Begin
	Commit Transaction
	Print'Insertion Succeed'
	return 0;
End

END
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[AddProduct](
	@Name varchar(60),
	@BuyingCost money = null,
	@SellPrice money = null,
	@Description varchar(300) = null,
	@StockQuantity int = null,
	@MadeBy varchar(60) = null
)

AS

Begin

Begin Transaction

Declare @ProductID int = null;
Declare @errorOccured smallint = 0;

Declare @CompanyID int = null;
Select @CompanyID = ID From Company Where @MadeBy = [Name]

IF(@BuyingCost is not null and (@MadeBy is null or @MadeBy = ''))
Begin
	Raiserror('If MadeBy is not provided, plz not provide BuyingCost Value', 12, 1)
	RollBack Transaction
	Return 1
End

IF(@Name is null or @Name = '')
Begin
	Raiserror('Product Name can not be null or empty', 12, 2)
	RollBack Transaction
	Return 2
End

If(@BuyingCost <0)
Begin
	Raiserror('UnitCost can not below zero', 12, 3)
	RollBack Transaction
	Return 3
End

If(@SellPrice <0)
Begin
	Raiserror('SellPrice can not below zero', 12, 4)
	RollBack Transaction
	Return 4
End

If(@StockQuantity <0)
Begin
	Raiserror('StockQuantity can not below zero', 12, 5)
	RollBack Transaction
	Return 5
End

IF(@BuyingCost is not null and (@MadeBy = 'Material Store'))
Begin
	Raiserror('IF this product made by ourselves, then plz do not provide buyingcost value', 12, 6)
	RollBack Transaction
	Return 6
End

if(@MadeBy is null or @MadeBy = '')
Begin
	INSERT INTO [Product]([Name], SellPrice, [Description], StockQuantity)
	VALUES(@Name, @SellPrice, @Description, @StockQuantity)
	IF(@@ERROR <>0 ) set @errorOccured = 1
ENd
Else
Begin
	INSERT INTO [Product]([Name], SellPrice, [Description], StockQuantity)
	VALUES(@Name, @SellPrice, @Description, @StockQuantity)
	set @ProductID = SCOPE_IDENTITY()
	IF(@@ERROR <>0 ) set @errorOccured = 1

	Insert Into Made(CompanyID, ProductID, Cost)
	Values(@CompanyID, @ProductID, @BuyingCost)
End

IF(@errorOccured = 1)
Begin
	RollBack Transaction
	Print 'Insertion Failed'
End
Else
Begin
	Commit Transaction
	Print'Insertion Succeed'
	return 0;
End

End
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddUser](
@Username varchar(50),
@PasswordSalt varchar(50),
@PasswordHash varchar(50)
)
As
BEGIN

IF(@Username is null or @PasswordSalt is null or @PasswordHash is null)
Begin
	Raiserror('Input fields can not be null or empty', 12, 1)
	Return 1
End

IF(@Username IN (SELECT [Username] FROM UserList))
	Begin
		Raiserror('Username already exist', 12, 2)
		Return 2
End

INSERT INTO [UserList](Username, PasswordSalt, PasswordHash)
VALUES(@Username, @PasswordSalt, @PasswordHash)
Print'Insertion Succeed'
Return 0


END
GO
/****** Object:  StoredProcedure [dbo].[AddUserInfo]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[AddUserInfo](
	@Username varchar(50),
	@Token varchar(50)
)
As
BEGIN

	IF(@Username is null or @Token is null)
	Begin
		Raiserror('Input fields can not be null or empty', 12, 1)
		Return 1
	End

	IF(@Username NOT IN (SELECT [Username] FROM UserList))
	Begin
		Raiserror('The user does not exist', 12, 2)
		Return 2
	End

	INSERT INTO [UserInfo](Username, token)
	VALUES(@Username, @Token)
	Return SCOPE_IDENTITY()
	Print'Insertion Succeed'

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompany]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[DeleteCompany](
	@Name varchar(30)
)
AS

BEGIN

--Check for null value--
IF(@Name NOT IN (SELECT [Name] FROM Company))
BEGIN 
RAISERROR('Company Name is invalid', 13,1)
RETURN 1
END

--Perform the delete operation--
DELETE From [Company] 
WHERE ([Name]=@Name)

--Check for succesful delete--
DECLARE @Status SMALLINT
SET @Status = @@ERROR
IF @Status <> 0 
BEGIN
	-- Return error code to the calling program to indicate failure.
	PRINT 'An error occurred deleting the product ' + CONVERT(varchar(30), @Name) + '.'
	RETURN(@Status)
END
ELSE
BEGIN
	-- Return 0 to the calling program to indicate success.
	PRINT 'The company with name, ' + CONVERT(varchar(30), @Name) + ', was deleted successfully.'
	RETURN(0)
END

END
GO
/****** Object:  StoredProcedure [dbo].[deleteContactWith]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   Procedure [dbo].[deleteContactWith](
	@ContacterName varchar(30),
	@CompanyName varchar(60)
)
AS

Begin
	if(@ContacterName is null or @CompanyName is null)
	begin
		RAISERROR('Input fields cannot be null', 13,1)
		RETURN 1
	end

	if(@ContacterName not in (select [Name] from Employee where Position = 'Contacter'))
	begin 
		RAISERROR('contacter name does not exist', 13, 2)
		RETURN 2
	end

	if(@CompanyName not in (select [Name] from Company))
	begin 
		RAISERROR('company name does not exist', 13, 3)
		RETURN 3
	end

	--declare @myint1 int, @myint2 int
	--select @myInt1 = COUNT(*) from Employee where [Name] = @ContacterName
	--select @myInt2 = COUNT(*) from Company where [Name] = @CompanyName
	--if(@myint1 > 1 or @myint2 > 1)
	--begin 
	--	RAISERROR('', 13, 4)
	--	RETURN 4
	--end

	declare @ContacterSSN char(18), @CompanyID int
	select @ContacterSSN = SSN from Employee where [Name] = @ContacterName
	select @CompanyID = ID from Company where [Name] = @CompanyName
	if(not exists (select * from ContactWith where ContacterSSN = @ContacterSSN and CompanyID = @CompanyID))
	begin
		RAISERROR('The row does not exist', 13, 5)
		RETURN 5
	end

	delete from ContactWith where ContacterSSN = @ContacterSSN and CompanyID = @CompanyID
	Print'Delete Succeed'
	return 0;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Beta version
--just working for now,
--not perfect

CREATE Procedure [dbo].[DeleteEmployee](
	@SSN char(18)
)
AS

BEGIN

--Check for null value--
IF(@SSN NOT IN (SELECT SSN FROM Employee))
BEGIN 
RAISERROR('SSN is invalid', 13,1)
RETURN 1
END

If(@SSN In (Select SuperiorSSN From Manage) OR @SSN In (Select EmployeeSSN From Manage))
Begin
	Raiserror('Reference to Manage Table Exists, Delete Failed', 13, 2)
	Return 2
ENd

Declare @AddressID int;
Select @AddressID = AddressID from Employee where @AddressID = AddressID

IF(@AddressID is null)-- if this employee doesnt have an address yet
Begin                 -- just delete the employee directly
	DELETE From [Employee] 
	WHERE (@SSN=SSN)
End
Else -- if this employee has an address
Begin-- first delete employee then delete address, otherwise referential problem occurs. 
	DELETE From [Employee] 
	WHERE (@SSN=SSN)

	Delete From [Address]
	Where @AddressID = ID
ENd



--Check for succesful delete--
DECLARE @Status SMALLINT
SET @Status = @@ERROR
IF @Status <> 0 
BEGIN
	-- Return error code to the calling program to indicate failure.
	PRINT 'An error occurred deleting the Employee ' + @SSN + '.'
	RETURN(@Status)
END
ELSE
BEGIN
	-- Return 0 to the calling program to indicate success.
	PRINT 'The employee with SSN ' + @SSN + ', was deleted successfully.'
	RETURN(0)
END

Return 0;

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   Procedure [dbo].[DeleteOrder](
	@ID int
)
AS

BEGIN

--Check for null value--
IF(@ID NOT IN (SELECT [ID] FROM [Order]))
BEGIN 
RAISERROR('ID is invalid', 13,1)
RETURN 1
END

--Perform the delete operation--
DELETE From [Order] 
WHERE ([ID]=@ID)

--Check for succesful delete--
DECLARE @Status SMALLINT
SET @Status = @@ERROR
IF @Status <> 0 
BEGIN
	-- Return error code to the calling program to indicate failure.
	PRINT 'An error occurred deleting the order ' + CONVERT(varchar(30), @ID) + '.'
	RETURN(@Status)
END
ELSE
BEGIN
	-- Return 0 to the calling program to indicate success.
	PRINT 'The order with ID, ' + CONVERT(varchar(30), @ID) + ', was deleted successfully.'
	RETURN(0)
END

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[DeleteProduct](
	@Name varchar(50),
	@MadeBy varchar(50)
)
AS

BEGIN

--Check for null value--
IF(@Name NOT IN (SELECT Name FROM Product))
BEGIN 
RAISERROR('Product is invalid', 13,1)
RETURN 1
END

DECLARE @companyID int = null;
DECLARE @productID int = null;

Select @productID = ID From Product Where [Name] = @Name
Select @companyID = ID From Company Where [Name] = @MadeBy

--Perform the delete operation--
DELETE From Product
WHERE [Name] = @Name

DELETE From [Made]
WHERE ([CompanyID]=@companyID AND [ProductID]=@productID)



--Check for succesful delete--
DECLARE @Status SMALLINT
SET @Status = @@ERROR
IF @Status <> 0 
BEGIN
	-- Return error code to the calling program to indicate failure.
	PRINT 'An error occurred deleting the product ' + CONVERT(varchar(30), @Name) + '.'
	RETURN(@Status)
END
ELSE
BEGIN
	-- Return 0 to the calling program to indicate success.
	PRINT 'The product with name, ' + CONVERT(varchar(30), @Name) + ', was deleted successfully.'
	RETURN(0)
END

END
GO
/****** Object:  StoredProcedure [dbo].[GetCompany]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetCompany]
AS
Begin

Select * From CompanyMainView
Print'get Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyNamesAndIDs]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCompanyNamesAndIDs]
AS
Begin

Select [Name], ID From Company
Print'get Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[GetContactors]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetContactors]
AS
Begin

Select [Name], SSN From Employee
where Position = 'Contacter'
Print'get Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[GetContactWith]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetContactWith]
AS
Begin

Select * From ContactView
Print'get Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetEmployee]
AS
Begin

Select * From EmployeeMainView
Print'get Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrder]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   Procedure [dbo].[GetOrder]
AS
Begin

Select * From [OrderMainView]
Print'get Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetProduct]
AS
Begin

Select * From ProductMainView
Print'get Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetUser](
	@Username varchar(50)
)
As
BEGIN

	IF(@Username is null)
	Begin
		Raiserror('Input fields can not be null or empty', 12, 1)
		Return 1
	End

	IF(@Username NOT IN (SELECT [Username] FROM UserList))
	Begin
		Raiserror('Login failed', 12, 1)
		Return 1
	End

	select PasswordHash, PasswordSalt
	from UserList
	where Username = @Username

END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddAddress]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[Import_AddAddress](
@ZipCode char(6)=null,
@Province varchar(24),
@City varchar(24),
@Street varchar(24) = null,
@District varchar(24) = null
)
As
BEGIN

IF(@Province is null or @Province = '')
Begin
	Raiserror('Province can not be null or empty', 12, 1)
	Return 1
End

IF(@City is null or @City = '')
Begin
	Raiserror('City can not be null or empty', 12, 2)
	Return 2
End

INSERT INTO Address(ZipCode, Province, City, Street, District)
VALUES(@ZipCode, @Province, @City, @Street, @District)
Return SCOPE_IDENTITY()
Print'Insertion Succeed'

END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddCompany]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Beta version
--just working for now,
--not perfect

Create Procedure [dbo].[Import_AddCompany](
	@Name varchar(30),
	@Field varchar(30),
	@RepName varchar(30),
	@RepNumber varchar(11),
	@AddressID int = null,
	@RegDate date = null,
	@Type varchar(30) = null,
	@LevelOfInterest smallint,
	@Notes1 varchar(500) = null,
	@Notes2 varchar(500) = null,
	@Notes3 varchar(500) = null
)
AS

Begin

IF(@Name is null or @RepNumber is null or @Field is null or @LevelOfInterest is null)
Begin
	Raiserror('Name, Phone, Field or LevelOfInterest cannot be null', 12, 1)
	Return 1
End


IF(EXISTS (SELECT [Name] FROM Company WHERE Name = @Name AND RepName = @RepName AND Field = @Field))
BEGIN 
RAISERROR('Company already exists', 13,2)
RETURN 2
END

INSERT INTO [Company](RepName, AddressID, RegDate, [Name], RepNumber, [Type], Field, LevelOfInterest, Notes1, Notes2, Notes3)
VALUES(@RepName, @AddressID, @RegDate, @Name, @RepNumber, @Type, @Field, @LevelOfInterest, @Notes1, @Notes2, @Notes3)
Print'Insertion Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddContacter]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Sample Usage:
--Declare @return_value int
--EXEC @return_value = AddProduct 
--	@Name = haha,
--	@UnitCost = 3.33
--Select 'Returned value' = @return_value


Create Procedure [dbo].[Import_AddContacter](
	@SSN char(18)
)
AS
Begin

IF(@SSN = null OR @SSN ='')
Begin
	Raiserror('SSN Cannot Be Null', 12, 1)
	Return 1
END

INSERT INTO [Contacter](SSN)
VALUES(@SSN)
Print'Insertion Succeed'
return 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddContactWith]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Import_AddContactWith](
	@ContacterName varchar(30),
	@CompanyName varchar(60)
)
AS
Begin

Declare @ContacterSSN char(18);
Declare @CompanyID int;
Select @ContacterSSN = SSN From Employee Where [Name] = @ContacterName
Select @CompanyID = ID From Company Where [Name] = @CompanyName


IF(@ContacterSSN = null OR @ContacterSSN ='')
Begin
	Raiserror('cannot find this ContacterSSN', 12, 1)
	Return 1
END

INSERT INTO [ContactWith](ContacterSSN, CompanyID)
VALUES(@ContacterSSN, @CompanyID)

Print'Insertion Succeed'
return 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddDriver]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Sample Usage:
--Declare @return_value int
--EXEC @return_value = AddProduct 
--	@Name = haha,
--	@UnitCost = 3.33
--Select 'Returned value' = @return_value


CREATE Procedure [dbo].[Import_AddDriver](
	@SSN char(18)
)
AS
Begin

IF(@SSN = null OR @SSN ='')
Begin
	Raiserror('SSN Cannot Be Null', 12, 1)
	Return 1
END

INSERT INTO [Driver](SSN)
VALUES(@SSN)
Print'Insertion Succeed'
return 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddEmployee]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Beta version
--just working for now,
--not perfect

--Sample Usage:
--Declare @return_value int
--EXEC @return_value = AddProduct 
--	@Name = haha,
--	@UnitCost = 3.33
--Select 'Returned value' = @return_value


Create Procedure [dbo].[Import_AddEmployee](
	@SSN char(18),
	@Name varchar(30),
	@AddressID int = null,
	@Position varchar(30) = null,
	@EmployedYear int = null,
	@EmployedMonth smallint = null,
	@BirthYear int = null,
	@BirthMonth smallint = null,
	@PhoneNumber char(11),
	@Salary MONEY,
	@CreditCardNumber varchar(19)
)
AS

Begin

--IF((Select Count(*) From Product Where @Name = [Name]) >0)
--Begin
--	Raiserror('Product Name already Exists', 12, 1)
--	Return 1
--End

--IF(@Name is null or @Name = '')
--Begin
--	Raiserror('Product Name can not be null or empty', 12, 2)
--	Return 2
--End

--If(@UnitCost <0)
--Begin
--	Raiserror('UnitCost can not below zero', 12, 3)
--	Return 3
--End

--If(@SellPrice <0)
--Begin
--	Raiserror('SellPrice can not below zero', 12, 4)
--	Return 4
--End

--If(@StockQuantity <0)
--Begin
--	Raiserror('StockQuantity can not below zero', 12, 5)
--	Return 5
--End

INSERT INTO [Employee](SSN, [Name], AddressID, Position, EmployedYear, EmployedMonth, BirthYear, BirthMonth, PhoneNumber, Salary, CreditCardNumber)
VALUES(@SSN, @Name, @AddressID, @Position, @EmployedYear, @EmployedMonth, @BirthYear, @BirthMonth, @PhoneNumber, @Salary, @CreditCardNumber)
Print'Insertion Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddMade]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Sample Usage:
--Declare @return_value int
--EXEC @return_value = AddProduct 
--	@Name = haha,
--	@UnitCost = 3.33
--Select 'Returned value' = @return_value


CREATE Procedure [dbo].[Import_AddMade](
	@CompanyName varchar(60),
	@ProductName varchar(60),
	@Cost Money = null
)
AS
Begin

IF(@CompanyName = null OR @CompanyName ='')
Begin
	Raiserror('CompanyName Cannot Be Null', 12, 1)
	Return 1
END

IF(@ProductName = null OR @ProductName ='')
Begin
	Raiserror('ProductName Cannot Be Null', 12, 2)
	Return 2
END

Declare @CompanyID int;
Declare @ProductID int;
Select @CompanyID = ID From Company Where [Name] = @CompanyName
Select @ProductID = ID From Product Where [Name] = @ProductName

IF(@CompanyID = null)
Begin
	Declare @ErMe varchar(100);
	set @ErMe = 'Cannot find the CompanyID with this CompanyName'+ Cast(@CompanyName as Varchar(60))
	Raiserror(@ErMe, 12, 3)
	Return 3
END

If(@ProductID = null)
Begin
	Declare @ErMe2 varchar(100);
	set @ErMe2 = 'Cannot find the ProductID with this ProductName'+ Cast(@ProductName as Varchar(60))
	Raiserror(@ErMe2, 12, 4)
	Return 4
End

INSERT INTO [Made]([CompanyID],  [ProductID], [Cost])
VALUES(@CompanyID, @ProductID, @Cost)
Print'Insertion Succeed'
return 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddManage]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[Import_AddManage](
	@SuperiorName varchar(30),
	@EmployeeSSN char(18)
)
AS
Begin

Declare @SuperiorSSN char(18)
Select @SuperiorSSN = SSN From Employee Where [Name] = @SuperiorName

IF(@SuperiorSSN = null OR @SuperiorSSN ='')
Begin
	Raiserror('cannot find this SuperiorSSN', 12, 1)
	Return 1
END

INSERT INTO [Manage](EmployeeSSN, SuperiorSSN)
VALUES(@EmployeeSSN, @SuperiorSSN)
Print'Insertion Succeed'
return 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddOrder]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Import_AddOrder](
	@AddressID int,
	@CompanyRepName varchar(60),
	@ProductName varchar(60),
	@Quantity int,
	@OrderUnitPrice money = null,
	@DriverName varchar(30),
	@DateOfOrder date,
	@ArriveDeadline date,
	@DateArrived date
)
AS

Begin

Declare @CompanyID int;
Declare @ProductID int;
Declare @DriverSSN char(18);

Select @CompanyID = ID From Company Where @CompanyRepName = RepName
Select @ProductID = ID From Product Where @ProductName = [Name]
Select @DriverSSN = SSN From Employee Where @DriverName = [Name]



INSERT INTO [Order](AddressID, CompanyID, ProductID, Quantity, OrderUnitPrice, DriverSSN, DateOfOrder, ArriveDeadline, DateArrived)
VALUES(@AddressID, @CompanyID, @ProductID, @Quantity, @OrderUnitPrice, @DriverSSN, @DateOfOrder, @ArriveDeadline, @DateArrived)
Return SCOPE_IDENTITY()
Print'Insertion Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[Import_AddProduct]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Sample Usage:
--Declare @return_value int
--EXEC @return_value = AddProduct 
--	@Name = haha,
--	@UnitCost = 3.33
--Select 'Returned value' = @return_value


Create Procedure [dbo].[Import_AddProduct](
	@Name varchar(50),
	@SellPrice money = null,
	@Description varchar(300) = null,
	@StockQuantity int = null
)
AS

Begin

IF((Select Count(*) From Product Where @Name = [Name]) >0)
Begin
	Raiserror('Product Name already Exists', 12, 1)
	Return 1
End

IF(@Name is null or @Name = '')
Begin
	Raiserror('Product Name can not be null or empty', 12, 2)
	Return 2
End

If(@SellPrice <0)
Begin
	Raiserror('SellPrice can not below zero', 12, 4)
	Return 4
End

If(@StockQuantity <0)
Begin
	Raiserror('StockQuantity can not below zero', 12, 5)
	Return 5
End

INSERT INTO [Product]([Name],  SellPrice, [Description], StockQuantity)
VALUES(@Name, @SellPrice, @Description, @StockQuantity)
Return SCOPE_IDENTITY()
Print'Insertion Succeed'
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCompany]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SearchCompany](
    @Name varchar(50) = null,
	@Field varchar(30) = null,
	@Province varchar(24) = null,
	@RepName varchar(50) = null,
	@RepNumber varchar(11) = null,
	@City varchar(24) = null,
	@District varchar(24) = null,
	@Type varchar(30) = null,
	@RegDateMin date = null,
	@RegDateMax date = null,
	@LOIMin smallint = null,
	@LOIMax smallint = null

)
AS
BEGIN
	Select * 
	From CompanyMainView
    WHERE ((@Name is null) or ([Name] LIKE '%'+@Name+'%' ))
	and ((@RepName is null) or ([RepName] = @RepName))
	and ((@RepNumber is null) or ([RepNumber] = @RepNumber))
	and ((@Province is null) or (Province = @Province))
	and ((@City is null) or (City = @City))
	and ((@Field is null) or ([Field] = @Field))
	and ((@District is null) or ([District] = @District))
	and ((@Type is null) or ([Type] = @Type))
	and ((@RegDateMax is null) or (RegDate <= @RegDateMax))
	and ((@RegDateMin is null) or (RegDate >= @RegDateMin))
	and ((@LOIMax is null) or (LevelOfInterest <= @LOIMax))
	and ((@LOIMin is null) or (LevelOfInterest >= @LOIMin))
END
GO
/****** Object:  StoredProcedure [dbo].[SearchEmployee]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[SearchEmployee](
	@SSN char(18) = null,
	@Name varchar(30) = null,
	@Province varchar(24) = null,
	@City varchar(24) = null,
	@Position varchar(30) = null,
	@EmployedYearMax int = null,
	@EmployedYearMin int = null,
	@BirthYearMax int = null,
	@BirthYearMin int = null,
	@PhoneNumber char(11) = null,
	@SalaryMax MONEY = null,
	@SalaryMin MONEY = null,
	@Manager varchar(30) = null
)
AS
BEGIN
	
	Declare @ManagerSSN char(18)
	Select @ManagerSSN = SSN From Employee Where [Name] = @Manager


	Select e.Name, e.SSN, a.Province, a.City, a.District, a.Street, a.ZipCode, e.Position, cast(e.EmployedMonth as varchar(2)) as EmployedMonth, Cast(e.EmployedYear as Char(4)) as EmployedYear, Cast( e.BirthMonth as varchar(2)) as BirthMonth, Cast(e.BirthYear as char(4)) as BirthYear,  e.PhoneNumber, e.Salary, e.CreditCardNumber, e2.Name as Manager
	From  dbo.Employee AS e LEFT OUTER JOIN
             dbo.Address AS a ON e.AddressID = a.ID LEFT OUTER JOIN
             dbo.Manage AS m ON m.EmployeeSSN = e.SSN LEFT OUTER JOIN
             dbo.Employee AS e2 ON e2.SSN = m.SuperiorSSN
	WHERE ((@Name is null) or (e.Name = @Name))
	and ((@SSN is null) or (e.SSN = @SSN))
	and ((@Province is null) or (Province = @Province))
	and ((@City is null) or (City = @City))
	and ((@Position is null) or (e.Position = @Position))
	and ((@EmployedYearMax is null) or (e.EmployedYear <= @EmployedYearMax))
	and ((@EmployedYearMin is null) or (e.EmployedYear >= @EmployedYearMin))
	and ((@BirthYearMax is null) or (e.BirthYear <= @BirthYearMax))
	and ((@BirthYearMin is null) or (e.BirthYear >= @BirthYearMin))
	and ((@PhoneNumber is null) or (e.PhoneNumber = @PhoneNumber))
	and ((@SalaryMax is null) or (e.Salary <= @SalaryMax))
	and ((@SalaryMin is null) or (e.Salary >= @SalaryMin))
	and ((@ManagerSSN is null) or (SuperiorSSN = @ManagerSSN))
	
END
GO
/****** Object:  StoredProcedure [dbo].[SearchOrder]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   Procedure [dbo].[SearchOrder](
	@ID int = null,
	@Province varchar(24) = null,
	@City varchar(24) = null,
	@SellTo varchar(60) = null,
	@ProductID int,
	@QuantityMax int = null,
	@QuantityMin int = null,
	@OrderUnitPriceMax money = null,
	@OrderUnitPriceMin money = null,
	@Driver varchar(30) = null,
	@DateOfOrderMax date = null,
	@DateOfOrderMin date = null,
	@ArrivedDeadlineMax date = null,
	@ArrivedDeadlineMin date = null,
	@DateArrivedMax date = null,
	@DateArrivedMin date = null
)
AS
BEGIN

	Select * 
	From OrderMainView
	WHERE ((@ID is null) or (ID = @ID))
	and ((@Province is null) or (Province = @Province))
	and ((@City is null) or (City = @City))
	and ((@SellTo is null) or (SellTo = @SellTo))
	and ((@ProductID is null) or (ProductID = @ProductID))
	and ((@Driver is null) or (Driver = @Driver))
	and ((@QuantityMax is null) or (Quantity <= @QuantityMax))
	and ((@QuantityMin is null) or (Quantity >= @QuantityMin))
	and ((@OrderUnitPriceMax is null) or (OrderUnitPrice <= @OrderUnitPriceMax))
	and ((@OrderUnitPriceMin is null) or (OrderUnitPrice >= @OrderUnitPriceMin))
	and ((@DateOfOrderMax is null) or (DateOfOrder <= @DateOfOrderMax))
	and ((@DateOfOrderMin is null) or (DateOfOrder >= @DateOfOrderMin))
	and ((@ArrivedDeadlineMax is null) or (ArriveDeadline <= @ArrivedDeadlineMax))
	and ((@ArrivedDeadlineMin is null) or (ArriveDeadline >= @ArrivedDeadlineMin))
	and ((@DateArrivedMax is null) or (DateArrived <= @DateArrivedMax))
	and ((@DateArrivedMin is null) or (DateArrived >= @DateArrivedMin))
	
END
GO
/****** Object:  StoredProcedure [dbo].[SearchProduct]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   Procedure [dbo].[SearchProduct](
    @Name varchar(60) = null,
    @BuyingCost money = null,
    @SellPrice money = null,
    @StockQuantity int = null,
	@MadeBy varchar(60) = null
)
AS
BEGIN
    Select * From ProductMainView
    WHERE ((@Name is null) or ([Name] LIKE '%'+@Name+'%' ))
    and ((@BuyingCost is null) or (BuyingCost = @BuyingCost))
    and ((@SellPrice is null) or (SellPrice = @SellPrice))
	and ((@StockQuantity is null) or (StockQuantity = @StockQuantity))
    and ((@MadeBy is null) or (MadeBy LIKE '%'+@MadeBy+'%' ))
    --not allowing database fulltext indexing
END
GO
/****** Object:  StoredProcedure [dbo].[SearchProduct4]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SearchProduct4](
    @Name varchar(50) = null,
    @BuyingCost money = null,
    @SellPrice money = null,
    @StockQuantity int = null,
	@MadeBy varchar(60) = null
)
AS
BEGIN
    Select * From ProductMainView
    WHERE ((@Name is null) or ([Name] LIKE '%'+@Name+'%' ))
    and ((@BuyingCost is null) or (BuyingCost = @BuyingCost))
    and ((@SellPrice is null) or (SellPrice = @SellPrice))
	and ((@StockQuantity is null) or (StockQuantity = @StockQuantity))
    and ((@MadeBy is null) or (MadeBy LIKE '%'+@MadeBy+'%' ))
    --not allowing database fulltext indexing
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCompany]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Beta version
--just working for now,
--not perfect

CREATE Procedure [dbo].[UpdateCompany](
	@Name varchar(30),
	@Field varchar(30),
	@AddressID int = null,
	@Province varchar(24) = null,
	@City varchar(24) = null,
	@RepName varchar(50) = null,
	@RepNumber varchar(11) = null,
	@District varchar(24) = null,
	@Type varchar(30) = null,
	@RegDate date = null,
	@LevelOfInterest smallint,
	@Notes1 varchar(500) = null,
	@Notes2 varchar(500) = null,
	@Notes3 varchar(500) = null
)
AS
	Declare @id int
	Declare @errorOccured smallint = 0;
Begin


Select @id = ID from Company where [Name] = @Name
Select @AddressID = AddressID from Company where @Name = Name


--IF((Select Count(*) From Product Where @Name = [Name]) >0)
If((@Name is not null) and (Select Count(*) From Company Where @Name = [Name]) = 0)
Begin
	Update company
	Set [Name] = @Name
	Where ID = @id
End


If(@RepName is not null)
Begin
	Update company
	Set RepName = @RepName
	Where ID = @id
End

If(@RepNumber is not null)
Begin
	Update company
	Set RepNumber = @RepNumber
	Where ID = @id
End

If(@Field is not null)
Begin
	Update company
	Set [Field] = @Field
	Where ID = @id
End

If((@Province is not null and @Province <> '') and (@City is not null and @City <> '')) -- if province and city both is not empty
	Begin

		INSERT INTO Address(Province, City,District)
		VALUES(@Province, @City,@District)
		set @AddressID = SCOPE_IDENTITY()
		IF(@@ERROR <>0 ) set @errorOccured = 1
		
		Update Company
		Set AddressID = @AddressID
		Where Name = @Name
		IF(@@ERROR <>0 ) set @errorOccured = 1

	End

--If(@City is not null)
--Begin
--	Update CompanyMainView
--	Set [City] = @City
--	Where Name = @Name
--End

--If(@District is not null)
--Begin
--	Update CompanyMainView
--	Set [District] = @District
--	Where Name = @Name
--End

--If(@Province is not null)
--Begin
--	Update CompanyMainView
--	Set [Province] = @Province
--	Where Name = @Name
--End

If(@Type is not null)
Begin
	Update company
	Set [Type] = @Type
	Where ID = @id
End

If(@RegDate is not null)
Begin
	Update company
	Set [RegDate] = @RegDate
	Where ID = @id
End

If(@LevelOfInterest is not null)
Begin
	Update company
	Set [LevelOfInterest] = @LevelOfInterest
	Where ID = @id
End

If(@Notes1 is not null)
Begin
	Update company
	Set [Notes1] = @Notes1
	Where ID = @id
End

If(@Notes2 is not null)
Begin
	Update company
	Set [Notes2] = @Notes2
	Where ID = @id
End

If(@Notes3 is not null)
Begin
	Update company
	Set [Notes3] = @Notes3
	Where ID = @id
End


Print'update Succeed'
return 0
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[UpdateEmployee](
	@SSN char(18),
	@Name varchar(30) = null,
	@Position varchar(30) = null,
	@PhoneNumber char(11) = null,
	@Salary MONEY = null,
	@Province varchar(24) = null,
	@City varchar(24) = null,
	@District varchar(24) = null,
	@Street varchar(24) = null,
	@ZipCode char(6) = null,
	@EmployedYear int = null,
	@EmployedMonth smallint = null,
	@BirthYear int = null,
	@BirthMonth smallint = null,
	@CreditCardNumber varchar(19) = null,
	@Manager varchar(30) = null
)
AS

Begin

Begin Transaction

Declare @errorOccured smallint = 0;

--IF(EXISTS (SELECT [Name] FROM Employee WHERE [Name] = @Name))
--BEGIN 
--	RAISERROR('Employee already exists', 13,1)
--	RETURN 1
--END

--IF(EXISTS (SELECT [PhoneNumber] FROM Employee WHERE PhoneNumber = @PhoneNumber))
--BEGIN 
--	RAISERROR('PhoneNumber already exists', 13,3)
--	RETURN 3
--END


Declare @AddressID int;
Select @AddressID = AddressID from Employee where @SSN = SSN

IF(@AddressID is null)-- if this employee doesnt have an address yet
Begin
	IF((@Province is null or @Province = '') and (@City is not null and @City <> '')) or ((@Province is not null and @Province <> '') and (@City is null or @City = ''))
	Begin
		RAISERROR('province and city must be both null or not null', 13,4)
		RollBack Transaction
		RETURN 1
	End

	if((@District <> '' and @District is not null) or (@ZipCode <> '' and @ZipCode is not null) or (@Street <> '' and @Street is not null)) and (@Province is null or @Province = '') and (@City is null or @City = '')
	Begin
		Raiserror('if province or city is empty, then plz dont provide other address properties', 13, 5)
		RollBack Transaction
		return 2
	End

	If((@Province is not null and @Province <> '') and (@City is not null and @City <> '')) -- if province and city both is not empty
	Begin

		INSERT INTO Address(ZipCode, Province, City, Street, District)
		VALUES(@ZipCode, @Province, @City, @Street, @District)
		set @AddressID = SCOPE_IDENTITY()
		IF(@@ERROR <>0 ) set @errorOccured = 1
		
		Update Employee
		Set AddressID = @AddressID
		Where SSN = @SSN
		IF(@@ERROR <>0 ) set @errorOccured = 1

	End

End
Else -- if this employee already have an address
Begin
	If(@Province is not null)
	Begin
		Update Address
		Set Province = @Province
		Where ID = @AddressID
	End

	If(@City is not null)
	Begin
		Update Address
		Set City = @City
		Where ID = @AddressID
	End

	If(@District is not null)
	Begin
		Update Address
		Set District = @District
		Where ID = @AddressID
	End

	If(@Street is not null)
	Begin
		Update Address
		Set Street = @Street
		Where ID = @AddressID
	End

	If(@ZipCode is not null)
	Begin
		Update Address
		Set ZipCode = @ZipCode
		Where ID = @AddressID
	End
	
ENd


If(@Name is not null)
Begin
	Update Employee
	Set [Name] = @Name
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@Position is not null)
Begin
	Update Employee
	Set Position = @Position
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@EmployedYear is not null)
Begin
	Update Employee
	Set EmployedYear = @EmployedYear
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@EmployedMonth is not null)
Begin
	Update Employee
	Set EmployedMonth = @EmployedMonth
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@BirthMonth is not null)
Begin
	Update Employee
	Set BirthMonth = @BirthMonth
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@BirthYear is not null)
Begin
	Update Employee
	Set BirthYear = @BirthYear
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@PhoneNumber is not null)
Begin
	Update Employee
	Set PhoneNumber = @PhoneNumber
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@Salary is not null)
Begin
	Update Employee
	Set Salary = @Salary
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@CreditCardNumber is not null)
Begin
	Update Employee
	Set CreditCardNumber = @CreditCardNumber
	Where SSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End
----------------------------------------------------------------------------------------------------
Declare @hasPerson smallint--if this manager is an employee
SELECT @hasPerson = count(*) FROM Employee WHERE [Name] = @Manager
Declare @tmpPosition varchar(30);
Select @tmpPosition = Position From Employee e Where e.Name = @Manager
Declare @ManagerSSN char(18)
Select @ManagerSSN = SSN From Employee Where [Name] = @Manager

Declare @hasManager smallint;
IF(@Manager is not null and @Manager <> '') 
Begin
	set @hasManager = 1
End
Else
Begin
	set @hasManager = 0
End


If(@hasManager = 1 and @hasPerson = 0)--if manager field is provided but can't find this manager as an employee.
Begin
	Raiserror('Provided Manager does not exists as an Employee', 13, 6)
	RollBack Transaction
	return 3
End

If(@hasManager = 1 and (@tmpPosition = null OR (@tmpPosition <> 'Manager' and @tmpPosition <> 'Boss')))--if provided manager's position is not 'Manager'
Begin
	Raiserror('Provided Manager is not a manager', 13, 6)
	RollBack Transaction
	return 4
End

If(@Manager is not null)
Begin
	Update Manage
	Set SuperiorSSN = @ManagerSSN
	Where EmployeeSSN = @SSN
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

IF(@errorOccured = 1)
Begin
	RollBack Transaction
	Print 'Update Failed'
End
Else
Begin
	Commit Transaction
	Print'Update Succeed'
	return 0;
End

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   Procedure [dbo].[UpdateOrder](
	@ID int,
	@ProductID int = null, 
	@Quantity int = null,
	@OrderUnitPrice money = null,
	@DateOfOrder date = null,
	@Driver varchar(30) = null,
	@SellTo varchar(60) = null,
	@AddressID int = null,
	@Province varchar(24) = null,
	@City varchar(24) = null,
	@District varchar(24) = null,
	@Street varchar(24) = null,
	@ZipCode char(6) = null,
	@ArriveDeadline date = null,
	@DateArrived date = null
)
AS

Begin

Begin Transaction

Declare @errorOccured smallint = 0;

If(@ProductID is not null)
Begin
	if(@ProductID not in (select ID from Product))
	begin
		Raiserror('New Product ID does not exist', 13, 1)
		rollback transaction
		return 1
	end

	Update [Order]
	Set [ProductID] = @ProductID
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@Province is not null)
Begin
	Update Address
	Set [Province] = @Province
	Where ID = @AddressID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@City is not null)
Begin
	Update Address
	Set [City] = @City
	Where ID = @AddressID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@District is not null)
Begin
	Update Address
	Set [District] = @District
	Where ID = @AddressID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@ZipCode is not null)
Begin
	Update Address
	Set [ZipCode] = @ZipCode
	Where ID = @AddressID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@Quantity is not null)
Begin
	Update [Order]
	Set Quantity = @Quantity
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@OrderUnitPrice is not null)
Begin
	Update [Order]
	Set OrderUnitPrice = @OrderUnitPrice
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@DateOfOrder is not null)
Begin
	Update [Order]
	Set DateOfOrder = @DateOfOrder
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@Driver is not null)
Begin

	if(Not exists (select* from Employee where [Name] = @Driver and [Position] = 'Driver'))
	begin
		Raiserror('new driver is not an employee or is not a driver', 13, 2)
		rollback transaction
		return 2
	end

	declare @DriverSSN char(18)
	select @DriverSSN = SSN from Employee where [Name] = @Driver

	Update [Order]
	Set DriverSSN = @DriverSSN
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@SellTo is not null)
Begin

	if(not exists (select* from Company where [Name] = @SellTo))
	begin
		Raiserror('new company does not exist', 13, 3)
		rollback transaction
		return 3
	end

	declare @CompanyID int
	select @CompanyID = ID from Company where [Name] = @SellTo

	Update [Order]
	Set CompanyID = @CompanyID
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

--maybe we need to check whether the arrivedeadline is later than the date of order, not sure how to do it
If(@ArriveDeadline is not null)
Begin
	Update [Order]
	Set ArriveDeadline = @ArriveDeadline
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End

If(@DateArrived is not null)
Begin
	Update [Order]
	Set DateArrived = @DateArrived
	Where ID = @ID
	IF(@@ERROR <>0 ) set @errorOccured = 1
End


IF(@errorOccured = 1)
Begin
	RollBack Transaction
	Print 'Update Failed'
End
Else
Begin
	Commit Transaction
	Print'Update Succeed'
	return 0;
End

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 5/20/2022 4:58:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Sample Usage:
--Declare @return_value int
--EXEC @return_value = AddProduct 
--	@Name = haha,
--	@UnitCost = 3.33
--Select 'Returned value' = @return_value


CREATE Procedure [dbo].[UpdateProduct](
	@Name varchar(50),
	@BuyingCost money = null,
	@SellPrice money = null,
	@Description varchar(300) = null,
	@StockQuantity int = null,
	@MadeBy varchar(60)
)
AS

Begin

DECLARE @companyID int = null;
DECLARE @productID int = null;

Select @productID = ID From Product Where [Name] = @Name
Select @companyID = ID From Company Where [Name] = @MadeBy

IF(@Name is null)
Begin
	Raiserror('Product Name can not be null', 12, 1)
	Return 1
End

IF(@MadeBy is null)
Begin
	Raiserror('Company name can not be null', 12, 10)
	Return 10
End

If(@BuyingCost <0)
Begin
	Raiserror('BuyingCost can not be negative', 12, 2)
	Return 2
End

If(@SellPrice <0)
Begin
	Raiserror('SellPrice can not be negative', 12, 3)
	Return 3
End

If(@StockQuantity <0)
Begin
	Raiserror('StockQuantity can not be negative', 12, 4)
	Return 4
End

If(@BuyingCost is not null)
Begin
	Update Made
	Set Cost = @BuyingCost
	WHERE ([CompanyID]=@companyID AND [ProductID]=@productID)
End

If(@SellPrice is not null)
Begin
	Update Product
	Set SellPrice = @SellPrice
	Where [Name] = @Name
End

If(@Description is not null)
Begin
	Update Product
	Set [Description] = @Description
	Where [Name] = @Name
End

If(@StockQuantity is not null)
Begin
	Update Product
	Set StockQuantity = @StockQuantity
	Where [Name] = @Name
End

Return 0
Print'Update Succeed'
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CompanyMainView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CompanyMainView'
GO
USE [master]
GO
ALTER DATABASE [MaterialStoreC] SET  READ_WRITE 
GO
