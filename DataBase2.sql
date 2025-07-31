USE [master]
GO
/****** Object:  Database [PROJECT2]    Script Date: 12/22/2024 12:31:55 PM ******/
CREATE DATABASE [PROJECT2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROJECT2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PROJECT2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROJECT2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PROJECT2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PROJECT2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROJECT2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROJECT2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROJECT2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROJECT2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROJECT2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROJECT2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROJECT2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PROJECT2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROJECT2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROJECT2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROJECT2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROJECT2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROJECT2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROJECT2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROJECT2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROJECT2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROJECT2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROJECT2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROJECT2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROJECT2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROJECT2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROJECT2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROJECT2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROJECT2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PROJECT2] SET  MULTI_USER 
GO
ALTER DATABASE [PROJECT2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROJECT2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROJECT2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROJECT2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROJECT2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROJECT2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PROJECT2] SET QUERY_STORE = ON
GO
ALTER DATABASE [PROJECT2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PROJECT2]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Person_ID] [int] NOT NULL,
	[First_Name] [varchar](50) NULL,
	[Mid_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[Birth_Date] [date] NULL,
	[Email] [varchar](100) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Street] [varchar](100) NULL,
	[Zip_Code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PersonWithAge]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PersonWithAge] AS
SELECT 
    Person_ID,
    First_Name,
    Last_Name,
    DATEDIFF(YEAR, Birth_Date, GETDATE()) AS Age
FROM 
    Person;

