
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
DECLARE	@ContactoInterno BIT = 1
DECLARE	@Organizacion VARCHAR (20) = NULL
DECLARE	@Area VARCHAR (20) = 'Operaciones'
DECLARE	@Activo BIT = 1
DECLARE	@Direccion VARCHAR(20) = 'Calle 123'
DECLARE	@TelefonoFijoInterno VARCHAR(20) = '121345234'
DECLARE	@TelefonoCelular VARCHAR (20) = '22334567'
DECLARE	@Email VARCHAR (30) = 'mauro@gmail.com'
DECLARE	@CuentaSkype VARCHAR (20) = 'porzioMauro'
DECLARE @Cuil VARCHAR (20) = '20-12342354-7'

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
	@Cuil,
	@ContactoAltaReg


DECLARE @idContacto2 INT
DECLARE	@ApellidoYNombre2 VARCHAR (50) ='Maria Benitez'
DECLARE	@Genero2 VARCHAR (10) = 'Femenino'
DECLARE	@Pais2 VARCHAR (20) = 'Argentina'
DECLARE	@Localidad2 VARCHAR (20) = 	'Buenos Aires' --PARAM DISTINTO PARA PROBAR LA CONSULTA POR FILTRO
DECLARE	@ContactoInterno2 BIT = 0
DECLARE	@Organizacion2 VARCHAR (20) = 'Empresa s.a'
DECLARE	@Area2 VARCHAR (20) = NULL
DECLARE	@Activo2 BIT = 0
DECLARE	@Direccion2 VARCHAR(20) = 'Calle 3645'
DECLARE	@TelefonoFijoInterno2 VARCHAR(20) = NULL
DECLARE	@TelefonoCelular2 VARCHAR (20) =  '22334567'
DECLARE	@Email2 VARCHAR (30) ='mariaBenitez@gmail.com'
DECLARE	@CuentaSkype2 VARCHAR (20) = 'mariaBenitez'
DECLARE @Cuil2 VARCHAR (20) = '27-13245568-6'

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
	@Cuil2,
	@ContactoAltaReg2

DECLARE @idContacto3 INT
DECLARE	@ApellidoYNombre3 VARCHAR (50) ='Juan Perez'
DECLARE	@Genero3 VARCHAR (10) = 'Masculino'
DECLARE	@Pais3 VARCHAR (20) = 'Chile'
DECLARE	@Localidad3 VARCHAR (20) = 	'Santiago de Chile'
DECLARE	@ContactoInterno3 BIT = 1
DECLARE	@Organizacion3 VARCHAR (20) = NULL
DECLARE	@Area3 VARCHAR (20) = 'RRHH'
DECLARE	@Activo3 BIT = 1
DECLARE	@Direccion3 VARCHAR(20) = 'Calle 6543'
DECLARE	@TelefonoFijoInterno3 VARCHAR(20) = '121345234'
DECLARE	@TelefonoCelular3 VARCHAR (20) = NULL
DECLARE	@Email3 VARCHAR (30) = 'juanPerez@gmail.com'
DECLARE	@CuentaSkype3 VARCHAR (20) = 'juanPerez'
DECLARE @Cuil3 VARCHAR (20) = '20-13454356-5'

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
	@Cuil3,
	@ContactoAltaReg3

DECLARE @idContacto4 INT

EXEC InsertarContacto
	@idContacto4 OUTPUT,
	'Luna Torres',
	'Femenino',
	'Brasil',
	'Rio de Janeiro',
	0,
	'Empresa SRL',
	NULL,
	0,
	'Calle 567',
	NULL,
	'145786454',
	'lunaTorres@hotmail.com',
	'lunaTorres1',
	'27-123542455-2',
	'insertarContacto'

DECLARE @idContacto5 INT

EXEC InsertarContacto
	@idContacto5 OUTPUT,
	'Agustin Ponce',
	'Masculino',
	'Colombia',
	'Bogota',
	0,
	'Empresa2 SRL',
	NULL,
	0,
	'Calle 778',
	NULL,
	'165734633',
	'agustinPonce@hotmail.com',
	'agustinPonce123',
	'20-23453454-8',
	'insertarContacto'

