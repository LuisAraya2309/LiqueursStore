
USE [ArgentinaLS]
GO
/****** Object:  StoredProcedure [dbo].[sp_SignIn]    Script Date: 22/11/2021 21:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_BestSold]
	@OutResultCode INT OUTPUT

AS
BEGIN
		SET NOCOUNT ON;
		BEGIN TRY
			SELECT @OutResultCode = 1;
			--A table for the final results
			DECLARE @result TABLE(Liqueur VARCHAR(50),Amount INT);

			--Colombia
			DECLARE @idTopLiqueurCol INT = (
				SELECT TOP(1)
					T.IdLiqueur
				FROM ColombiaLS.dbo.Transactions AS T
				GROUP BY t.IdLiqueur
				ORDER BY SUM(T.Price) DESC
			);
			DECLARE @topLiqueurCol VARCHAR(50) = (SELECT L.Title FROM ColombiaLS.dbo.Liqueurs AS L WHERE L.Id = @idTopLiqueurCol);
			DECLARE @saleAmountCol INT = ((SELECT COUNT(@idTopLiqueurCol) FROM ColombiaLS.dbo.Transactions AS T WHERE T.IdLiqueur = @idTopLiqueurCol)-3)/2;


			--Costa Rica
			DECLARE @idTopLiqueurCR INT = (
				SELECT TOP(1)
					T.IdLiqueur
				FROM CostaRicaLS.dbo.Transactions AS T
				GROUP BY t.IdLiqueur
				ORDER BY SUM(T.Price) DESC
			);
			DECLARE @topLiqueurCR VARCHAR(50) = (SELECT L.Title FROM CostaRicaLS.dbo.Liqueurs AS L WHERE L.Id = @idTopLiqueurCR);
			DECLARE @saleAmountCR INT = ((SELECT COUNT(@idTopLiqueurCR) FROM CostaRicaLS.dbo.Transactions AS T WHERE T.IdLiqueur = @idTopLiqueurCR)-3)/2;

			--Argentina
			DECLARE @idTopLiqueurAR INT = (
				SELECT TOP(1)
					T.IdLiqueur
				FROM ArgentinaLS.dbo.Transactions AS T
				GROUP BY t.IdLiqueur
				ORDER BY SUM(T.Price) DESC
			);
			DECLARE @topLiqueurAR VARCHAR(50) = (SELECT L.Title FROM ArgentinaLS.dbo.Liqueurs AS L WHERE L.Id = @idTopLiqueurAR);
			DECLARE @saleAmountAR INT = ((SELECT COUNT(@idTopLiqueurAR) FROM ArgentinaLS.dbo.Transactions AS T WHERE T.IdLiqueur = @idTopLiqueurAR)-3)/2;

			INSERT INTO @result
				(
					Liqueur,
					Amount
				)
				VALUES

				(
					@topLiqueurCol,
					@saleAmountCol
				),
				(
					@topLiqueurCR,
					@saleAmountCR
				),
				(
					@topLiqueurAR,
					@saleAmountAR
				);

			SELECT TOP(1)
				R.Liqueur
			FROM @result AS R
			ORDER BY R.Amount  DESC
			

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

