USE [master]
GO
/****** Object:  Database [TestSales]    Script Date: 13/12/2016 11:11:51 ******/
CREATE DATABASE [TestSales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestSales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestSales.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestSales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestSales_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestSales] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestSales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestSales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestSales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestSales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestSales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestSales] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestSales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestSales] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TestSales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestSales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestSales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestSales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestSales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestSales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestSales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestSales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestSales] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestSales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestSales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestSales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestSales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestSales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestSales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestSales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestSales] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestSales] SET  MULTI_USER 
GO
ALTER DATABASE [TestSales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestSales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestSales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestSales] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TestSales]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 13/12/2016 11:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 13/12/2016 11:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] NOT NULL,
	[label] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productCart]    Script Date: 13/12/2016 11:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productCart](
	[idCart] [int] NOT NULL,
	[idProduct] [int] NOT NULL,
	[quantity] [int] NOT NULL CONSTRAINT [DF_productCart_quantity]  DEFAULT ((1)),
 CONSTRAINT [PK_productCart] PRIMARY KEY CLUSTERED 
(
	[idCart] ASC,
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 13/12/2016 11:11:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[password] [varchar](250) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[cart] ([id], [idUser]) VALUES (1, 31)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (2, 69)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (3, 28)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (4, 35)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (5, 2)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (6, 12)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (7, 62)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (8, 12)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (9, 55)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (10, 34)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (11, 13)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (12, 34)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (13, 79)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (14, 5)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (15, 24)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (16, 25)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (17, 91)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (18, 41)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (19, 61)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (20, 18)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (21, 47)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (22, 34)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (23, 93)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (24, 9)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (25, 13)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (26, 64)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (27, 50)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (28, 40)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (29, 85)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (30, 12)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (31, 84)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (32, 64)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (33, 66)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (34, 27)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (35, 99)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (36, 93)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (37, 69)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (38, 38)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (39, 26)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (40, 88)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (41, 80)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (42, 24)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (43, 55)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (44, 12)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (45, 60)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (46, 90)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (47, 90)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (48, 100)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (49, 48)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (50, 77)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (51, 37)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (52, 19)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (53, 88)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (54, 99)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (55, 98)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (56, 91)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (57, 3)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (58, 75)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (59, 73)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (60, 31)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (61, 75)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (62, 89)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (63, 81)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (64, 45)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (65, 48)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (66, 11)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (67, 33)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (68, 7)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (69, 94)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (70, 83)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (71, 37)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (72, 42)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (73, 32)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (74, 57)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (75, 55)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (76, 30)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (77, 52)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (78, 99)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (79, 71)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (80, 91)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (81, 76)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (82, 79)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (83, 86)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (84, 16)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (85, 61)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (86, 8)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (87, 83)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (88, 37)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (89, 63)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (90, 52)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (91, 3)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (92, 47)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (93, 56)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (94, 89)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (95, 100)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (96, 95)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (97, 96)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (98, 55)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (99, 5)
INSERT [dbo].[cart] ([id], [idUser]) VALUES (100, 82)
GO
INSERT [dbo].[product] ([id], [label], [price]) VALUES (1, N'jlarson0', 0.33)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (2, N'jthomas1', 9.58)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (3, N'kwilson2', 5.93)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (4, N'amurphy3', 3.94)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (5, N'fmurphy4', 4.66)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (6, N'clawson5', 6.09)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (7, N'gramirez6', 2.02)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (8, N'asullivan7', 8.16)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (9, N'cgraham8', 3.69)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (10, N'hlane9', 0.01)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (11, N'lmatthewsa', 6.78)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (12, N'kdanielsb', 7.63)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (13, N'dgrayc', 4.33)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (14, N'lstoned', 5.7)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (15, N'lhowarde', 4.37)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (16, N'jrichardsf', 9.15)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (17, N'wbennettg', 9.54)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (18, N'nolsonh', 0.92)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (19, N'lolsoni', 0.4)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (20, N'jmorrisonj', 1.76)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (21, N'jhallk', 1.05)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (22, N'wcookl', 8.35)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (23, N'awatkinsm', 1.42)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (24, N'jturnern', 0.56)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (25, N'rlarsono', 0.8)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (26, N'dlopezp', 8.99)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (27, N'jcrawfordq', 8.7)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (28, N'fbutlerr', 3.93)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (29, N'jlynchs', 5.06)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (30, N'afranklint', 6.22)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (31, N'rmeyeru', 1.67)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (32, N'bjacksonv', 5.14)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (33, N'mhowellw', 5.66)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (34, N'jgomezx', 1.75)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (35, N'bmoralesy', 4.68)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (36, N'creyesz', 7.3)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (37, N'jmorales10', 2.11)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (38, N'sbell11', 0.31)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (39, N'tcoleman12', 8.32)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (40, N'vstewart13', 4.92)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (41, N'wkennedy14', 5.61)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (42, N'mgonzalez15', 6.37)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (43, N'nperry16', 0.42)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (44, N'ckelley17', 4.33)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (45, N'pduncan18', 0.37)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (46, N'ctorres19', 4.75)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (47, N'lpayne1a', 8.35)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (48, N'jreynolds1b', 3.81)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (49, N'klee1c', 4.83)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (50, N'jrobertson1d', 3.17)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (51, N'hfrazier1e', 6.54)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (52, N'jbryant1f', 0.25)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (53, N'pgordon1g', 8.41)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (54, N'raustin1h', 5.35)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (55, N'syoung1i', 3.65)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (56, N'jrodriguez1j', 3.59)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (57, N'aford1k', 7.25)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (58, N'acollins1l', 8.55)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (59, N'kray1m', 4.59)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (60, N'hhawkins1n', 8.64)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (61, N'thenry1o', 0.57)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (62, N'preid1p', 5.71)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (63, N'pcooper1q', 8.14)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (64, N'acarpenter1r', 6.41)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (65, N'scarpenter1s', 8.52)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (66, N'ahamilton1t', 1.79)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (67, N'dfernandez1u', 7.66)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (68, N'kcrawford1v', 0.06)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (69, N'mcunningham1w', 9.95)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (70, N'bpeters1x', 2.54)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (71, N'thamilton1y', 6.34)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (72, N'cgilbert1z', 3.95)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (73, N'kdean20', 0.52)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (74, N'adunn21', 7.7)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (75, N'jsimmons22', 9.28)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (76, N'jrichards23', 2.71)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (77, N'agriffin24', 8.53)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (78, N'woliver25', 5.08)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (79, N'kfernandez26', 3.15)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (80, N'smontgomery27', 1.3)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (81, N'aberry28', 0.68)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (82, N'pwilson29', 3.18)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (83, N'jpatterson2a', 8.99)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (84, N'gharrison2b', 3.66)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (85, N'jjohnson2c', 3.32)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (86, N'rjames2d', 2.4)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (87, N'bhanson2e', 8.77)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (88, N'mhughes2f', 9.57)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (89, N'egomez2g', 4.29)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (90, N'mdunn2h', 3.32)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (91, N'calexander2i', 3.89)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (92, N'ndaniels2j', 7.34)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (93, N'pmartin2k', 7.02)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (94, N'cjacobs2l', 4.36)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (95, N'dgardner2m', 4.12)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (96, N'pcarr2n', 5.45)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (97, N'arussell2o', 4.07)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (98, N'ssmith2p', 1.64)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (99, N'jolson2q', 6.15)
INSERT [dbo].[product] ([id], [label], [price]) VALUES (100, N'rwillis2r', 8.46)
GO
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (1, 11, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (1, 77, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (2, 10, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (2, 82, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (3, 86, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (5, 55, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (5, 100, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (6, 53, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (7, 80, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (7, 95, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (9, 22, 3)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (9, 28, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (9, 68, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (10, 73, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (12, 91, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (13, 2, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (13, 42, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (17, 86, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (18, 40, 1)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (20, 37, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (21, 87, 1)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (23, 28, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (24, 17, 1)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (25, 13, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (25, 71, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (26, 76, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (27, 16, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (27, 59, 1)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (27, 65, 1)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (27, 98, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (28, 85, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (29, 68, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (29, 85, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (30, 79, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (31, 26, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (33, 81, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (34, 21, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (34, 74, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (35, 38, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (36, 8, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (36, 81, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (38, 43, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (38, 46, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (39, 12, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (39, 26, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (40, 8, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (42, 3, 1)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (45, 57, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (45, 62, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (45, 98, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (46, 24, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (46, 73, 1)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (48, 17, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (49, 24, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (51, 99, 3)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (52, 93, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (55, 55, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (55, 67, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (56, 45, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (57, 26, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (64, 10, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (64, 48, 3)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (66, 5, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (66, 70, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (67, 69, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (67, 97, 3)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (68, 30, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (69, 39, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (69, 72, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (71, 84, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (73, 38, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (73, 40, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (73, 48, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (75, 47, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (75, 72, 7)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (76, 96, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (77, 46, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (79, 73, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (80, 87, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (81, 46, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (81, 100, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (82, 1, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (82, 63, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (84, 98, 2)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (86, 56, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (89, 16, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (89, 33, 3)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (89, 84, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (90, 36, 4)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (90, 57, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (93, 5, 3)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (94, 93, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (95, 24, 8)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (96, 69, 9)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (97, 19, 5)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (98, 29, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (98, 53, 3)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (100, 3, 6)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (100, 43, 10)
INSERT [dbo].[productCart] ([idCart], [idProduct], [quantity]) VALUES (100, 88, 7)
GO
INSERT [dbo].[user] ([id], [name], [password]) VALUES (1, N'Cookley', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (2, N'Treeflex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (3, N'Y-find', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (4, N'Trippledex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (5, N'Quo Lux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (6, N'Bytecard', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (7, N'Tempsoft', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (8, N'Regrant', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (9, N'Temp', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (10, N'Daltfresh', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (11, N'Regrant', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (12, N'Voyatouch', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (13, N'Home Ing', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (14, N'Y-Solowarm', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (15, N'Sonair', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (16, N'Latlux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (17, N'Gembucket', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (18, N'Solarbreeze', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (19, N'Cardguard', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (20, N'Sonair', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (21, N'Otcom', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (22, N'Transcof', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (23, N'Treeflex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (24, N'Fintone', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (25, N'Cookley', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (26, N'Trippledex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (27, N'Ronstring', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (28, N'Bamity', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (29, N'Lotstring', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (30, N'Voltsillam', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (31, N'Sonsing', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (32, N'Subin', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (33, N'Vagram', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (34, N'Bamity', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (35, N'Fintone', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (36, N'Aerified', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (37, N'Zamit', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (38, N'Transcof', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (39, N'Alpha', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (40, N'Duobam', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (41, N'Konklab', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (42, N'Bitchip', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (43, N'Flexidy', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (44, N'Flowdesk', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (45, N'Flexidy', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (46, N'Viva', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (47, N'Span', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (48, N'Stringtough', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (49, N'Veribet', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (50, N'Daltfresh', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (51, N'Keylex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (52, N'Y-Solowarm', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (53, N'Quo Lux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (54, N'Sonair', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (55, N'Pannier', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (56, N'Gembucket', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (57, N'Trippledex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (58, N'Zaam-Dox', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (59, N'Konklab', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (60, N'Tempsoft', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (61, N'Sonair', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (62, N'Domainer', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (63, N'Voltsillam', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (64, N'Pannier', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (65, N'Alpha', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (66, N'Holdlamis', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (67, N'Home Ing', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (68, N'Home Ing', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (69, N'Zaam-Dox', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (70, N'Zathin', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (71, N'Prodder', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (72, N'Konklux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (73, N'Fixflex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (74, N'Matsoft', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (75, N'Regrant', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (76, N'Biodex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (77, N'Subin', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (78, N'It', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (79, N'Konklux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (80, N'Voyatouch', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (81, N'Quo Lux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (82, N'Alpha', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (83, N'Y-find', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (84, N'Lotlux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (85, N'Konklux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (86, N'Lotstring', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (87, N'Biodex', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (88, N'Vagram', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (89, N'Holdlamis', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (90, N'Zoolab', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (91, N'Bitwolf', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (92, N'Flexidy', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (93, N'Voyatouch', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (94, N'Bytecard', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (95, N'Ronstring', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (96, N'Greenlam', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (97, N'Ventosanzap', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (98, N'Quo Lux', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (99, N'Aerified', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
INSERT [dbo].[user] ([id], [name], [password]) VALUES (100, N'Bitchip', N'1b4cd41d31bfe52182ecaa235320ccb304cbc7a4')
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_user] FOREIGN KEY([idUser])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_user]
GO
ALTER TABLE [dbo].[productCart]  WITH CHECK ADD  CONSTRAINT [FK_productCart_cart] FOREIGN KEY([idCart])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[productCart] CHECK CONSTRAINT [FK_productCart_cart]
GO
ALTER TABLE [dbo].[productCart]  WITH CHECK ADD  CONSTRAINT [FK_productCart_product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[productCart] CHECK CONSTRAINT [FK_productCart_product]
GO
USE [master]
GO
ALTER DATABASE [TestSales] SET  READ_WRITE 
GO
