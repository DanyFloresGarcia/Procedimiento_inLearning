IF EXISTS (SELECT Id FROM dbo.sysobjects WHERE Id = OBJECT_ID('Usp_Actualizar_Contacto'))
BEGIN
    DROP PROCEDURE Usp_Actualizar_Contacto
END
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC Usp_Actualizar_Contacto (
@iIdContacto BIGINT,
@iIdEmpresa BIGINT,
@vNombre NVARCHAR(200),
@vCelular NVARCHAR(20),
@vDireccion NVARCHAR(20),
@vCorreo NVARCHAR(20),
@vMensaje NVARCHAR(100) out
)
AS
BEGIN

UPDATE [Maestro].[Contacto]
   SET [IdEmpresa] = @iIdEmpresa
      ,[Nombre] = @vNombre
      ,[Celular] = @vCelular
      ,[Direccion] = @vDireccion
      ,[Correo] = @vCorreo
 WHERE  IdContacto = @iIdContacto

 SET @vMensaje = 'Se actualizó exitosamente ' + @vNombre

END
GO


