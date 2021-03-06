
USE [CostaRicaLS]

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
		'2000'
	),
	('Miscelaneo','1950'),
	('Gerente','3000'),
	('Auxiliar','1500');








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
--Crear direcciones para los usuarios



EXEC sp_SignUp 'Luis Carlos Araya Mata','luistec2309@gmail.com',84105826,'POINT(10.007443708576737 -84.21213808239264)',19,'luis2309','admin123','Administrator',0;


EXEC sp_SignUp 'Josue Gutierrez Piedra','josuegupi2309@gmail.com',87430908,'POINT(9.90462237731634 -83.68280935931553)',20,'gupi08','flor420','Biller',0;


EXEC sp_SignUp 'Sebastian Diaz Obando','sebasDiaz@gmail.com',96397630,'POINT(10.007443708576737 -84.21213808239264)',25,'sebas63','kmy45','Biller',0;


EXEC sp_SignUp 'Rolbin Mendez Brenes','rolbismb@gmail.com',49584109,'POINT(10.007443708576737 -84.21213808239264)',30,'rolbis09','amoskz','Consultant',0;


EXEC sp_SignUp 'Jorge Bonilla Moreira','jorgeb@gmail.com',84950987,'POINT(10.007443708576737 -84.21213808239264)',45,'jorge87','labias123','Consultant',0;


EXEC sp_SignUp 'Robert Araya Carrillo','roberta@gmail.com',23098495,'POINT(10.007443708576737 -84.21213808239264)',60,'roberta95','explotar','Administrator',0;


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
		'Lim?n',
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
		'8:00',
		'18:00'
	),
	(
		1,
		'Martes',
		'9:00',
		'17:00'
	),
	(
		1,
		'Mi?rcoles',
		'8:00',
		'16:00'
	),
	(
		1,
		'Jueves',
		'9:00',
		'19:00'
	),
	(
		1,
		'Viernes',
		'13:00',
		'20:00'
	),
	(
		1,
		'S?bado',
		'15:00',
		'23:00'
	),
	(
		1,
		'Domingo',
		'14:00',
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
		'Mi?rcoles',
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
		'S?bado',
		'15:00',
		'23:00'
	),
	(
		2,
		'Domingo',
		'14:00',
		'22:00'
	);

--Alajuela
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
		'19:00'
	),
	(
		3,
		'Martes',
		'8:00',
		'18:00'
	),
	(
		3,
		'Mi?rcoles',
		'6:00',
		'17:00'
	),
	(
		3,
		'Jueves',
		'11:00',
		'21:00'
	),
	(
		3,
		'Viernes',
		'14:00',
		'23:00'
	),
	(
		3,
		'S?bado',
		'14:00',
		'22:00'
	),
	(
		3,
		'Domingo',
		'14:00',
		'20:00'
	);
--INSERTAR EMPLEADOS---------------------------------------------------------------------------------------------------
--Insertar empleados
DECLARE @imagenEmpleado VARBINARY(MAX);

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\laura.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Cartago','Gerente','Laura Mata Redondo','lauramr@gmail.com',38740187,32,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\andrea.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Lim?n','Gerente','Andrea Barahona Mata','andreabm@gmail.com',97308963,35,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\carlos.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Alajuela','Gerente','Carlos Mendez Brenes','carlosmb@gmail.com',92100982,40,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\jorge.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Cartago','Cajero','Jorge Flores Araya','jorgefa@gmail.com',12730906,43,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\josue.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Lim?n','Cajero','Josue Carrillo Parra','josuecp@gmail.com',82937018,47,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\raul.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Alajuela','Cajero','Raul Alvarez Genis','raulag@gmail.com',48205629,23,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\rolbin.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Cartago','Auxiliar','Rolbin Bonilla Moreira','rolbinbm@gmail.com',58201927,40,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\saray.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Lim?n','Auxiliar','Saray Fuentes Diaz','sarayfd@gmail.com',29093567,43,@imagenEmpleado,0

SET @imagenEmpleado = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\raquel.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddEmployee 'Alajuela','Auxiliar','Raquel Soto Montero','raquelsm@gmail.com',48204675,28,@imagenEmpleado,0




--INSERTAR LICORES--------------------------------------------------------------------------------------------------------
--Insertar productos en Cartago
DECLARE @imagenProducto VARBINARY(MAX);-- = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
--Baileys
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\baileys.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 20 a?os','Baileys','Escocia','17',20,30,'Cartago' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 20 a?os','Baileys','Escocia','17',20,35,'Lim?n' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 20 a?os','Baileys','Escocia','17',20,42,'Alajuela' ,'luis2309',@imagenProducto,NULL,0

--Jack Daniels
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\jackDaniels.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 10 a?os','Jack Daniels Standard Edition','Estados Unidos','25',10,50,'Cartago' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 10 a?os','Jack Daniels Standard Edition','Estados Unidos','25',10,40,'Lim?n' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 10 a?os','Jack Daniels Standard Edition','Estados Unidos','25',10,60,'Alajuela' ,'luis2309',@imagenProducto,NULL,0


--Bacardi
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\bacardi.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Con madera de abeto','Bacard? Blanco','Cuba','10',5,120,'Cartago' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacard? Blanco','Cuba','10',5,102,'Lim?n' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Con madera de abeto','Bacard? Blanco','Cuba','10',5,140,'Alajuela' ,'luis2309',@imagenProducto,NULL,0

--Cortez
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\cortez.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,200,'Cartago' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,150,'Lim?n' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Liviano aromatizado','Cortez','Cubano','7',1,50,'Alajuela' ,'luis2309',@imagenProducto,NULL,0

--DonJulio
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\donJulio.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maduracion a 30 a?os','Don Julio','M?xico','150',30,20,'Cartago' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 30 a?os','Don Julio','M?xico','150',30,17,'Lim?n' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maduracion a 30 a?os','Don Julio','M?xico','150',30,12,'Alajuela' ,'luis2309',@imagenProducto,NULL,0



--Johnnie Walker
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\johnnieWBL.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,50,'Cartago' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,60,'Lim?n' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Maderizado con roble','Johnnie Walker Black Label','Escocia','40',12,30,'Alajuela' ,'luis2309',@imagenProducto,NULL,0

--Smirnoff Vodka
SET @imagenProducto= (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\luist\OneDrive\Escritorio\LiqueursStore\static\images\smirnoffV.jpg',SINGLE_BLOB) AS Imagen);
EXEC sp_AddNewProduct 'Aromatizado con canela','Smirnoff Vodka','Rusia','18',3,50,'Cartago' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Aromatizado con canela','Smirnoff Vodka','Rusia','18',3,60,'Lim?n' ,'luis2309',@imagenProducto,NULL,0
EXEC sp_AddNewProduct 'Aromatizado con canela','Smirnoff Vodka','Rusia','18',3,200,'Alajuela' ,'luis2309',@imagenProducto,NULL,0


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