DECLARE @idContacto6 INT

EXEC InsertarContacto
	@idContacto6 OUTPUT,
	'Pablo Arias',
	'Masculino',
	'Argentina',
	'Rosario',
	0,
	'Empresa3 SRL',
	NULL,
	0,
	'Calle 7856',
	NULL,
	'134568784',
	'pabloArias@outlook.com',
	'pabloArias111',
	'20-12344565-6',
	'insertarContacto'

DECLARE @idContacto7 INT

EXEC InsertarContacto
	@idContacto7 OUTPUT,
	'Delfina Tassone',
	'Femenino',
	'Argentina',
	'Buenos Aires',
	1,
	NULL,
	'Finanzas',
	1,
	'Calle 6754',
	'44567551',
	'134568784',
	'tassoneDelfina@outlook.com',
	'delfinaTassone555',
	'27-12342345-9',
	'insertarContacto'

-- UPDATE FECHA INGRESO PARA QUE SE PUEDAN PROBAR LOS FILTROS

UPDATE [dbo].[AgendaContactos]
	SET FechaAltaReg = CONVERT(DATE, '12/02/2000')
	WHERE (Id = 1);
UPDATE [dbo].[AgendaContactos]
	SET FechaAltaReg = CONVERT(DATE, '06/18/2002')
	WHERE (Id = 2);

UPDATE [dbo].[AgendaContactos]
	SET FechaAltaReg = CONVERT(DATE, '11/07/2005')
	WHERE (Id = 3);

UPDATE [dbo].[AgendaContactos]
	SET FechaAltaReg = CONVERT(DATE, '08/03/2019')
	WHERE (Id = 4);

--MOSTRAR LAS DOS TABLAS COMPLETAS DESPUES DE LOS INSERT

SELECT * FROM [dbo].[AgendaContactos]
SELECT * FROM [dbo].[AgendaContactos_Historica] --SE CARGA POR TRIGGER

-- PRUEBA Procedure EditarContacto

DECLARE @IdContactoAEditar INT = 2 -- ASIGNAR EL ID QUE QUIERA PARA PROBAR EDITAR. (MIRAR LOS SELECT PARA INGRESAR NUMERO)
DECLARE @PaisNuevo VARCHAR (50) = 'Brasil'
DECLARE @ContactoModifReg VARCHAR (50)= 'FuncionDeEditarContactoEnC#'

EXEC EditarContacto @IdContactoAEditar, NULL, NULL, @PaisNuevo ,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,@ContactoModifReg

--MOSTRAR LAS DOS TABLAS COMPLETAS DESPUES DEL UPDATE

SELECT * FROM [dbo].[AgendaContactos]
SELECT * FROM [dbo].[AgendaContactos_Historica] --SE CARGA POR LA FUNCION DEL UPDATE QUE FUNCIONA SIMILAR A UN TRIGGER.

--PRUEBA Procedure ConsultaContactos sin filtros, debe retornar toda la tabla

EXEC ConsultarContacto 

--PRUEBA Procedure ConsultarContacto con filtros de nombre y por rango entre dos fechas

DECLARE @fechaDesde DATE = CONVERT(DATE, '01/01/2001')
DECLARE @fechaHasta DATE = CONVERT(DATE, '01/01/2004')

EXEC ConsultarContacto NULL, NULL, NULL, NULL, NULL, NULL, NULL, @fechaDesde, @fechaHasta

--PRUEBA PROCEDURE BorarContacto

DECLARE @IDContactoABorrar INT = 2 -- ASIGNAR EL ID QUE QUIERA PARA PROBAR BORRAR. (MIRAR LOS SELECT PARA INGRESAR NUMERO)

EXEC BorrarContacto @IDContactoABorrar

SELECT * FROM [dbo].[AgendaContactos]

-- PRUEBA procedure DevolverContactoPorId

DECLARE @IdBuscar INT = 1

EXEC DevolverContactoPorId @IdBuscar