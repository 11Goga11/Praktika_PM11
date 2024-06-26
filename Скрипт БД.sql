USE [master]
GO
/****** Object:  Database [ХранительПРО]    Script Date: 18.04.2024 17:22:30 ******/
CREATE DATABASE [ХранительПРО]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ХранительПРО_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ХранительПРО] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ХранительПРО].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ARITHABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ХранительПРО] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ХранительПРО] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ХранительПРО] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ХранительПРО] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ХранительПРО] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ХранительПРО] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET  MULTI_USER 
GO
ALTER DATABASE [ХранительПРО] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ХранительПРО] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ХранительПРО] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ХранительПРО] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ХранительПРО]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Учетные данные] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Группа]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группа](
	[ID] [int] NOT NULL,
	[Группы] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Группы] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Групповое посещение]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Групповое посещение](
	[ID] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
	[E-mail] [nvarchar](50) NULL,
	[Организация] [nvarchar](50) NULL,
	[Примечение] [nvarchar](50) NULL,
	[Дата рождения] [nvarchar](50) NULL,
	[Серия] [int] NULL,
	[Номер] [int] NULL,
 CONSTRAINT [PK_Групповое посещение] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Данные пользователя]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные пользователя](
	[ID] [int] NOT NULL,
	[ФИО] [nvarchar](50) NULL,
	[Номер телефона] [nvarchar](50) NULL,
	[E-mail] [nvarchar](max) NULL,
	[Дата рождения] [nvarchar](50) NULL,
	[Данные паспорта] [nvarchar](50) NULL,
 CONSTRAINT [PK_Данные пользователя] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Данные сотрудника]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Данные сотрудника](
	[ID] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Данные сотрудника] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Индивидуальное посещение]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Индивидуальное посещение](
	[ID] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Телефон] [numeric](18, 0) NOT NULL,
	[E-mail] [nvarchar](50) NOT NULL,
	[Организация] [nvarchar](50) NOT NULL,
	[Примечение] [nvarchar](50) NOT NULL,
	[Дата рождения] [date] NOT NULL,
	[Серия] [numeric](18, 0) NOT NULL,
	[Номер] [numeric](18, 0) NOT NULL,
	[Фото] [image] NULL,
 CONSTRAINT [PK_Индивидуальное посещение] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Информация для пропуска]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Информация для пропуска](
	[ID] [int] NOT NULL,
	[Дата(с)] [date] NOT NULL,
	[Дата(до)] [date] NOT NULL,
	[Цель посещения] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Информация для пропуска] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Код сотрудника]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Код сотрудника](
	[ID] [int] NOT NULL,
	[Код сотрудника] [nvarchar](50) NOT NULL,
	[ФИО] [nvarchar](50) NULL,
 CONSTRAINT [PK_Код сотрудника] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Назначение]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Назначение](
	[ID] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[№ кода сотрудника] [int] NOT NULL,
 CONSTRAINT [PK_Назначение 1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отдел]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отдел](
	[ID] [int] NOT NULL,
	[Отдел] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Отдел] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделение]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделение](
	[ID] [int] NOT NULL,
	[Подразделение] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Подразделение] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[ID] [int] NOT NULL,
	[№ пользователя] [int] NOT NULL,
	[№ паспортных данных] [int] NOT NULL,
	[№ учетных данных] [int] NOT NULL,
	[№ назначения] [int] NOT NULL,
	[№ группы] [int] NOT NULL,
 CONSTRAINT [PK_Пользователи] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Прикрепляемые документы]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Прикрепляемые документы](
	[ID] [int] NOT NULL,
	[Прикрепляемые документы] [image] NOT NULL,
 CONSTRAINT [PK_Прикрепляемые документы] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Принимающая сторона]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Принимающая сторона](
	[ID] [int] NOT NULL,
	[№ подразделения] [int] NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Принимающая сторона] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник ]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник ](
	[ID] [int] NOT NULL,
	[№ сотрудника] [int] NOT NULL,
	[№ подразделения] [int] NOT NULL,
	[№ отдела] [int] NOT NULL,
	[№ кода сотрудника] [int] NOT NULL,
 CONSTRAINT [PK_Сотрудник ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список посетителей]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список посетителей](
	[ID] [int] NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Номер телефона] [numeric](18, 0) NOT NULL,
	[Фотография] [image] NULL,
 CONSTRAINT [PK_Список посетителей] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус](
	[ID] [int] NOT NULL,
	[Тип регистрации] [nvarchar](50) NOT NULL,
	[№ отдела] [int] NOT NULL,
	[Статус] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип посещения]    Script Date: 18.04.2024 17:22:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип посещения](
	[ID] [int] NOT NULL,
	[Тип посещения] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Тип посещения] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Назначение]  WITH CHECK ADD  CONSTRAINT [FK_Назначение_Код сотрудника] FOREIGN KEY([№ кода сотрудника])
