CREATE TABLE AgendaContactos
(
	Id INT IDENTITY (1,1),
	ApellidoYNombre VARCHAR (50) NOT NULL,
	Genero VARCHAR (10) NOT NULL,
	Pais VARCHAR (20) NOT NULL,
	Localidad VARCHAR (20) NULL,
	ContactoInterno VARCHAR (2) NOT NULL,
	Organizacion VARCHAR (20) NULL,
	Area VARCHAR (20) NULL,
	FechaIngreso DATETIME NOT NULL,
	Activo VARCHAR (2) NOT NULL,
	Direccion VARCHAR(20) NULL,
	TelefonoFijoInterno VARCHAR(20) NULL,
	TelefonoCelular VARCHAR (20) NULL,
	Email VARCHAR (30) NOT NULL,
	CuentaSkype VARCHAR (20) NULL,

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
	ContactoInterno VARCHAR (2) NOT NULL,
	Organizacion VARCHAR (20) NULL,
	Area VARCHAR (20) NULL,
	FechaIngreso DATETIME NOT NULL,
	Activo VARCHAR (2) NOT NULL,
	Direccion VARCHAR(20) NULL,
	TelefonoFijoInterno VARCHAR(20) NULL,
	TelefonoCelular VARCHAR (20) NULL,
	Email VARCHAR (30) NOT NULL,
	CuentaSkype VARCHAR (20) NULL,

	ContactoAltaReg VARCHAR(50) NOT NULL,
    FechaAltaReg DATETIME NOT NULL,
    ContactoModifReg VARCHAR(50) NULL,
    FechaModifReg DATETIME NULL
)

--Borrar Tablas

DROP TABLE AgendaContactos

DROP TABLE AgendaContactos_Historica