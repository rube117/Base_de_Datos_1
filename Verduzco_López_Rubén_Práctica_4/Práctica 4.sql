/*

SCRIPT DE INICIO PARA SEGUIR CON LA PRACICA 4 
LA CUAL CONTEMPLA EL USO DE JOINS ENTRE VARIAS TABLAS.
JULIO 2018
TRANSACT-SQL

*/

--se borra la base de datos, si ya estuviera creada
--delete database COBRANZA
--go

-- Error 1: La base de datos se borra con DROP DATABASE COBRANZA no con DELETE
USE master
GO

drop database COBRANZA
go

print 'ya se borró la base de datos COBRANZA'


--SCRIPT PARA LA PRACTICA EN LABORATORIO


--1 Se crea la base de daros COBRANZA
--CREATE BASEDATE COBRANZA
--go

-- Error 2: Se crea con CREATE DATABASE COBRANZA no con CREATE BASEDATE
CREATE DATABASE COBRANZA
go

--2 cambiar a base de datos creada
USE Cobranza
go

--3) se crean las tabla CLIENTE Y FACTURA

/*
CREAR TABLE Cliente
(
   ID_Cliente char(10) FOREIGN KEY NOT NULL,
   Nombre    varchar(4) not null,
   APaterno  vARCHar(4 not null
   AMaterno  varchar(20) not nul,
   Direccion varchar(80),
   FechaAlta dateetime)
)
go

*/

-- Error 3: Se crea la tabla con CREATE no con CREAR, no es FOREIGN KEY es PRIMARY KEY, falta un paréntesis en APaterno varchar (4), una coma
-- al final de APaterno, falta una l en AMaterno not null, DATETIME está mal escrito y sobró un paréntesis.

CREATE TABLE Cliente
(
   ID_Cliente char(10) PRIMARY KEY NOT NULL,
   Nombre    varchar(4) not null, -- Aquí hay error contra el punto 10
   APaterno  vARCHar(4) not null, -- Aquí hay error contra el punto 10
   AMaterno  varchar(20) not null,
   Direccion varchar(80),
   FechaAlta datetime
)
go

/*
CREATE TABLA Factura
(
   ID_Numero_Factura   char(10) no null ,
   FechaFactura datetime,
   ImporteFactura decimal(8,2),
   SerieFactura char(1),
   Observaciones  varchar(100) )
)
go
*/

-- Error 4: Está mal escrito se crea con CREATE TABLE no TABLA, falta una t en char(10) not null y sobra un paréntesis

CREATE TABLE Factura
(
   ID_Numero_Factura   char(10) not null,
   FechaFactura datetime,
   ImporteFactura decimal(8,2),
   SerieFactura char(1),
   Observaciones  varchar(100)
)
go


--3.1 se crea el campola clave a materia
/*
insert table Factura constraint pk_Factura PRIMARY KEY (ID_Numero_Factura)
alter table Factura column Alter ID_Numero_Factura char(10) not nulo
*/

-- Error 5: En el primer comando Escribimos ALTER en lugar del INSERT, escribir ADD CONSTRAINT
-- Error 5.1: Es ALTER COLUMN en lugar de COLUMN ALTER y escribir NOT NULL
ALTER TABLE Factura ADD CONSTRAINT pk_Factura PRIMARY KEY (ID_Numero_Factura)
GO
ALTER TABLE Factura ALTER COLUMN ID_Numero_Factura CHAR(10) not null
GO


--5 Se agrega una columna llamada estatus ('ACTIVO', ' INACTIVO', 'PROSPECT') a Cliente
/*
ALTER  Cliente ADD  Estatus varchar
go
*/

-- Error 6: Escribimos ALTER TABLE, Agregamos el valor en VARCHAR
ALTER TABLE Cliente ADD Estatus varchar(10)
go

--7 SELECCIONAR TODO
/*
SELECT FROM Cliente
*/

-- Error 7: Escribir SELECT * FROM
SELECT * FROM Cliente
GO

--10 Insertar registros en tabla Cliente.

/* 
INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS 
       VALUES ('001','Pedro','Alvarez','Hernandez','calle de verona num 6 izcalli tlalnepantla','11-02-2000','ACTIVO')
	   go
*/
ALTER TABLE Cliente ALTER COLUMN Nombre VARCHAR(20)
GO
ALTER TABLE Cliente ALTER COLUMN APaterno VARCHAR(20)
GO

-- Error 8: Falta paréntesis después de ESTATUS, antes alteramos Nombre y APaterno y les ingresamos un VARCHAR(20)
INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS)
       VALUES ('001','Pedro','Alvarez','Hernandez','calle de verona num 6 izcalli tlalnepantla','11-02-2000','ACTIVO')
	   go

INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
       VALUES ('002','Elena','Rodriguez','Sarabia','AV. CENTRAL EN ECATEPEC SIN NUMERO','01-01-1990','INACTIVO')
	   go
/*
INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
       VALUES '003','Antonia','Alvarez','Hernandez','EN TULTITLAN ESTADO DE MEXIUCO','04-24-1997','INACTIVO')
	   go
*/

-- Error 9: Falta paréntesis después de VALUES
INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
       VALUES ('003','Antonia','Alvarez','Hernandez','EN TULTITLAN ESTADO DE MEXIUCO','04-24-1997','INACTIVO')
	   go
	   
INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
       VALUES ('100','Luis Alberto','Tellez','Alvarez','COACALCO EDO MEX','6-9-1998','PROSPECTO')
	   go

/*
INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
        ('200','Rodrigo','Hernandez','Sarabia','','01-07-1990','ACTIVO')
	   go
*/
-- Error 10: Falta el VALUES
INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
        VALUES ('200','Rodrigo','Hernandez','Sarabia','','01-07-1990','ACTIVO')
	   go

INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
       VALUES ('300','Raquel','Sanchez','Higareda','','04-06-2000','ACTIVO')
	   go

INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
       VALUES ('400','Sergio','Juarez','Bardomianos','DIRECCION CONOCIDA','09-09-1980','INACTIVO')
	   go

INSERT INTO Cliente (ID_Cliente , Nombre   ,APaterno ,AMaterno,Direccion,FechaAlta,ESTATUS )
       VALUES ('500','Alonso','Ruiz','N','JARDINES DE TULTITLAN','02-05-1978','INACTIVO')
	   go


-- Error 11: Escribimos SELECT * FROM Factura
/*
SELECT  FROM *  Factura
*/
SELECT * FROM Factura
GO
SELECT * FROM CLIENTE
GO


--se forma la relacion ENTRE LAS TABLAS cliente / factura
/* 
ALTER TABLE factura  ID_Cliente char(10) 
ALTER TABLE Factura ADD CONSTRAINT FKFacturaCliente FOREIGN KEY (ID_Cliente) REFERENCESES Cliente ID_Cliente
*/

-- Error 12: Escribimos ADD delante de Factura
ALTER TABLE Factura ADD ID_Cliente char(10)
GO
-- Error 12.1: Escribimos REFERENCES en lugar de REFERENCESES y falto paréntesis al final en Cliente ID_Cliente
ALTER TABLE Factura ADD CONSTRAINT FKFacturaCliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente)
GO

--11 MOSTRAR LO QUE TIENE LA TABLA  en CLIENTE
/*
SELECT * WHERE CLIENTEE
*/

-- Error 13: Hay un WHERE y va FROM, Cliente tiene una E de más
SELECT * FROM CLIENTE
GO


--11 insertar RREGISTROS EN FACTURA
/*
INSERT  Factura ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES ('00A','10-01-2018',5600.77,'E','Es factura de fechas anteriores')
	   go
*/

-- Error 14: Falta un INTO delante de INSERT falta un paréntesis después de factura
INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES ('00A','10-01-2018',5600.77,'E','Es factura de fechas anteriores')
	   go

INSERT INTO  Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
	     VALUES ('00B','10-01-2017',65600.77,'J','Es factura de fechas anteriores')
		 go 

/* 
INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES (100A,'20-01-2018',76544.00,'W','FACTURA INCORRECTA'),
	   go
*/

-- Error 15: Faltan comillas simples en 100A, quitamos la coma al final de VALUES, la fecha está mal escrita

INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES ('100A','01-20-2018',76544.00,'W','FACTURA INCORRECTA')
	   go

/* 
INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
	     VALUES ('200B','10-01-2018',9000,90,'W','ES UNA FACURA PARCIAL')
		 go
*/

-- Error 16: Va un punto en lugar de la coma va un punto en 9000,90
INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
	     VALUES ('200B','10-01-2018',9000.90,'W','ES UNA FACURA PARCIAL')
		 go

/* 
INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES (300C,'6-6-2016',5600.77,'E','FACTURA COMPLETA')
	   go
*/
-- Error 17: Faltan comillas en 300C

INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES ('300C','6-6-2016',5600.77,'E','FACTURA COMPLETA')
	   go

INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
	     VALUES ('400D','7-8-2018',100,'T','FACTURA UNA DE DOS')
		 go

INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES ('500E','10-01-2018',9845.98,'T','FACTURA ES RARA')
	   go
	   