GO
/****** Object:  Table [dbo].[Based]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Based](
	[Based_ID] [int] NOT NULL,
	[Course_ID] [int] NULL,
	[Prerequisite] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Based_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Belonging]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Belonging](
	[BelongingID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BelongingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[CreditHours] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[ManagerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[Salary] [decimal](10, 2) NULL,
	[Person_ID] [int] NULL,
	[ManagerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Enrollment](
	[Enrollment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Enroll_Date] [date] NULL,
	[Grade] [varchar](2) NULL,
	[Course_ID] [int] NULL,
	[Student_ID] [int] NULL,
	[Instructor_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Enrollment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] NOT NULL,
	[Degree] [varchar](50) NULL,
	[StartDate] [date] NULL,
	[DepartmentID] [int] NULL,
	[EmployeeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone_Number]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone_Number](
	[Phone_Number_ID] [int] NOT NULL,
	[Phone_Number] [varchar](15) NULL,
	[Person_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Phone_Number_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/22/2024 12:31:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] NOT NULL,
	[Registration_Number] [varchar](20) NULL,
	[Major] [varchar](50) NULL,
	[Person_ID] [int] NULL,
	[Department_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (1, 2, 1)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (2, 3, 2)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (3, 4, 3)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (4, 5, 4)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (5, 7, 6)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (6, 8, 7)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (7, 9, 8)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (8, 10, 9)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (9, 13, 6)
INSERT [dbo].[Based] ([Based_ID], [Course_ID], [Prerequisite]) VALUES (10, 14, 6)
GO
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (1, 1, 1)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (2, 2, 1)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (3, 3, 1)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (4, 4, 1)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (5, 5, 1)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (6, 6, 2)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (7, 7, 2)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (8, 8, 13)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (9, 9, 15)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (10, 10, 14)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (11, 11, 6)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (12, 12, 12)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (13, 13, 3)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (14, 14, 2)
INSERT [dbo].[Belonging] ([BelongingID], [CourseID], [DepartmentID]) VALUES (15, 15, 5)
GO
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (1, N'Introduction to Programming', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (2, N'Data Structures', 4)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (3, N'Database Systems', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (4, N'Operating Systems', 4)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (5, N'Software Engineering', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (6, N'Linear Algebra', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (7, N'Calculus', 4)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (8, N'Physics I', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (9, N'Biology I', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (10, N'Chemistry I', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (11, N'History of Art', 2)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (12, N'Psychology Basics', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (13, N'Business Management', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (14, N'Engineering Drawing', 3)
INSERT [dbo].[Course] ([Course_ID], [Name], [CreditHours]) VALUES (15, N'Ethics in Law', 2)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (1, N'Computer Science', 2)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (2, N'Engineering', 5)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (3, N'Business Administration', 8)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (4, N'Medicine', 10)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (5, N'Law', 13)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (6, N'Literature', 7)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (7, N'Pharmacy', 11)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (8, N'Dentistry', 3)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (9, N'Architecture', 12)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (10, N'Education', 14)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (11, N'Agriculture', 6)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (12, N'Psychology', 9)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (13, N'Physics', 15)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (14, N'Chemistry', 4)
INSERT [dbo].[Department] ([DepartmentID], [Name], [ManagerID]) VALUES (15, N'Biology', 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (1, CAST(15000.00 AS Decimal(10, 2)), 2, 7)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (2, CAST(20000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (3, CAST(18000.00 AS Decimal(10, 2)), 8, 2)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (4, CAST(17000.00 AS Decimal(10, 2)), 10, 3)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (5, CAST(22000.00 AS Decimal(10, 2)), 13, 4)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (6, CAST(20000.00 AS Decimal(10, 2)), 7, 5)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (7, CAST(14000.00 AS Decimal(10, 2)), 11, 6)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (8, CAST(19000.00 AS Decimal(10, 2)), 3, 7)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (9, CAST(14500.00 AS Decimal(10, 2)), 12, 8)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (10, CAST(17500.00 AS Decimal(10, 2)), 14, 9)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (11, CAST(15500.00 AS Decimal(10, 2)), 6, 10)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (12, CAST(16500.00 AS Decimal(10, 2)), 9, 11)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (13, CAST(18500.00 AS Decimal(10, 2)), 15, 12)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (14, CAST(19500.00 AS Decimal(10, 2)), 4, 13)
INSERT [dbo].[Employee] ([EmployeeID], [Salary], [Person_ID], [ManagerID]) VALUES (15, CAST(20500.00 AS Decimal(10, 2)), 1, 14)
GO
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'A', 1, 1, 1)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'B', 2, 2, 1)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'A', 3, 3, 1)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'C', 4, 4, 1)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'B', 5, 5, 1)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'A', 6, 6, 2)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'B', 7, 7, 2)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'A', 8, 8, 3)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'C', 9, 9, 3)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'B', 10, 10, 3)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'A', 11, 11, 4)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'B', 12, 12, 4)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'A', 13, 13, 5)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'C', 14, 14, 5)
INSERT [dbo].[Enrollment] ( [Enroll_Date], [Grade], [Course_ID], [Student_ID], [Instructor_ID]) VALUES ( CAST(N'2024-01-15' AS Date), N'B', 15, 15, 5)
GO
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (1, N'PhD in Computer Science', CAST(N'2015-09-01' AS Date), 1, 2)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (2, N'PhD in Engineering', CAST(N'2013-08-15' AS Date), 2, 5)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (3, N'MBA in Business', CAST(N'2014-01-10' AS Date), 3, 8)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (4, N'PhD in Medicine', CAST(N'2012-05-20' AS Date), 4, 10)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (5, N'JD in Law', CAST(N'2016-07-11' AS Date), 5, 13)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (6, N'PhD in Literature', CAST(N'2017-03-03' AS Date), 6, 7)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (7, N'PhD in Pharmacy', CAST(N'2018-02-25' AS Date), 7, 11)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (8, N'DDS in Dentistry', CAST(N'2019-10-30' AS Date), 8, 3)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (9, N'PhD in Architecture', CAST(N'2020-06-14' AS Date), 9, 12)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (10, N'PhD in Education', CAST(N'2011-09-08' AS Date), 10, 14)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (11, N'PhD in Agriculture', CAST(N'2010-11-04' AS Date), 11, 6)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (12, N'PhD in Psychology', CAST(N'2018-12-01' AS Date), 12, 9)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (13, N'PhD in Physics', CAST(N'2014-04-19' AS Date), 13, 15)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (14, N'PhD in Chemistry', CAST(N'2016-01-07' AS Date), 14, 4)
INSERT [dbo].[Instructor] ([InstructorID], [Degree], [StartDate], [DepartmentID], [EmployeeID]) VALUES (15, N'PhD in Biology', CAST(N'2015-08-30' AS Date), 15, 1)
GO
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (1, N'Ali', N'Ahmed', N'Hassan', N'M', CAST(N'1995-03-10' AS Date), N'ali.hassan@example.com', N'Cairo', N'Nasr City', N'Street 1', N'11371')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (2, N'Warda', N'Ahmed', N'Gamal', N'F', CAST(N'2003-06-06' AS Date), N'warda.gamal@example.com', N'Alexandria', N'Toson', N'Street 2', N'12612')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (3, N'Youssef', N'Hany', N'Omar', N'M', CAST(N'2000-01-25' AS Date), N'youssef.omar@example.com', N'Alexandria', N'Stanley', N'Street 3', N'21532')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (4, N'Sara', N'Mohamed', N'Ali', N'F', CAST(N'1998-06-30' AS Date), N'sara.ali@example.com', N'Cairo', N'Heliopolis', N'Street 4', N'11351')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (5, N'Hassan', N'Tarek', N'Saeed', N'M', CAST(N'1990-12-05' AS Date), N'hassan.saeed@example.com', N'Giza', N'6th of October', N'Street 5', N'12566')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (6, N'Habiba', N'Mohamed', N'Ebrahim', N'F', CAST(N'2004-04-30' AS Date), N'habiba.mohamed@example.com', N'Alexandria', N'Mandara', N'Street 6', N'21648')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (7, N'Nancy', N'Nabil', N'Mohamed', N'F', CAST(N'2004-09-20' AS Date), N'nancy.nabil@example.com', N'Alexandria', N'Toson', N'Street 7', N'11431')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (8, N'Noha', N'Adel', N'Ramy', N'F', CAST(N'1999-04-22' AS Date), N'noha.ramy@example.com', N'Cairo', N'Zamalek', N'Street 8', N'11561')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (9, N'Karim', N'Ayman', N'Yehia', N'M', CAST(N'1997-11-03' AS Date), N'karim.yehia@example.com', N'Giza', N'Imbaba', N'Street 9', N'12611')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (10, N'Dina', N'Hesham', N'Fouad', N'F', CAST(N'2001-05-18' AS Date), N'dina.fouad@example.com', N'Cairo', N'Garden City', N'Street 10', N'11521')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (11, N'Mahmoud', N'Ehab', N'Sameh', N'M', CAST(N'1994-08-11' AS Date), N'mahmoud.sameh@example.com', N'Alexandria', N'Gleem', N'Street 11', N'21523')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (12, N'Nourhan', N'Ashraf', N'Hossam', N'F', CAST(N'1995-10-05' AS Date), N'nourhan.hossam@example.com', N'Giza', N'Haram', N'Street 12', N'12555')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (13, N'Khaled', N'Nabil', N'Lotfy', N'M', CAST(N'1993-09-14' AS Date), N'khaled.lotfy@example.com', N'Cairo', N'Tagamoa', N'Street 13', N'11835')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (14, N'Reem', N'Sherif', N'Sami', N'F', CAST(N'1992-03-25' AS Date), N'reem.sami@example.com', N'Alexandria', N'Raml Station', N'Street 14', N'21618')
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Mid_Name], [Last_Name], [Gender], [Birth_Date], [Email], [State], [City], [Street], [Zip_Code]) VALUES (15, N'Ahmed', N'Magdy', N'Soliman', N'M', CAST(N'2000-07-20' AS Date), N'ahmed.soliman@example.com', N'Giza', N'Mohandessin', N'Street 15', N'12655')
GO
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (1, N'01012345678', 1)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (2, N'01298765432', 2)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (3, N'01122334455', 3)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (4, N'01099887766', 4)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (5, N'01233445566', 5)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (6, N'01155667788', 6)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (7, N'01077665544', 7)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (8, N'01299887711', 8)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (9, N'01133446677', 9)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (10, N'01088997766', 10)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (11, N'01255443322', 11)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (12, N'01166778899', 12)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (13, N'01033221144', 13)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (14, N'01222334455', 14)
INSERT [dbo].[Phone_Number] ([Phone_Number_ID], [Phone_Number], [Person_ID]) VALUES (15, N'01199887766', 15)
GO
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (1, N'STU001', N'Computer Science', 1, 1)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (2, N'STU002', N'Engineering', 3, 2)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (3, N'STU003', N'Business Administration', 5, 3)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (4, N'STU004', N'Medicine', 6, 4)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (5, N'STU005', N'Law', 7, 5)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (6, N'STU006', N'Literature', 8, 6)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (7, N'STU007', N'Pharmacy', 9, 7)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (8, N'STU008', N'Dentistry', 10, 8)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (9, N'STU009', N'Architecture', 12, 9)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (10, N'STU010', N'Education', 13, 10)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (11, N'STU011', N'Agriculture', 14, 11)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (12, N'STU012', N'Psychology', 15, 12)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (13, N'STU013', N'Physics', 11, 13)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (14, N'STU014', N'Chemistry', 2, 14)
INSERT [dbo].[Student] ([Student_ID], [Registration_Number], [Major], [Person_ID], [Department_ID]) VALUES (15, N'STU015', N'Biology', 4, 15)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_Email]    Script Date: 12/22/2024 12:31:55 PM ******/
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [uq_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_Phone_Number]    Script Date: 12/22/2024 12:31:55 PM ******/
ALTER TABLE [dbo].[Phone_Number] ADD  CONSTRAINT [uq_Phone_Number] UNIQUE NONCLUSTERED 
(
	[Phone_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Based]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Based]  WITH CHECK ADD FOREIGN KEY([Prerequisite])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Belonging]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([Course_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Belonging]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Person_ID])
