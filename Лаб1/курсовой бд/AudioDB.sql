USE [master]
GO
/****** Object:  Database [AudioStudioDB]    Script Date: 24.06.2021 9:02:30 ******/
CREATE DATABASE [AudioStudioDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AudioStudioDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AudioStudioDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AudioStudioDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AudioStudioDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AudioStudioDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AudioStudioDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AudioStudioDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AudioStudioDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AudioStudioDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AudioStudioDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AudioStudioDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AudioStudioDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AudioStudioDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AudioStudioDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AudioStudioDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AudioStudioDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AudioStudioDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AudioStudioDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AudioStudioDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AudioStudioDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AudioStudioDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AudioStudioDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AudioStudioDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AudioStudioDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AudioStudioDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AudioStudioDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AudioStudioDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AudioStudioDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AudioStudioDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AudioStudioDB] SET  MULTI_USER 
GO
ALTER DATABASE [AudioStudioDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AudioStudioDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AudioStudioDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AudioStudioDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AudioStudioDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AudioStudioDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AudioStudioDB] SET QUERY_STORE = OFF
GO
USE [AudioStudioDB]
GO
/****** Object:  Table [dbo].[Договоры]    Script Date: 24.06.2021 9:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Договоры](
	[Номер договора] [nvarchar](10) NOT NULL,
	[Стоимость] [money] NOT NULL,
	[Дата заключения] [date] NOT NULL,
	[Кол-во услуг] [int] NOT NULL,
	[Паспорт заказчика] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Договоры] PRIMARY KEY CLUSTERED 
(
	[Номер договора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[PeriodSell]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[PeriodSell](@Date1 DATE, @Date2 DATE)
RETURNS TABLE
AS
RETURN (SELECT SUM(Договоры.Стоимость)  AS "Salary" FROM dbo.Договоры WHERE Договоры.[Дата заключения]    BETWEEN @Date1 AND @Date2);
GO
/****** Object:  Table [dbo].[Autentification]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autentification](
	[Логин] [nvarchar](10) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[Роль] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Authorization] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Альбомы]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Альбомы](
	[Номер альбома] [int] NOT NULL,
	[Название альбома] [nvarchar](50) NOT NULL,
	[Жанр] [nvarchar](50) NULL,
	[Общая длина] [time](7) NULL,
	[Кол-во песен] [int] NULL,
	[Язык] [nvarchar](50) NULL,
	[EP] [bit] NULL,
	[Паспортные данные исполнителя] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Альбомы] PRIMARY KEY CLUSTERED 
(
	[Номер альбома] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Аранжировка]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Аранжировка](
	[Код услуги] [nvarchar](3) NOT NULL,
	[Референс] [nvarchar](50) NULL,
	[Жанр] [nvarchar](50) NOT NULL,
	[Кол-во музыкантов] [int] NULL,
 CONSTRAINT [PK_Аранжировка] PRIMARY KEY CLUSTERED 
(
	[Код услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Выполнение услуги]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Выполнение услуги](
	[Номер услуги] [int] NOT NULL,
	[Срок выполнения] [int] NOT NULL,
	[Номер песни] [int] NOT NULL,
	[Номер договора] [nvarchar](10) NOT NULL,
	[Код услуги] [nvarchar](3) NOT NULL,
	[Стоимость] [money] NOT NULL,
 CONSTRAINT [PK_Выполнение услуги] PRIMARY KEY CLUSTERED 
(
	[Номер услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Запись]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Запись](
	[Код услуги] [nvarchar](3) NOT NULL,
	[Перезаписи] [int] NULL,
	[Фрагменты] [int] NULL,
	[Что записывается] [nvarchar](50) NOT NULL,
	[Сопр инструменты] [int] NULL,
	[Битрейт] [int] NOT NULL,
 CONSTRAINT [PK_Запись] PRIMARY KEY CLUSTERED 
(
	[Код услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Исполнитель]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Исполнитель](
	[Паспорт Исполнителя] [nvarchar](10) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Кол-во альбомов] [int] NULL,
	[Карьера] [date] NULL,
	[Кол-во наград] [int] NULL,
	[Страна] [nvarchar](50) NULL,
	[Эл почта] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Исполнитель] PRIMARY KEY CLUSTERED 
(
	[Паспорт Исполнителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Перечень услуг]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Перечень услуг](
	[Код услуги] [nvarchar](3) NOT NULL,
	[Оборудование] [nvarchar](50) NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Паспорт сотрудника] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Перечень услуг] PRIMARY KEY CLUSTERED 
(
	[Код услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Песни]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Песни](
	[Номер песни] [int] NOT NULL,
	[Название песни] [nvarchar](50) NOT NULL,
	[Битрейт] [int] NOT NULL,
	[Длина] [time](7) NOT NULL,
	[Номер альбома] [int] NOT NULL,
	[Сопр инструменты] [int] NULL,
 CONSTRAINT [PK_Песни] PRIMARY KEY CLUSTERED 
(
	[Номер песни] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сведение]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сведение](
	[Код услуги] [nvarchar](3) NOT NULL,
	[Кол-во дорожек] [int] NULL,
	[Работа в днях] [int] NOT NULL,
	[Плагин] [nvarchar](50) NULL,
 CONSTRAINT [PK_Сведение] PRIMARY KEY CLUSTERED 
(
	[Код услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Паспорт сотрудника] [nvarchar](10) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Должность] [nvarchar](50) NOT NULL,
	[Дата рождения] [date] NOT NULL,
	[Телефон] [nvarchar](11) NOT NULL,
	[Пол] [nvarchar](1) NOT NULL,
	[Зарплата] [money] NOT NULL,
	[Номер труд книги] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Паспорт сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Исполнитель]    Script Date: 24.06.2021 9:02:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Исполнитель] ON [dbo].[Исполнитель]
(
	[Эл почта] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Сотрудники_1]    Script Date: 24.06.2021 9:02:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Сотрудники_1] ON [dbo].[Сотрудники]
(
	[Телефон] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Autentification]  WITH CHECK ADD  CONSTRAINT [FK_Autentification_Сотрудники] FOREIGN KEY([Логин])
REFERENCES [dbo].[Сотрудники] ([Паспорт сотрудника])
GO
ALTER TABLE [dbo].[Autentification] CHECK CONSTRAINT [FK_Autentification_Сотрудники]
GO
ALTER TABLE [dbo].[Альбомы]  WITH CHECK ADD  CONSTRAINT [FK_Альбомы_Исполнитель] FOREIGN KEY([Паспортные данные исполнителя])
REFERENCES [dbo].[Исполнитель] ([Паспорт Исполнителя])
GO
ALTER TABLE [dbo].[Альбомы] CHECK CONSTRAINT [FK_Альбомы_Исполнитель]
GO
ALTER TABLE [dbo].[Аранжировка]  WITH CHECK ADD  CONSTRAINT [FK_Аранжировка_Перечень услуг] FOREIGN KEY([Код услуги])
REFERENCES [dbo].[Перечень услуг] ([Код услуги])
GO
ALTER TABLE [dbo].[Аранжировка] CHECK CONSTRAINT [FK_Аранжировка_Перечень услуг]
GO
ALTER TABLE [dbo].[Выполнение услуги]  WITH CHECK ADD  CONSTRAINT [FK_Выполнение услуги_Договоры] FOREIGN KEY([Номер договора])
REFERENCES [dbo].[Договоры] ([Номер договора])
GO
ALTER TABLE [dbo].[Выполнение услуги] CHECK CONSTRAINT [FK_Выполнение услуги_Договоры]
GO
ALTER TABLE [dbo].[Выполнение услуги]  WITH CHECK ADD  CONSTRAINT [FK_Выполнение услуги_Перечень услуг] FOREIGN KEY([Код услуги])
REFERENCES [dbo].[Перечень услуг] ([Код услуги])
GO
ALTER TABLE [dbo].[Выполнение услуги] CHECK CONSTRAINT [FK_Выполнение услуги_Перечень услуг]
GO
ALTER TABLE [dbo].[Выполнение услуги]  WITH CHECK ADD  CONSTRAINT [FK_Выполнение услуги_Песни] FOREIGN KEY([Номер песни])
REFERENCES [dbo].[Песни] ([Номер песни])
GO
ALTER TABLE [dbo].[Выполнение услуги] CHECK CONSTRAINT [FK_Выполнение услуги_Песни]
GO
ALTER TABLE [dbo].[Договоры]  WITH CHECK ADD  CONSTRAINT [FK_Договоры_Исполнитель] FOREIGN KEY([Паспорт заказчика])
REFERENCES [dbo].[Исполнитель] ([Паспорт Исполнителя])
GO
ALTER TABLE [dbo].[Договоры] CHECK CONSTRAINT [FK_Договоры_Исполнитель]
GO
ALTER TABLE [dbo].[Запись]  WITH CHECK ADD  CONSTRAINT [FK_Запись_Перечень услуг] FOREIGN KEY([Код услуги])
REFERENCES [dbo].[Перечень услуг] ([Код услуги])
GO
ALTER TABLE [dbo].[Запись] CHECK CONSTRAINT [FK_Запись_Перечень услуг]
GO
ALTER TABLE [dbo].[Перечень услуг]  WITH CHECK ADD  CONSTRAINT [FK_Перечень услуг_Сотрудники] FOREIGN KEY([Паспорт сотрудника])
REFERENCES [dbo].[Сотрудники] ([Паспорт сотрудника])
GO
ALTER TABLE [dbo].[Перечень услуг] CHECK CONSTRAINT [FK_Перечень услуг_Сотрудники]
GO
ALTER TABLE [dbo].[Песни]  WITH CHECK ADD  CONSTRAINT [FK_Песни_Альбомы] FOREIGN KEY([Номер альбома])
REFERENCES [dbo].[Альбомы] ([Номер альбома])
GO
ALTER TABLE [dbo].[Песни] CHECK CONSTRAINT [FK_Песни_Альбомы]
GO
ALTER TABLE [dbo].[Сведение]  WITH CHECK ADD  CONSTRAINT [FK_Сведение_Перечень услуг] FOREIGN KEY([Код услуги])
REFERENCES [dbo].[Перечень услуг] ([Код услуги])
GO
ALTER TABLE [dbo].[Сведение] CHECK CONSTRAINT [FK_Сведение_Перечень услуг]
GO
/****** Object:  StoredProcedure [dbo].[Dogovor]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Dogovor](@Dog_count NVARCHAR(10))
AS 
--Узнаем количество услуг, которые должны быть выполнены по данному договору
DECLARE @kolvo_uslug INT = (SELECT COUNT([Выполнение услуги].[Номер услуги]) 
	FROM dbo.[Выполнение услуги], dbo.Договоры
	WHERE [Выполнение услуги].[Номер договора] = Договоры.[Номер договора] AND Договоры.[Номер договора] = @Dog_count);
--Узнаем общую стоимость договора
DECLARE @Sum MONEY = (SELECT SUM([Выполнение услуги].Стоимость) 
	FROM dbo.[Выполнение услуги], dbo.Договоры
	WHERE Договоры.[Номер договора] = @Dog_count AND [Выполнение услуги].[Номер договора] = @Dog_count);
--Объявляем переменную, отвечающую за заказчика
DECLARE @zak NVARCHAR(10) = (SELECT Договоры.[Паспорт заказчика] FROM dbo.Договоры WHERE Договоры.[Номер договора] = @Dog_count);
--Объявляем переменную, отвечающую за количество договоров, которые были заключены с данным заказчиком
DECLARE @Col_Dog INT = (SELECT COUNT(Договоры.[Номер договора] ) FROM dbo.Договоры WHERE dbo.Договоры.[Паспорт заказчика] = @zak);
--Если количество таких договоров больше двух...
IF (@Col_Dog > 2)
BEGIN
--...Уведомляем о том, что на текущий договор предоставляется 10-процентная скидка 
--и обновляем записи с количеством услуг и стоимостью договоро в таблице Договоры
PRINT 'Вам была сделана скидка на 3й заказ'
UPDATE dbo.Договоры SET Договоры.[Кол-во услуг] = @kolvo_uslug, Договоры.Стоимость = @Sum*0.9 WHERE Договоры.[Номер договора] = @Dog_count;
END
ELSE
--Иначе просто обновляем записи с количеством услуг и стоимостью договоро в таблице Договоры
UPDATE dbo.Договоры SET Договоры.[Кол-во услуг] = @kolvo_uslug, Договоры.Стоимость = @Sum WHERE Договоры.[Номер договора] = @Dog_count;
GO
/****** Object:  StoredProcedure [dbo].[Nalog]    Script Date: 24.06.2021 9:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Nalog](@PerCent INT)
AS 
UPDATE dbo.Сотрудники
	SET Сотрудники.Зарплата = Сотрудники.Зарплата - Сотрудники.Зарплата*CONVERT(MONEY,@PerCent)/100;
GO
USE [master]
GO
ALTER DATABASE [AudioStudioDB] SET  READ_WRITE 
GO
