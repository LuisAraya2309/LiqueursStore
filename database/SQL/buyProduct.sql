USE [ArgentinaLS]
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewEmployee]    Script Date: 20/11/2021 11:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_buyProduct]
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

