USE [CostaRicaLS]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewProduct]    Script Date: 17/11/2021 16:42:43 ******/
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
				DECLARE @addressCustomer GEOGRAPHY = (SELECT C.Address FROM dbo.Customers AS C WHERE C.IdUser = @idUser);
				DECLARE @subsidiariesDistance TABLE(Title VARCHAR(50));
				INSERT INTO @subsidiariesDistance
					SELECT
						
				DECLARE @idx INT =(SELECT COUNT(*) Subsidiary);
				DECLARE @minorDistance FLOAT = 0.0;
				WHILE @idx > 0
					BEGIN
						
					END
			
					
			BEGIN TRANSACTION TSaveMov

				
				
			COMMIT TRANSACTION TSaveMov
				


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
