CREATE DATABASE Prueba
GO

USE Prueba 
GO

CREATE SCHEMA [Maestro]

IF EXISTS (SELECT Id FROM dbo.sysobjects WHERE Id = OBJECT_ID('[Maestro].[Empresa]'))
BEGIN
    DROP TABLE [Maestro].[Empresa]
END
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Maestro].[Empresa]
(
	IdEmpresa BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	Nombre NVARCHAR(200) NOT NULL,
	RUC NVARCHAR(20) NOT NULL,
	Direccion NVARCHAR(200),
	Activo BIT DEFAULT 1 NOT NULL,
	FechaCreacion DATETIME DEFAULT GETDATE() NOT NULL,
	IdUsuarioCreador BIGINT
)
GO

INSERT INTO Maestro.Empresa (Nombre, RUC, Direccion, IdUsuarioCreador) VALUES ('MOVISTAR', '6456165165', 'AV JAVIER PRADO 1200', 1)
GO
INSERT INTO Maestro.Empresa (Nombre, RUC, Direccion, IdUsuarioCreador) VALUES ('ENTEL', '9845649888', 'AV 28 DE JULIO 852', 1)
GO
INSERT INTO Maestro.Empresa (Nombre, RUC, Direccion, IdUsuarioCreador) VALUES ('CLARO', '232655962', 'AV LIMA 956', 1)
GO

IF EXISTS (SELECT Id FROM dbo.sysobjects WHERE Id = OBJECT_ID('[Maestro].[Contacto]'))
BEGIN
    DROP TABLE [Maestro].[Contacto]
END
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Maestro].[Contacto]
(
	IdContacto BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	Codigo VARCHAR(200),
	IdEmpresa BIGINT NOT NULL,
	Nombre NVARCHAR(100) NOT NULL,
	Celular NVARCHAR(20) NOT NULL,
	Direccion NVARCHAR(100),
	Correo NVARCHAR(100),
	IdUsuarioCreador BIGINT,
	FechaCreacion DATETIME DEFAULT GETDATE(),
	Activo BIT DEFAULT 1 NOT NULL,
	IdUsuarioEliminador BIGINT,
	FechaEliminacion DATETIME,
	CONSTRAINT Fk_IdEmpresa FOREIGN KEY(IdEmpresa) REFERENCES Maestro.Empresa (IdEmpresa)
)
GO

INSERT INTO Maestro.[Contacto] (Codigo, IdEmpresa, Nombre, Celular, Direccion, Correo, IdUsuarioCreador) 
VALUES ('1', 1, 'NESTOR VILLEGAS', '994152366', 'AV LARCO 215','nestorvillegas@gmail.com', 1)
GO



