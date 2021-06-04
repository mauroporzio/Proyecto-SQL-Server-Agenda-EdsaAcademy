
--//////////////////HACER ANTES DE TESTEAR/////////////////////////

--borrar tablas completas

TRUNCATE TABLE [dbo].[AgendaContactos];
TRUNCATE TABLE [dbo].[AgendaContactos_Historica];

--////////////////////////////////////////////////////////////////



--TESTEO InsertarContacto DE LA TABLA AgendaContacto, con trigger a AgendaContactoHistorica
-- SE CARGAN PERSONAS CON ARIBUTOS SIMILARES PARA TESTEAR CUANDO HAY COINCIDENCIAS MULTIPLES, POR EJEMPLO SE FILTRA POR NOMBRE (2 RESULTADOS) Y POR PAIS (1 RESULTADO)
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
DECLARE	@CuentaSkype VARCHAR (20) = 'cuentaSkype'

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

DECLARE @idContacto3 INT
DECLARE	@ApellidoYNombre3 VARCHAR (50) ='Mauro Porzio'
DECLARE	@Genero3 VARCHAR (10) = 'Masculino'
DECLARE	@Pais3 VARCHAR (20) = 'Argentina'
DECLARE	@Localidad3 VARCHAR (20) = 	'Mar del Plata'
DECLARE	@ContactoInterno3 VARCHAR (2) = 'Si'
DECLARE	@Organizacion3 VARCHAR (20) = 'RRHH'
DECLARE	@Area3 VARCHAR (20) = 'SI'
DECLARE	@Activo3 VARCHAR (2) = 'Calle 123'
DECLARE	@Direccion3 VARCHAR(20) = 'Calle 123'
DECLARE	@TelefonoFijoInterno3 VARCHAR(20) = '121345234'
DECLARE	@TelefonoCelular3 VARCHAR (20) = '22334567'
DECLARE	@Email3 VARCHAR (30) = 'mauro@gmail.com'
DECLARE	@CuentaSkype3 VARCHAR (20) = 'cuentaSkype'

DECLARE	@ContactoAltaReg3 VARCHAR(50) = 'FuncionInsertarContactoDeC#'

EXEC InsertarContacto
	@idContacto3 OUTPUT,
	@ApellidoYNombre3,
	@Genero3,
	@Pais3,
	@Localidad3,
	@ContactoInterno3,
	@Organizacion3,
	@Area3,
	@Activo3,
	@Direccion3,
	@TelefonoFijoInterno3,
	@TelefonoCelular3,
	@Email3,
	@CuentaSkype3,
	@ContactoAltaReg3

-- UPDATE FECHA INGRESO PARA QUE SE PUEDAN PROBAR LOS FILTROS

UPDATE [dbo].[AgendaContactos]
	SET FechaAltaReg = CONVERT(DATE, '12/02/2000')
	WHERE (Id = 1);
													-- EL TRIGGER NO SE USA PORQUE NO ESTA APLICADO PARA UPDATE, SINO SOLO CON LA PROCEDURE DE EDITAR CONTACTO,
													-- QUE ES LA UNICA MANERA DE EDITAR UN CONTACTO USADA EN EL PROYECYO, NUNCA SE HARA UN UPDATE DIRECTO.
UPDATE [dbo].[AgendaContactos]
	SET FechaAltaReg = CONVERT(DATE, '06/18/2002')
	WHERE (Id = 2);

UPDATE [dbo].[AgendaContactos]
	SET FechaAltaReg = CONVERT(DATE, '11/07/2005')
	WHERE (Id = 3);

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

--PRUEBA FUNCTION ConsultaContactos sin filtros, debe retornar toda la tabla

SELECT * FROM ConsultaContactos (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)

--PRUEBA FUNCTION ConsultaContactos con filtros de nombre y por rango entre dos fechas

SELECT * FROM ConsultaContactos ('Mauro Porzio', NULL, NULL, NULL, NULL, NULL, NULL, CONVERT(DATE, '01/01/2001'), CONVERT(DATE, '01/01/2004'))

--PRUEBA PROCEDURE BorarContacto

DECLARE @IDContactoABorrar INT = 2 -- ASIGNAR EL ID QUE QUIERA PARA PROBAR BORRAR. (MIRAR LOS SELECT PARA INGRESAR NUMERO)

EXEC BorrarContacto @IDContactoABorrar

SELECT * FROM [dbo].[AgendaContactos]