/*
INSERT  Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES ('4B','10-01-2018',432,'T')
	   go
*/

-- Error 18: Falta un INTO delante de INSERT, faltaron en observaciones

INSERT INTO Factura (ID_Numero_Factura  , FechaFactura,ImporteFactura,SerieFactura,Observaciones )
       VALUES ('4B','10-01-2018',432,'T','')
	   go


--SE REVISA LO QUE HAY EN LA TABLA FACTURA
/* 
SELECT *  FACTURA
*/

-- Error 19: Falto el FROM después del *
SELECT * FROM FACTURA
GO


--PARA LOGRAR LA RELACIN ENTRE LAS TABLAS CON INTEGRIDAD REFERENCIAL SE ACTUALIZAN LOS VALORES.

-- Error 20: Faltaron los GO
update FACTURA set ID_Cliente = '100' where ID_Numero_Factura = '00a'
GO
update FACTURA set ID_Cliente = '100' where ID_Numero_Factura = '00b'
GO
update FACTURA set ID_Cliente = '200' where ID_Numero_Factura = '100a'
GO
update FACTURA set ID_Cliente = '300' where ID_Numero_Factura = '200b'
GO
update FACTURA set ID_Cliente = '400' where ID_Numero_Factura = '500e'
GO
update FACTURA set ID_Cliente = '300' where ID_Numero_Factura = '300c'
GO
update FACTURA set ID_Cliente = '400' where ID_Numero_Factura = '400d'
GO
update FACTURA set ID_Cliente = '400' where ID_Numero_Factura = '4b'
GO


--SE MUESTRAN LOS CONTENIDOS DE AMBAS TABLAS
SELECT * FROM cliente
GO
SELECT * FROM factura
GO


--UTILIZAMOS CONSTRAINTS PARA VER LAS ESTRUCTURAS
/*  
sp_helpCONSTRAIN Cliente
GO
sp_helpCONSTRAIN factura
GO
*/

-- Error 21: En ambos se escribe sp_help
sp_help Cliente
GO
sp_help factura
GO



/*       a  realizar   */
-- 1 HABER CORREGIDO LA PRIMER PARTE DE ESTA PRACTICA *Listo*

/*

1.CREAR UNA TABLA LLAMADA “COBRADOR” CON LOS ATRIBUTOS : (PK) ID_COBRADOR char(7), NOMBRE VARCHAR (49),EDAD TINYNT ,FECHAINGRESO DATETIME

2.CREAR UNA TABLA LLAMADA  “COMISION"  CON LOS ATRIBUTOS : (PK) ID_COMISION CHAR (10), DESCRIPCION VARCHAR(30), MONTOCOMISION MONEY, NUMEROCOMISION TINYINT

3.	INTRODUCIR LOS SIGUIENTES 5  REGISTROS EN LA TABLA COMISION 

        F-105,Comision por recuperacin rapida,500,1)
	    X-105,comision mensual,322,1)
        B-101,comisin anual,8999,2)
        T-201,comisino por montos,989,2)
        G-100,comision por recuperacion minima,1200,3)


4.	INTRODUCIR LOS SIGUIENTES 5  REGISTROS EN LA TABLA COBRADOR

    73879,Jesus Barajas Natividad,90,10-05-2008
 	1222,Biana Yañez Garcia,32,10-10-2008
 	33321,Olivia Patlan Ramirez,28,12-11-2011
 	73879,Isabel Zuñiga Lopez,55,02-01-2004
 	73879,Margarita Alba Maequez,44,10-05-2000
	


5. REALIZAR LAS MODIFICACIONES NECESARIAS PARA PODER EJECUTAR LAS SIGUIENTES CONSULTAS DEL TIPO INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN
   ENTRE LAS TABLAS CLIENTE, FACTURA,COBRADOR Y COMISION  : 

 5.1 EL USUARIO QUIERE SABER LOS CLIENTES Y LAS FACTURAS QUE TIENE.
 5.2 EL USUARIO QUIERE SABER CUANTOS CLIENTES NO TIENEN NINGUNA FACTURA REALIZADA
 5.3 EL USUARIO QUIERE SABER QUE COMISIONES HA COBRADO UN COBRADOR
 5.4 EL USuARIO QUIERE VER TODO EL DETALLE DE LAS FACTURAS EXISTENTES QUE TIENEN LOS CLIENTES Y DE AQUI SOLO QUIERE VER EL NOMBRE DEL CLIENTE
 5.5 EL USUARIO QUIERE VER EL DETALLE DE TODAS LAS FACTURAS
 5.6 EL USUARIO QUIERE SABER TODAS LAS FACTURAS DE LOS CLIENTES QUE SE QUE SE APELLIDAN (MATERNO O PATERNO) HERNANDEZ
 5.7 EL USUARIO QUIERE SABER EL NOMBRE DEL COBRADOR Y EL TOTAL DE SUS COMISIONES COBRADAS
 5.8 EL USUARIO QUIERE VER TODAS LAS COMISIONES MAYORES A 400 PESOS
 5.9 EL USUARIO QUIERE SABER TODOS LAS FACTURAS QUE TENGAN CLIENTE Y QUE EL CLIENTE SEA ACTIVO
 5.10  POR DEFINIR
 5.11  POR DEFINIR
 5.12  POR DEFINIR
 5.13  POR DEFINIR

6. BORRAR TUPLAS CLIENTE-FACTURA PARA ASEGURAR QUE SI TIENE INFORMACIÓN RELACIONADA NO NOS DEBE PERMITIR DEBIDO A LAS LLAVES FORÁNEAS.
 
7. REALIZAR LOS CONTRAINTS ADECUADOS PARA PODER  BORRAR EL ID_CLIENTE 100 Y SUS FACTURAS RELACIONADAS.

8. REALIZAR LOS CONTRAINTS ADECUADOS PARA PODER ACTUALIZAR EL ID_CLIENTE 400  Y SUS FACTURAS RELACIONADAS.


*****************--------------*******
*/

