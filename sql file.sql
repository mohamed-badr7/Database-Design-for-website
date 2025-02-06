USE [master]
GO
/****** Object:  Database [VezeetaDB]    Script Date: 30/11/2024 3:11:25 PM ******/
CREATE DATABASE [VezeetaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VezeetaDB', FILENAME = N'D:\Course\sql server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VezeetaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VezeetaDB_log', FILENAME = N'D:\Course\sql server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VezeetaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VezeetaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VezeetaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VezeetaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VezeetaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VezeetaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VezeetaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VezeetaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VezeetaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VezeetaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VezeetaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VezeetaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VezeetaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VezeetaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VezeetaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VezeetaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VezeetaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VezeetaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VezeetaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VezeetaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VezeetaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VezeetaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VezeetaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VezeetaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VezeetaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VezeetaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [VezeetaDB] SET  MULTI_USER 
GO
ALTER DATABASE [VezeetaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VezeetaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VezeetaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VezeetaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VezeetaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VezeetaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VezeetaDB', N'ON'
GO
ALTER DATABASE [VezeetaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [VezeetaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VezeetaDB]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DoctorID] [int] NULL,
	[AppointmentDate] [datetime] NOT NULL,
	[StatusID] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CallDoctor]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallDoctor](
	[CallID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DoctorID] [int] NULL,
	[CallDate] [datetime] NULL,
	[Duration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](255) NULL,
	[GovernorateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinics]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinics](
	[ClinicID] [int] IDENTITY(1,1) NOT NULL,
	[ClinicName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[CityID] [int] NULL,
	[SpecializationID] [int] NULL,
	[SubspecialtyID] [int] NULL,
	[PriceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClinicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[GenderID] [int] NULL,
	[ExperienceYears] [int] NULL,
	[Rate] [decimal](3, 2) NULL,
	[Comments] [nvarchar](max) NULL,
	[TitleID] [int] NULL,
	[FacilityID] [int] NULL,
	[PriceID] [int] NULL,
	[SpecializationID] [int] NULL,
	[SubspecialtyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorsTitle]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorsTitle](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityName] [nvarchar](255) NULL,
	[FacilityType] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[CityID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Governorates]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Governorates](
	[GovernorateID] [int] IDENTITY(1,1) NOT NULL,
	[GovernorateName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GovernorateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeVisit]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeVisit](
	[VisitID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DoctorID] [int] NULL,
	[VisitDate] [datetime] NOT NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[VisitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance_Contacts]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance_Contacts](
	[InsuranceContactID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[InsuranceName] [nvarchar](255) NULL,
	[InsuranceNumber] [nvarchar](255) NULL,
	[ContactDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InsuranceContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalLibrary]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalLibrary](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[SpecializationID] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalQuestions]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalQuestions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DoctorID] [int] NULL,
	[Question] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacies]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacies](
	[PharmacyID] [int] IDENTITY(1,1) NOT NULL,
	[PharmacyName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[CityID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmaciesOrders]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmaciesOrders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PharmacyID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmaciesOrdersDetails]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmaciesOrdersDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmaciesProducts]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmaciesProducts](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[ProductPrice] [decimal](10, 2) NULL,
	[PharmacyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[PriceID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[PriceAmount] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Prices__4957584F8A974CE1] PRIMARY KEY CLUSTERED 
(
	[PriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionsAnswers]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionsAnswers](
	[QnAID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Question] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QnAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[SpecializationID] [int] IDENTITY(1,1) NOT NULL,
	[SpecializationName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subspecialties]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subspecialties](
	[SubspecialtyID] [int] IDENTITY(1,1) NOT NULL,
	[SubspecialtyName] [nvarchar](255) NULL,
	[SpecializationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubspecialtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/11/2024 3:11:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[GenderID] [int] NULL,
	[DateOfBirth] [date] NULL,
	[RegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 
GO
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [DoctorID], [AppointmentDate], [StatusID], [CreatedAt]) VALUES (1, 1, 1, CAST(N'2024-12-01T10:00:00.000' AS DateTime), 1, CAST(N'2024-11-23T22:48:53.757' AS DateTime))
GO
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [DoctorID], [AppointmentDate], [StatusID], [CreatedAt]) VALUES (2, 2, 2, CAST(N'2024-12-02T14:00:00.000' AS DateTime), 2, CAST(N'2024-11-23T22:48:53.757' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[CallDoctor] ON 
GO
INSERT [dbo].[CallDoctor] ([CallID], [UserID], [DoctorID], [CallDate], [Duration]) VALUES (1, 1, 1, CAST(N'2024-11-23T22:48:53.767' AS DateTime), 30)
GO
INSERT [dbo].[CallDoctor] ([CallID], [UserID], [DoctorID], [CallDate], [Duration]) VALUES (2, 2, 2, CAST(N'2024-11-23T22:48:53.767' AS DateTime), 45)
GO
SET IDENTITY_INSERT [dbo].[CallDoctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 
GO
INSERT [dbo].[Cities] ([CityID], [CityName], [GovernorateID]) VALUES (1, N'Nasr City', 1)
GO
INSERT [dbo].[Cities] ([CityID], [CityName], [GovernorateID]) VALUES (2, N'Sidi Gaber', 2)
GO
INSERT [dbo].[Cities] ([CityID], [CityName], [GovernorateID]) VALUES (3, N'6th of October', 3)
GO
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Clinics] ON 
GO
INSERT [dbo].[Clinics] ([ClinicID], [ClinicName], [Address], [CityID], [SpecializationID], [SubspecialtyID], [PriceID]) VALUES (1, N'City Clinic', N'123 Main St, Nasr City', 1, 1, 1, 1)
GO
INSERT [dbo].[Clinics] ([ClinicID], [ClinicName], [Address], [CityID], [SpecializationID], [SubspecialtyID], [PriceID]) VALUES (2, N'Alex Specialist Center', N'456 Elm St, Sidi Gaber', 2, 2, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Clinics] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 
GO
INSERT [dbo].[Doctors] ([DoctorID], [FullName], [GenderID], [ExperienceYears], [Rate], [Comments], [TitleID], [FacilityID], [PriceID], [SpecializationID], [SubspecialtyID]) VALUES (1, N'Dr. Alice Roberts', 2, 10, CAST(4.80 AS Decimal(3, 2)), N'Excellent cardiologist', 1, 1, 2, 1, 4)
GO
INSERT [dbo].[Doctors] ([DoctorID], [FullName], [GenderID], [ExperienceYears], [Rate], [Comments], [TitleID], [FacilityID], [PriceID], [SpecializationID], [SubspecialtyID]) VALUES (2, N'Dr. Bob Andrews', 1, 7, CAST(4.50 AS Decimal(3, 2)), N'Highly recommended', 2, 2, 3, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorsTitle] ON 
GO
INSERT [dbo].[DoctorsTitle] ([TitleID], [Title]) VALUES (1, N'Professor')
GO
INSERT [dbo].[DoctorsTitle] ([TitleID], [Title]) VALUES (2, N'Associate Professor')
GO
INSERT [dbo].[DoctorsTitle] ([TitleID], [Title]) VALUES (3, N'Consultant')
GO
SET IDENTITY_INSERT [dbo].[DoctorsTitle] OFF
GO
SET IDENTITY_INSERT [dbo].[Facilities] ON 
GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName], [FacilityType], [Address], [CityID]) VALUES (1, N'Green Hospital', N'Hospital', N'789 Pine St, Nasr City', 1)
GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName], [FacilityType], [Address], [CityID]) VALUES (2, N'Blue Clinic', N'Clinic', N'321 Oak St, 6th of October', 3)
GO
SET IDENTITY_INSERT [dbo].[Facilities] OFF
GO
SET IDENTITY_INSERT [dbo].[Genders] ON 
GO
INSERT [dbo].[Genders] ([GenderID], [Gender]) VALUES (1, N'Male')
GO
INSERT [dbo].[Genders] ([GenderID], [Gender]) VALUES (2, N'Female')
GO
INSERT [dbo].[Genders] ([GenderID], [Gender]) VALUES (3, N'Other')
GO
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Governorates] ON 
GO
INSERT [dbo].[Governorates] ([GovernorateID], [GovernorateName]) VALUES (1, N'Cairo')
GO
INSERT [dbo].[Governorates] ([GovernorateID], [GovernorateName]) VALUES (2, N'Alexandria')
GO
INSERT [dbo].[Governorates] ([GovernorateID], [GovernorateName]) VALUES (3, N'Giza')
GO
SET IDENTITY_INSERT [dbo].[Governorates] OFF
GO
SET IDENTITY_INSERT [dbo].[HomeVisit] ON 
GO
INSERT [dbo].[HomeVisit] ([VisitID], [UserID], [DoctorID], [VisitDate], [Address]) VALUES (1, 1, 1, CAST(N'2024-12-05T09:00:00.000' AS DateTime), N'123 Home St, Nasr City')
GO
INSERT [dbo].[HomeVisit] ([VisitID], [UserID], [DoctorID], [VisitDate], [Address]) VALUES (2, 2, 2, CAST(N'2024-12-06T11:00:00.000' AS DateTime), N'456 Apartment Rd, Sidi Gaber')
GO
SET IDENTITY_INSERT [dbo].[HomeVisit] OFF
GO
SET IDENTITY_INSERT [dbo].[Insurance_Contacts] ON 
GO
INSERT [dbo].[Insurance_Contacts] ([InsuranceContactID], [UserID], [InsuranceName], [InsuranceNumber], [ContactDate]) VALUES (1, 1, N'HealthCare Inc.', N'INS123456', CAST(N'2024-11-23T22:48:53.730' AS DateTime))
GO
INSERT [dbo].[Insurance_Contacts] ([InsuranceContactID], [UserID], [InsuranceName], [InsuranceNumber], [ContactDate]) VALUES (2, 2, N'LifeHealth', N'INS654321', CAST(N'2024-11-23T22:48:53.730' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Insurance_Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalLibrary] ON 
GO
INSERT [dbo].[MedicalLibrary] ([EntryID], [Title], [Content], [SpecializationID], [CreatedAt]) VALUES (1, N'Heart Disease Overview', N'Heart disease includes conditions that affect the heart.', 1, CAST(N'2024-11-23T22:48:53.770' AS DateTime))
GO
INSERT [dbo].[MedicalLibrary] ([EntryID], [Title], [Content], [SpecializationID], [CreatedAt]) VALUES (2, N'Migraine Management', N'Lifestyle changes and medication can help manage migraines.', 2, CAST(N'2024-11-23T22:48:53.770' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MedicalLibrary] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalQuestions] ON 
GO
INSERT [dbo].[MedicalQuestions] ([QuestionID], [UserID], [DoctorID], [Question], [CreatedAt]) VALUES (1, 1, 1, N'What are the symptoms of a heart attack?', CAST(N'2024-11-23T22:48:53.763' AS DateTime))
GO
INSERT [dbo].[MedicalQuestions] ([QuestionID], [UserID], [DoctorID], [Question], [CreatedAt]) VALUES (2, 2, 2, N'Can migraines lead to other complications?', CAST(N'2024-11-23T22:48:53.763' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MedicalQuestions] OFF
GO
SET IDENTITY_INSERT [dbo].[Pharmacies] ON 
GO
INSERT [dbo].[Pharmacies] ([PharmacyID], [PharmacyName], [Address], [CityID]) VALUES (1, N'Health Pharmacy', N'123 Medical St, Nasr City', 1)
GO
INSERT [dbo].[Pharmacies] ([PharmacyID], [PharmacyName], [Address], [CityID]) VALUES (2, N'Wellness Pharmacy', N'456 Healing St, Sidi Gaber', 2)
GO
SET IDENTITY_INSERT [dbo].[Pharmacies] OFF
GO
SET IDENTITY_INSERT [dbo].[PharmaciesOrders] ON 
GO
INSERT [dbo].[PharmaciesOrders] ([OrderID], [UserID], [PharmacyID], [OrderDate], [TotalAmount]) VALUES (1, 1, 1, CAST(N'2024-11-23T22:48:53.760' AS DateTime), CAST(30.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[PharmaciesOrders] ([OrderID], [UserID], [PharmacyID], [OrderDate], [TotalAmount]) VALUES (2, 2, 2, CAST(N'2024-11-23T22:48:53.760' AS DateTime), CAST(20.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[PharmaciesOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[PharmaciesOrdersDetails] ON 
GO
INSERT [dbo].[PharmaciesOrdersDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 2, CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[PharmaciesOrdersDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 2, 2, 1, CAST(20.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[PharmaciesOrdersDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PharmaciesProducts] ON 
GO
INSERT [dbo].[PharmaciesProducts] ([ProductID], [ProductName], [ProductPrice], [PharmacyID]) VALUES (1, N'Paracetamol', CAST(10.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[PharmaciesProducts] ([ProductID], [ProductName], [ProductPrice], [PharmacyID]) VALUES (2, N'Ibuprofen', CAST(20.00 AS Decimal(10, 2)), 2)
GO
SET IDENTITY_INSERT [dbo].[PharmaciesProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[Prices] ON 
GO
INSERT [dbo].[Prices] ([PriceID], [Description], [PriceAmount]) VALUES (1, N'Medical examination', CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Prices] ([PriceID], [Description], [PriceAmount]) VALUES (2, N'Medical follow-up', CAST(350.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Prices] ([PriceID], [Description], [PriceAmount]) VALUES (3, N'rays', CAST(500.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Prices] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionsAnswers] ON 
GO
INSERT [dbo].[QuestionsAnswers] ([QnAID], [UserID], [Question], [Answer], [CreatedAt]) VALUES (1, 1, N'What is hypertension?', N'Hypertension is high blood pressure.', CAST(N'2024-11-23T22:48:53.770' AS DateTime))
GO
INSERT [dbo].[QuestionsAnswers] ([QnAID], [UserID], [Question], [Answer], [CreatedAt]) VALUES (2, 2, N'How to treat acne?', N'Use medicated cleansers and topical creams.', CAST(N'2024-11-23T22:48:53.770' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[QuestionsAnswers] OFF
GO
SET IDENTITY_INSERT [dbo].[Specializations] ON 
GO
INSERT [dbo].[Specializations] ([SpecializationID], [SpecializationName]) VALUES (1, N'Cardiology')
GO
INSERT [dbo].[Specializations] ([SpecializationID], [SpecializationName]) VALUES (2, N'Neurology')
GO
INSERT [dbo].[Specializations] ([SpecializationID], [SpecializationName]) VALUES (3, N'Dermatology')
GO
SET IDENTITY_INSERT [dbo].[Specializations] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Scheduled')
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Completed')
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (3, N'Cancelled')
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (4, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Subspecialties] ON 
GO
INSERT [dbo].[Subspecialties] ([SubspecialtyID], [SubspecialtyName], [SpecializationID]) VALUES (1, N'Interventional Cardiology', 1)
GO
INSERT [dbo].[Subspecialties] ([SubspecialtyID], [SubspecialtyName], [SpecializationID]) VALUES (2, N'Pediatric Neurology', 2)
GO
INSERT [dbo].[Subspecialties] ([SubspecialtyID], [SubspecialtyName], [SpecializationID]) VALUES (3, N'Cosmetic Dermatology', 3)
GO
INSERT [dbo].[Subspecialties] ([SubspecialtyID], [SubspecialtyName], [SpecializationID]) VALUES (4, N'Heart failure
', 1)
GO
SET IDENTITY_INSERT [dbo].[Subspecialties] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [PasswordHash], [PhoneNumber], [GenderID], [DateOfBirth], [RegistrationDate]) VALUES (1, N'John Doe', N'john.doe@example.com', N'hashed_password_123', N'1234567890', 1, CAST(N'1990-01-01' AS Date), CAST(N'2024-11-23T22:48:53.730' AS DateTime))
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [PasswordHash], [PhoneNumber], [GenderID], [DateOfBirth], [RegistrationDate]) VALUES (2, N'Jane Smith', N'jane.smith@example.com', N'hashed_password_456', N'0987654321', 2, CAST(N'1985-05-15' AS Date), CAST(N'2024-11-23T22:48:53.730' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105346671D1E2]    Script Date: 30/11/2024 3:11:25 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[CallDoctor] ADD  DEFAULT (getdate()) FOR [CallDate]
GO
ALTER TABLE [dbo].[Insurance_Contacts] ADD  DEFAULT (getdate()) FOR [ContactDate]
GO
ALTER TABLE [dbo].[MedicalLibrary] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[MedicalQuestions] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[PharmaciesOrders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[QuestionsAnswers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Status]
GO
ALTER TABLE [dbo].[CallDoctor]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[CallDoctor]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD FOREIGN KEY([GovernorateID])
REFERENCES [dbo].[Governorates] ([GovernorateID])
GO
ALTER TABLE [dbo].[Clinics]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Clinics]  WITH CHECK ADD  CONSTRAINT [FK__Clinics__PriceID__52593CB8] FOREIGN KEY([PriceID])
REFERENCES [dbo].[Prices] ([PriceID])
GO
ALTER TABLE [dbo].[Clinics] CHECK CONSTRAINT [FK__Clinics__PriceID__52593CB8]
GO
ALTER TABLE [dbo].[Clinics]  WITH CHECK ADD FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
GO
ALTER TABLE [dbo].[Clinics]  WITH CHECK ADD FOREIGN KEY([SubspecialtyID])
REFERENCES [dbo].[Subspecialties] ([SubspecialtyID])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([GenderID])
REFERENCES [dbo].[Genders] ([GenderID])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK__Doctors__PriceID__5BE2A6F2] FOREIGN KEY([PriceID])
REFERENCES [dbo].[Prices] ([PriceID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK__Doctors__PriceID__5BE2A6F2]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD FOREIGN KEY([TitleID])
REFERENCES [dbo].[DoctorsTitle] ([TitleID])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Specializations] FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Specializations]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Subspecialties] FOREIGN KEY([SubspecialtyID])
REFERENCES [dbo].[Subspecialties] ([SubspecialtyID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Subspecialties]
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[HomeVisit]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[HomeVisit]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Insurance_Contacts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[MedicalLibrary]  WITH CHECK ADD FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
GO
ALTER TABLE [dbo].[MedicalQuestions]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctors] ([DoctorID])
GO
ALTER TABLE [dbo].[MedicalQuestions]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Pharmacies]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[PharmaciesOrders]  WITH CHECK ADD FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacies] ([PharmacyID])
GO
ALTER TABLE [dbo].[PharmaciesOrders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[PharmaciesOrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[PharmaciesOrders] ([OrderID])
GO
ALTER TABLE [dbo].[PharmaciesOrdersDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[PharmaciesProducts] ([ProductID])
GO
ALTER TABLE [dbo].[PharmaciesProducts]  WITH CHECK ADD FOREIGN KEY([PharmacyID])
REFERENCES [dbo].[Pharmacies] ([PharmacyID])
GO
ALTER TABLE [dbo].[QuestionsAnswers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subspecialties]  WITH CHECK ADD FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([GenderID])
REFERENCES [dbo].[Genders] ([GenderID])
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD CHECK  (([Rate]>=(0) AND [Rate]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [VezeetaDB] SET  READ_WRITE 
GO