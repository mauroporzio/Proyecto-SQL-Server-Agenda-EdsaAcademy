CREATE TABLE AgendaContactos
(
	Id INT IDENTITY (1,1),
	ApellidoYNombre VARCHAR (50) NOT NULL,
	Genero VARCHAR (10) NOT NULL,
	Pais VARCHAR (20) NOT NULL,
	Localidad VARCHAR (20) NULL,
	ContactoInterno BIT NOT NULL,
	Organizacion VARCHAR (20) NULL,
	Area VARCHAR (20) NULL,
	Activo BIT NOT NULL,
	Direccion VARCHAR(20) NULL,
	TelefonoFijoInterno VARCHAR(20) NULL,
	TelefonoCelular VARCHAR (20) NULL,
	Email VARCHAR (30) NOT NULL,
	CuentaSkype VARCHAR (20) NULL,
	Cuil VARCHAR (20) NOT NULL,

	ContactoAltaReg VARCHAR(50) NOT NULL, --NOMBRE DE FUNCION QUE HIZO EL insert.
	FechaAltaReg DATETIME NOT NULL,
    ContactoModifReg VARCHAR(50) NULL, --NOMBRE DE FUNCION QUE HIZO EL edit.
    FechaModifReg DATETIME NULL
)

CREATE TABLE AgendaContactos_Historica
(
	IdContactoHistorica INT IDENTITY(1,1),

	IdContacto INT NOT NULL,
	ApellidoYNombre VARCHAR (50) NOT NULL,
	Genero VARCHAR (10) NOT NULL,
	Pais VARCHAR (20) NOT NULL,
	Localidad VARCHAR (20) NULL,
	ContactoInterno BIT NOT NULL,
	Organizacion VARCHAR (20) NULL,
	Area VARCHAR (20) NULL,
	Activo BIT NOT NULL,
	Direccion VARCHAR(20) NULL,
	TelefonoFijoInterno VARCHAR(20) NULL,
	TelefonoCelular VARCHAR (20) NULL,
	Email VARCHAR (30) NOT NULL,
	CuentaSkype VARCHAR (20) NULL,
	Cuil VARCHAR (20) NOT NULL,

	ContactoAltaReg VARCHAR(50) NOT NULL,
    FechaAltaReg DATETIME NOT NULL,
    ContactoModifReg VARCHAR(50) NULL,
    FechaModifReg DATETIME NULL
)


CREATE TABLE Pais -- TABLA QUE CONTIENE LOS VALORES DE LOS PAISES QUE ESTARN DISPONIBLES EN EL DROP DOWN DENTRO DEL UI
(
	IdPais INT IDENTITY(1,1),
	NombrePais VARCHAR (20) NOT NULL
)

INSERT INTO [dbo].[Pais] (NombrePais) VALUES 

	('Argentina'),
	('Bolivia'),	
	('Brasil'),	
	('Chile'),
	('Colombia'),	
	('Ecuador'),	
	('Paraguay'),	
	('Perú'),	
	('Uruguay'),	
	('Venezuela'),
	('Estados Unidos'),
	('Alemania'),
	('España'),
	('Francia'),
	('Reino Unido'),
	('China'),
	('Japon')

CREATE TABLE SiNo
(
	IdSiNo INT IDENTITY(1,1),
	Valor VARCHAR (20) NOT NULL
)

INSERT INTO [dbo].[SiNo] (Valor) VALUES 

	('Si'),
	('No')

CREATE TABLE Genero
(
	IdGenero INT IDENTITY(1,1),
	Valor VARCHAR (20) NOT NULL
)

INSERT INTO [dbo].[Genero] (Valor) VALUES 

	('Masculino'),
	('Femenino')


SELECT * FROM Pais
SELECT * FROM AgendaContactos
SELECT * FROM AgendaContactos_Historica
SELECT * FROM Genero
SELECT * FROM SiNo

--Borrar Tablas

DROP TABLE AgendaContactos

DROP TABLE AgendaContactos_Historica

DROP TABLE Pais

DROP TABLE Area

DROP TABLE SiNo

DROP TABLE Genero