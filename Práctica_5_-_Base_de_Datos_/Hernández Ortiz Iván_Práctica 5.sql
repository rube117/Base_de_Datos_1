/*
Alumno: Hernández Ortiz Iván
*/
--Paso 1: Creamos una Base de Datos.
CREATE DATABASE [Practica 5];
GO

--Paso 2: Creamos las respectivas tablas.
USE [Practica 5];
GO
CREATE TABLE Libro(ID_Libro TINYINT PRIMARY KEY NOT NULL,Titulo Varchar(30) NOT NULL,Editorial Varchar(30) NOT NULL, Area Varchar(30) NOT NULL);
CREATE TABLE Libautor(ID_Autor INT PRIMARY KEY NOT NULL,ID_Libro TINYINT NOT NULL);
CREATE TABLE Prestamo(ID_Lector INT PRIMARY KEY NOT NULL,ID_Libro TINYINT NOT NULL,FechaPresta DATE NOT NULL,FechaDevo DATE NOT NULL,Devuelto char(2) NOT NULL);
CREATE TABLE Autor(ID_Autor INT PRIMARY KEY NOT NULL,Nombre Varchar(30),Nacionalidad Varchar(25));
CREATE TABLE Estudiante(ID_Lector INT PRIMARY KEY NOT NULL,Nombre Varchar(30),Direccion Varchar(50) NOT NULL,Carrera Varchar(30),Edad TINYINT);
GO

--Paso 3: Creamos CONSTRAINTS necesarios para las tablas.
ALTER TABLE Libautor ADD FOREIGN KEY(ID_Libro) REFERENCES Libro(ID_Libro);
ALTER TABLE Autor ADD FOREIGN KEY(ID_Autor) REFERENCES Libautor(ID_Autor);
ALTER TABLE Prestamo ADD FOREIGN KEY(ID_Libro) REFERENCES Libro(ID_Libro);
ALTER TABLE Estudiante ADD FOREIGN KEY(ID_Lector) REFERENCES Estudiante(ID_Lector);

ALTER TABLE Autor ADD CONSTRAINT DF_Nombre_Autor DEFAULT('No ingresado') FOR Nombre;
ALTER TABLE Autor ADD CONSTRAINT DF_Nacionalidad DEFAULT('No ingresado') FOR Nacionalidad;

ALTER TABLE Estudiante ADD CONSTRAINT DF_Nombre DEFAULT('No ingresado') FOR Nombre;
ALTER TABLE Estudiante ADD CONSTRAINT DF_Carrera DEFAULT('No ingresado') FOR Carrera;
ALTER TABLE Estudiante ADD CONSTRAINT DF_Edad DEFAULT('No ingresado') FOR Edad;
ALTER TABLE Estudiante ADD CONSTRAINT CH_Edad CHECK(Edad>=7 AND Edad<=100);

--Paso 4: Ingresar 5 registros por tabla.
INSERT INTO Libro(ID_Libro,Titulo,Editorial,Area)VALUES(100,'Introducción a la programación','Club Universitario','Lenguaje de Programación');
INSERT INTO Libro(ID_Libro,Titulo,Editorial,Area)VALUES(101,'Python 3','RA-MA','Lenguaje de Programación');
INSERT INTO Libro(ID_Libro,Titulo,Editorial,Area)VALUES(102,'Números Increíbles','Crítica','Matemáticas');
INSERT INTO Libro(ID_Libro,Titulo,Editorial,Area)VALUES(103,'Algebra. Baldor','Patria','Matemáticas');
INSERT INTO Libro(ID_Libro,Titulo,Editorial,Area)VALUES(104,'Breve historia del tiempo','Bantam Books','Física');
GO
SELECT*FROM Libro;

INSERT INTO Libautor(ID_Autor,ID_Libro)VALUES(10,100);
INSERT INTO Libautor(ID_Autor,ID_Libro)VALUES(11,101);
INSERT INTO Libautor(ID_Autor,ID_Libro)VALUES(12,102);
INSERT INTO Libautor(ID_Autor,ID_Libro)VALUES(13,103);
INSERT INTO Libautor(ID_Autor,ID_Libro)VALUES(14,104);
GO
SELECT*FROM Libautor;

INSERT INTO Prestamo(ID_Lector,ID_Libro,FechaPresta,FechaDevo,Devuelto)VALUES(12482216,100,'07/21/2018','08/04/2018','S');
INSERT INTO Prestamo(ID_Lector,ID_Libro,FechaPresta,FechaDevo,Devuelto)VALUES(15239707,101,'07/23/2018','08/06/2018','N');
INSERT INTO Prestamo(ID_Lector,ID_Libro,FechaPresta,FechaDevo,Devuelto)VALUES(16533851,102,'07/27/2018','08/10/2018','N');
INSERT INTO Prestamo(ID_Lector,ID_Libro,FechaPresta,FechaDevo,Devuelto)VALUES(15478865,103,'07/27/2018','08/10/2018','S');
INSERT INTO Prestamo(ID_Lector,ID_Libro,FechaPresta,FechaDevo,Devuelto)VALUES(16452287,104,'07/31/2018','08/14/2018','S');
GO
--ALTER TABLE Prestamo DROP PK__Prestamo__90673C033DA89B38
--ALTER TABLE Prestamo ALTER COLUMN ID_Lector INT NOT NULL;
--ALTER TABLE Prestamo ADD CONSTRAINT PK_ID_Lector PRIMARY KEY(ID_Lector);
SELECT*FROM Prestamo;

