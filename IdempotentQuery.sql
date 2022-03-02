IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'Aseni')
BEGIN
	CREATE DATABASE [Aseni];
END
GO
USE Aseni

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Usuarios') 
BEGIN
	CREATE TABLE Usuarios( ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
						   Nombre VARCHAR(16) NOT NULL,
						   Apellidos VARCHAR(32) NOT NULL,
						   Contrase�a VARCHAR(16) NOT NULL,
						   UrlPicture IMAGE NOT NULL,
						   CreationDate DATE NOT NULL
						 );
END

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Provincias') 
BEGIN
	CREATE TABLE Provincias(ID INT IDENTITY(1,1) PRIMARY KEY,
							Nombre VARCHAR(16) NOT NULL)
END
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'San Jos�') INSERT INTO Provincias Values('San Jos�')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Cartago') INSERT INTO Provincias Values('Cartago')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Alajuela') INSERT INTO Provincias Values('Alajuela')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Puntarenas') INSERT INTO Provincias Values('Puntarenas')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Lim�n') INSERT INTO Provincias Values('Lim�n')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Guanacaste') INSERT INTO Provincias Values('Guanacaste')
IF NOT EXISTS(SELECT P.Nombre FROM Provincias P WHERE P.Nombre = 'Heredia') INSERT INTO Provincias Values('Heredia')

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Cantones') 
BEGIN
	CREATE TABLE Cantones(ID INT IDENTITY(1,1) PRIMARY KEY,
							Nombre VARCHAR(32) NOT NULL,
							IdProvincia INT FOREIGN KEY References Provincias(ID) NOT NULL
						 );
END
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Abangares' AND C.IdProvincia = 6)
INSERT INTO Cantones VALUES('Abangares',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Bagaces' AND C.IdProvincia =6 )
INSERT INTO Cantones VALUES('Bagaces',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Acosta' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Acosta',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Alajuelita' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Alajuelita',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Barva' AND C.IdProvincia =7 )
INSERT INTO Cantones VALUES('Barva',7)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Atenas' AND C.IdProvincia =3 )
INSERT INTO Cantones VALUES('Atenas',3)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Cartago' AND C.IdProvincia =2 )
INSERT INTO Cantones VALUES('Cartago',2)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Esparza' AND C.IdProvincia = 4 )
INSERT INTO Cantones VALUES('Esparza',4)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Gu�cimo' AND C.IdProvincia =5 )
INSERT INTO Cantones VALUES('Gu�cimo',5)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Matina' AND C.IdProvincia =5 )
INSERT INTO Cantones VALUES('Matina',5)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = '�lvarado' AND C.IdProvincia =2 )
INSERT INTO Cantones VALUES('�lvarado',2)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Aserri' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Aserri',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Bel�n' AND C.IdProvincia =7 )
INSERT INTO Cantones VALUES('Bel�n',7)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Buenos Aires' AND C.IdProvincia =4 )
INSERT INTO Cantones VALUES('Buenos Aires',4)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Ca�as' AND C.IdProvincia =6 )
INSERT INTO Cantones VALUES('Ca�as',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Carrillo' AND C.IdProvincia =6 )
INSERT INTO Cantones VALUES('Carrillo',6)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Corredores' AND C.IdProvincia =4 )
INSERT INTO Cantones VALUES('Corredores',4)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Curridabat' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Curridabat',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Desamparados' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Desamparados',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'Dota' AND C.IdProvincia =1 )
INSERT INTO Cantones VALUES('Dota',1)
IF NOT EXISTS(SELECT C.Nombre, C.IdProvincia FROM Cantones C WHERE C.Nombre = 'El Guarco' AND C.IdProvincia =2 )
INSERT INTO Cantones VALUES('El Guarco',2)

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Partidos') 
BEGIN
	CREATE TABLE Partidos(ID INT IDENTITY(1,1) PRIMARY KEY,
							Nombre VARCHAR(32) NOT NULL,
							urlFlag NCHAR(10) null,
							CreationDate DATE NOT NULL
						 );
END
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PLN')INSERT INTO Partidos VALUES('PLN',NULL,'1982-10-12')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PAC')INSERT INTO Partidos VALUES('PAC',NULL,'1982-12-03')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PUSC')INSERT INTO Partidos VALUES('PUSC',NULL,'1983-12-17')
IF NOT EXISTS(SELECT P.Nombre FROM Partidos P WHERE P.Nombre = 'PIN')INSERT INTO Partidos VALUES('PIN',NULL,'1996-01-30')

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Planes') 
BEGIN
	CREATE TABLE Planes(ID INT IDENTITY(1,1) PRIMARY KEY,
							Titulo VARCHAR(MAX) NOT NULL,
							Descripcion VARCHAR(MAX) NOT NULL,
							IdPartido INT FOREIGN KEY References Partidos(ID) NOT NULL
						 );
END
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'La Via Costarricense al Bienvivir') INSERT INTO Planes VALUES('La Via Costarricense al Bienvivir','Gobernar con �xito exige un prop�sito superior. El nuestro es el bienvivir de las personas  en Costa Rica.',1)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'Propuesta Program�tica') INSERT INTO Planes VALUES('Propuesta Program�tica','Tomamos como base la visi�n de sociedad y las prioridades de pol�tica p�blica que hist�ricamente el Partido Acci�n Ciudadana ha venido planteando desde sus Congresos Ciudadanos.',2)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'La Ruta de la Activaci�n') INSERT INTO Planes VALUES('La Ruta de la Activaci�n','El compromiso de la Presidencia ser� gobernar de la mano con el sector privado',3)
IF NOT EXISTS(SELECT P.Titulo FROM Planes P WHERE P.Titulo = 'Salvando a Costa Rica en tiempos de Sindemia') INSERT INTO Planes VALUES('Salvando a Costa Rica en tiempos de Sindemia','Costa Rica cuenta con suficiente institucionalidad y legislaci�n para promover la inversi�n nacional y extranjera',4)

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Acciones') 
BEGIN
	CREATE TABLE Acciones(ID INT IDENTITY(1,1) PRIMARY KEY,
							Descripcion VARCHAR(120) NOT NULL,
							IdPlan INT FOREIGN KEY References Planes(ID) NOT NULL
						 );
