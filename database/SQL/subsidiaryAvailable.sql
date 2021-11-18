USE [CostaRicaLS]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddNewProduct]    Script Date: 17/11/2021 16:42:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_SubsidiaryAvailable]
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
				
				SELECT * FROM @subsidiariesDistance;
						
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
					@nearestSubsidiary,
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


DECLARE @x GEOGRAPHY;
SET @x = GEOGRAPHY::STGeomFromText('POINT(10.007443708576737 -84.21213808239264)',4326)
UPDATE dbo.Customers
	SET
		Address = @x
	WHERE Phone = 84105826;

EXEC sp_SubsidiaryAvailable 'Baileys','luis2309',0

