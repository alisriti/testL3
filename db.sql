
USE [master]
GO
/****** Object:  Database [testl3]    Script Date: 29/03/2023 22:30:06 ******/
DROP DATABASE [testl3]
GO
/****** Object:  Database [testl3]    Script Date: 29/03/2023 22:30:06 ******/
CREATE DATABASE [testl3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testl3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL\MSSQL\DATA\testl3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testl3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL\MSSQL\DATA\testl3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testl3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testl3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testl3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testl3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testl3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testl3] SET ARITHABORT OFF 
GO
ALTER DATABASE [testl3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testl3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testl3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testl3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testl3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testl3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testl3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testl3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testl3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testl3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testl3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testl3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testl3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testl3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testl3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testl3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testl3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testl3] SET RECOVERY FULL 
GO
ALTER DATABASE [testl3] SET  MULTI_USER 
GO
ALTER DATABASE [testl3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testl3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testl3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testl3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'testl3', N'ON'
GO
USE [testl3]
GO
/****** Object:  Table [dbo].[DEPARTEMENTS]    Script Date: 29/03/2023 22:30:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTEMENTS](
	[Code] [varchar](8) NOT NULL,
	[Faculte] [varchar](8) NOT NULL,
	[Nom] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DEPARTEMENTS] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACULTES]    Script Date: 29/03/2023 22:30:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACULTES](
	[Id] [varchar](8) NOT NULL,
	[Libelle] [varchar](250) NOT NULL,
 CONSTRAINT [PK_FACULTES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVENTAIRE]    Script Date: 29/03/2023 22:30:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVENTAIRE](
	[Numero] [int] NOT NULL,
	[Designation] [varchar](200) NOT NULL,
	[Prix] [decimal](18, 2) NOT NULL,
	[Quantite] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DAGS', N'ISTAPS', N'Département d''Administration et Gestion sportive')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DARCH', N'FST', N'Département d''Architecture')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DCI', N'FST', N'Département de Chimie Industrielle')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DD', N'FDSP', N'Département de Droit ')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DEM', N'ISTAPS', N'Département d''Education Motrice')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DES', N'ISTAPS', N'Département d''Entraînement Sportif')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DGCH', N'FST', N'Département de Génie Civil et Hydraulique')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DGE', N'FST', N'Département de Génie Electrique')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DGM', N'FST', N'Département de Génie Mécanique')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DIINF', N'FSESNV', N'Département d''Informatique')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DLLA', N'FLL', N'Département des Lettres et Langues Arabe')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DLLE', N'FLL', N'Département des Lettres et Langues Etrangères')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DM', N'FSESNV', N'Département de Mathématiques')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSA', N'FSESNV', N'Département des Sciences Agricoles')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSC', N'FSECSG', N'Département des Sciences Commerciales')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSE', N'FSECSG', N'Département des Sciences Economiques')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSG', N'FSECSG', N'Département des Sciences de Gestion')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSH', N'FSHS', N'Département des Sciences Humaines')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSM', N'FSESNV', N'Département des Sciences de la Matière')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSNV', N'FSESNV', N'Département des Sciences de la Nature et de la Vie')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSP', N'FDSP', N'Département des Sciences Politiques')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSS', N'FSHS', N'Département des Sciences Sociales')
GO
INSERT [dbo].[DEPARTEMENTS] ([Code], [Faculte], [Nom]) VALUES (N'DSTU', N'FSESNV', N'Département des Sciences de la Terre et de l''Univers')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'FDSP', N'Faculté de Droit et des Sciences Politiques')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'FLL', N'Faculté des Lettres et Langues')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'FSECSG', N'Faculté des Sciences économiques, Commerciales et Sciences de Gestion')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'FSESNV', N'Faculté des Sciences Exactes, sciences de la Nature et de la Vie')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'FSHS', N'Faculté des Sciences Humaines et Sociales')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'FST', N'Faculté des Sciences et de la Technologie')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'ISTAPS', N'Institut des Sciences et Technologie des Activités Physiques et sportives')
GO
INSERT [dbo].[FACULTES] ([Id], [Libelle]) VALUES (N'RCT', N'Rectorat')
GO
ALTER TABLE [dbo].[DEPARTEMENTS]  WITH CHECK ADD  CONSTRAINT [FK_DEPARTEMENTS_FACULTES] FOREIGN KEY([Faculte])
REFERENCES [dbo].[FACULTES] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DEPARTEMENTS] CHECK CONSTRAINT [FK_DEPARTEMENTS_FACULTES]
GO
USE [master]
GO
ALTER DATABASE [testl3] SET  READ_WRITE 
GO