END
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Asfaltar Carreteras' AND A.IdPlan = 1) INSERT INTO Acciones VALUES('Asfaltar Carreteras',1)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Aumentar el alcance de agua potable' AND A.IdPlan = 1) INSERT INTO Acciones VALUES('Aumentar el alcance de agua potable',1)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Crear viviendas bono para necesitados' AND A.IdPlan = 2) INSERT INTO Acciones VALUES('Crear viviendas bono para necesitados',2)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Ciclovias' AND A.IdPlan = 3) INSERT INTO Acciones VALUES('Ciclovias',3)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Asfaltar Carreteras' AND A.IdPlan = 3) INSERT INTO Acciones VALUES('Asfaltar Carreteras',3)
IF NOT EXISTS(SELECT A.Descripcion, A.IdPlan FROM Acciones A WHERE A.Descripcion = 'Rampas para personas con discapacidad' AND A.IdPlan = 4) INSERT INTO Acciones VALUES('Rampas para personas con discapacidad',4)

IF NOT EXISTS (SELECT 1 
           FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_TYPE='BASE TABLE' 
           AND TABLE_NAME='Entregables') 
BEGIN
	CREATE TABLE Entregables (ID INT IDENTITY(1,1) PRIMARY KEY,
							 IdPlan INT FOREIGN KEY REFERENCES Planes(ID) NOT NULL,
							 IdAccion INT FOREIGN KEY REFERENCES Acciones(ID) NOT NULL,
							 IdCanton INT FOREIGN KEY REFERENCES Cantones(ID) NOT NULL,
							 IdPartido INT FOREIGN KEY REFERENCES Partidos(ID) NOT NULL,
							 kpitype VARCHAR(16) NOT NULL,
							 kpivalue INT NOT NULL,
							 Fecha DATE NOT NULL,
							 checksum VARBINARY(120) NULL
						 );
END

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan = 1 AND E.IdAccion =2 AND E.IdCanton =3 )
INSERT INTO Entregables VALUES(1,2,3,1,'Kilometros',45,'2024-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =2 AND E.IdCanton =7 )
INSERT INTO Entregables VALUES(1,2,7,1,'Kilometros',40,'2024-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =2 AND E.IdCanton =12 )
INSERT INTO Entregables VALUES(1,2,12,1,'Kilometros',21,'2024-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =2 AND E.IdCanton =17 )
INSERT INTO Entregables VALUES(1,2,17,1,'Kilometros',34,'2024-12-10',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =20 )
INSERT INTO Entregables VALUES(1,1,20,1,'Kilometros',30,'2024-11-02',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =10 )
INSERT INTO Entregables VALUES(1,1,10,1,'Kilometros',15,'2024-11-30',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =1  AND E.IdAccion =1 AND E.IdCanton =2 )
INSERT INTO Entregables VALUES(1,1,2,1,'Kilometros',2,'2024-11-28',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =3 AND E.IdCanton =3 )
INSERT INTO Entregables VALUES(4,3,3,4,'Rampas',4,'2023-08-17',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =3 AND E.IdCanton =1 )
INSERT INTO Entregables VALUES(4,3,1,4,'Rampas',5,'2023-08-19',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =4  AND E.IdAccion =3 AND E.IdCanton =11 )
INSERT INTO Entregables VALUES(4,3,11,4,'Rampas',4,'2023-08-27',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =4 AND E.IdCanton =16 )
INSERT INTO Entregables VALUES(3,4,16,3,'Ciclovias',4,'2024-05-20',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =4 AND E.IdCanton =19 )
INSERT INTO Entregables VALUES(3,4,19,3,'Ciclovias',2,'2024-04-22',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =4 AND E.IdCanton =15 )
INSERT INTO Entregables VALUES(3,4,15,3,'Ciclovias',3,'2024-05-16',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =5 AND E.IdCanton =15 )
INSERT INTO Entregables VALUES(3,5,15,3,'Kilometros',52,'2024-08-16',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =5 AND E.IdCanton =8 )
INSERT INTO Entregables VALUES(3,5,8,3,'Kilometros',22,'2024-08-07',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =3  AND E.IdAccion =5 AND E.IdCanton =13 )
INSERT INTO Entregables VALUES(3,5,13,3,'Kilometros',37,'2024-08-23',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =4 )
INSERT INTO Entregables VALUES(2,6,4,2,'Casas',4,'2025-02-09',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =5 )
INSERT INTO Entregables VALUES(2,6,5,2,'Casas',6,'2025-02-17',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =14 )
INSERT INTO Entregables VALUES(2,6,14,2,'Casas',6,'2025-02-19',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =8 )
INSERT INTO Entregables VALUES(2,6,8,2,'Casas',7,'2025-03-09',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =11 )
INSERT INTO Entregables VALUES(2,6,11,2,'Casas',5,'2025-03-29',NULL)

IF NOT EXISTS( SELECT E.IdPlan, E.IdAccion, E.IdCanton FROM Entregables E WHERE E.IdPlan =2  AND E.IdAccion =6 AND E.IdCanton =15 )
INSERT INTO Entregables VALUES(2,6,15,2,'Casas',5,'2025-02-21',NULL)