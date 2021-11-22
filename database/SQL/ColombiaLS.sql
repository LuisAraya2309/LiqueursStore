USE [master]
GO
/****** Object:  Database [ColombiaLS]    Script Date: 21/11/2021 21:07:25 ******/
CREATE DATABASE [ColombiaLS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ColombiaLS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ColombiaLS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ColombiaLS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ColombiaLS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ColombiaLS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ColombiaLS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ColombiaLS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ColombiaLS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ColombiaLS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ColombiaLS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ColombiaLS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ColombiaLS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ColombiaLS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ColombiaLS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ColombiaLS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ColombiaLS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ColombiaLS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ColombiaLS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ColombiaLS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ColombiaLS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ColombiaLS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ColombiaLS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ColombiaLS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ColombiaLS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ColombiaLS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ColombiaLS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ColombiaLS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ColombiaLS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ColombiaLS] SET RECOVERY FULL 
GO
ALTER DATABASE [ColombiaLS] SET  MULTI_USER 
GO
ALTER DATABASE [ColombiaLS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ColombiaLS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ColombiaLS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ColombiaLS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ColombiaLS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ColombiaLS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ColombiaLS', N'ON'
GO
ALTER DATABASE [ColombiaLS] SET QUERY_STORE = OFF
GO
USE [ColombiaLS]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[CustomerType]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[EmployeePerSubsidiary]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Errors]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Food]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[GreatCombinations]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[LiqueurInfo]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Liqueurs]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Schedules]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Shippings]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Subsidiary]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[TaxesReport]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[TransactionType]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AddEmployee]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AddEmployee]
	@inSubsidiary VARCHAR(50),
	@inEmployeeType VARCHAR(50),
	@inTitle VARCHAR(50),
	@inEmail VARCHAR(50),
	@inPhone INT,
	@inAge INT,
	@inPhoto VARBINARY(MAX),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		DECLARE @idSubsidiary INT = (SELECT S.Id FROM dbo.Subsidiary AS S WHERE S.Title = @inSubsidiary);
		DECLARE @idEmployeeType INT = (SELECT ET.Id FROM dbo.EmployeeType AS ET WHERE ET.Job = @inEmployeeType);

		SELECT
			@OutResultCode=0 ;
		
		INSERT INTO dbo.Employees
			(
				IdEmployeeType,
				Title,
				Email,
				Phone,
				Age,
				Photo
			)
		VALUES
			(
				@idEmployeeType,
				@inTitle,
				@inEmail,
				@inPhone,
				@inAge,
				@inPhoto
			)

		

		INSERT INTO dbo.EmployeePerSubsidiary
			(
			IdSubsidiary,
			IdEmployee
			)
		VALUES
			(
			@idSubsidiary,
			(SELECT MAX(Id) FROM dbo.Employees)
			)

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
GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewProduct]    Script Date: 21/11/2021 21:07:25 ******/
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

            DECLARE @idSubsidiary INT =(SELECT S.Id FROM dbo.Subsidiary AS S WHERE S.Title = @inSubsidiary);
            DECLARE @idLiqueur INT = (SELECT L.Id FROM dbo.Liqueurs AS L WHERE L.Title = @inTitle);
            DECLARE @idUser INT =(SELECT U.Id FROM dbo.Users AS U WHERE Username = @inUser);
                    
            BEGIN TRANSACTION TSaveMov

                IF @idLiqueur IS NULL
                    BEGIN 
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
                    END

                ELSE
                    BEGIN

                        IF EXISTS(SELECT Id FROM dbo.Stock AS S WHERE S.IdLiqueur = @idLiqueur AND S.IdSubsidiary = @idSubsidiary)
                            BEGIN
                                UPDATE dbo.Stock
                                    SET
                                        Amount  = Amount + @inAmount
                                WHERE IdLiqueur = @idLiqueur AND IdSubsidiary = @idSubsidiary;
                            END
                        ELSE
                            BEGIN
                                INSERT INTO dbo.Stock
                                    VALUES(
                                        @idLiqueur,
                                        @idSubsidiary,
                                        @inAmount
                                    )
                            END
                        
                    END
                
                


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
                
            COMMIT TRANSACTION TSaveMov
                


            SELECT @OutResultCode;

        END TRY
        BEGIN CATCH

                IF @@Trancount>0 
                    ROLLBACK TRANSACTION TSaveMov;

                INSERT INTO dbo.Errors    VALUES (
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
/****** Object:  StoredProcedure [dbo].[sp_buyProduct]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_buyProduct]
	@inSubsidiary VARCHAR(50),
	@inUsername VARCHAR(50),
	@inPrice MONEY,
	@inDiscount MONEY,
	@inBiller VARCHAR(50),
	@inAddress VARCHAR(50),
	@inProductName VARCHAR(50),
	@inPaymentType VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode=0 ;
			
			DECLARE @idSubsidiary INT = (SELECT S.Id FROM dbo.Subsidiary AS S WHERE S.Title = @inSubsidiary);
			DECLARE @idUserCustomer INT = (SELECT U.Id FROM dbo.Users AS U WHERE U.Username = @inUsername);
			DECLARE @idCustomer INT = (SELECT C.Id FROM dbo.Customers AS C WHERE C.IdUser = @idUserCustomer);
			DECLARE @idUserBiller INT = (SELECT E.Id FROM dbo.Employees AS E WHERE E.Title = @inBiller);
			DECLARE @idPaymentType  INT;
			DECLARE @taxes MONEY = '0.0';
			DECLARE @shippingCosts MONEY = '0.0';
			DECLARE @totalPrice MONEY = '0.0';
			DECLARE @idLiqueur INT = (SELECT L.Id FROM dbo.Liqueurs AS L WHERE L.Title = @inProductName);
			

			--Calcular costo de envío si es un usuario Normal
			IF ((SELECT C.IdUserType FROM dbo.Customers AS C WHERE C.Id = @idCustomer) = 1) AND (@inAddress = 'Casa')
				BEGIN
					DECLARE @shippingDistance FLOAT;
					DECLARE @houseAddress GEOGRAPHY = (SELECT C.Address FROM dbo.Customers AS C WHERE C.Id = @idCustomer);
					SET @shippingDistance = (SELECT @houseAddress.STDistance((SELECT S.Address FROM dbo.Subsidiary AS S WHERE S.Id = @idSubsidiary))) / 1000;
					SET @shippingCosts = @shippingDistance * 0.5
				END
			ELSE IF @inAddress = 'Casa'  --Es un envio pero el cliente es VIp
				BEGIN
					SET @shippingCosts = '0.0'
				END

			--Aplicar descuento
			IF @inDiscount > '0.0'
				BEGIN
					SET @totalPrice = (@inPrice + @shippingCosts) - ((@inPrice + @shippingCosts)*0.10);
					SET @inDiscount = (@inPrice + @shippingCosts)*0.10;
				END
			ELSE IF @shippingCosts = '0.0'
				BEGIN
					SET @totalPrice = @inPrice - @inDiscount;
				END
			ELSE
				BEGIN
					SET @totalPrice = @inPrice;
				END
		
			

			IF @inPaymentType = 'Tarjeta de Crédito'
				BEGIN
					SET @idPaymentType = 2;
					SET @taxes = @totalPrice * 0.10;
				END
			ELSE
				BEGIN
					SET @idPaymentType = 3;
				END


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
					3,
					@idSubsidiary,
					@idUserCustomer,
					@idLiqueur,
					@idPaymentType,
					GETDATE(),
					@inDiscount,
					@totalPrice
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
					@idUserBiller,
					@idLiqueur,
					@idPaymentType,
					GETDATE(),
					@inDiscount,
					@totalPrice
				)


			IF @inAddress = 'Casa'
				BEGIN
					INSERT INTO dbo.Shippings
						(
							IdTransaction,
							OriginAddress,
							DestinyAddress
						)
					VALUES
						(	
							(SELECT MAX(Id) FROM dbo.Transactions),
							(SELECT S.Address FROM dbo.Subsidiary AS S WHERE S.Id = @idSubsidiary),
							@houseAddress
						)
				END

			IF @idPaymentType = 2
				BEGIN
					INSERT INTO dbo.TaxesReport
						(
							IdTransaction,
							Amount
						)
						VALUES
						(
							(SELECT MAX(Id) FROM dbo.Transactions),
							@taxes
						)
				END

			IF (SELECT COUNT(Id) FROM dbo.Transactions AS T WHERE T.IdUser = @idUserCustomer 
				AND 
				DATEPART(MONTH,T.TranDate) = DATEPART(MONTH,GETDATE()) ) >= 5 
				BEGIN
					UPDATE dbo.Customers
						SET
							IdUserType = 2
					WHERE Id = @idCustomer;
				END


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

GO
/****** Object:  StoredProcedure [dbo].[sp_CustomerDiscount]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_CustomerDiscount]
	@inUsername VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode=0 ;


			DECLARE @discountLevel MONEY = '750';
			DECLARE @idUser INT = (SELECT U.Id FROM dbo.Users AS U WHERE U.Username =@inUsername);
			DECLARE @idCustomer INT = (SELECT C.Id FROM dbo.Customers AS C WHERE C.IdUser = @idUser);
			DECLARE @actualMonth INT = DATEPART(MONTH,GETDATE());
			DECLARE @amountOfTrans MONEY;
			SET @amountOfTrans = (
				SELECT SUM(T.Price)
					FROM dbo.Transactions AS T
				WHERE T.IdUser = @idUser AND (DATEPART(MONTH,T.TranDate) = @actualMonth)
			);
			IF @amountOfTrans > @discountLevel
				SELECT 'True'
			ELSE
				SELECT 'False'



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
				select @OutResultCode;
				
		END CATCH;

		SET NOCOUNT OFF;

END
GO
/****** Object:  StoredProcedure [dbo].[sp_EmployeesPerSubsidiary]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_EmployeesPerSubsidiary]
	@inSubsidiary VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY
			DECLARE @idSubsidiary INT = (SELECT S.Id FROM dbo.Subsidiary AS S WHERE S.Title = @inSubsidiary );
			SELECT 
				E.Title
			FROM dbo.Employees AS E
			INNER JOIN dbo.EmployeePerSubsidiary AS ES
			ON ES.IdEmployee = E.Id
			WHERE ES.IdSubsidiary = @idSubsidiary;

		

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
GO
/****** Object:  StoredProcedure [dbo].[sp_getDates]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_getDates]
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode = 0 ;

			SELECT
				T.TranDate
			FROM dbo.Transactions AS T
			WHERE T.IdTransactionType = 1

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


GO
/****** Object:  StoredProcedure [dbo].[sp_getPaymentType]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_getPaymentType]
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode = 0 ;

			SELECT
				PT.Title
			FROM dbo.PaymentTypes AS PT

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


GO
/****** Object:  StoredProcedure [dbo].[sp_ProductStock]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ProductStock]
	@inTitle VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode=0 ;
			
			DECLARE @idLiqueur INT = (SELECT L.Id FROM dbo.Liqueurs AS L WHERE L.Title = @inTitle);
			IF @idLiqueur IS NOT NULL
				BEGIN
					SELECT 
						S.Amount,
						Sub.Title,
						@OutResultCode
					FROM dbo.Stock AS S
					INNER JOIN dbo.Subsidiary AS Sub
					ON S.IdSubsidiary = Sub.Id
					WHERE S.IdLiqueur = @idLiqueur;
				END
			ELSE
				BEGIN
					SET @OutResultCode = 1;
					SELECT @OutResultCode;
				END


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
GO
/****** Object:  StoredProcedure [dbo].[sp_productXSubsidiary]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_productXSubsidiary]
	@inIdSubsidiary INT,
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode=0 ;

			SELECT
				(SELECT L.Title FROM dbo.Liqueurs AS L WHERE L.Id =  S.IdLiqueur)
			FROM dbo.Stock AS S
			WHERE S.IdSubsidiary = @inIdSubsidiary;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_salesXCountry]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_salesXCountry]
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		SELECT
			(SELECT S.Title FROM dbo.Subsidiary AS S WHERE S.Id = T.IdSubsidiary) AS SubsidiaryTitle,
			T.TranDate AS TranDate,
			(SELECT U.Username FROM dbo.Users AS U WHERE U.Id = T.IdUser) AS username,
			(SELECT L.Title FROM dbo.Liqueurs AS L WHERE L.Id = T.IdLiqueur) AS LiqueurTitle,
			(SELECT PT.Title FROM dbo.PaymentTypes AS PT WHERE PT.Id = T.IdPaymentType) AS PaymentType,
			T.Discount AS Discount,
			T.Price AS Price
			

		FROM dbo.Transactions AS T
		WHERE 
			T.IdTransactionType = 1;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_salesXDate]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_salesXDate]
	@inDate DATE,
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		SELECT
			(SELECT S.Title FROM dbo.Subsidiary AS S WHERE S.Id = T.IdSubsidiary) AS SubsidiaryTitle,
			T.TranDate AS TranDate,
			(SELECT U.Username FROM dbo.Users AS U WHERE U.Id = T.IdUser) AS username,
			(SELECT L.Title FROM dbo.Liqueurs AS L WHERE L.Id = T.IdLiqueur) AS LiqueurTitle,
			(SELECT PT.Title FROM dbo.PaymentTypes AS PT WHERE PT.Id = T.IdPaymentType) AS PaymentType,
			T.Discount AS Discount,
			T.Price AS Price
			

		FROM dbo.Transactions AS T
		WHERE 
			T.IdTransactionType = 1 AND
			T.TranDate = @inDate;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_salesXPaymentType]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_salesXPaymentType]
	@inIdPaymentType INT,
	@OutResultCode INT OUTPUT
																									
AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		SELECT
			(SELECT S.Title FROM dbo.Subsidiary AS S WHERE S.Id = T.IdSubsidiary) AS SubsidiaryTitle,
			T.TranDate AS TranDate,
			(SELECT U.Username FROM dbo.Users AS U WHERE U.Id = T.IdUser) AS username,
			(SELECT L.Title FROM dbo.Liqueurs AS L WHERE L.Id = T.IdLiqueur) AS LiqueurTitle,
			T.Discount AS Discount,
			T.Price AS Price
			

		FROM dbo.Transactions AS T
		WHERE 
			T.IdTransactionType = 1 AND
			T.IdPaymentType = @inIdPaymentType;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_salesXSubsidiary]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_salesXSubsidiary]
	@inIdSubsidiary INT,
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		SELECT
			T.TranDate AS TranDate,
			(SELECT U.Username FROM dbo.Users AS U WHERE U.Id = T.IdUser) AS username,
			(SELECT L.Title FROM dbo.Liqueurs AS L WHERE L.Id = T.IdLiqueur) AS LiqueurTitle,
			(SELECT PT.Title FROM dbo.PaymentTypes AS PT WHERE PT.Id = T.IdPaymentType) AS PaymentType,
			T.Discount AS Discount,
			T.Price AS Price
			

		FROM dbo.Transactions AS T
		WHERE 
			T.IdSubsidiary = @inIdSubsidiary AND
			T.IdTransactionType = 1;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_salesXSubsidiaryXProduct]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_salesXSubsidiaryXProduct]
	@inIdProduct INT,
	@inIdSubsidiary INT,
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		SELECT
			T.TranDate AS TranDate,
			(SELECT U.Username FROM dbo.Users AS U WHERE U.Id = T.IdUser) AS username,
			(SELECT PT.Title FROM dbo.PaymentTypes AS PT WHERE PT.Id = T.IdPaymentType) AS PaymentType,
			T.Discount AS Discount,
			T.Price AS Price
			

		FROM dbo.Transactions AS T
		WHERE 
			T.IdLiqueur = @inIdProduct AND 
			T.IdSubsidiary = @inIdSubsidiary AND
			T.IdTransactionType = 1;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_SignIn]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SignUp]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SubsidiaryAvailable]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SubsidiaryAvailable]
	@inTitle VARCHAR(50),
	@inUsername VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY
			SELECT 
				@OutResultCode=0 ;
				DECLARE @idUser INT = (SELECT U.Id FROM dbo.Users AS U WHERE U.Username = @inUsername );
				DECLARE @idLiqueur INT = (SELECT L.Id FROM dbo.Liqueurs AS L WHERE L.Title = @inTitle);
				DECLARE @addressCustomer GEOGRAPHY = (SELECT C.Address FROM dbo.Customers AS C WHERE C.IdUser = @idUser);
				DECLARE @subsidiariesDistance TABLE(Id INT IDENTITY (1,1),Title VARCHAR(50),Distance FLOAT NULL);
				INSERT INTO @subsidiariesDistance
					SELECT
						S.Title,
						NULL
					FROM dbo.Subsidiary AS S
				
						
				DECLARE @idx INT = (SELECT COUNT(*) FROM @subsidiariesDistance);
				DECLARE @minorDistance FLOAT = 0.0;
				DECLARE @nearestSubsidiary VARCHAR(50);
				WHILE @idx > 0
					BEGIN
						DECLARE @auxSubsidiary VARCHAR(50) = (SELECT Title FROM @subsidiariesDistance AS T WHERE T.Id = @idx);
						DECLARE @subsidiaryDistance GEOGRAPHY = (SELECT S.Address FROM dbo.Subsidiary AS S WHERE S.Title = @auxSubsidiary);
						SET @minorDistance = (SELECT @addressCustomer.STDistance(@subsidiaryDistance));
						UPDATE @subsidiariesDistance
							SET Distance = @minorDistance
						WHERE Title = @auxSubsidiary;
						
						SELECT @idx = @idx - 1;
					END

				SELECT @minorDistance = (SELECT MIN(Distance) FROM @subsidiariesDistance);

				SELECT @nearestSubsidiary = (
						SELECT 
							Title
						FROM @subsidiariesDistance
						WHERE Distance = @minorDistance
				);


				SELECT DISTINCT
					S.Title,
					@nearestSubsidiary AS Nearest,
					@minorDistance,
					@OutResultCode
				FROM dbo.Subsidiary AS S
				INNER JOIN Stock AS ST
				ON ST.IdLiqueur = @idLiqueur
				WHERE Amount>0;


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
GO
/****** Object:  StoredProcedure [dbo].[sp_subsidiaryXCountry]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_subsidiaryXCountry]
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode=0 ;

			SELECT
				S.Title
			FROM dbo.Subsidiary AS S;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePrice]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ViewEmployee]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ViewEmployee]
	@inEmployeeName VARCHAR(50),
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

			SELECT
				@OutResultCode=0 ;

			DECLARE @idEmployee INT = (SELECT E.Id FROM dbo.Employees AS E WHERE E.Title = @inEmployeeName);
			DECLARE @idEmployeeType INT = (SELECT E.IdEmployeeType FROM dbo.Employees AS E WHERE E.Id = @idEmployee);
			DECLARE @job VARCHAR(50) = (SELECT ET.Job FROM dbo.EmployeeType AS ET WHERE ET.Id = @idEmployeeType);
			DECLARE @salary MONEY = (SELECT ET.Salary FROM dbo.EmployeeType AS ET WHERE ET.Job = @job);
			SELECT *,
				   @job AS Job,
				   @salary AS Salary

			FROM dbo.Employees AS E
			WHERE E.Title = @inEmployeeName;

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
/****** Object:  StoredProcedure [dbo].[sp_ViewEmployeesPerSubsidiary]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ViewEmployeesPerSubsidiary]
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
				@inSubsidiaryName AS SubsidiaryTitle,
				(SELECT E.Title FROM dbo.Employees AS E WHERE E.Id = EPS.IdEmployee) AS EmployeeName,
				@OutResultCode AS OutResultCode

			FROM dbo.EmployeePerSubsidiary AS EPS
			WHERE EPS.IdSubsidiary = @idSubsidiary;

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
/****** Object:  StoredProcedure [dbo].[sp_ViewPaymentType]    Script Date: 21/11/2021 21:07:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_ViewPaymentType]
	@OutResultCode INT OUTPUT
																									
AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY

		SELECT
			@OutResultCode=0 ;

		SELECT
			PT.Id
			
		FROM dbo.PaymentTypes AS PT;

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


GO
/****** Object:  StoredProcedure [dbo].[sp_ViewPrice]    Script Date: 21/11/2021 21:07:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ViewProduct]    Script Date: 21/11/2021 21:07:25 ******/
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

                INSERT INTO dbo.Errors    VALUES (
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
/****** Object:  StoredProcedure [dbo].[sp_ViewSchedule]    Script Date: 21/11/2021 21:07:25 ******/
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
				@inSubsidiaryName AS Title,
				SC.DayName AS ScheduleDay,
				SC.BeginHour AS BeginHour,
				SC.EndHour AS EndHour,
				@OutResultCode AS OutResultCode

			FROM dbo.Schedules AS SC
			WHERE SC.IdSubsidiary = @idSubsidiary;

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
ALTER DATABASE [ColombiaLS] SET  READ_WRITE 
GO
