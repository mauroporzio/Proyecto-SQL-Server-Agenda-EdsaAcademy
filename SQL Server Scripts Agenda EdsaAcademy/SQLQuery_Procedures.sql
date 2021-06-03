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
	@ContactoInterno VARCHAR (2),
	@Organizacion VARCHAR (20) = NULL,
	@Area VARCHAR (20) =NULL,
	@Activo VARCHAR (2),
	@Direccion VARCHAR(20) = NULL,
	@TelefonoFijoInterno VARCHAR(20) = NULL,
	@TelefonoCelular VARCHAR (20) = NULL,
	@Email VARCHAR (30),
	@CuentaSkype VARCHAR (20) = NULL,

	@ContactoAltaReg VARCHAR(50),
    @ContactoModifReg VARCHAR(50) = NULL
	

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
			FechaIngreso,
			Activo,
			Direccion,
			TelefonoFijoInterno,
			TelefonoCelular,
			Email,
			CuentaSkype,

			ContactoAltaReg,
			FechaAltaReg,
			ContactoModifReg
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
			GETDATE(),
			@Activo,
			@Direccion,
			@TelefonoFijoInterno,
			@TelefonoCelular,
			@Email,
			@CuentaSkype,

			@ContactoAltaReg,
			GETDATE(),
			@ContactoModifReg
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
	@ContactoInterno VARCHAR (2)= NULL,
	@Organizacion VARCHAR (20)= NULL,
	@Area VARCHAR (20)= NULL,
	@Activo VARCHAR (2)= NULL,
	@Direccion VARCHAR(20) = NULL,
	@TelefonoFijoInterno VARCHAR(20) = NULL,
	@TelefonoCelular VARCHAR (20) = NULL,
	@Email VARCHAR (30)= NULL,
	@CuentaSkype VARCHAR (20) = NULL,

	@ContactoModifReg VARCHAR(50)
AS
	BEGIN

		UPDATE [dbo].[AgendaContactos]

			SET ApellidoYNombre = @ApellidoYNombre
			WHERE (@ApellidoYNombre IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET Genero = @Genero
			WHERE (@Genero IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET Pais = @Pais
			WHERE (@Pais IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET Localidad = @Localidad
			WHERE (@Localidad IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET ContactoInterno = @ContactoInterno
			WHERE (@ContactoInterno IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET Organizacion = @Organizacion
			WHERE (@Organizacion IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET Area = @Area
			WHERE (@Area IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET Activo = @Activo
			WHERE (@Activo IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET Direccion = @Direccion
			WHERE (@Direccion IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET TelefonoFijoInterno = @TelefonoFijoInterno
			WHERE (@TelefonoFijoInterno IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET TelefonoCelular = @TelefonoCelular
			WHERE (@TelefonoCelular IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);
	
		UPDATE [dbo].[AgendaContactos]
			SET Email = @Email
			WHERE (@Email IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET CuentaSkype = @CuentaSkype
			WHERE (@CuentaSkype IS NOT NULL AND [dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET ContactoModifReg = @ContactoModifReg
			WHERE ([dbo].[AgendaContactos].Id = @Id);

		UPDATE [dbo].[AgendaContactos]
			SET FechaModifReg = GETDATE()
			WHERE([dbo].[AgendaContactos].Id = @Id);

	END

--////////////////////////////////

DROP PROCEDURE IF EXISTS BorrarContacto
DROP PROCEDURE IF EXISTS InsertarContacto
DROP PROCEDURE IF EXISTS EditarContacto