IF EXISTS (SELECT Id FROM dbo.sysobjects WHERE Id = OBJECT_ID('Usp_Eliminar_Contacto'))
BEGIN
    DROP PROCEDURE Usp_Eliminar_Contacto
END
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC Usp_Eliminar_Contacto (
@iIdContacto BIGINT,
@iIdUsuario BIGINT,
@vMensaje NVARCHAR(100) out
)
AS
BEGIN
UPDATE [Maestro].[Contacto] SET Activo = 0, IdUsuarioEliminador = @iIdUsuario, FechaEliminacion = GETDATE()
      WHERE IdContacto = @iIdContacto

	  DECLARE @vNombre VARCHAR(100) = (SELECT Nombre FROM Maestro.Contacto where IdContacto = @iIdContacto)

	  SET @vMensaje = 'Se elimino exitosamente el contacto ' + @vNombre 
END
GO


