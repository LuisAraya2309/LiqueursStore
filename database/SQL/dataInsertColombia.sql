
USE ColombiaLS

--Insertar datos
--Insertar Tipos de Transaccion  #################################

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

--Insertar tipos de Pagos     ####################################
INSERT INTO dbo.PaymentTypes
	VALUES
	(
		'Add'
	)

INSERT INTO dbo.PaymentTypes
	VALUES
	(
		'Credit Card'
	)

INSERT INTO dbo.PaymentTypes
	VALUES
	(
		'Cash'
	)

--Insertar tipos de Cliente   ####################################
INSERT INTO dbo.CustomerType
	VALUES(
	'Normal'
	)

INSERT INTO dbo.CustomerType  
	VALUES(
	'VIP'
	)


--Insertar tipos de Empleado 

INSERT INTO dbo.EmployeeType
	VALUES(
		'Cajero',
		'2200'
	),
	('Miscelaneo','1250'),
	('Gerente','3250'),
	('Auxiliar','1200');








--Insertar comidas
INSERT INTO dbo.Food
	VALUES(
		'Anchoas'
	)
INSERT INTO dbo.Food
	VALUES(
		'Sardina anchoada'
	)
INSERT INTO dbo.Food
	VALUES(
		'Ajiaco'
	)
INSERT INTO dbo.Food
	VALUES(
		'Pie de manzana'
	)
INSERT INTO dbo.Food
	VALUES(
		'Costilla de Cerdo'
	)
INSERT INTO dbo.Food
	VALUES(
		'Bandeja paisa'
	)
INSERT INTO dbo.Food
	VALUES(
		'Mote de queso'
	)
INSERT INTO dbo.Food
	VALUES(
		'Chifrijo'
	)
INSERT INTO dbo.Food
	VALUES(
		'Sancocho'
	)
INSERT INTO dbo.Food
	VALUES(
		'Queso Manchego'
	)

--INSERTAR USUARIOS
--Crear direcciones para los usuarios

EXEC sp_SignUp 'Luciana Garcia Sanchez','lucianags9@gmail.com',98436712,'POINT(4.449182316702537 -75.20707212197306)',19,'luciGa','Gs01182','Administrator',0;


EXEC sp_SignUp 'Salome Lopez Gomez','salomelg@gmail.com',98674365,'POINT(6.183666734281075 -75.61488103166667)',20,'saloLo','salo543','Biller',0;


EXEC sp_SignUp 'Santiago Ramirez Rodriguez','santiagorr@gmail.com',12984323,'POINT(7.078635959383407 -73.08668470228557)',25,'santiRo','santi889','Biller',0;


EXEC sp_SignUp 'Antonella Mendez Brenes','antonellamb@gmail.com',98672312,'POINT(3.4301215558889235 -76.48899146469735)',30,'lelaMen','lelaMen654','Consultant',0;


EXEC sp_SignUp 'Samuel Sanchez Lopez','samuelsl@gmail.com',98674356,'POINT(2.4362966890611655 -76.57640250800043)',45,'SamuSa','Samu123','Consultant',0;


EXEC sp_SignUp 'Emiliano Martinez Garcia','emilianomg@gmail.com',98678721,'POINT(5.5199395560117726 -73.34112545341848)',60,'EmiMart','Emi423','Administrator',0;


--INSERTAR Subsidiarias
DECLARE @cartagoDireccion GEOGRAPHY;
SET @cartagoDireccion = GEOGRAPHY::STGeomFromText('POINT(4.6312447469652644 -74.17856027052046)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Bogota',
		@cartagoDireccion
	)

DECLARE @limonDireccion GEOGRAPHY;
SET @limonDireccion = GEOGRAPHY::STGeomFromText('POINT(6.2001126930143995 -75.56300072723407)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Medellin',
		@limonDireccion
	)

DECLARE @alajuelaDireccion GEOGRAPHY;
SET @alajuelaDireccion = GEOGRAPHY::STGeomFromText('POINT(3.4119499280826635 -76.54066950972903)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Cali',
		@alajuelaDireccion
	)


--INSERTAR HORARIOS
--Cartago
INSERT INTO dbo.Schedules
	(
		IdSubsidiary,
		DayName,
		BeginHour,
		EndHour
	)
	VALUES
	(
		1,
		'Lunes',
		'7:00',
		'14:00'
	),
	(
		1,
		'Martes',
		'10:00',
		'20:00'
	),
	(
		1,
		'Miércoles',
		'10:00',
		'20:00'
	),
	(
		1,
		'Jueves',
		'10:00',
		'20:00'
	),
	(
		1,
		'Viernes',
		'10:00',
		'23:00'
	),
	(
		1,
		'Sábado',
		'15:00',
		'23:00'
	),
	(
		1,
		'Domingo',
		'15:00',
		'23:00'
	);


INSERT INTO dbo.Schedules
	(
		IdSubsidiary,
		DayName,
		BeginHour,
		EndHour
	)
	VALUES
		(
		2,
		'Lunes',
		'7:00',
		'14:00'
	),
	(
		2,
		'Martes',
		'10:00',
		'20:00'
	),
	(
		2,
		'Miércoles',
		'10:00',
		'20:00'
	),
	(
		2,
		'Jueves',
		'10:00',
		'20:00'
	),
	(
		2,
		'Viernes',
		'10:00',
		'23:00'
	),
	(
		2,
		'Sábado',
		'15:00',
		'23:00'
	),
	(
		2,
		'Domingo',
		'15:00',
		'23:00'
	);