REFERENCES [dbo].[Код сотрудника] ([ID])
GO
ALTER TABLE [dbo].[Назначение] CHECK CONSTRAINT [FK_Назначение_Код сотрудника]
GO
ALTER TABLE [dbo].[Пользователь]  WITH CHECK ADD  CONSTRAINT [FK_Пользователи_Группы] FOREIGN KEY([№ группы])
REFERENCES [dbo].[Группа] ([ID])
GO
ALTER TABLE [dbo].[Пользователь] CHECK CONSTRAINT [FK_Пользователи_Группы]
GO
ALTER TABLE [dbo].[Пользователь]  WITH CHECK ADD  CONSTRAINT [FK_Пользователи_Учетные данные] FOREIGN KEY([№ учетных данных])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Пользователь] CHECK CONSTRAINT [FK_Пользователи_Учетные данные]
GO
ALTER TABLE [dbo].[Пользователь]  WITH CHECK ADD  CONSTRAINT [FK_Пользователь_Данные пользователя] FOREIGN KEY([№ пользователя])
REFERENCES [dbo].[Данные пользователя] ([ID])
GO
ALTER TABLE [dbo].[Пользователь] CHECK CONSTRAINT [FK_Пользователь_Данные пользователя]
GO
ALTER TABLE [dbo].[Пользователь]  WITH CHECK ADD  CONSTRAINT [FK_Пользователь_Назначение] FOREIGN KEY([№ назначения])
REFERENCES [dbo].[Назначение] ([ID])
GO
ALTER TABLE [dbo].[Пользователь] CHECK CONSTRAINT [FK_Пользователь_Назначение]
GO
ALTER TABLE [dbo].[Принимающая сторона]  WITH CHECK ADD  CONSTRAINT [FK_Принимающая сторона_Подразделение] FOREIGN KEY([№ подразделения])
REFERENCES [dbo].[Подразделение] ([ID])
GO
ALTER TABLE [dbo].[Принимающая сторона] CHECK CONSTRAINT [FK_Принимающая сторона_Подразделение]
GO
ALTER TABLE [dbo].[Сотрудник ]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Данные сотрудника] FOREIGN KEY([№ сотрудника])
REFERENCES [dbo].[Данные сотрудника] ([ID])
GO
ALTER TABLE [dbo].[Сотрудник ] CHECK CONSTRAINT [FK_Сотрудник_Данные сотрудника]
GO
ALTER TABLE [dbo].[Сотрудник ]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Код сотрудника] FOREIGN KEY([№ кода сотрудника])
REFERENCES [dbo].[Код сотрудника] ([ID])
GO
ALTER TABLE [dbo].[Сотрудник ] CHECK CONSTRAINT [FK_Сотрудник_Код сотрудника]
GO
ALTER TABLE [dbo].[Сотрудник ]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Отдел] FOREIGN KEY([№ отдела])
REFERENCES [dbo].[Отдел] ([ID])
GO
ALTER TABLE [dbo].[Сотрудник ] CHECK CONSTRAINT [FK_Сотрудник_Отдел]
GO
ALTER TABLE [dbo].[Сотрудник ]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Подразделение] FOREIGN KEY([№ подразделения])
REFERENCES [dbo].[Подразделение] ([ID])
GO
ALTER TABLE [dbo].[Сотрудник ] CHECK CONSTRAINT [FK_Сотрудник_Подразделение]
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО] SET  READ_WRITE 
GO
