IF EXISTS (SELECT Id FROM dbo.sysobjects WHERE Id = OBJECT_ID('Usp_Registrar_Contacto'))
BEGIN
    DROP PROCEDURE Usp_Registrar_Contacto
END
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC Usp_Registrar_Contacto (
@iIdEmpresa BIGINT,
@vNombre NVARCHAR(200),
@vCelular NVARCHAR(20),
@vDireccion NVARCHAR(20),
@vCorreo NVARCHAR(20),
@vMensaje NVARCHAR(100) OUT
)
AS
BEGIN

INSERT INTO [Maestro].[Contacto] 
	(
		IdEmpresa,
		Nombre,
		Celular,
		Direccion,
		Correo,
		IdUsuarioCreador
	) 
	values 
	(
		@iIdEmpresa,
		@vNombre,
		@vCelular,
		@vDireccion,
		@vCorreo,
		1
	)

	DECLARE @iIdContacto BIGINT = (SELECT TOP 1 IdContacto FROM Maestro.Contacto ORDER BY IdContacto Desc)
	DECLARE @vCodigo VARCHAR(100) = CAST(@iIdContacto AS VARCHAR(100))
	

	UPDATE Maestro.Contacto  SET Codigo = @vCodigo WHERE IdContacto = @iIdContacto



	SET @vMensaje = 'Se registró exitosamente ' + @vNombre

END
GO