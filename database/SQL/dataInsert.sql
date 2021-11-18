
USE [CostaRicaLS]

--Insertar datos
--Insertar Tipos de Transaccion
INSERT INTO dbo.TransactionType
	VALUES
	(
		'AddLiqueur'
	)

--Insertar tipos de Pagos
INSERT INTO dbo.PaymentTypes
	VALUES
	(
		'Add'
	)

--Insertar tipos de Cliente
INSERT INTO dbo.CustomerType
	VALUES(
	'Normal'
	)

INSERT INTO dbo.CustomerType
	VALUES(
	'VIP'
	)



--Insertar comidas
INSERT INTO dbo.Food
	VALUES(
		'Pasta'
	)
INSERT INTO dbo.Food
	VALUES(
		'Antipasto'
	)
INSERT INTO dbo.Food
	VALUES(
		'Alitas BBQ'
	)
INSERT INTO dbo.Food
	VALUES(
		'Tiramisu'
	)
INSERT INTO dbo.Food
	VALUES(
		'Costilla de Cerdo'
	)
INSERT INTO dbo.Food
	VALUES(
		'Pierna de cerdo al horno'
	)
INSERT INTO dbo.Food
	VALUES(
		'Patatas bravas'
	)
INSERT INTO dbo.Food
	VALUES(
		'Chifrijo'
	)
INSERT INTO dbo.Food
	VALUES(
		'Pescado frito'
	)
INSERT INTO dbo.Food
	VALUES(
		'Queso Manchego'
	)

--INSERTAR USUARIOS
EXEC sp_SignUp 'Luis Carlos Araya Mata','luistec2309@gmail.com',84105826,NULL,19,'luis2309','admin123','Administrator',0;
EXEC sp_SignUp 'Josue Gutierrez Piedra','josuegupi2309@gmail.com',87430908,NULL,20,'gupi08','flor420','Biller',0;
EXEC sp_SignUp 'Sebastian Diaz Obando','sebasDiaz@gmail.com',96397630,NULL,25,'sebas63','kmy45','Biller',0;
EXEC sp_SignUp 'Rolbin Mendez Brenes','rolbismb@gmail.com',49584109,NULL,30,'rolbis09','amoskz','Consultant',0;
EXEC sp_SignUp 'Jorge Bonilla Moreira','jorgeb@gmail.com',84950987,NULL,45,'jorge87','labias123','Consultant',0;
EXEC sp_SignUp 'Robert Araya Carrillo','roberta@gmail.com',23098495,NULL,60,'roberta95','explotar','Administrator',0;


--INSERTAR Subsidiarias
DECLARE @cartagoDireccion GEOGRAPHY;
SET @cartagoDireccion = GEOGRAPHY::STGeomFromText('POINT(9.862610500763806 -83.92381078210549)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Cartago',
		@cartagoDireccion
	)


--INSERTAR LICORES
--Insertar producto
DECLARE @imagenBaileys VARBINARY(MAX) = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 20 años','Baileys','Escocia','17000',20,30,'Cartago' ,'luis2309',@imagenBaileys,0

DECLARE @imagenJD VARBINARY(MAX) = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\jackDaniels.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 10 años','Jack Daniels Standard Edition','Estados Unidos','25000',10,50,'Cartago' ,'luis2309',@imagenJD,0

--INSERTAR COMBINACIONES DE COMIDA
INSERT INTO dbo.GreatCombinations  --Baileys
	VALUES
	(
	1,
	3
	)

INSERT INTO dbo.GreatCombinations --Baileys
	VALUES
	(
	1,
	2
	)


INSERT INTO dbo.GreatCombinations  --Jack Daniels
	VALUES
	(
	2,
	3
	)

INSERT INTO dbo.GreatCombinations --Jack Daniels
	VALUES
	(
	2,
	5
	)


















--BORRAR DATOS
--Taxes Report



/*
Borrar Transacciones
DELETE FROM Transactions
DBCC CHECKIDENT (Transactions,RESEED,0)
*/
/*
BORRAR LICORES
DELETE FROM Stock

DELETE FROM LiqueurInfo
DELETE FROM Liqueurs

DBCC CHECKIDENT (LiqueurInfo,RESEED,0)
DBCC CHECKIDENT (Liqueurs,RESEED,0)
DBCC CHECKIDENT (Stock,RESEED,0)


*/
--Borrar subsidiary
/*
	
	DELETE FROM Subsidiary;
	DBCC CHECKIDENT (Subsidiary, RESEED, 0)
*/

--Borrar tipos de Usuario
/*
DELETE FROM CustomerType
DBCC CHECKIDENT (CustomerType, RESEED, 0)
*/
--Borrar tipos de transacciones
/*
DELETE FROM TransactionType
DBCC CHECKIDENT (TransactionType, RESEED, 0)
*/
--Borrar Usuarios
/*
	DELETE FROM Customers
	DELETE FROM Users;
	DBCC CHECKIDENT (Customers, RESEED, 0)
	DBCC CHECKIDENT (Users, RESEED, 0)
*/



/*
BORRAR Combinaciones

DELETE FROM GreatCombinations
DBCC CHECKIDENT(GreatCombinations,RESEED,0)

--BORRAR Comidas
DELETE FROM Food
DBCC CHECKIDENT(Food,RESEED,0)

*/

/*
DELETE FROM Errors
DBCC CHECKIDENT(Errors,RESEED,0)

*/