INSERT INTO Autor(ID_Autor,Nombre,Nacionalidad)VALUES(10,'Mihaela Juganaru Mathieu','Americano');
INSERT INTO Autor(ID_Autor,Nombre,Nacionalidad)VALUES(11,'Mark Summerfield','Americano');
INSERT INTO Autor(ID_Autor,Nombre,Nacionalidad)VALUES(12,'Ian Stewart','Inglés');
INSERT INTO Autor(ID_Autor,Nombre,Nacionalidad)VALUES(13,'Aurelio Baldor','Cubano');
INSERT INTO Autor(ID_Autor,Nombre,Nacionalidad)VALUES(14,'Stephen Hawking','Inglés');
GO
SELECT*FROM Autor;

INSERT INTO Estudiante(ID_Lector,Nombre,Direccion,Carrera,Edad)VALUES(12482216,'Iván Hernández Ortiz','Calle San Luis Potosi #137. Tulpetlac','Ing.Sistemas Computacionales',21);
INSERT INTO Estudiante(ID_Lector,Nombre,Direccion,Carrera,Edad)VALUES(15239707,'Rubén Verduzco López','Calle Emiliano Zapata #188. Jardines','Ing.Sistemas Computacionales',17);
INSERT INTO Estudiante(ID_Lector,Nombre,Direccion,Carrera,Edad)VALUES(16533851,'Gabriela Barrientos Barrientos','Calle Berriosabal #155. G.Victoria','Negocios Internacionales',21);
INSERT INTO Estudiante(ID_Lector,Nombre,Direccion,Carrera,Edad)VALUES(15478865,'Dakota Mayi Johnson','Calle Plutarco Elias #255. CDMX ','Telecomunicaciónes',27);
INSERT INTO Estudiante(ID_Lector,Nombre,Direccion,Carrera,Edad)VALUES(16452287,'Christian Fernández Salgado','Calle Obere_Str.57 #101. CDMX','Física',35);
GO
--ALTER TABLE Estudiante ALTER COLUMN Direccion Varchar(50)  NOT NULL;
SELECT*FROM Estudiante;

--Paso 5: Listar los datos de los autores. 
SELECT Autor.*,Libro.* FROM Autor INNER JOIN Libautor ON (Autor.ID_Autor=Libautor.ID_Autor) INNER JOIN Libro ON (Libro.ID_Libro=Libautor.ID_Libro);
GO
--Paso 6: ¿Qué estudiantes pertenecen a la carrera de Informática? 
SELECT Nombre FROM Estudiante WHERE Carrera='Ing.Sistemas Computacionales';
GO
--Paso 7: Listar los nombres de los estudiantes cuyo apellido comience con la letra F? 
SELECT Nombre FROM Estudiante WHERE Nombre LIKE('%F%');
GO
--Paso 8: ¿Quiénes son los autores del libro “Introducción a la programación”, listar solamente los nombres? (Subconsultas)
SELECT Autor.Nombre as [Nombre del Autor] FROM Autor INNER JOIN Libautor ON(Autor.ID_Autor=Libautor.ID_Autor) INNER JOIN Libro ON(Libautor.ID_Libro=Libro.ID_Libro) WHERE Libro.Titulo='Introducción a la programación';
GO
--Paso 9: ¿Qué libros no son del Área de Física?
SELECT Titulo as [Libros que no son del área de Física] FROM Libro WHERE Area NOT IN('Física');
GO
--Paso 10: ¿Qué libros se prestó el Lector “Gabriela Barrientos Barrientos”? 
SELECT Titulo as [Libro que se prestó al lector] FROM Libro INNER JOIN Prestamo ON(Libro.ID_Libro=Prestamo.ID_Libro) INNER JOIN Estudiante ON(Prestamo.ID_Lector=Estudiante.ID_Lector) WHERE Estudiante.Nombre='Gabriela Barrientos Barrientos';
GO
--Paspo 11: Listar el nombre del estudiante de menor edad. (Subconsultas)
SELECT Nombre,Edad FROM Estudiante WHERE Edad=(SELECT Edad FROM Estudiante WHERE Edad<=18);
GO
--Paso 12: Listar los nombres de los estudiantes que se prestaron Libros de Lenguaje de Programación. (Joins) 
--SELECT Nombre FROM Estudiante WHERE ID_Lector=(SELECT ID_Lector FROM Prestamo WHERE ID_Libro=(SELECT Area FROM Libro WHERE ID_Libro=104));
SELECT Estudiante.Nombre FROM Estudiante WHERE ID_Lector IN (SELECT Prestamo.ID_Lector FROM Prestamo WHERE Prestamo.ID_Lector IN (12482216,15239707));
GO
--Paso 13: Listar los libros de editorial Patria y Crítica.
SELECT Titulo as[Libros con editorial Patria y Crítica] FROM Libro WHERE Editorial IN('Patria','Crítica');
GO
--Paso 14: Listar los libros que pertenecen al autor Stephen Hawking. (Joins)
SELECT Titulo as [Libro del autor Stephen Hawking] FROM Libro INNER JOIN Libautor ON(Libro.ID_Libro=Libautor.ID_Libro) INNER JOIN Autor ON(Libautor.ID_Autor=Autor.ID_Autor) WHERE Autor.Nombre='Stephen Hawking';
GO
--Paso 15: Listar los títulos de los libros que debían devolverse el 08/06/2018. (Subconsultas)
SELECT Titulo FROM Libro WHERE ID_Libro IN(SELECT ID_Libro FROM LIBRO WHERE ID_Libro=101);
GO
--Paso 16: Hallar la suma de las edades de los estudiantes.
SELECT SUM(Edad) as [Resultado de la suma de todas las edades] FROM Estudiante;
GO
--Paso 17: Listar los datos de los estudiantes cuya edad es mayor al promedio. (Joins)
