/*
	Práctica Número 1

	En esta práctica se van a aplicar los conocimientos básicos para crear
	y manipular las bases de datos.

	Autor: Rubén Verduzco López
*/

-- Paso 1: Crear una base de datos.
CREATE DATABASE UNITEC
GO

-- Paso 2: Borrar la base de datos ya creada.
DROP DATABASE UNITEC
GO

-- Paso 3: Volver a crear la base de datos.
CREATE DATABASE UNITEC
GO

-- Paso 4: Crear las tablas para la base de datos.
USE UNITEC -- Usar la base de datos.
GO

CREATE TABLE ALUMNO(
Matricula CHAR (10) NOT NULL PRIMARY KEY,
Nombre VARCHAR (20) NOT NULL,
ApellidoPaterno VARCHAR (20) NOT NULL,
ApellidoMaterno VARCHAR (20) NOT NULL
)
GO

CREATE TABLE Materia(
ClaveMateria CHAR (10) NOT NULL,
Descripcion VARCHAR (30) NOT NULL,
Periodo TINYINT NOT NULL,
Observaciones VARCHAR (200),
Seriada BIT NOT NULL,
)
GO

ALTER TABLE Materia ADD CONSTRAINT PK_Clave_Materia PRIMARY KEY(ClaveMateria)
GO

CREATE TABLE Campus(
ClaveCampus CHAR (10) NOT NULL PRIMARY KEY,
Descripcion VARCHAR (30) NOT NULL,
Observaciones VARCHAR (200),
)
GO

-- Paso 5: Eliminar la tabla.
DROP TABLE Campus
GO

-- Paso 6: Agregar la columna Alumno.
ALTER TABLE ALUMNO ADD Telefono VARCHAR (20)
GO

-- Paso 7: Comprobar la columna con SELECT.
SELECT Telefono FROM ALUMNO
GO

-- Paso 8: Seleccionar toda la tabla ALUMNO.
SELECT * FROM ALUMNO
GO

-- Paso 9: Elimina la columna Teléfono de la tabla ALUMNO.
ALTER TABLE ALUMNO DROP COLUMN Telefono
GO

-- Paso 10: Seleccionar toda la tabla ALUMNOS
SELECT * FROM ALUMNO
GO

--Paso 11: Insertar los registros de la tabla ALUMNO
INSERT INTO ALUMNO VALUES (001,'Gerardo','Ruiz','Hernandez')
GO
INSERT INTO ALUMNO VALUES (202,'Rafael','Inclan','Hernandez')
GO
INSERT INTO ALUMNO VALUES (1003,'Eloisa','Armendariz','Gómez')
GO

--Paso 12: Insertar los registros de la tabla Materia
INSERT INTO Materia VALUES ('ABC','Matematicas',2,NULL,0)
GO
INSERT INTO Materia VALUES ('1-122','Base de datos',4,'Seriada con BDII',1)
GO
INSERT INTO Materia VALUES ('321','Quimica',1,'Seriada con Q Orgánica',1)
GO

-- Paso 13: Comprobar la tabla ALUMNO.
SELECT * FROM ALUMNO
GO

-- Paso 14: Comprobar la tabla Materia.
SELECT * FROM Materia
GO

-- Paso 15: Eliminar todos los registros de la tabla ALUMNO
DELETE ALUMNO

-- Paso 16: Eliminar todos los registros de la tabla Materia
DELETE Materia

-- Paso 17: Agrega 5 registros diferentes a la tabla ALUMNO
INSERT INTO ALUMNO VALUES (16533851,'Rubén','Verduzco','López')
GO
INSERT INTO ALUMNO VALUES (12482216,'Iván','Hernandez','Ortíz')
GO
INSERT INTO ALUMNO VALUES (09059774,'Hector','Torres','Herrera')
GO
INSERT INTO ALUMNO VALUES (346536,'Miguel','Eugenio','Ramírez')
GO
INSERT INTO ALUMNO VALUES (09059773,'Rafael','Carbajal','Cordero')
GO

-- Paso 17 A: Seleccionar a los alumnos que tengan 20 años de edad. Añadir el Campo edad a la Tabla Alumno
ALTER TABLE ALUMNO ADD Edad TINYINT
GO

UPDATE ALUMNO SET Edad=20 WHERE Nombre IN('Rubén','Miguel') -- Sirve para actualizar 2 campos 
GO
UPDATE ALUMNO SET Edad=21 WHERE Nombre IN('Rafael','Iván')
GO

UPDATE ALUMNO SET Edad=21 WHERE Nombre='Hector'

SELECT * FROM ALUMNO WHERE Edad=20
GO

-- Paso 17 B: Seleccionar a los alumnos que tengan entre 19 y 22 años de edad.
SELECT * FROM ALUMNO WHERE(Edad>18 AND Edad<22)
GO

-- Paso 18: Agrega 5 registros diferentes a la tabla Materia
INSERT INTO Materia VALUES ('16-73','Cálculo Vectorial',7,NULL,0)
GO
INSERT INTO Materia VALUES ('A-113','Pixar',2,'Esto es solo un texto :)',1)
GO
INSERT INTO Materia VALUES ('0DH','Memorias y periféricos',1,'Seriada con PIC16F84A',1)
GO
INSERT INTO Materia VALUES ('SC08S','Redes 4',5,NULL,0)
GO
INSERT INTO Materia VALUES ('E-204','Geometría Analític',3,NULL,0)
GO

-- Paso 19: Creando la tabla salón con 2 columnas con ClaveSalon Primary Key
CREATE TABLE Salon
(
ClaveSalon VARCHAR (5) NOT NULL PRIMARY KEY,
Descripción VARCHAR (100)
)
GO

-- Agregando las columnas
ALTER TABLE Salon ADD Edificio VARCHAR(3)
GO
ALTER TABLE Salon ADD NumeroButacas TINYINT
GO

INSERT INTO Salon VALUES ('T101','Lab. de computo','T',30)
GO
INSERT INTO Salon VALUES ('T505','Salon grande','T',80)
GO
INSERT INTO Salon VALUES ('B-202','Juicios orales','b',25)
GO

-- Paso 20: Eliminar de la tabla “Salon” los registros del edificio T
DELETE Salon WHERE Edificio='T'
GO

-- Paso 21: Eliminar la información contenida en la tabla “Salon”
DELETE Salon
GO

-- Paso 22: Eliminar la tabla Salon
DROP TABLE Salon
GO

-- Paso 23: Crea la tabla “Profesor”, agregar 5 columnas, 3 registros
CREATE TABLE Profesor(
Matricula CHAR (10) NOT NULL PRIMARY KEY,
Nombre VARCHAR (20) NOT NULL,
ApellidoPaterno VARCHAR (20) NOT NULL,
ApellidoMaterno VARCHAR (20) NOT NULL,
Materia VARCHAR (40) NOT NULL,
)
GO

INSERT INTO Profesor VALUES ('55678964','Edgar Arturo','Rosas','Mayor','Administración de Empresas')
GO
INSERT INTO Profesor VALUES ('39840569','Carlos','Gomez','Mandujano','Java 2')
GO
INSERT INTO Profesor VALUES ('54787903','Rigoberto','Romualdo','Jiménez','Biología')
GO

-- Paso 24: Visualizar todos los registros capturados en la tabla Profesor.
SELECT * FROM Profesor
GO

-- Paso 25: Eliminar la tabla Profesor de la base de datos.
DROP TABLE Profesor
GO