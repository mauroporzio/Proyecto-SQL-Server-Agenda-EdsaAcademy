CREATE PROCEDURE BorrarContacto 
	@Id INT --Recibe por parametro el id que desea borrar
AS
	BEGIN
		DELETE [dbo].[AgendaContactos] WHERE [dbo].[AgendaContactos].id = @id
	END



--////////////////////////////////

CREATE PROCEDURE InsertarContacto

	@idContacto INT = NULL OUTPUT,
	@ApellidoYNombre VARCHAR (50),
	@Genero VARCHAR (10),
	@Pais VARCHAR (20),
	@Localidad VARCHAR (20) = NULL,
	@ContactoInterno BIT,
	@Organizacion VARCHAR (20) = NULL,
	@Area VARCHAR (20) =NULL,
	@Activo BIT,
	@Direccion VARCHAR(20) = NULL,
	@TelefonoFijoInterno VARCHAR(20) = NULL,
	@TelefonoCelular VARCHAR (20) = NULL,
	@Email VARCHAR (30),
	@CuentaSkype VARCHAR (20) = NULL,

	@ContactoAltaReg VARCHAR(50)
	

AS
	BEGIN
		INSERT INTO [dbo].[AgendaContactos]
		(
			ApellidoYNombre,
			Genero,
			Pais,
			Localidad,
			ContactoInterno,
			Organizacion,
			Area,
			Activo,
			Direccion,
			TelefonoFijoInterno,
			TelefonoCelular,
			Email,
			CuentaSkype,

			ContactoAltaReg,
			FechaAltaReg
		)
		VALUES
		(	
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

			@ContactoAltaReg,
			GETDATE()
		)
		SET @idContacto = SCOPE_IDENTITY()
	END


--////////////////////////////////

CREATE PROCEDURE EditarContacto -- RECIBE POR PARAMETRO EL ID A MODIFICAR, Y UNICAMENTE LOS DATOS QUE SE MODIFICARON. (no es necesario que reciba todos los param).

	@Id INT,
	@ApellidoYNombre VARCHAR (50)= NULL,
	@Genero VARCHAR (10)= NULL,
	@Pais VARCHAR (20)= NULL,
	@Localidad VARCHAR (20) = NULL,
	@ContactoInterno BIT= NULL,
	@Organizacion VARCHAR (20)= NULL,
	@Area VARCHAR (20)= NULL,
	@Activo BIT= NULL,
	@Direccion VARCHAR(20) = NULL,
	@TelefonoFijoInterno VARCHAR(20) = NULL,
	@TelefonoCelular VARCHAR (20) = NULL,
	@Email VARCHAR (30)= NULL,
	@CuentaSkype VARCHAR (20) = NULL,

	@ContactoModifReg VARCHAR(50)
AS
	BEGIN

		UPDATE [dbo].[AgendaContactos]

			SET ApellidoYNombre = @ApellidoYNombre,
				Genero = @Genero,
				Pais = @Pais,
				ContactoInterno = @ContactoInterno,
				Localidad = @Localidad,
				Area = @Area,
				Activo = @Activo,
				Organizacion = @Organizacion,
				Direccion = @Direccion,
				TelefonoFijoInterno = @TelefonoFijoInterno,
				TelefonoCelular = @TelefonoCelular,
				Email = @Email,
				CuentaSkype = @CuentaSkype,
				ContactoModifReg = @ContactoModifReg,
				FechaModifReg = GETDATE()
			WHERE (AgendaContactos.Id = @Id)
	END

--////////////////////////////////

CREATE PROCEDURE ConsultarContacto

	@ApellidoYNombre VARCHAR (50)= NULL,
	@Pais VARCHAR (20)= NULL,
	@Localidad VARCHAR (20) = NULL,
	@ContactoInterno BIT= NULL,	
	@Organizacion VARCHAR (20)= NULL,
	@Area VARCHAR (20)= NULL,
	@Activo BIT= NULL,
	@fechaDeIngresoDesde DATETIME = NULL,
	@fechaDeIngresoHasta DATETIME = NULL
AS
	BEGIN
		SELECT 
			Id,
			ApellidoYNombre,
			Genero,
			Pais,
			Localidad,
			ContactoInterno,
			Organizacion,
			Area,
			Activo,
			Direccion,
			TelefonoFijoInterno,
			TelefonoCelular,
			Email,
			CuentaSkype,
			FechaAltaReg
		FROM [dbo].[AgendaContactos]
		WHERE (@ApellidoYNombre IS NULL OR ApellidoYNombre LIKE '%' + @ApellidoYNombre + '%') AND
			  (@Pais IS NULL OR Pais = @Pais) AND
			  (@Localidad IS NULL OR Localidad LIKE '%' + @Localidad + '%') AND
			  (@ContactoInterno IS NULL OR ContactoInterno = @ContactoInterno) AND
			  (@Organizacion IS NULL OR Organizacion LIKE '%' + @Organizacion + '%') AND
			  (@Area IS NULL OR Area = @Area) AND
			  (@Activo IS NULL OR Activo = @Activo) AND
			  (CONVERT(DATE, @fechaDeIngresoDesde) IS NULL OR CONVERT(DATE, FechaAltaReg) >= @fechaDeIngresoDesde) AND
			  (CONVERT(DATE, @fechaDeIngresoHasta) IS NULL OR CONVERT(DATE, FechaAltaReg) <= CONVERT(DATE, @fechaDeIngresoHasta))
	END

--////////////////////////////////

CREATE PROCEDURE DevolverContactoPorId
	@Id INT
AS
	BEGIN
		SELECT * FROM [dbo].[AgendaContactos] WHERE AgendaContactos.Id = @Id
	END

--////////////////////////////////

DROP PROCEDURE IF EXISTS BorrarContacto
DROP PROCEDURE IF EXISTS InsertarContacto
DROP PROCEDURE IF EXISTS EditarContacto
DROP PROCEDURE IF EXISTS ConsultarContacto
DROP PROCEDURE IF EXISTS DevolverContactoPorId