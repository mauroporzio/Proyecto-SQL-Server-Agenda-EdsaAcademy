--AUN FALTA MEJORAR EL TRIGGER PORQUE SE EJECUTA EN TODAS LAS OPERACIONES DE LA MODIFICAICON DEL CONTACTO Y ESTO NO ES CORRECTO, SE VA CAMBIAR ESO.

CREATE TRIGGER [dbo].[AgendaContactos_Trigger_AgendaContactosHistorica_Insert] ON [dbo].[AgendaContactos] AFTER INSERT
AS
	BEGIN
		INSERT INTO [dbo].[AgendaContactos_Historica]
		(
			IdContacto,
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
			FechaAltaReg
		)
		SELECT
			Id,
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
			FechaAltaReg
		FROM INSERTED
	END

--//////////////////////////

--TEST TRIGGERS

	SELECT * FROM AgendaContactos

	SELECT * FROM AgendaContactos_Historica

-- DROP TRIGGER 

DROP TRIGGER IF EXISTS [dbo].[AgendaContactos_Trigger_AgendaContactosHistorica_Insert]

