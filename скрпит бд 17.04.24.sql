USE [master]
GO
/****** Object:  Database [Хранитель]    Script Date: 17.04.2024 15:02:56 ******/
CREATE DATABASE [Хранитель]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Хранитель', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Хранитель.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Хранитель_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Хранитель_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Хранитель] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Хранитель].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Хранитель] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Хранитель] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Хранитель] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Хранитель] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Хранитель] SET ARITHABORT OFF 
GO
ALTER DATABASE [Хранитель] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Хранитель] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Хранитель] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Хранитель] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Хранитель] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Хранитель] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Хранитель] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Хранитель] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Хранитель] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Хранитель] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Хранитель] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Хранитель] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Хранитель] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Хранитель] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Хранитель] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Хранитель] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Хранитель] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Хранитель] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Хранитель] SET  MULTI_USER 
GO
ALTER DATABASE [Хранитель] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Хранитель] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Хранитель] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Хранитель] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Хранитель] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Хранитель]
GO
/****** Object:  Table [dbo].[Групповые посещения]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Групповые посещения](
	[ID_Посещения] [int] NOT NULL,
	[ID_Информации_для_пропуска] [int] NULL,
 CONSTRAINT [PK_Групповые посещения] PRIMARY KEY CLUSTERED 
(
	[ID_Посещения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Заявки для посещения]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки для посещения](
	[ID_Заявки] [int] NOT NULL,
	[ID_Информации_для_пропуска] [int] NULL,
	[ID_Информации_о_посетителе] [int] NULL,
	[ID_статуса заявки] [int] NULL,
 CONSTRAINT [PK_Заявки для посещения] PRIMARY KEY CLUSTERED 
(
	[ID_Заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Информация для пропуска]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Информация для пропуска](
	[ID] [int] NOT NULL,
	[Срок_начала_действия_пропуска] [date] NULL,
	[Срок_окончания_действия_пропуска] [date] NULL,
	[Цель_посещения] [nvarchar](150) NULL,
	[ID_принимающей_стороны] [int] NULL,
 CONSTRAINT [PK_Информация для пропуска] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[ID_Пользователя] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Примечание] [nvarchar](50) NULL,
	[Дата_рождения] [nvarchar](50) NULL,
	[Серия_паспорта] [int] NULL,
	[Номер_паспорта] [int] NULL,
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
	[Наличие_паспорта] [nvarchar](50) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[ID_Пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Прикрепляемые документы]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Прикрепляемые документы](
	[ID_Документа] [int] NOT NULL,
	[ID_Информации_о_пользователе] [int] NULL,
	[Скан_паспорта] [image] NULL,
 CONSTRAINT [PK_Прикрепляемые документы] PRIMARY KEY CLUSTERED 
(
	[ID_Документа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Принимающая сторона]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Принимающая сторона](
	[ID_Стороны] [int] NOT NULL,
	[Подразделение_для_посещения] [nvarchar](150) NULL,
	[ID_Сотрудника] [int] NULL,
 CONSTRAINT [PK_Принимающая сторона] PRIMARY KEY CLUSTERED 
(
	[ID_Стороны] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ID_Сотрудника] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Подразделение] [nvarchar](50) NOT NULL,
	[Код_сотрудника] [int] NULL,
	[Отдел] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Статус заявки]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус заявки](
	[ID_Статуса] [int] NOT NULL,
	[Статус заявки] [nvarchar](50) NULL,
 CONSTRAINT [PK_Статус заявки] PRIMARY KEY CLUSTERED 
(
	[ID_Статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Фото паспорта]    Script Date: 17.04.2024 15:02:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фото паспорта](
	[Наличие_паспорта] [nvarchar](50) NOT NULL,
	[Фото_паспорта] [image] NULL,
 CONSTRAINT [PK_Фото паспорта_1] PRIMARY KEY CLUSTERED 
(
	[Наличие_паспорта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Групповые посещения]  WITH CHECK ADD  CONSTRAINT [FK_Групповые посещения_Информация для пропуска] FOREIGN KEY([ID_Информации_для_пропуска])
REFERENCES [dbo].[Информация для пропуска] ([ID])
GO
ALTER TABLE [dbo].[Групповые посещения] CHECK CONSTRAINT [FK_Групповые посещения_Информация для пропуска]
GO
ALTER TABLE [dbo].[Заявки для посещения]  WITH CHECK ADD  CONSTRAINT [FK_Заявки для посещения_Информация для пропуска] FOREIGN KEY([ID_Информации_для_пропуска])
REFERENCES [dbo].[Информация для пропуска] ([ID])
GO
ALTER TABLE [dbo].[Заявки для посещения] CHECK CONSTRAINT [FK_Заявки для посещения_Информация для пропуска]
GO
ALTER TABLE [dbo].[Заявки для посещения]  WITH CHECK ADD  CONSTRAINT [FK_Заявки для посещения_Пользователь] FOREIGN KEY([ID_Информации_о_посетителе])
REFERENCES [dbo].[Пользователь] ([ID_Пользователя])
GO
ALTER TABLE [dbo].[Заявки для посещения] CHECK CONSTRAINT [FK_Заявки для посещения_Пользователь]
GO
ALTER TABLE [dbo].[Заявки для посещения]  WITH CHECK ADD  CONSTRAINT [FK_Заявки для посещения_Статус заявки] FOREIGN KEY([ID_статуса заявки])
REFERENCES [dbo].[Статус заявки] ([ID_Статуса])
GO
ALTER TABLE [dbo].[Заявки для посещения] CHECK CONSTRAINT [FK_Заявки для посещения_Статус заявки]
GO
ALTER TABLE [dbo].[Информация для пропуска]  WITH CHECK ADD  CONSTRAINT [FK_Информация для пропуска_Принимающая сторона] FOREIGN KEY([ID_принимающей_стороны])
REFERENCES [dbo].[Принимающая сторона] ([ID_Стороны])
GO
ALTER TABLE [dbo].[Информация для пропуска] CHECK CONSTRAINT [FK_Информация для пропуска_Принимающая сторона]
GO
ALTER TABLE [dbo].[Прикрепляемые документы]  WITH CHECK ADD  CONSTRAINT [FK_Прикрепляемые документы_Пользователь] FOREIGN KEY([ID_Информации_о_пользователе])
REFERENCES [dbo].[Пользователь] ([ID_Пользователя])
GO
ALTER TABLE [dbo].[Прикрепляемые документы] CHECK CONSTRAINT [FK_Прикрепляемые документы_Пользователь]
GO
ALTER TABLE [dbo].[Принимающая сторона]  WITH CHECK ADD  CONSTRAINT [FK_Принимающая сторона_Сотрудники] FOREIGN KEY([ID_Сотрудника])
REFERENCES [dbo].[Сотрудники] ([ID_Сотрудника])
GO
ALTER TABLE [dbo].[Принимающая сторона] CHECK CONSTRAINT [FK_Принимающая сторона_Сотрудники]
GO
USE [master]
GO
ALTER DATABASE [Хранитель] SET  READ_WRITE 
GO