-- 1.- CREAR UNA TABLA LLAMADA “COBRADOR” CON LOS ATRIBUTOS : (PK) ID_COBRADOR char(7), NOMBRE VARCHAR (49),EDAD TINYNT ,FECHAINGRESO DATETIME
CREATE TABLE COBRADOR
(
	ID_COBRADOR char(7) PRIMARY KEY NOT NULL,
	NOMBRE VARCHAR (49),
	EDAD TINYINT,
	FECHAINGRESO DATETIME
)
GO

-- 2.- CREAR UNA TABLA LLAMADA  “COMISION"  CON LOS ATRIBUTOS : (PK) ID_COMISION CHAR (10), DESCRIPCION VARCHAR(30), MONTOCOMISION MONEY, NUMEROCOMISION TINYINT
CREATE TABLE COMISION
(
	ID_COMISION CHAR (10) PRIMARY KEY NOT NULL,
	DESCRIPCION VARCHAR(35),
	MONTOCOMISION MONEY,
	NUMEROCOMISION TINYINT,
	ID_COBRADOR CHAR(7)
)
GO

-- 3.- INTRODUCIR LOS SIGUIENTES 5  REGISTROS EN LA TABLA COMISION

/*
        F-105,Comision por recuperacin rapida,500,1)
	    X-105,comision mensual,322,1)
        B-101,comisin anual,8999,2)
        T-201,comisino por montos,989,2)
        G-100,comision por recuperacion minima,1200,3)
*/

INSERT INTO COMISION
(ID_COMISION,DESCRIPCION,MONTOCOMISION,NUMEROCOMISION,ID_COBRADOR)
VALUES
('F-105','Comision por recuperacion rapida',500,1,'73879'),
('X-105','Comisión mensual',322,1,'1222'),
('B-101','Comisión anual',8999,2,'33321'),
('T-201','Comisión por montos',989,2,'73880'),
('G-100','comision por recuperacion minima',1200,3,'73881')
GO

-- 4.- INTRODUCIR LOS SIGUIENTES 5  REGISTROS EN LA TABLA COBRADOR
/*
    73879,Jesus Barajas Natividad,90,10-05-2008
 	1222,Biana Yañez Garcia,32,10-10-2008
 	33321,Olivia Patlan Ramirez,28,12-11-2011
 	73879,Isabel Zuñiga Lopez,55,02-01-2004
 	73879,Margarita Alba Maequez,44,10-05-2000
*/

INSERT INTO COBRADOR
(ID_COBRADOR,NOMBRE,EDAD,FECHAINGRESO)
VALUES
('73879','Jesus Barajas Natividad',90,'10-05-2008'),
('1222','Biana Yañez Garcia',32,'10-10-2008'),
('33321','Olivia Patlan Ramirez',28,'12-11-2011'),
('73880','Isabel Zuñiga Lopez',55,'02-01-2004'),
('73881','Margarita Alba Maequez',44,'10-05-2000')
GO

-- 5. REALIZAR LAS MODIFICACIONES NECESARIAS PARA PODER EJECUTAR LAS SIGUIENTES CONSULTAS DEL TIPO INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN
-- ENTRE LAS TABLAS CLIENTE, FACTURA,COBRADOR Y COMISION:

