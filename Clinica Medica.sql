USE [master]
GO
/****** Object:  Database [Clinica_medica]    Script Date: 5/13/2025 4:24:08 PM ******/
CREATE DATABASE [Clinica_medica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinica_medica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Clinica_medica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Clinica_medica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Clinica_medica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Clinica_medica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinica_medica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinica_medica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinica_medica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinica_medica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinica_medica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinica_medica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinica_medica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinica_medica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinica_medica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica_medica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinica_medica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinica_medica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinica_medica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinica_medica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinica_medica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinica_medica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinica_medica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinica_medica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinica_medica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinica_medica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinica_medica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinica_medica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinica_medica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinica_medica] SET RECOVERY FULL 
GO
ALTER DATABASE [Clinica_medica] SET  MULTI_USER 
GO
ALTER DATABASE [Clinica_medica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinica_medica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinica_medica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinica_medica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Clinica_medica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clinica_medica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Clinica_medica', N'ON'
GO
ALTER DATABASE [Clinica_medica] SET QUERY_STORE = ON
GO
ALTER DATABASE [Clinica_medica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Clinica_medica]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 5/13/2025 4:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[IdPaciente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimientos] [date] NOT NULL,
	[Genero] [nchar](1) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 5/13/2025 4:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[IdMedicos] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Especialidad] [varchar](50) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[IdMedicos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 5/13/2025 4:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulta](
	[IdConsultas] [int] NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdMedico] [int] NOT NULL,
	[FechaConsulta] [datetime] NOT NULL,
	[Motivo] [varchar](255) NOT NULL,
	[Diagnostico] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Consulta] PRIMARY KEY CLUSTERED 
(
	[IdConsultas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_ConsultasPacientes]    Script Date: 5/13/2025 4:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_ConsultasPacientes]
AS
SELECT dbo.Medicos.Nombre, dbo.Consulta.FechaConsulta, dbo.Consulta.Motivo, dbo.Pacientes.Nombre AS Expr1
FROM   dbo.Consulta INNER JOIN
             dbo.Medicos ON dbo.Consulta.IdMedico = dbo.Medicos.IdMedicos INNER JOIN
             dbo.Pacientes ON dbo.Consulta.IdPaciente = dbo.Pacientes.IdPaciente
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 5/13/2025 4:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] NOT NULL,
	[IdConsulta] [int] NOT NULL,
	[Medicamento] [varchar](100) NOT NULL,
	[Dosis] [varchar](50) NOT NULL,
	[Indicaciones] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_ConsultaReceta]    Script Date: 5/13/2025 4:24:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_ConsultaReceta]
AS
SELECT dbo.Receta.Indicaciones, dbo.Medicos.Especialidad, dbo.Consulta.FechaConsulta, dbo.Medicos.Nombre
FROM   dbo.Consulta INNER JOIN
             dbo.Medicos ON dbo.Consulta.IdMedico = dbo.Medicos.IdMedicos INNER JOIN
             dbo.Receta ON dbo.Consulta.IdConsultas = dbo.Receta.IdConsulta
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Medicos] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medicos] ([IdMedicos])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Medicos]
GO
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Pacientes]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Consulta] FOREIGN KEY([IdConsulta])
REFERENCES [dbo].[Consulta] ([IdConsultas])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Consulta]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Consulta"
            Begin Extent = 
               Top = 30
               Left = 522
               Bottom = 227
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Medicos"
            Begin Extent = 
               Top = 29
               Left = 234
               Bottom = 226
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Receta"
            Begin Extent = 
               Top = 32
               Left = 813
               Bottom = 229
               Right = 1035
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista_ConsultaReceta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista_ConsultaReceta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Consulta"
            Begin Extent = 
               Top = 55
               Left = 485
               Bottom = 252
               Right = 707
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Medicos"
            Begin Extent = 
               Top = 43
               Left = 106
               Bottom = 240
               Right = 328
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pacientes"
            Begin Extent = 
               Top = 55
               Left = 865
               Bottom = 254
               Right = 1179
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista_ConsultasPacientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista_ConsultasPacientes'
GO
USE [master]
GO
ALTER DATABASE [Clinica_medica] SET  READ_WRITE 
GO
