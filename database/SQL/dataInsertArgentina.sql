
USE [ArgentinaLS]

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

INSERT INTO dbo.TransactionType
	VALUES
	(
		'Buy'
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
		'2500'
	),
	('Miscelaneo','2000'),
	('Gerente','3100'),
	('Auxiliar','1600');



--Insertar comidas
INSERT INTO dbo.Food
	VALUES(
		'Mate'
	)
INSERT INTO dbo.Food
	VALUES(
		'Pasta'
	)
INSERT INTO dbo.Food
	VALUES(
		'Chorizo'
	)
INSERT INTO dbo.Food
	VALUES(
		'Antipasto'
	)
INSERT INTO dbo.Food
	VALUES(
		'Pierna de cerdo al horno'
	)
INSERT INTO dbo.Food
	VALUES(
		'Costilla de Cerdo'
	)
INSERT INTO dbo.Food
	VALUES(
		'Queso de La Plata'
	)
INSERT INTO dbo.Food
	VALUES(
		'Asado'
	)
INSERT INTO dbo.Food
	VALUES(
		'Ojo de bife'
	)
INSERT INTO dbo.Food
	VALUES(
		'Patatas fritas'
	)

--INSERTAR USUARIOS
--Crear direcciones para los usuarios
DECLARE @x GEOGRAPHY;

SET @x = GEOGRAPHY::STGeomFromText('POINT(-34.6171791174319 -58.372791859151846)',4326)
EXEC sp_SignUp 'Leonardo Gaspar Marino','leonardogm@gmail.com',92740019,@x,19,'leonardo19','admin123','Administrator',0;

SET @x = GEOGRAPHY::STGeomFromText('POINT(-32.959879442998016 -60.66338432094325)',4326)
EXEC sp_SignUp 'Sahori Solano Bife','sahorisb@gmail.com',73947267,@x,20,'sahori67','ssb67','Biller',0;

SET @x = GEOGRAPHY::STGeomFromText('POINT(-31.395840614177267 -64.18614340241018)',4326)
EXEC sp_SignUp 'Mauricio Milei Donoso','mauriciomd@gmail.com',23979022,@x,25,'mauricio22','mmd25','Biller',0;

SET @x = GEOGRAPHY::STGeomFromText('POINT(-41.15007962671213 -71.30479444427928)',4326)
EXEC sp_SignUp 'Manfred Pozuelo Villalta','manfredpv@gmail.com',30293012,@x,30,'manfred12','mpv30','Consultant',0;

SET @x = GEOGRAPHY::STGeomFromText('POINT(-43.25340797219106 -65.30657559667006)',4326)
EXEC sp_SignUp 'Carlos Alvarado Jimenez','carlosaj@gmail.com',93453424,@x,45,'carlos24','caj45','Consultant',0;

SET @x = GEOGRAPHY::STGeomFromText('POINT(-38.012006201509955 -57.55854033906109)',4326)
EXEC sp_SignUp 'Patricia Mora Delao','patriciamd@gmail.com',12834877,@x,60,'patricia77','pmd60','Administrator',0;


--INSERTAR Subsidiarias
DECLARE @cartagoDireccion GEOGRAPHY;
SET @cartagoDireccion = GEOGRAPHY::STGeomFromText('POINT(-34.62892796448651 -58.42779942001132)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'BuenosAires',
		@cartagoDireccion
	)

DECLARE @limonDireccion GEOGRAPHY;
SET @limonDireccion = GEOGRAPHY::STGeomFromText('POINT(-32.96633289625378 -60.67536736702453)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Rosario',
		@limonDireccion
	)

DECLARE @alajuelaDireccion GEOGRAPHY;
SET @alajuelaDireccion = GEOGRAPHY::STGeomFromText('POINT(-32.891244983468866 -68.84358061292863)',4326)
INSERT INTO dbo.Subsidiary
	(
	Title,
	Address
	)
	VALUES
	(
		'Mendoza',
		@alajuelaDireccion
	)


--INSERTAR HORARIOS
--BuenosAires
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
		'9:00',
		'18:00'
	),
	(
		1,
		'Martes',
		'8:00',
		'17:00'
	),
	(
		1,
		'Miércoles',
		'9:00',
		'16:00'
	),
	(
		1,
		'Jueves',
		'11:00',
		'19:00'
	),
	(
		1,
		'Viernes',
		'14:00',
		'20:00'
	),
	(
		1,
		'Sábado',
		'16:00',
		'23:00'
	),
	(
		1,
		'Domingo',
		'16:00',
		'22:00'
	);