-- 5.1 EL USUARIO QUIERE SABER LOS CLIENTES Y LAS FACTURAS QUE TIENE.
SELECT CL.*,F.* FROM Cliente CL INNER JOIN Factura F ON(CL.ID_Cliente=F.ID_Cliente)
GO

-- 5.2 EL USUARIO QUIERE SABER CUANTOS CLIENTES NO TIENEN NINGUNA FACTURA REALIZADA
SELECT COUNT(*) AS "No tienen factura" FROM CLIENTE CL INNER JOIN FACTURA F ON(CL.ID_Cliente=F.ID_Cliente)
GO

SELECT * FROM COMISION
GO
SELECT * FROM COBRADOR
GO

-- 5.3 EL USUARIO QUIERE SABER QUE COMISIONES HA COBRADO UN COBRADOR
ALTER TABLE COBRADOR ADD CONSTRAINT FK_COMISIONCOBRADOR FOREIGN KEY (ID_COBRADOR) REFERENCES COBRADOR (ID_COBRADOR)
GO
SELECT C1.*,C2.* FROM COBRADOR C1 RIGHT JOIN COMISION C2 ON(C1.ID_COBRADOR=C2.ID_COMISION)
GO

-- 5.4 EL USuARIO QUIERE VER TODO EL DETALLE DE LAS FACTURAS EXISTENTES QUE TIENEN LOS CLIENTES Y DE AQUI SOLO QUIERE VER EL NOMBRE DEL CLIENTE
SELECT CL.NOMBRE,F.* FROM Cliente AS CL INNER JOIN Factura F ON(CL.ID_Cliente=F.ID_Cliente)
GO

-- 5.5 EL USUARIO QUIERE VER EL DETALLE DE TODAS LAS FACTURAS
SELECT * FROM FACTURA
GO

-- 5.6 EL USUARIO QUIERE SABER TODAS LAS FACTURAS DE LOS CLIENTES QUE SE QUE SE APELLIDAN (MATERNO O PATERNO) HERNANDEZ
SELECT CL.*,F.* FROM Cliente CL INNER JOIN Factura F ON(CL.ID_Cliente=F.ID_Cliente) WHERE CL.AMaterno='Hernandez' OR CL.APaterno='Hernandez'
GO

-- 5.7 EL USUARIO QUIERE SABER EL NOMBRE DEL COBRADOR Y EL TOTAL DE SUS COMISIONES COBRADAS "NO SALE"
SELECT SUM(C2.MONTOCOMISION),C1.NOMBRE,c2.MONTOCOMISION FROM COBRADOR C1 RIGHT JOIN COMISION C2 ON(C1.ID_COBRADOR=C2.ID_COMISION) GROUP BY C1.NOMBRE,C2.MONTOCOMISION
GO

-- 5.8 EL USUARIO QUIERE VER TODAS LAS COMISIONES MAYORES A 400 PESOS
SELECT C1.*,C2.* FROM COBRADOR C1 RIGHT JOIN COMISION C2 ON(C1.ID_COBRADOR=C2.ID_COMISION) WHERE (C2.MONTOCOMISION > 400)
GO

-- 5.9 EL USUARIO QUIERE SABER TODOS LAS FACTURAS QUE TENGAN CLIENTE Y QUE EL CLIENTE SEA ACTIVO
SELECT CL.*,F.* FROM Cliente CL INNER JOIN Factura F ON(CL.ID_Cliente=F.ID_Cliente) WHERE CL.Estatus='ACTIVO'
GO

-- 6 BORRAR TUPLAS CLIENTE-FACTURA PARA ASEGURAR QUE SI TIENE INFORMACIÓN RELACIONADA NO NOS DEBE PERMITIR DEBIDO A LAS LLAVES FORÁNEAS.
DELETE Cliente
GO
DELETE Factura
GO

-- 7 REALIZAR LOS CONTRAINTS ADECUADOS PARA PODER BORRAR EL ID_CLIENTE 100 Y SUS FACTURAS RELACIONADAS.
-- Se alteró la tabla borrando el CONSTRAINT para poder borrar los registros, esto aplica también para el punto 8.
ALTER TABLE Factura DROP CONSTRAINT FKFacturaCliente
GO
DELETE Cliente WHERE ID_Cliente=100
GO

-- 8 REALIZAR LOS CONTRAINTS ADECUADOS PARA PODER ACTUALIZAR EL ID_CLIENTE 400  Y SUS FACTURAS RELACIONADAS.
UPDATE Cliente SET Estatus='ACTIVO' WHERE ID_Cliente=400
GO

SELECT * FROM Cliente
GO