
USE [CostaRicaLS]

--Insertar datos
--Insertar Tipos de Transaccion

INSERT INTO dbo.TransactionType
	VALUES
	(
		'Sales'
	)

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

INSERT INTO dbo.PaymentTypes
	VALUES
	(
		'Cash'
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

DECLARE @limonDireccion GEOGRAPHY;
SET @limonDireccion = GEOGRAPHY::STGeomFromText('POINT(9.984966886534004 -83.06093068202011)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Limón',
		@limonDireccion
	)

DECLARE @alajuelaDireccion GEOGRAPHY;
SET @alajuelaDireccion = GEOGRAPHY::STGeomFromText('POINT(10.016929741729518 -84.21399376233771)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Alajuela',
		@alajuelaDireccion
	)



--INSERTAR LICORES--------------------------------------------------------------------------------------------------------
--Insertar productos en Cartago
DECLARE @imagenProducto VARBINARY(MAX);-- = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
--Baileys
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 20 años','Baileys','Escocia','17',20,30,'Cartago' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maduracion a 20 años','Baileys','Escocia','17',20,35,'Limón' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maduracion a 20 años','Baileys','Escocia','17',20,42,'Alajuela' ,'luis2309',@imagenProducto,0

--Jack Daniels
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\jackDaniels.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 10 años','Jack Daniels Standard Edition','Estados Unidos','25',10,50,'Cartago' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maduracion a 10 años','Jack Daniels Standard Edition','Estados Unidos','25',10,40,'Limón' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maduracion a 10 años','Jack Daniels Standard Edition','Estados Unidos','25',10,60,'Alajuela' ,'luis2309',@imagenProducto,0


--Bacardi
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\bacardi.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','10',5,120,'Cartago' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','10',5,102,'Limón' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','10',5,140,'Alajuela' ,'luis2309',@imagenProducto,0

--Cortez
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\cortez.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,200,'Cartago' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,150,'Limón' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,50,'Alajuela' ,'luis2309',@imagenProducto,0

--DonJulio
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\donJulio.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 30 años','Don Julio','México','150',30,20,'Cartago' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maduracion a 30 años','Don Julio','México','150',30,17,'Limón' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maduracion a 30 años','Don Julio','México','150',30,12,'Alajuela' ,'luis2309',@imagenProducto,0



--Johnnie Walker
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\johnnieWBL.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,50,'Cartago' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,60,'Limón' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,30,'Alajuela' ,'luis2309',@imagenProducto,0

--Smirnoff Vodka
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\Sebastian\Desktop\TEC\IVSemestre\BasesDatosII\Proyecto\LiqueursStore\static\images\smirnoffV.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Aromatizado con canela','Smirnoff Vodka','Rusia','18',3,50,'Cartago' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Aromatizado con canela','Smirnoff Vodka','Rusia','18',3,60,'Limón' ,'luis2309',@imagenProducto,0
EXEC sp_AddNewProduct 'Aromatizado con canela','Smirnoff Vodka','Rusia','18',3,200,'Alajuela' ,'luis2309',@imagenProducto,0


/*
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\smirnoffV.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\johnnieWBL.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\donJulio.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\cortez.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\bacardi.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\jackDaniels.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg'
*/



-----------------------------------------------------------------------------------------------------------------------------------------
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


INSERT INTO dbo.GreatCombinations --Bacardi
	VALUES
	(
	3,
	9
	)

INSERT INTO dbo.GreatCombinations --Bacardi
	VALUES
	(
	3,
	5
	)

INSERT INTO dbo.GreatCombinations --Cortez
	VALUES
	(
	4,
	1
	)

INSERT INTO dbo.GreatCombinations --Cortez
	VALUES
	(
	4,
	8
	)

INSERT INTO dbo.GreatCombinations --Don Julio
	VALUES
	(
	5,
	3
	)

INSERT INTO dbo.GreatCombinations --Don Julio
	VALUES
	(
	5,
	4
	)

INSERT INTO dbo.GreatCombinations --Johnnie Walker
	VALUES
	(
	6,
	10
	)

INSERT INTO dbo.GreatCombinations --Johnnie Walker
	VALUES
	(
	6,
	3
	)

INSERT INTO dbo.GreatCombinations --Smirnoff
	VALUES
	(
	7,
	10
	)

INSERT INTO dbo.GreatCombinations --Smirnoff
	VALUES
	(
	7,
	2
	)


--Insertar transacciones

INSERT INTO dbo.Transactions
	VALUES
	(
	1,
	1,
	4,
	5,
	2,
	'2021-11-18',
	0.0,
	150
	)

INSERT INTO dbo.Transactions
	VALUES
	(
	1,
	1,
	4,
	5,
	1,
	'2021-03-11',
	0.0,
	150
	)

INSERT INTO dbo.Transactions
	VALUES
	(
	1,
	1,
	5,
	2,
	1,
	'2021-04-21',
	0.0,
	25
	)

INSERT INTO dbo.Transactions
	VALUES
	(
	1,
	1,
	4,
	6,
	1,
	'2021-09-7',
	0.0,
	40
	)

INSERT INTO dbo.Transactions
	VALUES
	(
	1,
	2,
	5,
	1,
	1,
	'2021-10-13',
	0.0,
	17
	)

INSERT INTO dbo.Transactions
	VALUES
	(
	1,
	3,
	5,
	1,
	2,
	'2021-10-13',
	0.0,
	17
	)

INSERT INTO dbo.Transactions
	VALUES
	(
	1,
	1,
	5,
	1,
	2,
	'2021-10-13',
	0.0,
	17
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