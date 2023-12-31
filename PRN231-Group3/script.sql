USE [master]
GO
/****** Object:  Database [PRN231_DTB]    Script Date: 3/28/2023 8:55:20 PM ******/
CREATE DATABASE [PRN231_DTB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN231_DTB', FILENAME = N'D:\MSSQL\IRD\MSSQL15.VANKA\MSSQL\DATA\PRN231_DTB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN231_DTB_log', FILENAME = N'D:\MSSQL\IRD\MSSQL15.VANKA\MSSQL\DATA\PRN231_DTB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN231_DTB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN231_DTB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN231_DTB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN231_DTB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN231_DTB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN231_DTB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN231_DTB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN231_DTB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN231_DTB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN231_DTB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN231_DTB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN231_DTB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN231_DTB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN231_DTB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN231_DTB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN231_DTB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN231_DTB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRN231_DTB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN231_DTB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN231_DTB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN231_DTB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN231_DTB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN231_DTB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN231_DTB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN231_DTB] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN231_DTB] SET  MULTI_USER 
GO
ALTER DATABASE [PRN231_DTB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN231_DTB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN231_DTB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN231_DTB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN231_DTB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN231_DTB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN231_DTB', N'ON'
GO
ALTER DATABASE [PRN231_DTB] SET QUERY_STORE = OFF
GO
USE [PRN231_DTB]
GO
/****** Object:  Table [dbo].[candiadate_stage]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candiadate_stage](
	[candidate_id] [int] NOT NULL,
	[stage_id] [int] NOT NULL,
 CONSTRAINT [PK_candiadate_stage] PRIMARY KEY CLUSTERED 
(
	[candidate_id] ASC,
	[stage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidates]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](25) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone_number] [varchar](20) NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [int] NOT NULL,
	[interviewer_id] [nchar](10) NULL,
	[salary] [decimal](8, 2) NOT NULL,
	[department_id] [int] NULL,
 CONSTRAINT [PK__employee__3213E83F50F84446] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [varchar](40) NULL,
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK__countrie__7E8CD055782E7D58] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](30) NOT NULL,
	[location_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interviewer]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interviewer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[position] [varchar](25) NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_interviewer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interviewer_candidate]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interviewer_candidate](
	[interviewer_id] [int] NOT NULL,
	[candidate_id] [int] NOT NULL,
	[score] [int] NOT NULL,
 CONSTRAINT [PK_interviewer_candidate] PRIMARY KEY CLUSTERED 
(
	[interviewer_id] ASC,
	[candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[expired_date] [datetime] NULL,
	[job_title] [nvarchar](50) NOT NULL,
	[min_salary] [decimal](8, 2) NULL,
	[max_salary] [decimal](8, 2) NULL,
 CONSTRAINT [PK__jobs__3213E83F0D65D3F9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs_skill]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs_skill](
	[job_id] [int] NOT NULL,
	[exp_year] [int] NULL,
	[skill_id] [int] NOT NULL,
 CONSTRAINT [PK_jobs_skill] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC,
	[skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street_address] [varchar](40) NULL,
	[postal_code] [varchar](12) NULL,
	[city] [varchar](30) NOT NULL,
	[state_province] [varchar](25) NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK__location__771831EA07343670] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regions]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[region_name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[skills]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_skills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stages]    Script Date: 3/28/2023 8:55:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[stage_index] [int] NOT NULL,
 CONSTRAINT [PK_stages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[candidates] ON 

INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (100, N'Steven', N'King', N'steven.king@sqltutorial.org', N'515.123.4567', CAST(N'1987-06-17' AS Date), 4, NULL, CAST(24000.00 AS Decimal(8, 2)), 9)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (101, N'Neena', N'Kochhar', N'neena.kochhar@sqltutorial.org', N'515.123.4568', CAST(N'1989-09-21' AS Date), 5, NULL, CAST(17000.00 AS Decimal(8, 2)), 9)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (102, N'Lex', N'De Haan', N'lex.de haan@sqltutorial.org', N'515.123.4569', CAST(N'1993-01-13' AS Date), 5, NULL, CAST(17000.00 AS Decimal(8, 2)), 9)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (103, N'Alexander', N'Hunold', N'alexander.hunold@sqltutorial.org', N'590.423.4567', CAST(N'1990-01-03' AS Date), 9, NULL, CAST(9000.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (104, N'Bruce', N'Ernst', N'bruce.ernst@sqltutorial.org', N'590.423.4568', CAST(N'1991-05-21' AS Date), 9, NULL, CAST(6000.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (105, N'David', N'Austin', N'david.austin@sqltutorial.org', N'590.423.4569', CAST(N'1997-06-25' AS Date), 9, NULL, CAST(4800.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (106, N'Valli', N'Pataballa', N'valli.pataballa@sqltutorial.org', N'590.423.4560', CAST(N'1998-02-05' AS Date), 9, NULL, CAST(4800.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (107, N'Diana', N'Lorentz', N'diana.lorentz@sqltutorial.org', N'590.423.5567', CAST(N'1999-02-07' AS Date), 9, NULL, CAST(4200.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (108, N'Nancy', N'Greenberg', N'nancy.greenberg@sqltutorial.org', N'515.124.4569', CAST(N'1994-08-17' AS Date), 7, NULL, CAST(12000.00 AS Decimal(8, 2)), 10)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (109, N'Daniel', N'Faviet', N'daniel.faviet@sqltutorial.org', N'515.124.4169', CAST(N'1994-08-16' AS Date), 6, NULL, CAST(9000.00 AS Decimal(8, 2)), 10)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (110, N'John', N'Chen', N'john.chen@sqltutorial.org', N'515.124.4269', CAST(N'1997-09-28' AS Date), 6, NULL, CAST(8200.00 AS Decimal(8, 2)), 10)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (111, N'Ismael', N'Sciarra', N'ismael.sciarra@sqltutorial.org', N'515.124.4369', CAST(N'1997-09-30' AS Date), 6, NULL, CAST(7700.00 AS Decimal(8, 2)), 10)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (112, N'Jose Manuel', N'Urman', N'jose manuel.urman@sqltutorial.org', N'515.124.4469', CAST(N'1998-03-07' AS Date), 6, NULL, CAST(7800.00 AS Decimal(8, 2)), 10)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (113, N'Luis', N'Popp', N'luis.popp@sqltutorial.org', N'515.124.4567', CAST(N'1999-12-07' AS Date), 6, NULL, CAST(6900.00 AS Decimal(8, 2)), 10)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (114, N'Den', N'Raphaely', N'den.raphaely@sqltutorial.org', N'515.127.4561', CAST(N'1994-12-07' AS Date), 14, NULL, CAST(11000.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (115, N'Alexander', N'Khoo', N'alexander.khoo@sqltutorial.org', N'515.127.4562', CAST(N'1995-05-18' AS Date), 13, NULL, CAST(3100.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (116, N'Shelli', N'Baida', N'shelli.baida@sqltutorial.org', N'515.127.4563', CAST(N'1997-12-24' AS Date), 13, NULL, CAST(2900.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (117, N'Sigal', N'Tobias', N'sigal.tobias@sqltutorial.org', N'515.127.4564', CAST(N'1997-07-24' AS Date), 13, NULL, CAST(2800.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (118, N'Guy', N'Himuro', N'guy.himuro@sqltutorial.org', N'515.127.4565', CAST(N'1998-11-15' AS Date), 13, NULL, CAST(2600.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (119, N'Karen', N'Colmenares', N'karen.colmenares@sqltutorial.org', N'515.127.4566', CAST(N'1999-08-10' AS Date), 13, NULL, CAST(2500.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (120, N'Matthew', N'Weiss', N'matthew.weiss@sqltutorial.org', N'650.123.1234', CAST(N'1996-07-18' AS Date), 19, NULL, CAST(8000.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (121, N'Adam', N'Fripp', N'adam.fripp@sqltutorial.org', N'650.123.2234', CAST(N'1997-04-10' AS Date), 19, NULL, CAST(8200.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (122, N'Payam', N'Kaufling', N'payam.kaufling@sqltutorial.org', N'650.123.3234', CAST(N'1995-05-01' AS Date), 19, NULL, CAST(7900.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (123, N'Shanta', N'Vollman', N'shanta.vollman@sqltutorial.org', N'650.123.4234', CAST(N'1997-10-10' AS Date), 19, NULL, CAST(6500.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (126, N'Irene', N'Mikkilineni', N'irene.mikkilineni@sqltutorial.org', N'650.124.1224', CAST(N'1998-09-28' AS Date), 18, NULL, CAST(2700.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (145, N'John', N'Russell', N'john.russell@sqltutorial.org', NULL, CAST(N'1996-10-01' AS Date), 15, NULL, CAST(14000.00 AS Decimal(8, 2)), 8)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (146, N'Karen', N'Partners', N'karen.partners@sqltutorial.org', NULL, CAST(N'1997-01-05' AS Date), 15, NULL, CAST(13500.00 AS Decimal(8, 2)), 8)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (176, N'Jonathon', N'Taylor', N'jonathon.taylor@sqltutorial.org', NULL, CAST(N'1998-03-24' AS Date), 16, NULL, CAST(8600.00 AS Decimal(8, 2)), 8)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (177, N'Jack', N'Livingston', N'jack.livingston@sqltutorial.org', NULL, CAST(N'1998-04-23' AS Date), 16, NULL, CAST(8400.00 AS Decimal(8, 2)), 8)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (178, N'Kimberely', N'Grant', N'kimberely.grant@sqltutorial.org', NULL, CAST(N'1999-05-24' AS Date), 16, NULL, CAST(7000.00 AS Decimal(8, 2)), 8)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (179, N'Charles', N'Johnson', N'charles.johnson@sqltutorial.org', NULL, CAST(N'2000-01-04' AS Date), 16, NULL, CAST(6200.00 AS Decimal(8, 2)), 8)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (192, N'Sarah', N'Bell', N'sarah.bell@sqltutorial.org', N'650.501.1876', CAST(N'1996-02-04' AS Date), 17, NULL, CAST(4000.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (193, N'Britney', N'Everett', N'britney.everett@sqltutorial.org', N'650.501.2876', CAST(N'1997-03-03' AS Date), 17, NULL, CAST(3900.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (200, N'Jennifer', N'Whalen', N'jennifer.whalen@sqltutorial.org', N'515.123.4444', CAST(N'1987-09-17' AS Date), 3, NULL, CAST(4400.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (201, N'Michael', N'Hartstein', N'michael.hartstein@sqltutorial.org', N'515.123.5555', CAST(N'1996-02-17' AS Date), 10, NULL, CAST(13000.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (202, N'Pat', N'Fay', N'pat.fay@sqltutorial.org', N'603.123.6666', CAST(N'1997-08-17' AS Date), 11, NULL, CAST(6000.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (203, N'Susan', N'Mavris', N'susan.mavris@sqltutorial.org', N'515.123.7777', CAST(N'1994-06-07' AS Date), 8, NULL, CAST(6500.00 AS Decimal(8, 2)), 4)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (204, N'Hermann', N'Baer', N'anhbdhe151175@fpt.edu.com', N'515.123.8888', CAST(N'1994-06-07' AS Date), 12, NULL, CAST(10000.00 AS Decimal(8, 2)), 7)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (205, N'Shelley', N'Higgins', N'dominhanh171201@gmail.com', N'515.123.8080', CAST(N'1994-06-07' AS Date), 2, NULL, CAST(12000.00 AS Decimal(8, 2)), 11)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (206, N'William', N'Gietz', N'hongnhung.bda13@gmail.com', N'515.123.8181', CAST(N'1994-06-07' AS Date), 1, NULL, CAST(8300.00 AS Decimal(8, 2)), 11)
INSERT [dbo].[candidates] ([id], [first_name], [last_name], [email], [phone_number], [hire_date], [job_id], [interviewer_id], [salary], [department_id]) VALUES (214, N'Bùi', N'Anh', N'ducanhbui09@gmail.com', N'0943993221', CAST(N'2023-03-26' AS Date), 17, NULL, CAST(1999.00 AS Decimal(8, 2)), 10)
SET IDENTITY_INSERT [dbo].[candidates] OFF
GO
SET IDENTITY_INSERT [dbo].[countries] ON 

INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (1, N'Argentina', 2)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (2, N'Australia', 3)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (3, N'Belgium', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (4, N'Brazil', 2)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (5, N'Canada', 2)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (6, N'Switzerland', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (7, N'China', 3)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (8, N'Germany', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (9, N'Denmark', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (10, N'Egypt', 4)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (11, N'France', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (12, N'HongKong', 3)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (13, N'Israel', 4)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (14, N'India', 3)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (15, N'Italy', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (16, N'Japan', 3)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (17, N'Kuwait', 4)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (18, N'Mexico', 2)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (19, N'Nigeria', 4)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (20, N'Netherlands', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (21, N'Singapore', 3)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (22, N'United Kingdom', 1)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (23, N'United States of America', 2)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (24, N'Zambia', 4)
INSERT [dbo].[countries] ([id], [country_name], [region_id]) VALUES (25, N'Zimbabwe', 4)
SET IDENTITY_INSERT [dbo].[countries] OFF
GO
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (1, N'Administration', 1700)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (2, N'Marketing', 1800)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (3, N'Purchasing', 1700)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (4, N'Human Resources', 2400)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (5, N'Shipping', 1500)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (6, N'IT', 1400)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (7, N'Public Relations', 2700)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (8, N'Sales', 2500)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (9, N'Executive', 1700)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (10, N'Finance', 1700)
INSERT [dbo].[departments] ([id], [department_name], [location_id]) VALUES (11, N'Accounting', 1700)
SET IDENTITY_INSERT [dbo].[departments] OFF
GO
SET IDENTITY_INSERT [dbo].[interviewer] ON 

INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (1, N'Penelope', N'Gietz', N'Child', N'dominhanh171201@gmail.com', N'123123')
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (2, N'Nick', N'Higgins', N'Child', N'abc@gmail.com', N'321321')
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (3, N'Ed', N'Whalen', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (4, N'Jennifer', N'King', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (5, N'Johnny', N'Kochhar', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (6, N'Bette', N'De Haan', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (7, N'Grace', N'Faviet', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (8, N'Matthew', N'Chen', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (9, N'Joe', N'Sciarra', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (10, N'Christian', N'Urman', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (11, N'Zero', N'Popp', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (12, N'Karl', N'Greenberg', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (13, N'Uma', N'Mavris', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (14, N'Vivien', N'Hunold', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (15, N'Cuba', N'Ernst', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (16, N'Fred', N'Austin', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (17, N'Helen', N'Pataballa', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (18, N'Dan', N'Lorentz', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (19, N'Bob', N'Hartstein', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (20, N'Lucille', N'Fay', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (21, N'Kirsten', N'Baer', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (22, N'Elvis', N'Khoo', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (23, N'Sandra', N'Baida', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (24, N'Cameron', N'Tobias', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (25, N'Kevin', N'Himuro', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (26, N'Rip', N'Colmenares', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (27, N'Julia', N'Raphaely', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (28, N'Woody', N'Russell', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (29, N'Alec', N'Partners', N'Child', NULL, NULL)
INSERT [dbo].[interviewer] ([id], [first_name], [last_name], [position], [email], [password]) VALUES (30, N'Sandra', N'Taylor', N'Child', NULL, NULL)
SET IDENTITY_INSERT [dbo].[interviewer] OFF
GO
SET IDENTITY_INSERT [dbo].[jobs] ON 

INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (1, NULL, NULL, N'Public Accountant', CAST(4200.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (2, NULL, NULL, N'Accounting Manager', CAST(8200.00 AS Decimal(8, 2)), CAST(16000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (3, NULL, NULL, N'Administration Assistant', CAST(3000.00 AS Decimal(8, 2)), CAST(6000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (4, NULL, NULL, N'President', CAST(20000.00 AS Decimal(8, 2)), CAST(40000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (5, NULL, NULL, N'Administration Vice President', CAST(15000.00 AS Decimal(8, 2)), CAST(30000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (6, NULL, NULL, N'Accountant', CAST(4200.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (7, NULL, NULL, N'Finance Manager', CAST(8200.00 AS Decimal(8, 2)), CAST(16000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (8, NULL, NULL, N'Human Resources Representative', CAST(4000.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (9, NULL, NULL, N'Programmer', CAST(4000.00 AS Decimal(8, 2)), CAST(10000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (10, NULL, NULL, N'Marketing Manager', CAST(9000.00 AS Decimal(8, 2)), CAST(15000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (11, NULL, NULL, N'Marketing Representative', CAST(4000.00 AS Decimal(8, 2)), CAST(9000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (12, NULL, NULL, N'Public Relations Representative', CAST(4500.00 AS Decimal(8, 2)), CAST(10500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (13, NULL, NULL, N'Purchasing Clerk', CAST(2500.00 AS Decimal(8, 2)), CAST(5500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (14, NULL, NULL, N'Purchasing Manager', CAST(8000.00 AS Decimal(8, 2)), CAST(15000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (15, NULL, NULL, N'Sales Manager', CAST(10000.00 AS Decimal(8, 2)), CAST(20000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (16, NULL, NULL, N'Sales Representative', CAST(6000.00 AS Decimal(8, 2)), CAST(12000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (17, NULL, NULL, N'Shipping Clerk', CAST(2500.00 AS Decimal(8, 2)), CAST(5500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (18, NULL, NULL, N'Stock Clerk', CAST(2000.00 AS Decimal(8, 2)), CAST(5000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (19, NULL, NULL, N'Stock Manager', CAST(5500.00 AS Decimal(8, 2)), CAST(8500.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (20, CAST(N'2023-03-26T00:21:11.547' AS DateTime), CAST(N'2023-03-29T00:00:00.000' AS DateTime), N'Project Manager', CAST(3000.00 AS Decimal(8, 2)), CAST(10000.00 AS Decimal(8, 2)))
INSERT [dbo].[jobs] ([id], [created_date], [expired_date], [job_title], [min_salary], [max_salary]) VALUES (24, CAST(N'2023-03-27T12:27:06.470' AS DateTime), CAST(N'2023-03-30T00:00:00.000' AS DateTime), N'PM', CAST(122.00 AS Decimal(8, 2)), CAST(1222.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[jobs] OFF
GO
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (9, NULL, 1)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (9, NULL, 2)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (9, NULL, 3)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (9, NULL, 4)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (9, NULL, 5)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (9, NULL, 6)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 1)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 2)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 3)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 4)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 5)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 6)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 7)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (20, NULL, 8)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (24, NULL, 1)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (24, NULL, 2)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (24, NULL, 5)
INSERT [dbo].[jobs_skill] ([job_id], [exp_year], [skill_id]) VALUES (24, NULL, 6)
GO
SET IDENTITY_INSERT [dbo].[locations] ON 

INSERT [dbo].[locations] ([id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1400, N'2014 Jabberwocky Rd', N'26192', N'Southlake', N'Texas', 23)
INSERT [dbo].[locations] ([id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1500, N'2011 Interiors Blvd', N'99236', N'South San Francisco', N'California', 23)
INSERT [dbo].[locations] ([id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1700, N'2004 Charade Rd', N'98199', N'Seattle', N'Washington', 23)
INSERT [dbo].[locations] ([id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (1800, N'147 Spadina Ave', N'M5V 2L7', N'Toronto', N'Ontario', 5)
INSERT [dbo].[locations] ([id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2400, N'8204 Arthur St', NULL, N'London', NULL, 22)
INSERT [dbo].[locations] ([id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2500, N'Magdalen Centre, The Oxford Science Park', N'OX9 9ZB', N'Oxford', N'Oxford', 22)
INSERT [dbo].[locations] ([id], [street_address], [postal_code], [city], [state_province], [country_id]) VALUES (2700, N'Schwanthalerstr. 7031', N'80925', N'Munich', N'Bavaria', 8)
SET IDENTITY_INSERT [dbo].[locations] OFF
GO
SET IDENTITY_INSERT [dbo].[regions] ON 

INSERT [dbo].[regions] ([id], [region_name]) VALUES (1, N'Europe')
INSERT [dbo].[regions] ([id], [region_name]) VALUES (2, N'Americas')
INSERT [dbo].[regions] ([id], [region_name]) VALUES (3, N'Asia')
INSERT [dbo].[regions] ([id], [region_name]) VALUES (4, N'Middle East and Africa')
SET IDENTITY_INSERT [dbo].[regions] OFF
GO
SET IDENTITY_INSERT [dbo].[skills] ON 

INSERT [dbo].[skills] ([id], [name]) VALUES (1, N'.NET')
INSERT [dbo].[skills] ([id], [name]) VALUES (2, N'JAVA')
INSERT [dbo].[skills] ([id], [name]) VALUES (3, N'SQL')
INSERT [dbo].[skills] ([id], [name]) VALUES (4, N'REACT')
INSERT [dbo].[skills] ([id], [name]) VALUES (5, N'ANGULAR')
INSERT [dbo].[skills] ([id], [name]) VALUES (6, N'TEST MANUAL')
INSERT [dbo].[skills] ([id], [name]) VALUES (7, N'TEST AUTOMATION')
INSERT [dbo].[skills] ([id], [name]) VALUES (8, N'VUE')
SET IDENTITY_INSERT [dbo].[skills] OFF
GO
SET IDENTITY_INSERT [dbo].[stages] ON 

INSERT [dbo].[stages] ([id], [name], [stage_index]) VALUES (2, N'Round 1', 1)
INSERT [dbo].[stages] ([id], [name], [stage_index]) VALUES (3, N'Round 2', 2)
INSERT [dbo].[stages] ([id], [name], [stage_index]) VALUES (4, N'Round 3', 3)
INSERT [dbo].[stages] ([id], [name], [stage_index]) VALUES (5, N'Round 4', 4)
SET IDENTITY_INSERT [dbo].[stages] OFF
GO
ALTER TABLE [dbo].[candidates] ADD  CONSTRAINT [DF__employees__first__31EC6D26]  DEFAULT (NULL) FOR [first_name]
GO
ALTER TABLE [dbo].[candidates] ADD  CONSTRAINT [DF__employees__phone__32E0915F]  DEFAULT (NULL) FOR [phone_number]
GO
ALTER TABLE [dbo].[candidates] ADD  CONSTRAINT [DF__employees__depar__34C8D9D1]  DEFAULT (NULL) FOR [department_id]
GO
ALTER TABLE [dbo].[countries] ADD  CONSTRAINT [DF__countries__count__276EDEB3]  DEFAULT (NULL) FOR [country_name]
GO
ALTER TABLE [dbo].[departments] ADD  DEFAULT (NULL) FOR [location_id]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__min_salary__35BCFE0A]  DEFAULT (NULL) FOR [min_salary]
GO
ALTER TABLE [dbo].[jobs] ADD  CONSTRAINT [DF__jobs__max_salary__36B12243]  DEFAULT (NULL) FOR [max_salary]
GO
ALTER TABLE [dbo].[locations] ADD  CONSTRAINT [DF__locations__stree__2B3F6F97]  DEFAULT (NULL) FOR [street_address]
GO
ALTER TABLE [dbo].[locations] ADD  CONSTRAINT [DF__locations__posta__2C3393D0]  DEFAULT (NULL) FOR [postal_code]
GO
ALTER TABLE [dbo].[locations] ADD  CONSTRAINT [DF__locations__state__2D27B809]  DEFAULT (NULL) FOR [state_province]
GO
ALTER TABLE [dbo].[regions] ADD  DEFAULT (NULL) FOR [region_name]
GO
ALTER TABLE [dbo].[candiadate_stage]  WITH CHECK ADD  CONSTRAINT [FK_candiadate_stage_candidates] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[candidates] ([id])
GO
ALTER TABLE [dbo].[candiadate_stage] CHECK CONSTRAINT [FK_candiadate_stage_candidates]
GO
ALTER TABLE [dbo].[candiadate_stage]  WITH CHECK ADD  CONSTRAINT [FK_candiadate_stage_stages] FOREIGN KEY([stage_id])
REFERENCES [dbo].[stages] ([id])
GO
ALTER TABLE [dbo].[candiadate_stage] CHECK CONSTRAINT [FK_candiadate_stage_stages]
GO
ALTER TABLE [dbo].[candidates]  WITH CHECK ADD  CONSTRAINT [FK__employees__depar__3E52440B] FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[candidates] CHECK CONSTRAINT [FK__employees__depar__3E52440B]
GO
ALTER TABLE [dbo].[candidates]  WITH CHECK ADD  CONSTRAINT [FK__employees__job_i__3F466844] FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[candidates] CHECK CONSTRAINT [FK__employees__job_i__3F466844]
GO
ALTER TABLE [dbo].[countries]  WITH CHECK ADD  CONSTRAINT [FK__countries__regio__286302EC] FOREIGN KEY([region_id])
REFERENCES [dbo].[regions] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[countries] CHECK CONSTRAINT [FK__countries__regio__286302EC]
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD  CONSTRAINT [FK__departmen__locat__35BCFE0A] FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[departments] CHECK CONSTRAINT [FK__departmen__locat__35BCFE0A]
GO
ALTER TABLE [dbo].[interviewer_candidate]  WITH CHECK ADD  CONSTRAINT [FK_interviewer_candidate_candidates] FOREIGN KEY([candidate_id])
REFERENCES [dbo].[candidates] ([id])
GO
ALTER TABLE [dbo].[interviewer_candidate] CHECK CONSTRAINT [FK_interviewer_candidate_candidates]
GO
ALTER TABLE [dbo].[interviewer_candidate]  WITH CHECK ADD  CONSTRAINT [FK_interviewer_candidate_interviewer] FOREIGN KEY([interviewer_id])
REFERENCES [dbo].[interviewer] ([id])
GO
ALTER TABLE [dbo].[interviewer_candidate] CHECK CONSTRAINT [FK_interviewer_candidate_interviewer]
GO
ALTER TABLE [dbo].[jobs_skill]  WITH CHECK ADD  CONSTRAINT [FK_jobs_skill_jobs] FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([id])
GO
ALTER TABLE [dbo].[jobs_skill] CHECK CONSTRAINT [FK_jobs_skill_jobs]
GO
ALTER TABLE [dbo].[jobs_skill]  WITH CHECK ADD  CONSTRAINT [FK_jobs_skill_skills] FOREIGN KEY([skill_id])
REFERENCES [dbo].[skills] ([id])
GO
ALTER TABLE [dbo].[jobs_skill] CHECK CONSTRAINT [FK_jobs_skill_skills]
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD  CONSTRAINT [FK__locations__count__2E1BDC42] FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[locations] CHECK CONSTRAINT [FK__locations__count__2E1BDC42]
GO
USE [master]
GO
ALTER DATABASE [PRN231_DTB] SET  READ_WRITE 
GO