--Limon
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
		'17:00'
	),
	(
		2,
		'Martes',
		'9:00',
		'19:00'
	),
	(
		2,
		'Miércoles',
		'7:00',
		'15:00'
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
		'14:00',
		'21:00'
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
		'14:00',
		'22:00'
	);

--Mendoza
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
		'9:00',
		'18:00'
	),
	(
		3,
		'Martes',
		'8:00',
		'19:00'
	),
	(
		3,
		'Miércoles',
		'6:00',
		'18:00'
	),
	(
		3,
		'Jueves',
		'11:00',
		'22:00'
	),
	(
		3,
		'Viernes',
		'14:00',
		'22:00'
	),
	(
		3,
		'Sábado',
		'14:00',
		'21:00'
	),
	(
		3,
		'Domingo',
		'14:00',
		'23:00'
	);
--INSERTAR EMPLEADOS---------------------------------------------------------------------------------------------------
--Insertar empleados
DECLARE @imagenEmpleado VARBINARY(MAX);

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\diego.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'BuenosAires','Gerente','Diego Gutierrez Molina','diegogm@gmail.com',64039278,30,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\monica.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Rosario','Gerente','Monica Alfaro Parrales','monicaap@gmail.com',20495638,37,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\roberto.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Mendoza','Gerente','Roberto Vega Morales','robertovm@gmail.com',92049502,42,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\gabriel.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'BuenosAires','Cajero','Gabriel Vega Obando','gabrielvo@gmail.com',29404434,41,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\roger.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Rosario','Cajero','Roger Araya Leiton','rogeral@gmail.com',92047560,50,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\olga.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Mendoza','Cajero','Olga Guzman Camacho','olgagc@gmail.com',99230246,24,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\paula.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'BuenosAires','Auxiliar','Paula Vega Obando','paulavo@gmail.com',84302339,29,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\justin.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Rosario','Auxiliar','Justin Torres Mendez','justintm@gmail.com',92220384,22,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\michael.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Mendoza','Auxiliar','Michael DeSanta Lopez','michaeldl@gmail.com',83205044,27,@imagenEmpleado,0




--INSERTAR LICORES--------------------------------------------------------------------------------------------------------
--Insertar productos en Argentina
DECLARE @imagenProducto VARBINARY(MAX);-- = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
--Baileys
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Aromatizado con canela','Baileys','Irlanda','27',20,35,'BuenosAires' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Aromatizado con canela','Baileys','Irlanda','27',20,37,'Rosario' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Aromatizado con canela','Baileys','Irland','27',20,48,'Mendoza' ,'leonardo19',@imagenProducto,NULL,0

--Jack Daniels
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\jackDaniels.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Aromatizado con cipres','Jack Daniels Standard Edition','Estados Unidos','35',10,300,'BuenosAires' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Aromatizado con cipres','Jack Daniels Standard Edition','Estados Unidos','35',10,275,'Rosario' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Aromatizado con cipres','Jack Daniels Standard Edition','Estados Unidos','35',10,400,'Mendoza' ,'leonardo19',@imagenProducto,NULL,0


--Bacardi
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\bacardi.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','12',5,500,'BuenosAires' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','12',5,600,'Rosario' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacardí Blanco','Cuba','12',5,456,'Mendoza' ,'leonardo19',@imagenProducto,NULL,0

--------------
--Legui
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\legui.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Liviano aromatizado con mate','Legui','Argentina','15',1,780,'BuenosAires' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Liviano aromatizado con mate','Legui','Argentina','15',1,700,'Rosario' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Liviano aromatizado con mate','Legui','Argentina','15',1,720,'Mendoza' ,'leonardo19',@imagenProducto,NULL,0

--Absolute
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\absolute.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Enfriado en Leningrado','Absolute','Rusia','170',30,200,'BuenosAires' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Enfriado en Leningrado','Absolute','Rusia','170',30,470,'Rosario' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Enfriado en Leningrado','Absolute','Rusia','170',30,300,'Mendoza' ,'leonardo19',@imagenProducto,NULL,0


--JB
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\jb.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Refrigerado en Sicilia','JB','Italia','20',12,500,'BuenosAires' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Refrigerado en Sicilia','JB','Italia','20',12,300,'Rosario' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Refrigerado en Sicilia','JB','Italia','20',12,400,'Mendoza' ,'leonardo19',@imagenProducto,NULL,0

--Buchanans
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\buchanans.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maderizado con abeto','Buchanans','Escocia','200',3,800,'BuenosAires' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maderizado con abeto','Buchanans','Escocia','200',3,760,'Rosario' ,'leonardo19',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maderizado con abeto','Buchanans','Escocia','200',3,300,'Mendoza' ,'leonardo19',@imagenProducto,NULL,0


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