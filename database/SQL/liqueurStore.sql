USE [master]
GO
/****** Object:  Database [CostaRicaLS]    Script Date: 17/11/2021 10:48:04 ******/
CREATE DATABASE [CostaRicaLS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CostaRicaLS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CostaRicaLS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CostaRicaLS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CostaRicaLS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CostaRicaLS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CostaRicaLS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CostaRicaLS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CostaRicaLS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CostaRicaLS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CostaRicaLS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CostaRicaLS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CostaRicaLS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CostaRicaLS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CostaRicaLS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CostaRicaLS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CostaRicaLS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CostaRicaLS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CostaRicaLS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CostaRicaLS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CostaRicaLS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CostaRicaLS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CostaRicaLS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CostaRicaLS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CostaRicaLS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CostaRicaLS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CostaRicaLS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CostaRicaLS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CostaRicaLS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CostaRicaLS] SET RECOVERY FULL 
GO
ALTER DATABASE [CostaRicaLS] SET  MULTI_USER 
GO
ALTER DATABASE [CostaRicaLS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CostaRicaLS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CostaRicaLS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CostaRicaLS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CostaRicaLS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CostaRicaLS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CostaRicaLS', N'ON'
GO
ALTER DATABASE [CostaRicaLS] SET QUERY_STORE = OFF
GO
USE [CostaRicaLS]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdUserType] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [geography] NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerType]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePA]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[Address] [geography] NOT NULL,
	[Photo] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_EmployeePA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePerSubsidiary]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePerSubsidiary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSubsidiary] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
 CONSTRAINT [PK_EmployeePerSubsidiary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmployeeType] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[Photo] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Job] [varchar](50) NOT NULL,
	[Salary] [money] NOT NULL,
 CONSTRAINT [PK_EmployeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errors]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errors](
	[SUSER_SNAME] [varchar](max) NULL,
	[ERROR_NUMER] [int] NULL,
	[ERROR_STATE] [int] NULL,
	[ERROR_SEVERITY] [int] NULL,
	[ERROR_LINE] [int] NULL,
	[ERROR_PROCEDURE] [varchar](max) NULL,
	[ERROR_MESSAGE] [varchar](max) NULL,
	[GETDATE] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GreatCombinations]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GreatCombinations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLiqueur] [int] NOT NULL,
	[IdFood] [int] NOT NULL,
 CONSTRAINT [PK_GreatCombinations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiqueurInfo]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiqueurInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLiqueur] [int] NOT NULL,
	[AgedType] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Origin] [varchar](50) NOT NULL,
	[Photo] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_LiqueurInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Liqueurs]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Liqueurs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Liqueurs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSubsidiary] [int] NOT NULL,
	[DayName] [varchar](50) NOT NULL,
	[BeginHour] [time](1) NOT NULL,
	[EndHour] [time](1) NOT NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippings]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTransaction] [int] NOT NULL,
	[OriginAddress] [geography] NOT NULL,
	[DestinyAddress] [geography] NOT NULL,
 CONSTRAINT [PK_Shippings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLiqueur] [int] NOT NULL,
	[IdSubsidiary] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subsidiary]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subsidiary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Address] [geography] NOT NULL,
 CONSTRAINT [PK_Subsidiary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxesReport]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxesReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTransaction] [int] NOT NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_TaxesReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTransactionType] [int] NOT NULL,
	[IdSubsidiary] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdLiqueur] [int] NOT NULL,
	[IdPaymentType] [int] NOT NULL,
	[TranDate] [date] NOT NULL,
	[Discount] [float] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleType] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Keyword] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerType] FOREIGN KEY([IdUserType])
