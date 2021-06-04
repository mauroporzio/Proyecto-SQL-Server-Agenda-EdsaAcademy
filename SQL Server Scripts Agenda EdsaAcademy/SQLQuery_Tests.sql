
--//////////////////HACER ANTES DE TESTEAR/////////////////////////

--borrar tablas completas

TRUNCATE TABLE [dbo].[AgendaContactos];
TRUNCATE TABLE [dbo].[AgendaContactos_Historica];

--////////////////////////////////////////////////////////////////



--TESTEO InsertarContacto DE LA TABLA AgendaContacto, con trigger a AgendaContactoHistorica
DECLARE @idContacto INT
DECLARE	@ApellidoYNombre VARCHAR (50) ='Mauro Porzio'
DECLARE	@Genero VARCHAR (10) = 'Masculino'
DECLARE	@Pais VARCHAR (20) = 'Argentina'
DECLARE	@Localidad VARCHAR (20) = 	'Mar del Plata'
DECLARE	@ContactoInterno VARCHAR (2) = 'Si'
DECLARE	@Organizacion VARCHAR (20) = 'RRHH'
DECLARE	@Area VARCHAR (20) = 'SI'
DECLARE	@Activo VARCHAR (2) = 'Calle 123'
DECLARE	@Direccion VARCHAR(20) = 'Calle 123'
DECLARE	@TelefonoFijoInterno VARCHAR(20) = '121345234'
DECLARE	@TelefonoCelular VARCHAR (20) = '22334567'
DECLARE	@Email VARCHAR (30) = 'mauro@gmail.com'
DECLARE	@CuentaSkype VARCHAR (20) = 'EditarContacto'

DECLARE	@ContactoAltaReg VARCHAR(50) = 'FuncionInsertarContactoDeC#'

EXEC InsertarContacto
	@idContacto OUTPUT,
	@ApellidoYNombre,
	@Genero,
	@Pais,
	@Localidad,
	@ContactoInterno,
	@Organizacion,
	@Area,
	@Activo,
	@Direccion,
	@TelefonoFijoInterno,
	@TelefonoCelular,
	@Email,
	@CuentaSkype,
	@ContactoAltaReg

DECLARE @idContacto2 INT
DECLARE	@ApellidoYNombre2 VARCHAR (50) ='Mauro Porzio'
DECLARE	@Genero2 VARCHAR (10) = 'Masculino'
DECLARE	@Pais2 VARCHAR (20) = 'Argentina'
DECLARE	@Localidad2 VARCHAR (20) = 	'Buenos Aires' --PARAM DISTINTO PARA PROBAR LA CONSULTA POR FILTRO
DECLARE	@ContactoInterno2 VARCHAR (2) = 'Si'
DECLARE	@Organizacion2 VARCHAR (20) = 'RRHH'
DECLARE	@Area2 VARCHAR (20) = 'SI'
DECLARE	@Activo2 VARCHAR (2) = 'Calle 123'
DECLARE	@Direccion2 VARCHAR(20) = 'Calle 123'
DECLARE	@TelefonoFijoInterno2 VARCHAR(20) = '1233453645'
DECLARE	@TelefonoCelular2 VARCHAR (20) =  '22334567'
DECLARE	@Email2 VARCHAR (30) ='mauro@gmail.com'
DECLARE	@CuentaSkype2 VARCHAR (20) = 'mauroporzioSkype'

DECLARE	@ContactoAltaReg2 VARCHAR(50) = 'FuncionInsertarContactoDeC#'

EXEC InsertarContacto
	@idContacto2 OUTPUT,
	@ApellidoYNombre2,
	@Genero2,
	@Pais2,
	@Localidad2,
	@ContactoInterno2,
	@Organizacion2,
	@Area2,
	@Activo2,
	@Direccion2,
	@TelefonoFijoInterno2,
	@TelefonoCelular2,
	@Email2,
	@CuentaSkype2,
	@ContactoAltaReg2

--MOSTRAR LAS DOS TABLAS COMPLETAS DESPUES DE LOS INSERT

SELECT * FROM [dbo].[AgendaContactos]
SELECT * FROM [dbo].[AgendaContactos_Historica] --SE CARGA POR TRIGGER

-- PRUEBA Procedure EditarContacto

DECLARE @IdContactoAEditar INT = 2 -- ASIGNAR EL ID QUE QUIERA PARA PROBAR EDITAR. (MIRAR LOS SELECT PARA INGRESAR NUMERO)
DECLARE @PaisNuevo VARCHAR (50) = 'Chile'
DECLARE @ContactoModifReg VARCHAR (50)= 'FuncionDeEditarContactoEnC#'

EXEC EditarContacto @IdContactoAEditar, NULL, NULL, @PaisNuevo ,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @ContactoModifReg

--MOSTRAR LAS DOS TABLAS COMPLETAS DESPUES DEL UPDATE

SELECT * FROM [dbo].[AgendaContactos]
SELECT * FROM [dbo].[AgendaContactos_Historica] --SE CARGA POR LA FUNCION DEL UPDATE QUE FUNCIONA SIMILAR A UN TRIGGER.

--PRUEBA FUNCTION ConsultaContactos

SELECT * FROM ConsultaContactos ('Mauro Porzio',  'Chile', NULL,NULL, NULL, NULL, NULL)

--PRUEBA PROCEDURE BorarContacto

DECLARE @IDContactoABorrar INT = 2 -- ASIGNAR EL ID QUE QUIERA PARA PROBAR BORRAR. (MIRAR LOS SELECT PARA INGRESAR NUMERO)

EXEC BorrarContacto @IDContactoABorrar

SELECT * FROM [dbo].[AgendaContactos]