REFERENCES [dbo].[Person] ([Person_ID])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Phone_Number]  WITH CHECK ADD FOREIGN KEY([Person_ID])
REFERENCES [dbo].[Person] ([Person_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([Person_ID])
REFERENCES [dbo].[Person] ([Person_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Based]  WITH CHECK ADD  CONSTRAINT [chk_Course_Prerequisite] CHECK  (([Course_ID]<>[Prerequisite]))
GO
ALTER TABLE [dbo].[Based] CHECK CONSTRAINT [chk_Course_Prerequisite]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [chk_Grade] CHECK  (([Grade]='F' OR [Grade]='D' OR [Grade]='C' OR [Grade]='B' OR [Grade]='A'))
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [chk_Grade]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [chk_Gender] CHECK  (([Gender]='F' OR [Gender]='M'))
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [chk_Gender]
GO
ALTER TABLE [dbo].[Phone_Number]  WITH CHECK ADD  CONSTRAINT [chk_Phone_Length] CHECK  ((len([Phone_Number])>=(10) AND len([Phone_Number])<=(15)))
GO
ALTER TABLE [dbo].[Phone_Number] CHECK CONSTRAINT [chk_Phone_Length]
GO
USE [master]
GO
ALTER DATABASE [PROJECT2] SET  READ_WRITE 
GO
