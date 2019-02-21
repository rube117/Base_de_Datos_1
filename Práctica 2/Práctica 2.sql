/*
	Pr�ctica N�mero 2

	En esta pr�ctica se van a aplicar conocimientos b�sicos amplios
	para resolver los que se viene.

	Autor: Rub�n Verduzco L�pez
*/

-- Paso 1: Crear una base de datos con nombre TAREA
CREATE DATABASE TAREA
GO

-- Utilizar la base de datos.
USE TAREA
GO

-- Paso 2: Crear la tabla Empleado.
CREATE TABLE Empleado(
EmpleadoID TINYINT NOT NULL PRIMARY KEY,
APaterno VARCHAR (20) NOT NULL,
AMaterno VARCHAR (20) NOT NULL,
Nombre VARCHAR (20) NOT NULL,
Puesto VARCHAR (30),
FNacimiento DATETIME NOT NULL,
Direcci�n VARCHAR (60),
Ciudad VARCHAR (15),
CodigoPostal VARCHAR (10),
Pais VARCHAR (15),
Edad TINYINT,
Sueldo DECIMAL(18,2)
)
GO

-- Paso 2 A: Agregar una restricci�n de chequeo de sueldo entre 10000 y 90000
ALTER TABLE Empleado ADD CONSTRAINT CH_Sueldo CHECK(Sueldo > 10000 AND Sueldo < 90000)
GO

-- Paso 2 B: Agregar una restricci�n de chequeo de edad entre 18 y 70
ALTER TABLE Empleado ADD CONSTRAINT CH_Edad CHECK(Edad > 18 AND Edad < 70)
GO

-- Paso 2 C: Agregar un constraint DEFAULT al campo opuesto con valor de "Empleado"
ALTER TABLE Empleado ADD CONSTRAINT DF_Puesto DEFAULT ('Empleado') FOR Puesto
GO

-- Paso 3: Insertar 10 registros a la tabla Empleado dejando al menos 3 registros con valores NULL en los campos que lo permiten.
-- La fecha se escribe como: Mes, D�a y A�o completo Ejemplo: 12/31/1999
INSERT INTO Empleado(EmpleadoID,APaterno,AMaterno,Nombre,Puesto,FNacimiento,Direcci�n,Ciudad,CodigoPostal,Pais,Edad,Sueldo)
VALUES (121,'Acuapan','Hernandez','Javier','E-435','11/02/1970','Heroes Acolman','M�xico',45435,'M�xico',41,50000),
	   (172,'Jordan','Jeffrey','Michael','NBA','02/17/1963','Brooklyn','Nueva York',29485,'Estados Unidos',55,80000),
	   (56,'Santos','Junior','Neymar da Silva','Par�s Saint-Germain','02/05/1992','Mogi','das Cruzes',89503,'Bras�l',26,60000),
	   (14,'Mebarak','Ripoll','Shakira Isabel','Productora','02/02/1977','Barranquilla','Atl�ntico',67493,'Colombia',41,70000),
	   (105,'L�pez','Obrador','Andr�s Manuel','Morena','10/09/1953','Macuspana','Tabasco',18293,'M�xico',64,50000),
	   (78,'Kaz','Hirai','Kazuo','CEO-SO','12/22/1960','Tokio','Tokio',98405,'Jap�n',57,89999),
	   (129,'A.','Zemdegs','Feliks','SpeedSolver','12/20/1995','Melbourne','Melbourne',37596,'Australia',22,40000)
GO

INSERT INTO Empleado(EmpleadoID,APaterno,AMaterno,Nombre,FNacimiento)
VALUES (117,'Verduzco','L�pez','Rub�n','12/28/1997'),
	   (194,'Torres','Herrera','Hector','12/31/1996'),
	   (110,'Hern�ndez','Ort�z','Iv�n','12/15/1996')
GO

SELECT * FROM Empleado
GO

/*
	Conclusiones:
	Con el check constranint se pueden ejecutar condiciones para ofrecer
	estabilidad a la base de datos, si cualquier chistoso intenta
	meter un valor no aceptable en el programa le mandar� un error.
*/

-- Paso 4: Actualiza la columna "Sueldo" de todos los registros de la tabla con el valor 23,500.00.
UPDATE Empleado SET Sueldo=23500
GO

-- Paso 5: Comprueba los resultados con la instrucci�n Select, analiza y genera tus conclusiones.
SELECT * FROM Empleado
GO

/*
	Conclusiones:
	Al utilizar el comando UPDATE la tabla se actualiza en general, el comando
	SET sirve para ingresar en una columna de la tabla alg�n dato en espec�fico.
	En este caso se les agreg� a todos el sueldo de 23500.
*/

-- Paso 6: Posteriormente Actualiza la columna Sueldo con el valor 30,000.00 para todos los empleados.
UPDATE Empleado SET Sueldo=30000
GO

-- Paso 7: Comprueba los resultados con la instrucci�n Select, analiza y genera tus conclusiones.
SELECT * FROM Empleado
GO

/*
	Conclusiones:
	El comando update afectar� la tabla a los datos en general, aqu� no se ocupan
	condiciones, se agregar� lo mismo para la columna de Sueldo y es lo mismo
	para todos los registros.
*/

/*
	Paso 8: Actualiza la columna "Puesto" con el valor de �Director� de todos los empleados 
	de la tabla si la fechanacimiento est� entre el 01-01-1950  y 31-12-1960. Comprueba los 
	resultados con la instrucci�n Select.
*/
UPDATE Empleado SET Puesto='Director' WHERE FNacimiento > '01/01/1950' AND FNacimiento < '12/31/1960'
GO

SELECT * FROM Empleado
GO

/*
	Paso 9: Actualiza la columna "Puesto" con el valor de �Gerente�de todos los empleados de 
	la tabla si la fechanacimiento es del a�o 1970. Comprueba los resultados con la instrucci�n Select.
*/

UPDATE Empleado SET Puesto='Gerente' WHERE FNacimiento > '01/01/1970' AND FNacimiento < '12/31/1970'
GO

SELECT * FROM Empleado
GO

-- Paso 10: Elimina un registro de acuerdo a su EmpleadoId (entre valores de 1 y 100) y comprueba los resultados con la instrucci�n Select.
DELETE FROM Empleado WHERE EmpleadoID > 1 AND EmpleadoID < 100
GO

SELECT * FROM Empleado
GO

-- Paso 11: Elimina un registro de acuerdo a su pa�s y comprueba los resultados con la instrucci�n Select.
DELETE FROM Empleado WHERE Pais='M�xico'
GO

SELECT * FROM Empleado
GO

-- Paso 12: Elimina un registro de acuerdo a su nombre y comprueba los resultados con la instrucci�n Select.
DELETE FROM Empleado WHERE Nombre='Hector'
GO

SELECT * FROM Empleado
GO

-- Paso 13: Elimina la llave PK de la tabla Empleado.
ALTER TABLE Empleado DROP CONSTRAINT PK__Empleado__958BE6F04A802C8A
GO

-- Paso 14: Inserta un registro con los valores id�nticos de un registro ya exista en la tabla y observa el resultado mediante un select.
SELECT * INTO Copia_Empleado FROM Empleado
GO

SELECT * FROM Empleado
GO

SELECT * FROM Copia_Empleado
GO

-- Paso 15: Elimina la tabla Empleado.
DROP TABLE Empleado
GO

-- Paso 16: Elimina la base de datos Tarea.
USE master
GO

DROP DATABASE TAREA
GO
