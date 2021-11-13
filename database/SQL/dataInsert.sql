
USE [CostaRicaLS]

--Insertar datos

--INSERTAR USUARIOS
EXEC sp_SignUp 'Luis Carlos Araya Mata','luistec2309@gmail.com',84105826,NULL,19,'luis2309','admin123','Administrator',0;
EXEC sp_SignUp 'Josue Gutierrez Piedra','josuegupi2309@gmail.com',87430908,NULL,20,'gupi08','flor420','Biller',0;
EXEC sp_SignUp 'Sebastian Diaz Obando','sebasDiaz@gmail.com',96397630,NULL,25,'sebas63','kmy45','Biller',0;
EXEC sp_SignUp 'Rolbin Mendez Brenes','rolbismb@gmail.com',49584109,NULL,30,'rolbis09','amoskz','Consultant',0;
EXEC sp_SignUp 'Jorge Bonilla Moreira','jorgeb@gmail.com',84950987,NULL,45,'jorge87','labias123','Consultant',0;
EXEC sp_SignUp 'Robert Araya Carrillo','roberta@gmail.com',23098495,NULL,60,'roberta95','explotar','Administrator',0;



--TESTEAR PROCEDURES
/*
EXEC sp_SignIn 'luis2309','admin123',0;
EXEC sp_SignIn 'jorge87','labias123',0;
*/