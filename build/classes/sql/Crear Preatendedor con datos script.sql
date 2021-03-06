USE [master]
GO
/****** Object:  Database [PREATENDEDOR]    Script Date: 26/05/2018 0:18:04 ******/
CREATE DATABASE [PREATENDEDOR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PREATENDEDOR', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PREATENDEDOR.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PREATENDEDOR_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PREATENDEDOR_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PREATENDEDOR] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PREATENDEDOR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PREATENDEDOR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET ARITHABORT OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PREATENDEDOR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PREATENDEDOR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PREATENDEDOR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PREATENDEDOR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PREATENDEDOR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PREATENDEDOR] SET  MULTI_USER 
GO
ALTER DATABASE [PREATENDEDOR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PREATENDEDOR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PREATENDEDOR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PREATENDEDOR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PREATENDEDOR]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 26/05/2018 0:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administradores](
	[usuario] [varchar](50) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 26/05/2018 0:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bitacora](
	[fecha] [datetime] NOT NULL,
	[accion] [varchar](50) NOT NULL,
	[tipo_persona] [varchar](50) NOT NULL,
	[tipo_documento] [varchar](50) NOT NULL,
	[numero_documento] [varchar](50) NOT NULL,
	[id_tramite] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gestion]    Script Date: 26/05/2018 0:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_apel] [varchar](100) NULL,
	[tramite] [varchar](100) NULL,
	[fecha_y_hora] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TIPO_TRAMITE]    Script Date: 26/05/2018 0:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIPO_TRAMITE](
	[ID] [int] NOT NULL,
	[TIPO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TIPO_TRAMITE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRAMITE]    Script Date: 26/05/2018 0:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRAMITE](
	[ID] [int] NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[DESCRIPCION] [text] NOT NULL,
	[ID_VENTANILLA] [int] NOT NULL,
	[ID_TIPO_TRAMITE] [int] NOT NULL,
 CONSTRAINT [PK_TRAMITE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_gestion]    Script Date: 26/05/2018 0:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario_gestion](
	[usuario] [varchar](50) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VENTANILLA]    Script Date: 26/05/2018 0:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VENTANILLA](
	[ID] [int] NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[HORARIO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VENTANILLA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Administradores] ([usuario], [password]) VALUES (N'ale', N'd8578edf8458ce06fbc5bb76a58c5ca4')
INSERT [dbo].[Administradores] ([usuario], [password]) VALUES (N'Gatito', N'52b0b3d5fb674765ec1003503f5a4720')
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4000246B1 AS DateTime), N'LOGIN', N'OTRO', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400026A19 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400028764 AS DateTime), N'LOGIN', N'OTRO', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40002A40F AS DateTime), N'LOGIN', N'ALUMNO', N'PAS', N'11111111', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40002B762 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40003259B AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400058112 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400068C85 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40006982C AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 2)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40006AB1E AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 7)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40006CF0C AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40006E60F AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400074768 AS DateTime), N'TRAMITE', N'NO-DOCENTE', N'DNI', N'11222555', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40009EFF0 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400105E3B AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400124803 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4001312BC AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E400E3B17F AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40124A0E7 AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401253BDD AS DateTime), N'TRAMITE', N'NO-DOCENTE', N'DNI', N'11222555', 16)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401289E75 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4012B3F49 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4012EC1FF AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4013003C9 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401329CE6 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 11)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40132AA13 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 5)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40133062F AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401334F36 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401464614 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4014CA0D3 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4014E667D AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E4015089F5 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40150D17D AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40150DA03 AS DateTime), N'TRAMITE', N'NO-DOCENTE', N'DNI', N'11222555', 16)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401547082 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40159D94C AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401838BE0 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E401849FEC AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E40189286F AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5001CF3E6 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5001D7E34 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 10)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5001DD53E AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5001DFFAD AS DateTime), N'TRAMITE', N'DOCENTE', N'DNI', N'11222444', 13)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5001E119E AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5001E14D7 AS DateTime), N'TRAMITE', N'NO-DOCENTE', N'DNI', N'11222555', 16)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500210519 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500211ED7 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002121F0 AS DateTime), N'TRAMITE', N'DOCENTE', N'DNI', N'11222444', 8)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002DDC81 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002EC8F4 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002F212C AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002F53A6 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002F83BF AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002FADF3 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5002FC817 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003011FB AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500318E6A AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50032279E AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500327F9F AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50032852F AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 7)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50032F7A8 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 7)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500331C85 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003376A7 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50038BB83 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003A3705 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003A4F40 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003A52C4 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003AF85B AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003B483F AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003B6B20 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003BC8CC AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003C355E AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003C37CE AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003C3B24 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003C3E21 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003C6D2C AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003C91AC AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 7)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003CCA64 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003D3E35 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003D9CA1 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003DFF52 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003F30B7 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003F3AE0 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003F6EF3 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003FBDA5 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5003FE965 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500402E24 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500403263 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 10)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5004040CC AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 13)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500405020 AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5004053F0 AS DateTime), N'TRAMITE', N'NO-DOCENTE', N'DNI', N'11222555', 16)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500E7E18B AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500E7F681 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500E7FA15 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500E8454E AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500E84772 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EB168F AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EB3886 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EB3BFC AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EBA7FA AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
GO
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EBAFA0 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EC7CE6 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500ECF69E AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500ECF90F AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500ED4BA5 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500ED5056 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EDD5B7 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EE2180 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500EE2370 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F04C46 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F05051 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F22C6C AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F22EE7 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F3E0F1 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F3E3A9 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F43E99 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F44247 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F4A594 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F4A7B4 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F4F200 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F4F3A4 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F7F49E AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F7F7A9 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F95499 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F957F2 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 2)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F9C285 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500F9C581 AS DateTime), N'TRAMITE', N'DOCENTE', N'DNI', N'11222444', 8)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500FB7EB4 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500FB8101 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500FD5CC1 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500FD5F85 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500FEF4C5 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E500FEF8ED AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5010059ED AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50100768E AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501008306 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 5)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501033356 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5010336DD AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 11)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50113FB8F AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501140153 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501141551 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501158521 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011588CA AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501163E73 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011640BE AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 12)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50118C624 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E50118C978 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 2)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501193064 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E501193373 AS DateTime), N'TRAMITE', N'DOCENTE', N'DNI', N'11222444', 8)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011DB2DE AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011DC410 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011DD3BE AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 5)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011E1B03 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011E2025 AS DateTime), N'TRAMITE', N'DOCENTE', N'DNI', N'11222444', 15)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5015A7BF6 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E801500650 AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E8015009ED AS DateTime), N'TRAMITE', N'NO-DOCENTE', N'DNI', N'11222555', 16)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E801502504 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E8015027C4 AS DateTime), N'TRAMITE', N'DOCENTE', N'DNI', N'11222444', 13)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E80150348C AS DateTime), N'TRAMITE', N'DOCENTE', N'DNI', N'11222444', 8)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E801582666 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E801585045 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E80158553B AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 10)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E80158E334 AS DateTime), N'LOGIN', N'NO-DOCENTE', N'DNI', N'11222555', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E80158E82D AS DateTime), N'TRAMITE', N'NO-DOCENTE', N'DNI', N'11222555', 16)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E80159112E AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8EB00040FC3 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8EB0004172E AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 17)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8EB0013A7CC AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8EB0014F908 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8EB00156AEA AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8EB00158699 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8EB00168C83 AS DateTime), N'LOGIN', N'DOCENTE', N'DNI', N'11222444', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011B3AE8 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011C65D7 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011C7BC5 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E5011C8380 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E801443296 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E801448627 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E8014B6FD2 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E8014BE8F1 AS DateTime), N'TRAMITE', N'OTRO', N'NO APLICA', N'NO INGRESO', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E8014CE2E2 AS DateTime), N'LOGIN', N'ALUMNO', N'DNI', N'11222333', 0)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E8014D19B2 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[bitacora] ([fecha], [accion], [tipo_persona], [tipo_documento], [numero_documento], [id_tramite]) VALUES (CAST(0x0000A8E8014D69E1 AS DateTime), N'TRAMITE', N'ALUMNO', N'DNI', N'11222333', 1)
INSERT [dbo].[TIPO_TRAMITE] ([ID], [TIPO]) VALUES (1, N'ALUMNO')
INSERT [dbo].[TIPO_TRAMITE] ([ID], [TIPO]) VALUES (2, N'DOCENTE')
INSERT [dbo].[TIPO_TRAMITE] ([ID], [TIPO]) VALUES (3, N'ALUMNO_DOCENTE')
INSERT [dbo].[TIPO_TRAMITE] ([ID], [TIPO]) VALUES (4, N'NO-DOCENTE')
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (1, N'Legalización programa', N'c cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis.', 4, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (2, N'Actualización de datos de alumno', N'Lorem ipsum ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 4, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (3, N'Entrega documentacion ingresante CIU', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 3, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (4, N'Reestablecimiento de claves', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 3, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (5, N'Cambios de comisión', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 3, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (6, N'Solicitud cert Alumno regular', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 3, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (7, N'Solicitud de analítico parcial', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 3, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (8, N'Actas docentes', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 2, 2)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (9, N'Solicitud de llaves y marcadores', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis.', 2, 2)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (10, N'Baja a materias', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis.', 4, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (11, N'Cambio de plan, de carrera', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis..', 4, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (12, N'Equivalencias internas', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis.', 1, 3)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (13, N'Equivalencias externas', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis.', 1, 3)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (14, N'Solicitud de título', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consequat tincidunt leo. In hac habitasse platea dictumst. Vestibulum a enim nec nunc cursus dignissim. Etiam quis urna ante. Morbi a augue dui. Vestibulum fermentum tristique convallis. Quisque suscipit elit tellus. Mauris nec pellentesque quam, ut lacinia turpis.', 4, 1)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (15, N'Solicitud de aulas', N'Se presentará el docente acreditando su identidad para solicitar el aula. Previamente completará un formulario t38', 1, 2)
INSERT [dbo].[TRAMITE] ([ID], [NOMBRE], [DESCRIPCION], [ID_VENTANILLA], [ID_TIPO_TRAMITE]) VALUES (16, N'Solicitud liquidación de sueldo', N'Ir a la ventanilla Departamentos y pedir la liquidación.', 5, 4)
INSERT [dbo].[usuario_gestion] ([usuario], [password]) VALUES (N'cambria', N'2b983ba84f7bb1ec5db809464a89bee2')
INSERT [dbo].[usuario_gestion] ([usuario], [password]) VALUES (N'ale', N'd8578edf8458ce06fbc5bb76a58c5ca4')
INSERT [dbo].[VENTANILLA] ([ID], [NOMBRE], [HORARIO]) VALUES (1, N'Mesa de entrada', N'Lun a Vier 9-20 hs')
INSERT [dbo].[VENTANILLA] ([ID], [NOMBRE], [HORARIO]) VALUES (2, N'Aulas y profesores', N'Lun a Vier 8-19 hs')
INSERT [dbo].[VENTANILLA] ([ID], [NOMBRE], [HORARIO]) VALUES (3, N'Estudiantes', N'Lun a Vier 8-20 hs/ Sab 8-12 hs')
INSERT [dbo].[VENTANILLA] ([ID], [NOMBRE], [HORARIO]) VALUES (4, N'Títulos,planes y SIU', N'Lun a Vier 8-15 hs')
INSERT [dbo].[VENTANILLA] ([ID], [NOMBRE], [HORARIO]) VALUES (5, N'Departamentos', N'Lun a Vier 8-15 hs')
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [CK_bitacora] CHECK  (([accion]='TRAMITE' OR [accion]='LOGIN'))
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [CK_bitacora]
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [CK_bitacora_1] CHECK  (([tipo_persona]='OTRO' OR [tipo_persona]='NO-DOCENTE' OR [tipo_persona]='DOCENTE' OR [tipo_persona]='ALUMNO'))
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [CK_bitacora_1]
GO
USE [master]
GO
ALTER DATABASE [PREATENDEDOR] SET  READ_WRITE 
GO
