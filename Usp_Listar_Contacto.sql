IF EXISTS (SELECT Id FROM dbo.sysobjects WHERE Id = OBJECT_ID('Usp_Listar_Contacto'))
BEGIN
    DROP PROCEDURE Usp_Listar_Contacto
END
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC Usp_Listar_Contacto 
AS 
BEGIN

SELECT [IdContacto]
      ,Emp.[IdEmpresa]
	  ,Con.Codigo
	  ,Emp.Nombre [NombreEmpresa]
      ,Con.[Nombre] [NombreContacto]
      ,[Celular]
      ,Con.[Direccion]
      ,[Correo]
      ,Con.[FechaCreacion]
      ,Con.[Activo]
  FROM [Maestro].[Contacto] Con
  JOIN Maestro.Empresa Emp ON Emp.IdEmpresa = Con.IdEmpresa
  WHERE Con.Activo = 1
	ORDER BY IdContacto DESC
END
GO


