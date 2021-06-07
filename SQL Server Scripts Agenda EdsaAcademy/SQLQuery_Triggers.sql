--AUN FALTA MEJORAR EL TRIGGER PORQUE SE EJECUTA EN TODAS LAS OPERACIONES DE LA MODIFICAICON DEL CONTACTO Y ESTO NO ES CORRECTO, SE VA CAMBIAR ESO.

CREATE TRIGGER [dbo].[AgendaContactos_Trigger_AgendaContactosHistorica_Insert_Update] ON [dbo].[AgendaContactos] AFTER INSERT, UPDATE
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
			Activo,
			Direccion,
			TelefonoFijoInterno,
			TelefonoCelular,
			Email,
			CuentaSkype,

			ContactoAltaReg,
			FechaAltaReg,
			ContactoModifReg,
			FechaModifReg
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
			Activo,
			Direccion,
			TelefonoFijoInterno,
			TelefonoCelular,
			Email,
			CuentaSkype,

			ContactoAltaReg,
			FechaAltaReg,
			ContactoModifReg,
			FechaModifReg
		FROM INSERTED
	END

--//////////////////////////

-- DROP TRIGGER 

DROP TRIGGER IF EXISTS [dbo].[AgendaContactos_Trigger_AgendaContactosHistorica_Insert_Update]

