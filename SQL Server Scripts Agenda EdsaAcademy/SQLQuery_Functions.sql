CREATE FUNCTION ConsultaContactos 
(
	@ApellidoYNombre VARCHAR (50)= NULL,
	@Pais VARCHAR (20)= NULL,
	@Localidad VARCHAR (20) = NULL,
	@ContactoInterno VARCHAR (2)= NULL,				-- LLEGA POR PARAMETRO LOS VALORES DE LOS FILTROS QUE DESEO UTILIZAR.
	@Organizacion VARCHAR (20)= NULL,				-- SI RECIBE TODOS EN NULL, DEVUELVE LA AGENDA COMPLETA.
	@Area VARCHAR (20)= NULL,
	@Activo VARCHAR (2)= NULL,
	@fechaDeIngresoDesde DATETIME = NULL,
	@fechaDeIngresoHasta DATETIME = NULL
)
RETURNS @TablaResultadosConsulta TABLE
		(
			Id INT NOT NULL,
			ApellidoYNombre VARCHAR (50)NOT NULL,
			Genero VARCHAR (10) NOT NULL,
			Pais VARCHAR (20) NOT NULL,
			Localidad VARCHAR (20) NULL,
			ContactoInterno VARCHAR (2) NOT NULL,
			Organizacion VARCHAR (20) NULL,
			Area VARCHAR (20) NULL,
			FechaAltaReg DATETIME NOT NULL,
			Activo VARCHAR (2) NOT NULL,
			Direccion VARCHAR(20) NULL,
			TelefonoFijoInterno VARCHAR(20) NULL,
			TelefonoCelular VARCHAR (20) NULL,
			Email VARCHAR (30) NOT NULL,
			CuentaSkype VARCHAR (20) NULL
		)
		AS
			BEGIN
				INSERT INTO @TablaResultadosConsulta --CARGO LOS PRIMEROS VALORES CON EL PRIMER FILTRO QUE TENGA PARA LUEGO FILTRAR EL RESTO DE COSAS.
					SELECT
							[dbo].[AgendaContactos].Id,
							[dbo].[AgendaContactos].ApellidoYNombre,
							[dbo].[AgendaContactos].Genero,
							[dbo].[AgendaContactos].Pais,
							[dbo].[AgendaContactos].Localidad,
							[dbo].[AgendaContactos].ContactoInterno,
							[dbo].[AgendaContactos].Organizacion,
							[dbo].[AgendaContactos].Area,
							[dbo].[AgendaContactos].FechaAltaReg,
							[dbo].[AgendaContactos].Activo,
							[dbo].[AgendaContactos].Direccion,
							[dbo].[AgendaContactos].TelefonoFijoInterno,
							[dbo].[AgendaContactos].TelefonoCelular,
							[dbo].[AgendaContactos].Email,
							[dbo].[AgendaContactos].CuentaSkype
					FROM [dbo].[AgendaContactos]
						WHERE															-- SOLO CARGO CON EL PRIMER FILTRO QUE DE TRUE.
						(
							[dbo].[AgendaContactos].ApellidoYNombre = @ApellidoYNombre OR 
							[dbo].[AgendaContactos].Pais = @Pais OR
							[dbo].[AgendaContactos].Localidad = @Localidad OR				
							[dbo].[AgendaContactos].ContactoInterno = @ContactoInterno OR
							[dbo].[AgendaContactos].Organizacion = @Organizacion OR
							[dbo].[AgendaContactos].Area = @Area OR
							[dbo].[AgendaContactos].Activo = @Activo OR
							CONVERT(DATE,[dbo].[AgendaContactos].FechaAltaReg) >= CONVERT(DATE, @fechaDeIngresoDesde) AND @fechaDeIngresoDesde IS NOT NULL OR
							CONVERT(DATE,[dbo].[AgendaContactos].FechaAltaReg) <= CONVERT(DATE, @fechaDeIngresoHasta) AND @fechaDeIngresoHasta IS NOT NULL
						)

					INSERT INTO @TablaResultadosConsulta --SI ME LLEGO TODOS LOS FILTROS EN NULL, QUIERO DEVOLVER TODA LA AGENDA.
					SELECT
							[dbo].[AgendaContactos].Id,
							[dbo].[AgendaContactos].ApellidoYNombre,
							[dbo].[AgendaContactos].Genero,
							[dbo].[AgendaContactos].Pais,
							[dbo].[AgendaContactos].Localidad,
							[dbo].[AgendaContactos].ContactoInterno,
							[dbo].[AgendaContactos].Organizacion,
							[dbo].[AgendaContactos].Area,
							[dbo].[AgendaContactos].FechaAltaReg,
							[dbo].[AgendaContactos].Activo,
							[dbo].[AgendaContactos].Direccion,
							[dbo].[AgendaContactos].TelefonoFijoInterno,
							[dbo].[AgendaContactos].TelefonoCelular,
							[dbo].[AgendaContactos].Email,
							[dbo].[AgendaContactos].CuentaSkype
					FROM [dbo].[AgendaContactos]
						WHERE															-- CHECKEO QUE TODOS LOS VALORES FILTROS SEAN NULL
						(
							@ApellidoYNombre IS NULL AND 
							@Pais IS NULL AND 
							@Localidad IS NULL AND 				
							@ContactoInterno IS NULL AND 
							@Organizacion IS NULL AND 
							@Area IS NULL AND 
							@Activo IS NULL AND
							@fechaDeIngresoDesde IS NULL AND
							@fechaDeIngresoHasta IS NULL
						)

					DELETE @TablaResultadosConsulta													 
						WHERE (ApellidoYNombre != @ApellidoYNombre AND @ApellidoYNombre IS NOT NULL)  
																									
					DELETE @TablaResultadosConsulta
						WHERE (Pais != @Pais AND @Pais IS NOT NULL)

					DELETE @TablaResultadosConsulta
						WHERE (Localidad != @Localidad AND @Localidad IS NOT NULL)
																										-- BORRO LO QUE NO CORRESPONDE AL RESTO DE MIS FILTROS.
					DELETE @TablaResultadosConsulta
						WHERE (ContactoInterno != @ContactoInterno AND @ContactoInterno IS NOT NULL)

					DELETE @TablaResultadosConsulta
						WHERE (Organizacion != @Organizacion AND @Organizacion IS NOT NULL)

					DELETE @TablaResultadosConsulta
						WHERE (Area != @Area AND @Area IS NOT NULL)

					DELETE @TablaResultadosConsulta
						WHERE (Activo != @Activo AND @Activo IS NOT NULL)
					
					DELETE @TablaResultadosConsulta
						WHERE (CONVERT(DATE, FechaAltaReg) < CONVERT(DATE, @fechaDeIngresoDesde) AND @fechaDeIngresoDesde IS NOT NULL)

					DELETE @TablaResultadosConsulta
						WHERE (CONVERT(DATE, FechaAltaReg) > CONVERT(DATE, @fechaDeIngresoHasta) AND @fechaDeIngresoHasta IS NOT NULL)

					RETURN  -- RETORNO LA TABLA CON LOS RESULTADOS DEL FILTRADO.
			END
		GO

--/////////////////////////////////

--DROP FUNCTIONS

DROP FUNCTION IF EXISTS ConsultaContactos