REFERENCES [dbo].[CustomerType] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CustomerType]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
ALTER TABLE [dbo].[EmployeePA]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePA_Employees] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmployeePA] CHECK CONSTRAINT [FK_EmployeePA_Employees]
GO
ALTER TABLE [dbo].[EmployeePerSubsidiary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePerSubsidiary_Employees] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmployeePerSubsidiary] CHECK CONSTRAINT [FK_EmployeePerSubsidiary_Employees]
GO
ALTER TABLE [dbo].[EmployeePerSubsidiary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePerSubsidiary_Subsidiary] FOREIGN KEY([IdSubsidiary])
REFERENCES [dbo].[Subsidiary] ([Id])
GO
ALTER TABLE [dbo].[EmployeePerSubsidiary] CHECK CONSTRAINT [FK_EmployeePerSubsidiary_Subsidiary]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmployeeType] FOREIGN KEY([IdEmployeeType])
REFERENCES [dbo].[EmployeeType] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmployeeType]
GO
ALTER TABLE [dbo].[GreatCombinations]  WITH CHECK ADD  CONSTRAINT [FK_GreatCombinations_Food] FOREIGN KEY([IdFood])
REFERENCES [dbo].[Food] ([Id])
GO
ALTER TABLE [dbo].[GreatCombinations] CHECK CONSTRAINT [FK_GreatCombinations_Food]
GO
ALTER TABLE [dbo].[GreatCombinations]  WITH CHECK ADD  CONSTRAINT [FK_GreatCombinations_Liqueurs] FOREIGN KEY([IdLiqueur])
REFERENCES [dbo].[Liqueurs] ([Id])
GO
ALTER TABLE [dbo].[GreatCombinations] CHECK CONSTRAINT [FK_GreatCombinations_Liqueurs]
GO
ALTER TABLE [dbo].[LiqueurInfo]  WITH CHECK ADD  CONSTRAINT [FK_LiqueurInfo_Liqueurs] FOREIGN KEY([IdLiqueur])
REFERENCES [dbo].[Liqueurs] ([Id])
GO
ALTER TABLE [dbo].[LiqueurInfo] CHECK CONSTRAINT [FK_LiqueurInfo_Liqueurs]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Subsidiary] FOREIGN KEY([IdSubsidiary])
REFERENCES [dbo].[Subsidiary] ([Id])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Subsidiary]
GO
ALTER TABLE [dbo].[Shippings]  WITH CHECK ADD  CONSTRAINT [FK_Shippings_Transactions] FOREIGN KEY([IdTransaction])
REFERENCES [dbo].[Transactions] ([Id])
GO
ALTER TABLE [dbo].[Shippings] CHECK CONSTRAINT [FK_Shippings_Transactions]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Liqueurs] FOREIGN KEY([IdLiqueur])
REFERENCES [dbo].[Liqueurs] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Liqueurs]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Subsidiary] FOREIGN KEY([IdSubsidiary])
REFERENCES [dbo].[Subsidiary] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Subsidiary]
GO
ALTER TABLE [dbo].[TaxesReport]  WITH CHECK ADD  CONSTRAINT [FK_TaxesReport_Transactions] FOREIGN KEY([IdTransaction])
REFERENCES [dbo].[Transactions] ([Id])
GO
ALTER TABLE [dbo].[TaxesReport] CHECK CONSTRAINT [FK_TaxesReport_Transactions]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Liqueurs] FOREIGN KEY([IdLiqueur])
REFERENCES [dbo].[Liqueurs] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Liqueurs]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_PaymentTypes] FOREIGN KEY([IdPaymentType])
REFERENCES [dbo].[PaymentTypes] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_PaymentTypes]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Subsidiary] FOREIGN KEY([IdSubsidiary])
REFERENCES [dbo].[Subsidiary] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Subsidiary]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransactionType] FOREIGN KEY([IdTransactionType])
REFERENCES [dbo].[TransactionType] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransactionType]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewProduct]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AddNewProduct]
	  @inAgedType VARCHAR(50)
	, @inTitle VARCHAR(50)
	, @inOrigin VARCHAR(50)
	, @inPrice MONEY
	, @inYears INT
	, @inAmount INT
	, @inSubsidiary VARCHAR(50)
	, @inUser VARCHAR(50)
	, @inPhoto VARBINARY(MAX)
	, @OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY
			SELECT 
				@OutResultCode=0 ;

			IF NOT EXISTS (SELECT * FROM dbo.Liqueurs AS L WHERE L.Title = @inTitle)
				BEGIN
					DECLARE @idSubsidiary INT =(SELECT S.Id FROM dbo.Subsidiary AS S WHERE S.Title = @inSubsidiary);
					DECLARE @idUser INT =(SELECT U.Id FROM dbo.Users AS U WHERE Username = @inUser);
					
					BEGIN TRANSACTION TSaveMov

						INSERT INTO dbo.Liqueurs(
								Title,
								Price,
								Enabled
							)	

							VALUES(
								@inTitle,
								@inPrice,
								1
							)

						INSERT INTO dbo.Stock
							(
								IdLiqueur,
								IdSubsidiary,
								Amount
							)
						VALUES
							(
								(SELECT MAX(Id) FROM dbo.Liqueurs),
								@idSubsidiary,
								@inAmount
							)


						INSERT INTO dbo.Transactions
							(
								IdTransactionType,
								IdSubsidiary,
								IdUser,
								IdLiqueur,
								IdPaymentType,
								TranDate,
								Discount,
								Price
							)
							VALUES
							(
								1,
								@idSubsidiary,
								@idUser,
								(SELECT MAX(Id) FROM dbo.Liqueurs),
								1,
								GETDATE(),
								0.0,
								0.0
							)
						INSERT INTO dbo.LiqueurInfo
							(
							IdLiqueur,
							AgedType,
							Age,
							Origin,
							Photo
							)

							VALUES
							(
							(SELECT MAX(Id) FROM dbo.Liqueurs),
							@inAgedType,
							@inYears,
							@inOrigin,
							@inPhoto
							)
					COMMIT TRANSACTION TSaveMov
				END

			ELSE
				SELECT
					@OutResultCode = 1 ;

			SELECT @OutResultCode;

		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;

				INSERT INTO dbo.Errors	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				SELECT @OutResultCode;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SignIn]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SignIn]
	@inUsername VARCHAR(50),
	@inPassword VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY
			IF EXISTS (SELECT * FROM dbo.Users AS CU WHERE CU.Username = @inUsername) AND
			@inPassword = (SELECT CU.Keyword FROM dbo.Users AS CU WHERE CU.Username = @inUsername) 
			BEGIN
				SELECT 
					@OutResultCode = 0
				
			END

		ELSE 
			BEGIN
				SELECT 
					@OutResultCode = 1
			END

		SELECT @OutResultCode AS OutResultCode ,(SELECT CU.RoleType FROM dbo.Users AS CU WHERE Username = @inUsername) ;
			

		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;

				INSERT INTO dbo.Errors	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_SignUp]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SignUp]
	@inName VARCHAR(50),
	@inEmail VARCHAR(50),
	@inPhone INT,
	@inAddress GEOGRAPHY,
	@inAge INT,
	@inUsername VARCHAR(50),
	@inPassword VARCHAR(50),
	@inRoleType VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY
			IF NOT EXISTS (SELECT * FROM dbo.Users AS CU WHERE CU.Username = @inUsername)
				BEGIN
					
					BEGIN TRANSACTION TSaveMov

						INSERT INTO dbo.Users
							(
								RoleType,
								Username,
								Keyword
							)
							VALUES
							(	
								@inRoleType,
								@inUsername,
								@inPassword
							)

						INSERT INTO dbo.Customers
							(
								IdUser,
								IdUserType,
								Title,
								Email,
								Phone,
								Address,
								Age
				
							)
							VALUES
							(
								(SELECT MAX(Id) FROM dbo.Users),
								1,
								@inName,
								@inEmail,
								@inPhone,
								@inAddress,
								@inAge
							)

						

					COMMIT TRANSACTION TSaveMov;
				END
			ELSE
				BEGIN
					SELECT
						@OutResultCode = 1 ;
				END

			SELECT @OutResultCode AS OutResultCode;
			

		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
					ROLLBACK TRANSACTION TSaveMov;

				INSERT INTO dbo.Errors	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				SELECT @OutResultCode;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePrice]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdatePrice]
	@inProductName VARCHAR(50),
	@inNewPrice MONEY,
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			BEGIN TRANSACTION TSaveMov
				SELECT
					@OutResultCode = 1 ;

				DECLARE @idLiqueur INT = (SELECT L.Id FROM dbo.Liqueurs AS L WHERE L.Title = @inProductName);
		
				UPDATE dbo.Liqueurs
				SET
					Price = @inNewPrice,
					@outResultCode = 0
				WHERE Id = @idLiqueur;

				SELECT 
					@OutResultCode AS OutResultCode

			COMMIT TRANSACTION TSaveMov

		END TRY
		BEGIN CATCH

				IF @@Trancount>0 
                    ROLLBACK TRANSACTION TSaveMov;

				INSERT INTO dbo.Errors	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewPrice]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ViewPrice]
	@inProductName VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		DECLARE @idLiqueur INT = (SELECT L.Id FROM dbo.Liqueurs AS L WHERE L.Title = @inProductName);
		
		SELECT 
			L.Title AS Title,
			L.Price AS Price,
			@OutResultCode AS OutResultCode

		FROM dbo.Liqueurs AS L
		WHERE L.Id = @idLiqueur
		AND L.Enabled = 1;

		END TRY
		BEGIN CATCH

				INSERT INTO dbo.Errors	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewProduct]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ViewProduct]
	@inProductName VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		DECLARE @idLiqueur INT = (SELECT L.Id FROM dbo.Liqueurs AS L WHERE L.Title = @inProductName);

		SELECT
			L.Title,
			L.Price,
			LI.AgedType,
			LI.Age,
			LI.Origin,
			LI.Photo,
			F.Title,
			@OutResultCode
		FROM dbo.Food AS F
		INNER JOIN dbo.GreatCombinations AS GC
		ON GC.IdFood = F.Id
		INNER JOIN dbo.Liqueurs AS L
		ON L.Id  = GC.IdLiqueur
		INNER JOIN dbo.LiqueurInfo AS LI
		ON LI.IdLiqueur = @idLiqueur
		WHERE L.Id = @idLiqueur;
		

		END TRY
		BEGIN CATCH

				INSERT INTO dbo.Errors	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				SELECT @OutResultCode;
				
		END CATCH;

		SET NOCOUNT OFF;