INSERT INTO dbo.Schedules
	(
		IdSubsidiary,
		DayName,
		BeginHour,
		EndHour
	)
	VALUES
		(
		3,
		'Lunes',
		'7:00',
		'14:00'
	),
	(
		3,
		'Martes',
		'10:00',
		'20:00'
	),
	(
		3,
		'Miércoles',
		'10:00',
		'20:00'
	),
	(
		3,
		'Jueves',
		'10:00',
		'20:00'
	),
	(
		3,
		'Viernes',
		'10:00',
		'23:00'
	),
	(
		3,
		'Sábado',
		'15:00',
		'23:00'
	),
	(
		3,
		'Domingo',
		'15:00',
		'23:00'
	);
--INSERTAR EMPLEADOS---------------------------------------------------------------------------------------------------
--Insertar empleados
DECLARE @imagenEmpleado VARBINARY(MAX);

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\mariana.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Bogota','Gerente','Mariana Gonzales Tenorio','marianagt@gmail.com',98546712,32,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\jeronimo.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Medellin','Gerente','Jeronimo Lopez Mata','jeronimolm@gmail.com',90876512,35,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\emmanuel.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Cali','Gerente','Emmanuel Mendez Martinez','emmanuelmm@gmail.com',95763267,40,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\mario.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Bogota','Cajero','Mario Parra Guevara','mariopg@gmail.com',91873256,43,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\German.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Medellin','Cajero','German Carrillo Parra','germancp@gmail.com',78321872,47,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\raul2.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Cali','Cajero','Raul Alvarez Garcia','rauraulaglag@gmail.com',67548912,23,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\Salome.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Bogota','Auxiliar','Salome Ortiz Moreira','salomeom@gmail.com',80547832,40,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\saray2.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Medellin','Auxiliar','Saray Fuentes Gonzalez','sarayfg@gmail.com',80328954,43,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\raquel2.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Cali','Auxiliar','Raquel Diaz Moreira','raqueldm@gmail.com',78654312,28,@imagenEmpleado,0




--INSERTAR LICORES--------------------------------------------------------------------------------------------------------

DECLARE @imagenProducto VARBINARY(MAX);-- = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
--Baileys
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\hechicera.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion 100% en Barranquilla','Ron La Hechicera','Colombia','66',21,18,'Bogota' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion 100% en Barranquilla','Ron La Hechicera','Colombia','66',21,12,'Medellin' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion 100% en Barranquilla','Ron La Hechicera','Colombia','66',21,13,'Cali' ,'luciGa',@imagenProducto,NULL,0

--Jack Daniels
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\milDemonios.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 30 años','Aguardiente Mil Demonios','Colombia','153',30,5,'Bogota' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 30 años','Aguardiente Mil Demonios','Colombia','153',30,6,'Medellin' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 30 años','Aguardiente Mil Demonios','Colombia','153',30,7,'Cali' ,'luciGa',@imagenProducto,NULL,0


--Bacardi
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\bacardi.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','10',5,120,'Bogota' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','10',5,102,'Medellin' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','10',5,140,'Cali' ,'luciGa',@imagenProducto,NULL,0

--Cortez
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\cortez.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,200,'Bogota' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,150,'Medellin' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,50,'Cali' ,'luciGa',@imagenProducto,NULL,0

--DonJulio
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\donJulio.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 30 años','Don Julio','México','150',30,20,'Bogota' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 30 años','Don Julio','México','150',30,17,'Medellin' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 30 años','Don Julio','México','150',30,12,'Cali' ,'luciGa',@imagenProducto,NULL,0



--Johnnie Walker
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\johnnieWBL.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,50,'Bogota' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,60,'Medellin' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,30,'Cali' ,'luciGa',@imagenProducto,NULL,0

--Smirnoff Vodka
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\parce.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Caña de azucar fermentada','Ron Parce','Colombia','223',12,2,'Bogota' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Caña de azucar fermentada','Ron Parce','Colombia','223',12,6,'Medellin' ,'luciGa',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Caña de azucar fermentada','Ron Parce','Colombia','223',12,10,'Cali' ,'luciGa',@imagenProducto,NULL,0


/*
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\smirnoffV.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\johnnieWBL.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\donJulio.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\cortez.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\bacardi.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\jackDaniels.jpg'
'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg'
*/
--C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\


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
/*
INSERT INTO dbo.Transactions
	VALUES
	(
	1,    Transaction Type   1 = Sale
	1,    IdSubsidiary
	4,    IdUser que lo compro
	5,	  IdLicor
	1,    2 = Credit Card, 3 Cash
	'2021-03-11',   Transaction Date
	0.0,            Discount
	150				Total Price
	)
*/

















--BORRAR DATOS
/*
--Borrar Empleados por sucursal
DELETE FROM EmployeePerSubsidiary;
DBCC CHECKIDENT (EmployeePerSubsidiary,RESEED,0);
*/

/*
DELETE FROM Employees
DBCC CHECKIDENT (Employees,RESEED,0);
*/

/*
DELETE FROM EmployeeType
DBCC CHECKIDENT (EmployeeType,RESEED,0);
*/

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