END


--EXEC sp_ViewProduct 'Jack Daniels Standard Edition',0
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewSchedule]    Script Date: 17/11/2021 10:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ViewSchedule]
	@inSubsidiaryName VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		DECLARE @idSubsidiary INT = (SELECT S.Id FROM dbo.Subsidiary AS S WHERE S.Title = @inSubsidiaryName);
		
		SELECT 
			S.Title AS Title,
			S.Address AS SubsidiaryAddress,
			(SELECT SC.Day FROM dbo.Schedule AS SC WHERE SC.Id = S.IdSchedule) AS ScheduleDay,
			(SELECT SC.BeginHour FROM dbo.Schedule AS SC WHERE SC.Id = S.IdSchedule) AS BeginHour,
			(SELECT SC.EndHour FROM dbo.Schedule AS SC WHERE SC.Id = S.IdSchedule) AS EndHour,
			@OutResultCode AS OutResultCode

		FROM dbo.Subsidiary AS S
		WHERE S.Id = @idSubsidiary


		END TRY
		BEGIN CATCH

				INSERT INTO dbo.Errors	VALUES (
					SUSER_SNAME(),
					ERROR_NUMBER(),
					ERROR_STATE(),
					ERROR_SEVERITY(),
					ERROR_LINE(),
					ERROR_PROCEDURE(),
					ERROR_MESSAGE(),
					GETDATE()
				);

				Set @OutResultCode=50005;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
USE [master]
GO
ALTER DATABASE [CostaRicaLS] SET  READ_WRITE 
GO
