
/****** Object:  Database [PMF]    Script Date: 18/11/2022 1:52:03 SA ******/
CREATE DATABASE [PMF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PMF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\PMF.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PMF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\PMF_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PMF] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PMF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PMF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PMF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PMF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PMF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PMF] SET ARITHABORT OFF 
GO
ALTER DATABASE [PMF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PMF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PMF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PMF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PMF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PMF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PMF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PMF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PMF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PMF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PMF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PMF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PMF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PMF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PMF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PMF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PMF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PMF] SET RECOVERY FULL 
GO
ALTER DATABASE [PMF] SET  MULTI_USER 
GO
ALTER DATABASE [PMF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PMF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PMF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PMF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PMF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PMF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PMF] SET QUERY_STORE = OFF
GO
USE [PMF]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[fullname] [nvarchar](250) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[image] [varchar](250) NOT NULL,
	[status] [int] NOT NULL,
	[roleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[activityID] [int] IDENTITY(1,1) NOT NULL,
	[objectID] [int] NULL,
	[activityName] [nvarchar](250) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[username] [varchar](50) NULL,
	[discription] [ntext] NULL,
	[projectID] [int] NULL,
	[categoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[activityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity_Category]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity_Category](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assigned]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assigned](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[activityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[activityID] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[projectID] [int] IDENTITY(1,1) NOT NULL,
	[projectName] [nvarchar](250) NOT NULL,
	[createDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[statusID] [int] NOT NULL,
	[securityID] [int] NOT NULL,
	[teamID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[projectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project_Security]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Security](
	[securityID] [int] NOT NULL,
	[securityName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[securityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project_Status]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Status](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[sectionID] [int] IDENTITY(1,1) NOT NULL,
	[sectionName] [nvarchar](250) NOT NULL,
	[sectionNumber] [int] NOT NULL,
	[projectID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[taskID] [int] IDENTITY(1,1) NOT NULL,
	[taskName] [nvarchar](250) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[plannedStartDate] [datetime] NULL,
	[plannedEndDate] [datetime] NULL,
	[taskNumber] [int] NOT NULL,
	[discription] [ntext] NULL,
	[projectID] [int] NOT NULL,
	[sectionID] [int] NOT NULL,
	[priorityID] [int] NOT NULL,
	[statusID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[taskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_File]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_File](
	[fileID] [int] IDENTITY(1,1) NOT NULL,
	[taskID] [int] NOT NULL,
	[projectID] [int] NOT NULL,
	[code] [varchar](20) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[fileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_Priority]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Priority](
	[priorityID] [int] NOT NULL,
	[priorityName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[priorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_Status]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Status](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_Sub]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_Sub](
	[subID] [int] IDENTITY(1,1) NOT NULL,
	[taskID] [int] NOT NULL,
	[discription] [ntext] NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[teamID] [int] IDENTITY(1,1) NOT NULL,
	[teamName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team_Members]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team_Members](
	[teamID] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[memberID] [int] IDENTITY(1,1) NOT NULL,
	[roleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teamID] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team_Role]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team_Role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_Security]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_Security](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[content] [ntext] NULL,
	[note] [ntext] NULL,
	[statusWeb] [bit] NULL,
	[versionWeb] [float] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'admin123', N'123456', N'Nguyễn Văn Admin', CAST(N'2022-11-02T01:15:25.427' AS DateTime), N'admin123@gmail.com', N'0123456789', N'Ho Chi Minh city', N'admin.png', 1, 1)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user111', N'123456', N'Nguyễn Thị User1', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user111@gmail.com', N'0123456789', N'Ho Chi Minh city', N'988557992.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user123', N'123456', N'Nguyễn Thị User10', CAST(N'2022-11-02T01:15:25.427' AS DateTime), N'user123@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user10.png', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user222', N'123456', N'Nguyễn Thị User2', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user222@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user2.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user333', N'123456', N'Nguyễn Thị User3', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user333@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user3.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user444', N'123456', N'Nguyễn Thị User4', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user444@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user4.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user555', N'123456', N'Nguyễn Thị User5', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user555@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user5.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user666', N'123456', N'Nguyễn Thị User6', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user666@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user6.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user777', N'123456', N'Nguyễn Thị User7', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user777@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user7.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user888', N'123456', N'Nguyễn Thị User8', CAST(N'2022-11-02T01:15:25.427' AS DateTime), N'user888@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user8.png', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user999', N'123456', N'Nguyễn Thị User9', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user999@gmail.com', N'0123456789', N'Ho Chi Minh city', N'user9.jpg', 1, 2)
GO
INSERT [dbo].[Account_Role] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Account_Role] ([roleID], [roleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1, 3, N'Project Owner(user111) giao task AAAA cho thành viên (user222)', CAST(N'2022-11-07T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (2, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-07T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (3, 6, N'Project Owner(user111) giao task Kakaa cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (4, 7, N'Project Owner(user111) giao task Lop cho thành viên (user111)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (5, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (6, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (7, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (8, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (9, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (10, 2, N'Project Owner(user111) giao task GA cho thành viên (user111)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (11, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (12, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (13, 6, N'Project Owner(user111) giao task Kakaa cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (14, 2, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (15, 2, N'Project Owner(user111) giao task GA cho thành viên (user111)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (16, 8, N'Project Owner(user111) giao task Ha cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (17, 6, N'Project Owner(user111) giao task Kakaa cho thành viên (user111)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (18, 7, N'Project Owner(user111) giao task Lop cho thành viên (user666)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user666', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (19, 2, N'Project Owner(user111) giao task GA cho thành viên (user444)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (20, 3, N'Project Owner(user111) giao task AAAA cho thành viên (user333)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (21, 8, N'Project Owner(user111) giao task Ha cho thành viên (user555)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user555', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (22, 3, N'Thành viên (user333) nhận task AAAA', CAST(N'2022-11-08T00:00:00.000' AS DateTime), NULL, NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (23, 3, N'Project Owner(user111) giao task AAAA cho thành viên (user444)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (24, 3, N'Thành viên (user444) từ chối nhận task AAAA', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (25, 3, N'Project Owner(user111) giao task AAAA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (26, 3, N'Thành viên (user222) nhận task AAAA', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (27, 7, N'Thành viên (user666) từ chối nhận task Lop', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user666', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (28, 9, N'Project Owner(user111) giao task New cho thành viên (user444)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (29, 2, N'Thành viên (user444) từ chối nhận task GA', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (30, 9, N'Thành viên (user444) nhận task New', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (31, 7, N'Project Owner(user111) giao task Lop cho thành viên (user555)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user555', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (32, 7, N'Thành viên (user555) từ chối nhận task Lop', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user555', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (33, 8, N'Thành viên (user555) nhận task Ha', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user555', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (34, 10, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (35, 11, N'Project Owner(user111) giao task HH cho thành viên (user222)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (36, 10, N'Thành viên (user222) từ chối nhận task GA', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (37, 11, N'Thành viên (user222) nhận task HH', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (38, 10, N'Project Owner(user111) giao task GA cho thành viên (user444)', CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (39, 2, N'Project Owner(user111) giao task GA cho thành viên (user333)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (40, 2, N'Thành viên (user333) từ chối nhận task GA', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user333', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (41, 7, N'Project Owner(user111) giao task Lop cho thành viên (user666)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (42, 6, N'Project Owner(user111) giao task Kakaa cho thành viên (user444)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (43, 13, N'Project Owner(user111) giao task DAME cho thành viên (user333)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (44, 14, N'Project Owner(user111) giao task HAHA cho thành viên (user555)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user555', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (45, 13, N'Project Owner(user111) giao task DAME cho thành viên (user222)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (46, 6, N'Thành viên (user444) từ chối nhận task Kakaa', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user444', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (47, 10, N'Thành viên (user444) nhận task GA', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user444', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (48, 12, N'Project Owner(user111) giao task FA cho thành viên (user222)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (49, 13, N'Thành viên (user222) từ chối nhận task DAME', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (50, 12, N'Thành viên (user222) nhận task FA', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (51, 15, N'Project Owner(user111) giao task GA cho thành viên (user222)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (52, 6, N'Project Owner(user111) giao task Kakaa cho thành viên (user666)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (53, 2, N'Project Owner(user111) giao task GA cho thành viên (user666)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (54, 7, N'Thành viên (user666) nhận task Lop', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (55, 6, N'Thành viên (user666) từ chối nhận task Kakaa', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (56, 1, N'Project Owner(user111) giao subtask Vẽ sơ đồ cho thành viên (user222)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (57, 2, N'Project Owner(user111) giao subtask Thiết kế dữ liệu cho thành viên (user333)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (58, 3, N'Project Owner(user111) giao subtask Chỉnh font chữ cho thành viên (user666)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (59, 2, N'Project Owner(user111) giao subtask Thiết kế dữ liệu cho thành viên (user222)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (60, 3, N'Project Owner(user111) giao subtask Chỉnh font chữ cho thành viên (user222)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (61, 1, N'Thành viên (user222) nhận subtask Vẽ sơ đồ', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (62, 2, N'Thành viên (user222) từ chối nhận subtask Thiết kế dữ liệu', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (63, 3, N'Thành viên (user222) nhận subtask Chỉnh font chữ', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (64, 3, N'Project Owner(user111) giao subtask Chỉnh font chữ cho thành viên (user666)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (65, 2, N'Project Owner(user111) giao subtask Thiết kế dữ liệu cho thành viên (user444)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (66, 2, N'Project Owner(user111) giao subtask Thiết kế dữ liệu cho thành viên (user222)', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (67, 15, N'Thành viên (user222) từ chối nhận task GA', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (68, 2, N'Thành viên (user666) nhận task GA', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (69, 3, N'Thành viên (user666) nhận subtask Chỉnh font chữ', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (70, 2, N'Thành viên (user222) từ chối nhận subtask Thiết kế dữ liệu', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (71, 4, N'Project Owner(user111) giao subtask Soạn văn bản cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (72, 5, N'Project Owner(user111) giao subtask Chỉnh giá trị cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (73, 4, N'Thành viên (user444) nhận subtask Soạn văn bản', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (74, 5, N'Thành viên (user444) từ chối nhận subtask Chỉnh giá trị', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (75, 7, N'Project Owner(user111) giao subtask New one cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (76, 7, N'Thành viên (user333) nhận subtask New one', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (77, 24, N'Project Owner(user111) giao subtask Su cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (78, 25, N'Project Owner(user111) giao subtask Kem cho thành viên (user666)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user666', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (79, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (80, 17, N'Project Owner(user111) giao task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (81, 18, N'Project Owner(user111) giao task Sơ đồ đặc tả SRS cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (82, 19, N'Project Owner(user111) giao task Dựng Model cho thành viên (user555)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (83, 27, N'Project Owner(user111) giao subtask Vẽ header cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (84, 28, N'Project Owner(user111) giao subtask Vẽ footer cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (85, 29, N'Project Owner(user111) giao subtask Vẽ main ariticle cho thành viên (user555)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (86, 30, N'Project Owner(user111) giao subtask Đầy đủ chức năng cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (87, 31, N'Project Owner(user111) giao subtask Hiểu rõ include cho thành viên (user555)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (88, 16, N'Thành viên (user222) nhận task Thiết kế UXUI', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (89, 17, N'Thành viên (user333) nhận task Vẽ Use case', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (90, 27, N'Thành viên (user333) nhận subtask Vẽ header', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (91, 18, N'Thành viên (user444) nhận task Sơ đồ đặc tả SRS', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (92, 28, N'Thành viên (user444) nhận subtask Vẽ footer', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (93, 30, N'Thành viên (user444) từ chối nhận subtask Đầy đủ chức năng', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (94, 32, N'Project Owner(user111) giao subtask Dựng css cho thành viên (user555)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (95, 33, N'Project Owner(user111) giao subtask Dựng js cho thành viên (user555)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (96, 19, N'Thành viên (user555) từ chối nhận task Dựng Model', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (97, 29, N'Thành viên (user555) từ chối nhận subtask Vẽ main ariticle', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (98, 32, N'Thành viên (user555) nhận subtask Dựng css', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (99, 33, N'Thành viên (user555) nhận subtask Dựng js', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 13)
GO
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (100, 33, N'Project Owner(user111) giao subtask Dựng js cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (101, 32, N'Project Owner(user111) giao subtask Dựng css cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (102, 29, N'Project Owner(user111) giao subtask Vẽ main ariticle cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (103, 33, N'Thành viên (user333) nhận subtask Dựng js', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (104, 32, N'Thành viên (user333) nhận subtask Dựng css', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (105, 29, N'Thành viên (user333) nhận subtask Vẽ main ariticle', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (106, 34, N'Project Owner(user111) giao subtask Ve xe cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (107, 34, N'Thành viên (user333) nhận subtask Ve xe', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (108, 27, N'Project Owner(user111) giao subtask Vẽ header cho thành viên (user222)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (109, 28, N'Project Owner(user111) giao subtask Vẽ footer cho thành viên (user222)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (110, 29, N'Project Owner(user111) giao subtask Vẽ main ariticle cho thành viên (user222)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (111, 32, N'Project Owner(user111) giao subtask Dựng css cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (112, 33, N'Project Owner(user111) giao subtask Dựng js cho thành viên (user555)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (113, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (114, 29, N'Thành viên (user222) nhận subtask Vẽ main ariticle', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (115, 28, N'Thành viên (user222) nhận subtask Vẽ footer', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (116, 27, N'Thành viên (user222) nhận subtask Vẽ header', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (117, 16, N'Thành viên (user222) nhận task Thiết kế UXUI', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (118, 32, N'Thành viên (user444) từ chối nhận subtask Dựng css', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (119, 33, N'Thành viên (user555) nhận subtask Dựng js', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (120, 31, N'Thành viên (user555) nhận subtask Hiểu rõ include', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (121, 32, N'Project Owner(user111) giao subtask Dựng css cho thành viên (user111)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (122, 32, N'Project Owner(user111) giao subtask Dựng css cho thành viên (user222)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (123, 32, N'Thành viên (user222) nhận subtask Dựng css', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (124, 35, N'Project Owner(user111) giao subtask Dựng source cho thành viên (user333)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (125, 36, N'Project Owner(user111) giao subtask Dựng controller cho thành viên (user444)', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (126, 30, N'Project Owner(user111) giao subtask Đầy đủ chức năng cho thành viên (user222)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (127, 36, N'Project Owner(user111) giao subtask Dựng controller cho thành viên (user333)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (128, 35, N'Project Owner(user111) giao subtask Dựng source cho thành viên (user333)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (129, 20, N'Project Owner(user111) giao task Vẽ diagram cho thành viên (user333)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (130, 19, N'Project Owner(user111) giao task Dựng Model cho thành viên (user333)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (131, 19, N'Thành viên (user333) nhận task Dựng Model', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (132, 20, N'Thành viên (user333) nhận task Vẽ diagram', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (133, 35, N'Project Owner(user111) giao subtask Dựng source cho thành viên (user333)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (134, 18, N'Project Owner(user111) giao task Sơ đồ đặc tả SRS cho thành viên (user333)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (135, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (136, 16, N'Thành viên (user333) từ chối nhận task Thiết kế UXUI', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (137, 18, N'Thành viên (user333) nhận task Sơ đồ đặc tả SRS', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (138, 35, N'Thành viên (user333) nhận subtask Dựng source', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (139, 36, N'Thành viên (user333) từ chối nhận subtask Dựng controller', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (140, 31, N'Project Owner(user111) giao subtask Hiểu rõ include cho thành viên (user222)', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (141, 31, N'Thành viên (user222) từ chối nhận subtask Hiểu rõ include', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (142, 30, N'Thành viên (user222) từ chối nhận subtask Đầy đủ chức năng', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (143, 0, N'Project Owner(user111) mời người dùng (haha@gmail.com) vào dự án Second', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'haha@gmail.com', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (144, 0, N'Project Owner(user111) mời người dùng (user888) vào dự án Second', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user888', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (145, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user555)', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user555', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (146, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (147, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user444)', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (148, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (149, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user444)', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (150, 16, N'Thành viên (user444) nhận task Thiết kế UXUI', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user444', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (151, 0, N'Project Owner(user111) mời người dùng (user888) vào dự án Second', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user888', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (152, 20, N'Project Owner(user111) giao task Vẽ diagram cho thành viên (user222)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (153, 20, N'Thành viên (user222) từ chối nhận task Vẽ diagram', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user222', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (154, 0, N'Project Owner(user111) mời người dùng (user888) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user888', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (155, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user777', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (156, 0, N'Project Owner(user111) mời người dùng (ggg@gmail.com) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'ggg@gmail.com', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (157, 37, N'Project Owner(user111) giao subtask New cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (158, 38, N'Project Owner(user111) giao subtask Old cho thành viên (user444)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (159, 38, N'Thành viên (user444) nhận subtask Old', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (160, 37, N'Thành viên (user333) nhận subtask New', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (161, 0, N'Project Owner(user111) mời người dùng (hehehe@gmail.com) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'hehehe@gmail.com', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (162, 0, N'Project Owner(user111) mời người dùng (lol@gmail.com) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'lol@gmail.com', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (163, 0, N'Project Owner(user111) mời người dùng (user123) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user123', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (164, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user777', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (165, 39, N'Project Owner(user111) giao subtask Dựng constructor cho thành viên (user666)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (166, 0, N'Project Owner(user111) mời người dùng (wwwwww@gmail.com) vào dự án PJ_User111', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'wwwwww@gmail.com', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (167, 0, N'Project Owner(user111) mời người dùng (hehehe@gmail.com) vào dự án PJ_User111', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'hehehe@gmail.com', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (168, 31, N'Project Owner(user111) giao subtask Hiểu rõ include cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (169, 30, N'Project Owner(user111) giao subtask Đầy đủ chức năng cho thành viên (user444)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (170, 30, N'Thành viên (user444) nhận subtask Đầy đủ chức năng', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (171, 27, N'Project Owner(user111) giao subtask Vẽ header cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (172, 28, N'Project Owner(user111) giao subtask Vẽ footer cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (173, 29, N'Project Owner(user111) giao subtask Vẽ main ariticle cho thành viên (user444)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (174, 32, N'Project Owner(user111) giao subtask Dựng css cho thành viên (user444)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (175, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (176, 31, N'Thành viên (user333) từ chối nhận subtask Hiểu rõ include', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (177, 28, N'Thành viên (user333) nhận subtask Vẽ footer', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (178, 27, N'Thành viên (user333) từ chối nhận subtask Vẽ header', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (179, 16, N'Thành viên (user333) nhận task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (180, 32, N'Thành viên (user444) nhận subtask Dựng css', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (181, 29, N'Thành viên (user444) từ chối nhận subtask Vẽ main ariticle', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (182, 27, N'Project Owner(user111) giao subtask Vẽ header của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (183, 28, N'Project Owner(user111) giao subtask Vẽ footer của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (184, 29, N'Project Owner(user111) giao subtask Vẽ main ariticle của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (185, 32, N'Project Owner(user111) giao subtask Dựng css của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (186, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (187, 20, N'Project Owner(user111) giao task Vẽ diagram cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (188, 20, N'Thành viên (user333) nhận task Vẽ diagram', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (189, 16, N'Thành viên (user333) từ chối nhận task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (190, 32, N'Thành viên (user333) từ chối nhận subtask Dựng css của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (191, 29, N'Thành viên (user333) nhận subtask Vẽ main ariticle của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (192, 28, N'Thành viên (user333) từ chối nhận subtask Vẽ footer của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (193, 27, N'Thành viên (user333) nhận subtask Vẽ header của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (194, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (195, 27, N'Project Owner(user111) giao subtask Vẽ header của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (196, 28, N'Project Owner(user111) giao subtask Vẽ footer của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (197, 29, N'Project Owner(user111) giao subtask Vẽ main ariticle của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (198, 32, N'Project Owner(user111) giao subtask Dựng css của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (199, 32, N'Project Owner(user111) giao subtask Dựng css của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
GO
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (200, 16, N'Thành viên (user333) nhận task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (201, 28, N'Thành viên (user333) nhận subtask Vẽ footer của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (202, 29, N'Thành viên (user333) nhận subtask Vẽ main ariticle của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (203, 32, N'Thành viên (user333) từ chối nhận subtask Dựng css của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (204, 27, N'Thành viên (user333) nhận subtask Vẽ header của task Thiết kế UXUI', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (205, 0, N'Project Owner(user111) mời người dùng (oooooo@gmail.com) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'oooooo@gmail.com', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (206, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user777', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (207, 0, N'Project Owner(user111) mời người dùng (user888) vào dự án Second', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user888', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (208, 39, N'Thành viên (user666) từ chối nhận subtask Dựng constructor của task Dựng Model', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (209, 20, N'Project Owner(user111) giao task Vẽ diagram cho thành viên (user666)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (210, 20, N'Thành viên (user666) nhận task Vẽ diagram', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (211, 39, N'Project Owner(user111) giao subtask Dựng constructor của task Dựng Model cho thành viên (user666)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (212, 39, N'Thành viên (user666) từ chối nhận subtask Dựng constructor của task Dựng Model', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (213, 20, N'Project Owner(user111) giao task Vẽ diagram cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (214, 40, N'Project Owner(user111) giao subtask Thiết kế khóa ngoại của task Vẽ diagram cho thành viên (user333)', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (215, 20, N'Thành viên (user333) nhận task Vẽ diagram', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (216, 40, N'Thành viên (user333) nhận subtask Thiết kế khóa ngoại của task Vẽ diagram', CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (217, 0, N'Project Owner(user111) mời người dùng (user222) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (218, 0, N'Project Owner(user111) mời người dùng (user333) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (219, 0, N'Project Owner(user111) mời người dùng (user222) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (220, 0, N'Người dùng (user222) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (221, 0, N'Người dùng (user333) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (222, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (223, 0, N'Người dùng (user777) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (224, 0, N'Người dùng (user777) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (225, 0, N'Người dùng (user777) chấp nhận tham gia dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 2, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (226, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (227, 0, N'Người dùng (user777) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (228, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (229, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (230, 0, N'Người dùng (user777) chấp nhận tham gia dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 2, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (231, 0, N'Người dùng (user777) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (232, 4, N'Project Owner(user111) giao task New cho thành viên (user777)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (233, 5, N'Project Owner(user111) giao task Ghe cho thành viên (user777)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (234, 41, N'Project Owner(user111) giao subtask hi của task New cho thành viên (user777)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (235, 41, N'Thành viên (user777) nhận subtask hi của task New', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (236, 5, N'Thành viên (user777) nhận task Ghe', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (237, 4, N'Thành viên (user777) nhận task New', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (238, 4, N'Project Owner(user111) giao task New cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 3, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (239, 5, N'Project Owner(user111) giao task Ghe cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 3, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (240, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (241, 0, N'Người dùng (user777) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (242, 0, N'Người dùng (user777) từ chối tham gia dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 2, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (243, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (244, 0, N'Người dùng (user777) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (245, 0, N'Người dùng (user777) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (246, 41, N'Project Owner(user111) giao subtask hi của task New cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 3, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (247, 0, N'Người dùng (user888) chấp nhận tham gia dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user888', NULL, 2, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (248, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (249, 33, N'Project Owner(user111) giao subtask Dựng js của task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (250, 35, N'Project Owner(user111) giao subtask Dựng source của task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (251, 36, N'Project Owner(user111) giao subtask Dựng controller của task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (252, 19, N'Project Owner(user111) giao task Dựng Model cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (253, 36, N'Thành viên (user222) nhận subtask Dựng controller của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (254, 19, N'Thành viên (user222) nhận task Dựng Model', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (255, 16, N'Thành viên (user222) nhận task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (256, 35, N'Thành viên (user222) từ chối nhận subtask Dựng source của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (257, 33, N'Thành viên (user222) từ chối nhận subtask Dựng js của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (258, 33, N'Project Owner(user111) giao subtask Dựng js của task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (259, 35, N'Project Owner(user111) giao subtask Dựng source của task Thiết kế UXUI cho thành viên (user222)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (260, 35, N'Thành viên (user222) từ chối nhận subtask Dựng source của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (261, 33, N'Thành viên (user222) từ chối nhận subtask Dựng js của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (262, 32, N'Project Owner(user111) giao subtask Dựng css của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (263, 32, N'Thành viên (user333) nhận subtask Dựng css của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (264, 16, N'Project Owner(user111) giao task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (265, 33, N'Project Owner(user111) giao subtask Dựng js của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (266, 35, N'Project Owner(user111) giao subtask Dựng source của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (267, 42, N'Project Owner(user111) giao subtask Dựng nhà cửa của task Thiết kế UXUI cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (268, 42, N'Thành viên (user333) nhận subtask Dựng nhà cửa của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (269, 35, N'Thành viên (user333) từ chối nhận subtask Dựng source của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (270, 33, N'Thành viên (user333) nhận subtask Dựng js của task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (271, 16, N'Thành viên (user333) nhận task Thiết kế UXUI', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (272, 0, N'Project Owner(user111) mời người dùng (wwwww@gmail.com) vào dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'wwwww@gmail.com', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (273, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (274, 0, N'Người dùng (user777) từ chối tham gia dự án Second', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', NULL, 2, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (275, 0, N'Project Owner(user111) mời người dùng (user444) vào dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user444', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (276, 0, N'Người dùng (user444) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user444', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (277, 30, N'Project Owner(user111) giao subtask Đầy đủ chức năng của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (278, 31, N'Project Owner(user111) giao subtask Hiểu rõ include của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (279, 37, N'Project Owner(user111) giao subtask New của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (280, 38, N'Project Owner(user111) giao subtask Old của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (281, 38, N'Thành viên (user333) nhận subtask Old của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (282, 30, N'Thành viên (user333) nhận subtask Đầy đủ chức năng của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (283, 31, N'Thành viên (user333) từ chối nhận subtask Hiểu rõ include của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (284, 37, N'Thành viên (user333) nhận subtask New của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (285, 30, N'Project Owner(user111) giao subtask Đầy đủ chức năng của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (286, 31, N'Project Owner(user111) giao subtask Hiểu rõ include của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (287, 37, N'Project Owner(user111) giao subtask New của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (288, 38, N'Project Owner(user111) giao subtask Old của task Vẽ Use case cho thành viên (user333)', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (289, 38, N'Thành viên (user333) từ chối nhận subtask Old của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (290, 37, N'Thành viên (user333) từ chối nhận subtask New của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (291, 31, N'Thành viên (user333) nhận subtask Hiểu rõ include của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (292, 30, N'Thành viên (user333) từ chối nhận subtask Đầy đủ chức năng của task Vẽ Use case', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (293, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-16T17:35:09.410' AS DateTime), N'user777', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (294, 0, N'Người dùng (user777) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-16T17:35:40.533' AS DateTime), N'user777', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (295, 38, N'Project Owner(user111) giao subtask Old của task Vẽ Use case cho thành viên (user222)', CAST(N'2022-11-16T17:35:57.827' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (296, 37, N'Project Owner(user111) giao subtask New của task Vẽ Use case cho thành viên (user222)', CAST(N'2022-11-16T17:35:59.293' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (297, 37, N'Thành viên (user222) từ chối nhận subtask New của task Vẽ Use case', CAST(N'2022-11-16T17:36:59.867' AS DateTime), N'user222', NULL, 2, 14)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (298, 38, N'Thành viên (user222) nhận subtask Old của task Vẽ Use case', CAST(N'2022-11-16T17:37:08.810' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (299, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-16T17:50:08.393' AS DateTime), N'user777', NULL, 3, 6)
GO
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (300, 0, N'Người dùng (user777) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-16T17:51:07.910' AS DateTime), N'user777', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (301, 17, N'Thành viên(user222) bình luận task Vẽ Use case với nội dung '' Task này đúng tiến độ ''', CAST(N'2022-11-16T18:15:29.157' AS DateTime), N'user222', N'Task này đúng tiến độ', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (302, 17, N'Thành viên(user222) bình luận task Vẽ Use case với nội dung '' Kì ta ''', CAST(N'2022-11-16T18:16:29.370' AS DateTime), N'user222', N'Kì ta', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (303, 17, N'Thành viên(user222) bình luận task Vẽ Use case với nội dung '' Được rồi nè ''', CAST(N'2022-11-16T18:18:06.520' AS DateTime), N'user222', N'Được rồi nè', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (304, 17, N'Thành viên(user222) bình luận task Vẽ Use case với nội dung '' Bữa làm task này rồi ''', CAST(N'2022-11-16T18:18:54.243' AS DateTime), N'user222', N'Bữa làm task này rồi', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (305, 17, N'Thành viên(user222) bình luận task Vẽ Use case với nội dung '' Nhớ làm rồi ''', CAST(N'2022-11-16T18:19:18.887' AS DateTime), N'user222', N'Nhớ làm rồi', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (306, 17, N'Thành viên(user222) bình luận task Vẽ Use case với nội dung '' Tươi luôn ''', CAST(N'2022-11-16T18:21:32.387' AS DateTime), N'user222', N'Tươi luôn', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (307, 17, N'Thành viên(user111) bình luận task Vẽ Use case với nội dung '' Cmt gì vậy ba ''', CAST(N'2022-11-16T18:22:08.867' AS DateTime), N'user111', N'Cmt gì vậy ba', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (308, 17, N'Thành viên(user111) bình luận task Vẽ Use case với nội dung '' Làm cho đàng hoàng ''', CAST(N'2022-11-17T11:01:38.803' AS DateTime), N'user111', N'Làm cho đàng hoàng', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (309, 18, N'Thành viên(user111) bình luận task Sơ đồ đặc tả SRS với nội dung '' Bên đây làm oke nà ''', CAST(N'2022-11-17T11:02:05.697' AS DateTime), N'user111', N'Bên đây làm oke nà', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (310, 22, N'Project Owner(user111) giao task New cho thành viên (user444)', CAST(N'2022-11-17T13:42:07.080' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (311, 43, N'Project Owner(user111) giao subtask New dựng nhà của task New cho thành viên (user333)', CAST(N'2022-11-17T13:43:35.150' AS DateTime), N'user333', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (312, 44, N'Project Owner(user111) giao subtask nhà mới của task New cho thành viên (user222)', CAST(N'2022-11-17T13:43:54.867' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (313, 22, N'Thành viên (user444) nhận task New', CAST(N'2022-11-17T13:45:08.243' AS DateTime), N'user444', NULL, 2, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (314, 0, N'Project Owner(user111) mời người dùng (haha@gmail.com) vào dự án PJ_User111', CAST(N'2022-11-17T13:47:01.510' AS DateTime), N'haha@gmail.com', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (315, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án PJ_User111', CAST(N'2022-11-17T13:47:01.523' AS DateTime), N'user777', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (316, 0, N'Project Owner(user111) mời người dùng (user123) vào dự án PJ_User111', CAST(N'2022-11-17T13:47:01.527' AS DateTime), N'user123', NULL, 3, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (317, 0, N'Người dùng (user777) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-17T13:47:22.720' AS DateTime), N'user777', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (318, 0, N'Người dùng (user999) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-17T13:48:13.547' AS DateTime), N'user999', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (319, 5, N'Thành viên (user333) nhận task Ghe', CAST(N'2022-11-17T13:49:14.060' AS DateTime), N'user333', NULL, 3, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (320, 4, N'Thành viên (user333) từ chối nhận task New', CAST(N'2022-11-17T13:49:15.120' AS DateTime), N'user333', NULL, 3, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (321, 41, N'Thành viên (user222) nhận subtask hi của task New', CAST(N'2022-11-17T13:50:17.273' AS DateTime), N'user222', NULL, 3, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (322, 44, N'Thành viên (user222) nhận subtask nhà mới của task New', CAST(N'2022-11-17T13:50:57.553' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (323, 22, N'Thành viên(user222) bình luận task New với nội dung '' gagaga ''', CAST(N'2022-11-17T13:51:08.327' AS DateTime), N'user222', N'gagaga', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (324, 22, N'Thành viên(user222) bình luận task New với nội dung '' hhahaha ''', CAST(N'2022-11-17T13:51:10.403' AS DateTime), N'user222', N'hhahaha', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (325, 22, N'Thành viên(user222) bình luận task New với nội dung '' hahahah ''', CAST(N'2022-11-17T13:51:12.427' AS DateTime), N'user222', N'hahahah', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (326, 22, N'Thành viên(user222) bình luận task New với nội dung '' fgdgdfghdgh ''', CAST(N'2022-11-17T13:51:14.090' AS DateTime), N'user222', N'fgdgdfghdgh', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (327, 17, N'Project Owner(user111) giao task Vẽ Use case cho thành viên (user222)', CAST(N'2022-11-17T14:05:18.207' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (328, 19, N'Project Owner(user111) giao task Dựng Model cho thành viên (user444)', CAST(N'2022-11-17T14:05:24.197' AS DateTime), N'user444', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (329, 20, N'user111 changed the status into Off track', CAST(N'2022-11-17T21:48:30.893' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (330, 20, N'user111 changed the status into Approved', CAST(N'2022-11-17T21:49:39.740' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (331, 20, N'user111 changed the priority into High', CAST(N'2022-11-17T21:49:52.383' AS DateTime), N'user111', NULL, 2, 18)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (332, 20, N'user111 changed the planned end date into Thu Nov 17 12:07:00 ICT 2022', CAST(N'2022-11-17T21:49:58.853' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (333, 20, N'user111 changed the planned end date into Thu Nov 17 12:07:00 ICT 2022', CAST(N'2022-11-17T21:49:58.853' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (334, 20, N'user111 changed the status into Off track', CAST(N'2022-11-17T21:50:05.757' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (335, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:55:32.517' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (336, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:55:32.517' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (337, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:55:32.517' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (338, 20, N'user111 changed the planned end date into 24-11-2022 01:07:00', CAST(N'2022-11-17T21:56:00.617' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (339, 20, N'user111 changed the planned end date into 24-11-2022 01:07:00', CAST(N'2022-11-17T21:56:00.617' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (340, 20, N'user111 changed the planned end date into 24-11-2022 01:07:00', CAST(N'2022-11-17T21:56:00.620' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (341, 20, N'user111 changed the planned end date into 24-11-2022 01:07:00', CAST(N'2022-11-17T21:56:00.623' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (342, 20, N'user111 changed the planned end date into 23-11-2022 01:07:00', CAST(N'2022-11-17T21:56:31.987' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (343, 20, N'user111 changed the planned end date into 23-11-2022 01:07:00', CAST(N'2022-11-17T21:56:31.987' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (344, 20, N'user111 changed the planned end date into 23-11-2022 01:07:00', CAST(N'2022-11-17T21:56:31.987' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (345, 20, N'user111 changed the planned end date into 23-11-2022 01:07:00', CAST(N'2022-11-17T21:56:31.987' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (346, 20, N'user111 changed the planned end date into 23-11-2022 01:07:00', CAST(N'2022-11-17T21:56:32.000' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (347, 20, N'user111 changed the status into Approved', CAST(N'2022-11-17T21:56:54.427' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (348, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.607' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (349, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.607' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (350, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.607' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (351, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.610' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (352, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.610' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (353, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.610' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (354, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.647' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (355, 20, N'user111 changed the planned end date into 17-11-2022 01:07:00', CAST(N'2022-11-17T21:59:10.647' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (356, 20, N'user111 changed the status into Off track', CAST(N'2022-11-17T21:59:13.010' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (357, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.180' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (358, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.180' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (359, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.183' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (360, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.187' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (361, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.180' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (362, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.190' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (363, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.213' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (364, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.213' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (365, 20, N'user111 changed the planned end date into 16-11-2022 01:07:00', CAST(N'2022-11-17T21:59:31.213' AS DateTime), N'user111', NULL, 2, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (366, 0, N'Người dùng (user999) chấp nhận tham gia dự án PJ_User111', CAST(N'2022-11-17T22:02:52.100' AS DateTime), N'user999', NULL, 3, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (367, 0, N'Người dùng (user999) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-17T22:03:09.517' AS DateTime), N'user999', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (368, 0, N'Người dùng (user999) từ chối tham gia dự án Second', CAST(N'2022-11-17T22:03:12.900' AS DateTime), N'user999', NULL, 2, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (369, 0, N'Người dùng (user777) từ chối tham gia dự án PJ_User111', CAST(N'2022-11-17T22:03:38.077' AS DateTime), N'user777', NULL, 3, 8)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (370, 19, N'user111 changed the status into Approved', CAST(N'2022-11-17T22:04:18.753' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (371, 19, N'user111 changed the status into Off track', CAST(N'2022-11-17T22:04:23.690' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (372, 18, N'user111 changed the status into Off track', CAST(N'2022-11-17T22:04:36.333' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (373, 18, N'user111 changed the priority into Medium', CAST(N'2022-11-17T22:04:46.657' AS DateTime), N'user111', NULL, 2, 18)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (374, 20, N'user111 changed the status into Approved', CAST(N'2022-11-17T23:21:25.783' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (375, 20, N'user111 changed the status into Off track', CAST(N'2022-11-17T23:21:28.547' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (376, 20, N'user111 changed the status into At risk', CAST(N'2022-11-17T23:21:30.593' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (377, 20, N'user111 changed the status into On track', CAST(N'2022-11-17T23:21:32.227' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (378, 20, N'user111 changed the status into At risk', CAST(N'2022-11-17T23:21:33.847' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (379, 20, N'user111 changed the status into Off track', CAST(N'2022-11-17T23:21:35.393' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (380, 20, N'user111 changed the status into Approved', CAST(N'2022-11-17T23:21:37.857' AS DateTime), N'user111', NULL, 2, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (381, 20, N'Thành viên(user111) bình luận task Vẽ diagram với nội dung '' uuwuwuww ''', CAST(N'2022-11-17T23:22:31.930' AS DateTime), N'user111', N'uuwuwuww', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (382, 20, N'Thành viên(user111) bình luận task Vẽ diagram với nội dung '' dđ ''', CAST(N'2022-11-17T23:22:44.993' AS DateTime), N'user111', N'dđ', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (383, 45, N'Project Owner(user111) giao subtask Tiến đẹp trai, web hơi bị mượt của task Vẽ diagram cho thành viên (user222)', CAST(N'2022-11-17T23:23:56.090' AS DateTime), N'user222', NULL, 2, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (384, 45, N'Thành viên (user222) nhận subtask Tiến đẹp trai, web hơi bị mượt của task Vẽ diagram', CAST(N'2022-11-17T23:24:27.947' AS DateTime), N'user222', NULL, 2, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (385, 20, N'Thành viên(user222) bình luận task Vẽ diagram với nội dung '' project owner khoai to đẹp trai ''', CAST(N'2022-11-17T23:27:28.467' AS DateTime), N'user222', N'project owner khoai to đẹp trai', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (386, 16, N'Thành viên(user222) bình luận task Thiết kế UXUI với nội dung '' ádasdasd ''', CAST(N'2022-11-17T23:28:21.237' AS DateTime), N'user222', N'ádasdasd', 2, 15)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (387, 17, N'Thành viên (user222) từ chối nhận task Vẽ Use case', CAST(N'2022-11-17T23:30:10.513' AS DateTime), N'user222', NULL, 2, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (388, 17, N'Project Owner(user111) giao task Vẽ Use case cho thành viên (user555)', CAST(N'2022-11-17T23:31:55.577' AS DateTime), N'user555', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (389, 17, N'Project Owner(user111) giao task Vẽ Use case cho thành viên (user222)', CAST(N'2022-11-17T23:32:03.613' AS DateTime), N'user222', NULL, 2, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (390, 0, N'Project Owner(user111) mời người dùng (user777) vào dự án Second', CAST(N'2022-11-17T23:50:48.403' AS DateTime), N'user777', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (391, 0, N'Project Owner(user111) mời người dùng (bruhbruhlmao@gmail.com) vào dự án Second', CAST(N'2022-11-17T23:50:48.543' AS DateTime), N'bruhbruhlmao@gmail.com', NULL, 2, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (392, 0, N'Người dùng (user777) chấp nhận tham gia dự án Second', CAST(N'2022-11-17T23:51:41.007' AS DateTime), N'user777', NULL, 2, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (393, 23, N'user123 changed the priority into Medium', CAST(N'2022-11-18T00:42:10.837' AS DateTime), N'user123', NULL, 4, 18)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (394, 46, N'Project Owner(user123) giao subtask đâsadsads của task lllll cho thành viên (user123)', CAST(N'2022-11-18T01:07:53.210' AS DateTime), N'user123', NULL, 4, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (395, 25, N'Project Owner(user123) giao task lllll cho thành viên (user123)', CAST(N'2022-11-18T01:07:55.707' AS DateTime), N'user123', NULL, 4, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (396, 0, N'Project Owner(user123) mời người dùng (user111) vào dự án this is a new project', CAST(N'2022-11-18T01:42:33.643' AS DateTime), N'user111', NULL, 4, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (397, 0, N'Người dùng (user111) chấp nhận tham gia dự án this is a new project', CAST(N'2022-11-18T01:42:59.057' AS DateTime), N'user111', NULL, 4, 7)
SET IDENTITY_INSERT [dbo].[Activity] OFF
GO
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (1, N'Create project')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (2, N'Create section')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (3, N'Create task')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (4, N'Move section')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (5, N'Move task')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (6, N'Invite people')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (7, N'Confirm invitation')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (8, N'Decline invitation')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (9, N'Assign task')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (10, N'Confirm assigned task')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (11, N'Decline assigned task')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (12, N'Assign subtask')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (13, N'Confirm assigned subtask')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (14, N'Decline assigned subtask')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (15, N'Comment')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (16, N'Set task start date')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (17, N'Set task end date')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (18, N'Set task priority')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (19, N'Set task status')
GO
SET IDENTITY_INSERT [dbo].[Assigned] ON 

INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 8)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (2, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 9)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (3, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 10)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (4, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 11)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (5, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 12)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (6, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 13)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (7, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 14)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (8, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 15)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (9, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 16)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (10, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 17)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (11, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 18)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (12, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 19)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (13, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 20)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (14, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 21)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (15, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user333', 22)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (16, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 23)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (17, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', 24)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (18, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 25)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (19, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', 26)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (20, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user666', 27)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (21, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 28)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (22, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', 29)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (23, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user444', 30)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (24, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 31)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (25, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user555', 32)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (26, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user555', 33)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (27, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 34)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (28, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 35)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (29, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', 36)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (30, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user222', 37)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (31, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'user111', 38)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (32, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 39)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (33, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user333', 40)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (34, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 41)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (35, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 42)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (36, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 43)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (37, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 44)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (38, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 45)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (39, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user444', 46)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (40, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user444', 47)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (41, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 48)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (42, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', 49)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (43, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', 50)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (44, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 51)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (45, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 52)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (46, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 53)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (47, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', 54)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (48, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', 55)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (49, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 56)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (50, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 57)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (51, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 58)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (52, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 59)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (53, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 60)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (54, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', 61)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (55, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', 62)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (56, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', 63)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (57, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 64)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (58, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 65)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (59, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user111', 66)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (60, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', 67)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (61, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', 68)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (62, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user666', 69)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (63, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'user222', 70)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (64, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 71)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (65, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 72)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (66, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', 73)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (67, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', 74)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (68, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 75)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (69, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', 76)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (70, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 77)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (71, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 78)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (72, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 79)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (73, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 80)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (74, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 81)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (75, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 82)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (76, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 83)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (77, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 84)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (78, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 85)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (79, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 86)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (80, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 87)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (81, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', 88)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (82, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', 89)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (83, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', 90)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (84, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', 91)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (85, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', 92)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (86, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', 93)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (87, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 94)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (88, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 95)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (89, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', 96)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (90, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', 97)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (91, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', 98)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (92, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', 99)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (93, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 100)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (94, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 101)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (95, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 102)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (96, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', 103)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (97, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', 104)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (98, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', 105)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (99, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 106)
GO
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (100, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user333', 107)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (101, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 108)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (102, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 109)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (103, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 110)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (104, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 111)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (105, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 112)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (106, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 113)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (107, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', 114)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (108, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', 115)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (109, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', 116)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (110, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', 117)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (111, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user444', 118)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (112, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', 119)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (113, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user555', 120)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (114, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 121)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (115, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 122)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (116, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user222', 123)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (117, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 124)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (118, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'user111', 125)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (119, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 126)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (120, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 127)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (121, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 128)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (122, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 129)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (123, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 130)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (124, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', 131)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (125, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', 132)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (126, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 133)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (127, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 134)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (128, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 135)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (129, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', 136)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (130, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', 137)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (131, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', 138)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (132, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user333', 139)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (133, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user111', 140)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (134, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user222', 141)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (135, CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'user222', 142)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (136, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 143)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (137, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 144)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (138, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 145)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (139, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 146)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (140, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 147)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (141, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 148)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (142, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 149)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (143, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user444', 150)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (144, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'user111', 151)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (145, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 152)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (146, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user222', 153)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (147, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 154)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (148, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 155)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (149, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 156)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (150, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 157)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (151, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 158)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (152, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', 159)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (153, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 160)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (154, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 161)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (155, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 162)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (156, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 163)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (157, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 164)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (158, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 165)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (159, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 166)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (160, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 167)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (161, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 168)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (162, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 169)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (163, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', 170)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (164, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 171)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (165, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 172)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (166, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 173)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (167, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 174)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (168, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 175)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (169, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 176)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (170, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 177)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (171, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 178)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (172, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 179)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (173, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', 180)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (174, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user444', 181)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (175, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 182)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (176, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 183)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (177, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 184)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (178, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 185)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (179, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 186)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (180, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 187)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (181, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 188)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (182, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 189)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (183, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 190)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (184, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 191)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (185, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 192)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (186, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 193)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (187, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 194)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (188, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 195)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (189, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 196)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (190, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 197)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (191, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 198)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (192, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 199)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (193, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 200)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (194, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 201)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (195, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 202)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (196, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 203)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (197, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 204)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (198, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 205)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (199, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 206)
GO
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (200, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 207)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (201, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', 208)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (202, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 209)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (203, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', 210)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (204, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 211)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (205, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user666', 212)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (206, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 213)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (207, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user111', 214)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (208, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 215)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (209, CAST(N'2022-11-15T00:00:00.000' AS DateTime), N'user333', 216)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (210, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 217)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (211, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 218)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (212, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 219)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (213, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 220)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (214, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 221)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (215, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 222)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (216, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 223)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (217, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 224)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (218, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 225)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (219, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 226)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (220, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 227)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (221, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 228)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (222, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 229)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (223, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 230)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (224, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 231)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (225, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 232)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (226, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 233)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (227, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 234)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (228, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 235)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (229, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 236)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (230, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 237)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (231, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 238)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (232, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 239)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (233, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 240)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (234, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 241)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (235, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 242)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (236, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 243)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (237, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 244)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (238, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 245)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (239, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 246)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (240, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user888', 247)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (241, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 248)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (242, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 249)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (243, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 250)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (244, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 251)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (245, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 252)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (246, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 253)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (247, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 254)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (248, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 255)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (249, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 256)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (250, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 257)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (251, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 258)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (252, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 259)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (253, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 260)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (254, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 261)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (255, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 262)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (256, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 263)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (257, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 264)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (258, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 265)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (259, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 266)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (260, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 267)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (261, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 268)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (262, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 269)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (263, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 270)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (264, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 271)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (265, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 272)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (266, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 273)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (267, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 274)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (268, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 275)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (269, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user444', 276)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (270, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 277)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (271, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 278)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (272, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 279)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (273, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 280)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (274, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 281)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (275, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 282)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (276, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 283)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (277, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 284)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (278, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 285)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (279, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 286)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (280, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 287)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (281, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 288)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (282, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 289)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (283, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 290)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (284, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 291)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (285, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user333', 292)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (286, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 293)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (287, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 294)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (288, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 295)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (289, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 296)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (290, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 297)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (291, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 298)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (292, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 299)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (293, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user777', 300)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (294, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 301)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (295, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 302)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (296, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 303)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (297, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 304)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (298, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 305)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (299, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user222', 306)
GO
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (300, CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'user111', 307)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (301, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 308)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (302, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 309)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (303, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 310)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (304, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 311)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (305, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 312)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (306, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user444', 313)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (307, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 314)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (308, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 315)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (309, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 316)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (310, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user777', 317)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (311, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user999', 318)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (312, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user333', 319)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (313, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user333', 320)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (314, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 321)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (315, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 322)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (316, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 323)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (317, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 324)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (318, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 325)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (319, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 326)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (320, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 327)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (321, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 328)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (322, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 329)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (323, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 330)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (324, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 331)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (326, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 332)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (325, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 333)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (327, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 334)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (329, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 335)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (330, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 336)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (328, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 337)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (333, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 338)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (331, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 339)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (332, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 340)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (334, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 341)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (337, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 342)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (336, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 343)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (335, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 344)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (338, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 345)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (339, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 346)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (340, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 347)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (345, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 348)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (342, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 349)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (341, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 350)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (344, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 351)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (343, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 352)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (346, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 353)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (348, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 354)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (347, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 355)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (349, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 356)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (350, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 357)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (352, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 358)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (351, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 359)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (354, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 360)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (355, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 361)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (353, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 362)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (356, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 363)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (358, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 364)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (357, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 365)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (359, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user999', 366)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (360, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user999', 367)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (361, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user999', 368)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (362, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user777', 369)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (363, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 370)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (364, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 371)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (365, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 372)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (366, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 373)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (367, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 374)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (368, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 375)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (369, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 376)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (370, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 377)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (371, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 378)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (372, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 379)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (373, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 380)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (374, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 381)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (375, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 382)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (376, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 383)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (377, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 384)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (378, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 385)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (379, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 386)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (380, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user222', 387)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (381, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 388)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (382, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 389)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (383, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 390)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (384, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user111', 391)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (385, CAST(N'2022-11-17T00:00:00.000' AS DateTime), N'user777', 392)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (386, CAST(N'2022-11-18T00:00:00.000' AS DateTime), N'user123', 393)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (387, CAST(N'2022-11-18T00:00:00.000' AS DateTime), N'user123', 394)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (388, CAST(N'2022-11-18T00:00:00.000' AS DateTime), N'user123', 395)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (389, CAST(N'2022-11-18T00:00:00.000' AS DateTime), N'user123', 396)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (390, CAST(N'2022-11-18T00:00:00.000' AS DateTime), N'user111', 397)
SET IDENTITY_INSERT [dbo].[Assigned] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([projectID], [projectName], [createDate], [endDate], [statusID], [securityID], [teamID]) VALUES (1, N'Robot Trai Cay', CAST(N'2022-11-02T00:00:00.000' AS DateTime), NULL, 1, 1, 3)
INSERT [dbo].[Project] ([projectID], [projectName], [createDate], [endDate], [statusID], [securityID], [teamID]) VALUES (2, N'Second', CAST(N'2022-11-02T00:00:00.000' AS DateTime), NULL, 1, 1, 12)
INSERT [dbo].[Project] ([projectID], [projectName], [createDate], [endDate], [statusID], [securityID], [teamID]) VALUES (3, N'PJ_User111', CAST(N'2022-11-07T00:00:00.000' AS DateTime), NULL, 1, 1, 13)
INSERT [dbo].[Project] ([projectID], [projectName], [createDate], [endDate], [statusID], [securityID], [teamID]) VALUES (4, N'this is a new project', CAST(N'2022-11-18T00:00:00.000' AS DateTime), NULL, 1, 1, 14)
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
INSERT [dbo].[Project_Security] ([securityID], [securityName]) VALUES (1, N'Public')
INSERT [dbo].[Project_Security] ([securityID], [securityName]) VALUES (2, N'Private')
GO
INSERT [dbo].[Project_Status] ([statusID], [statusName]) VALUES (1, N'Active')
INSERT [dbo].[Project_Status] ([statusID], [statusName]) VALUES (2, N'In-active')
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (1, N'Untitled section', 1, 1)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (2, N'Hay ta', 2, 1)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (4, N'Untitled section', 1, 3)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (8, N'To do', 2, 2)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (9, N'Doing', 1, 2)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (10, N'Done', 3, 2)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (11, N'Untitled section', 2, 4)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (12, N'ádasđá', 1, 4)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (13, N'llll', 3, 4)
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (1, N'Ghê trời', CAST(N'2022-11-02T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, 1, 2, 4)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (4, N'New', CAST(N'2022-11-07T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 3, 4, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (5, N'Ghe', CAST(N'2022-11-07T00:00:00.000' AS DateTime), NULL, NULL, 2, NULL, 3, 4, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (16, N'Thiết kế UXUI', CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-13T00:00:00.000' AS DateTime), 1, NULL, 2, 9, 1, 4)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (17, N'Vẽ Use case', CAST(N'2022-11-12T07:00:00.000' AS DateTime), CAST(N'2022-11-17T05:07:00.000' AS DateTime), CAST(N'2022-11-24T18:35:00.000' AS DateTime), 3, NULL, 2, 10, 1, 3)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (18, N'Sơ đồ đặc tả SRS', CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), NULL, 2, NULL, 2, 10, 2, 3)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (19, N'Dựng Model', CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-14T11:55:00.000' AS DateTime), CAST(N'2022-11-15T11:54:00.000' AS DateTime), 1, NULL, 2, 8, 2, 3)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (20, N'Vẽ diagram', CAST(N'2022-11-13T00:00:00.000' AS DateTime), CAST(N'2022-11-08T11:25:00.000' AS DateTime), CAST(N'2022-11-16T13:07:00.000' AS DateTime), 1, NULL, 2, 10, 3, 4)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (21, N'Vẽ Capcha
', CAST(N'2022-11-16T00:00:00.000' AS DateTime), NULL, NULL, 4, NULL, 2, 10, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (22, N'New', CAST(N'2022-11-17T13:41:51.000' AS DateTime), CAST(N'2022-11-14T13:42:00.000' AS DateTime), CAST(N'2022-11-18T13:42:00.000' AS DateTime), 2, NULL, 2, 9, 1, 4)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (23, N'ggggg', CAST(N'2022-11-18T00:30:47.770' AS DateTime), NULL, NULL, 1, NULL, 4, 11, 2, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (24, N'ádasđá', CAST(N'2022-11-18T00:31:03.687' AS DateTime), NULL, NULL, 2, NULL, 4, 13, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (25, N'lllll', CAST(N'2022-11-18T01:07:44.197' AS DateTime), NULL, NULL, 1, NULL, 4, 13, 1, 1)
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[Task_File] ON 

INSERT [dbo].[Task_File] ([fileID], [taskID], [projectID], [code], [username], [createDate], [name], [status]) VALUES (1, 23, 4, N'tOeVJmmlkKAnCW7OBl', N'user123', CAST(N'2022-11-18T00:37:55.720' AS DateTime), N'Thanks for buying the art work.txt', 1)
INSERT [dbo].[Task_File] ([fileID], [taskID], [projectID], [code], [username], [createDate], [name], [status]) VALUES (2, 23, 4, N'b79NVhllm91NMMHaMD', N'user123', CAST(N'2022-11-18T00:39:56.077' AS DateTime), N'Illustration21.png', 1)
INSERT [dbo].[Task_File] ([fileID], [taskID], [projectID], [code], [username], [createDate], [name], [status]) VALUES (3, 23, 4, N'SyvCTntOt1hhqaBzNL', N'user123', CAST(N'2022-11-18T00:40:15.433' AS DateTime), N'MVIMG_20220819_183049_2.jpg', 1)
INSERT [dbo].[Task_File] ([fileID], [taskID], [projectID], [code], [username], [createDate], [name], [status]) VALUES (4, 25, 4, N'7f8ZSd7hFaFlBY9U2f', N'user123', CAST(N'2022-11-18T01:08:07.590' AS DateTime), N'Point Blur_Apr182022_203401 (1).jpg', 1)
SET IDENTITY_INSERT [dbo].[Task_File] OFF
GO
INSERT [dbo].[Task_Priority] ([priorityID], [priorityName]) VALUES (1, N'Low')
INSERT [dbo].[Task_Priority] ([priorityID], [priorityName]) VALUES (2, N'Medium')
INSERT [dbo].[Task_Priority] ([priorityID], [priorityName]) VALUES (3, N'High')
GO
INSERT [dbo].[Task_Status] ([statusID], [statusName]) VALUES (1, N'On track')
INSERT [dbo].[Task_Status] ([statusID], [statusName]) VALUES (2, N'At risk')
INSERT [dbo].[Task_Status] ([statusID], [statusName]) VALUES (3, N'Off track')
INSERT [dbo].[Task_Status] ([statusID], [statusName]) VALUES (4, N'Approved')
GO
SET IDENTITY_INSERT [dbo].[Task_Sub] ON 

INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (27, 16, N'Vẽ header', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (28, 16, N'Vẽ footer', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (29, 16, N'Vẽ main ariticle', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (30, 17, N'Đầy đủ chức năng', 0)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (31, 17, N'Hiểu rõ include', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (32, 16, N'Dựng css', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (33, 16, N'Dựng js', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (34, 18, N'Ve xe', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (35, 16, N'Dựng source', 0)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (36, 16, N'Dựng controller', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (37, 17, N'New', 0)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (38, 17, N'Old', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (39, 19, N'Dựng constructor', 0)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (40, 20, N'Thiết kế khóa ngoại', 0)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (41, 4, N'hi', 0)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (42, 16, N'Dựng nhà cửa', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (43, 22, N'New dựng nhà', 0)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (44, 22, N'nhà mới', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (45, 20, N'Tiến đẹp trai, web hơi bị mượt', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (46, 25, N'đâsadsads', 0)
SET IDENTITY_INSERT [dbo].[Task_Sub] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (3, N'365Band')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (4, N'367Band')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (5, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (6, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (7, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (8, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (9, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (10, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (11, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (12, N'BAN')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (13, N'HiFi')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (14, N'tiến team')
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[Team_Members] ON 

INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user111', 3, 1)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user222', 4, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user333', 6, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user444', 7, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user555', 8, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user666', 9, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user777', 19, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (12, N'user888', 17, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (13, N'user111', 5, 1)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (13, N'user222', 10, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (13, N'user333', 11, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (13, N'user444', 18, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (14, N'user111', 21, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (14, N'user123', 20, 1)
SET IDENTITY_INSERT [dbo].[Team_Members] OFF
GO
INSERT [dbo].[Team_Role] ([roleID], [roleName]) VALUES (1, N'Project Owner')
INSERT [dbo].[Team_Role] ([roleID], [roleName]) VALUES (2, N'Project Member')
GO
SET IDENTITY_INSERT [dbo].[Web_Security] ON 

INSERT [dbo].[Web_Security] ([id], [name], [content], [note], [statusWeb], [versionWeb], [startDate], [endDate]) VALUES (1, N'ádsdaadsasd', N'sdaasdasđâsdasd. Nhã gà', N'ádadsdasasd', 0, 0, CAST(N'2022-11-18T01:50:00.000' AS DateTime), CAST(N'2022-11-18T01:51:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Web_Security] OFF
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Activity] ADD  DEFAULT (getdate()) FOR [startDate]
GO
ALTER TABLE [dbo].[Assigned] ADD  DEFAULT (getdate()) FOR [startDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Account_Role] ([roleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account_Role]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Activity_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Activity_Category] ([categoryID])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Activity_Category]
GO
ALTER TABLE [dbo].[Assigned]  WITH CHECK ADD  CONSTRAINT [FK_Assigned_Activity] FOREIGN KEY([activityID])
REFERENCES [dbo].[Activity] ([activityID])
GO
ALTER TABLE [dbo].[Assigned] CHECK CONSTRAINT [FK_Assigned_Activity]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Project_Security] FOREIGN KEY([securityID])
REFERENCES [dbo].[Project_Security] ([securityID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Project_Security]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Project_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Project_Status] ([statusID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Project_Status]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Team] FOREIGN KEY([teamID])
REFERENCES [dbo].[Team] ([teamID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Team]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Project] FOREIGN KEY([projectID])
REFERENCES [dbo].[Project] ([projectID])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Project]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Section] FOREIGN KEY([sectionID])
REFERENCES [dbo].[Section] ([sectionID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Section]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Task_Priority] FOREIGN KEY([priorityID])
REFERENCES [dbo].[Task_Priority] ([priorityID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Task_Priority]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Task_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Task_Status] ([statusID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Task_Status]
GO
ALTER TABLE [dbo].[Task_File]  WITH CHECK ADD  CONSTRAINT [fk_taskFile_account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Task_File] CHECK CONSTRAINT [fk_taskFile_account]
GO
ALTER TABLE [dbo].[Task_File]  WITH CHECK ADD  CONSTRAINT [fk_taskFile_project] FOREIGN KEY([projectID])
REFERENCES [dbo].[Project] ([projectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Task_File] CHECK CONSTRAINT [fk_taskFile_project]
GO
ALTER TABLE [dbo].[Task_File]  WITH CHECK ADD  CONSTRAINT [fk_taskFile_task] FOREIGN KEY([taskID])
REFERENCES [dbo].[Task] ([taskID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Task_File] CHECK CONSTRAINT [fk_taskFile_task]
GO
ALTER TABLE [dbo].[Task_Sub]  WITH CHECK ADD  CONSTRAINT [FK_Task_Sub_Task] FOREIGN KEY([taskID])
REFERENCES [dbo].[Task] ([taskID])
GO
ALTER TABLE [dbo].[Task_Sub] CHECK CONSTRAINT [FK_Task_Sub_Task]
GO
ALTER TABLE [dbo].[Team_Members]  WITH CHECK ADD  CONSTRAINT [FK_Team_Members_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Team_Members] CHECK CONSTRAINT [FK_Team_Members_Account]
GO
ALTER TABLE [dbo].[Team_Members]  WITH CHECK ADD  CONSTRAINT [FK_Team_Members_Team] FOREIGN KEY([teamID])
REFERENCES [dbo].[Team] ([teamID])
GO
ALTER TABLE [dbo].[Team_Members] CHECK CONSTRAINT [FK_Team_Members_Team]
GO
ALTER TABLE [dbo].[Team_Members]  WITH CHECK ADD  CONSTRAINT [FK_Team_Members_Team_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Team_Role] ([roleID])
GO
ALTER TABLE [dbo].[Team_Members] CHECK CONSTRAINT [FK_Team_Members_Team_Role]
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllActivitiesRelevantToInvitationInfor]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proceduce_GetAllActivitiesRelevantToInvitationInfor](@projectID int,@username varchar(50),@email varchar(50))
as
begin
	DECLARE @MyVariable VARCHAR(50);
	SET @MyVariable = @email;
	if exists ( select* from Account ac,Activity act,Project pj,Team t,Team_Members tm,Assigned ass
					where 
					 act.activityID = ass.activityID and
					 pj.projectID = act.projectID and
				     pj.teamID = t.teamID and
					 t.teamID = tm.teamID and 
					 ac.username = tm.username and
					 ac.email = @email)
	begin
		SET @MyVariable = null;
	end

	Select  * from  Activity
	where
		(Activity.categoryID = 6 or Activity.categoryID = 7 or Activity.categoryID = 8)
		and Activity.projectID = @projectID and (Activity.username = @username or Activity.username = @MyVariable)

		

end
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllActivitiesRelevantToProjectAndAccount]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proceduce_GetAllActivitiesRelevantToProjectAndAccount](@projectID int, @username varchar(50))
as
begin
	Select * from Activity, project, team, team_members, account
	where
		activity.projectID = project.projectID and
		project.teamID = team.teamID and
		Team_Members.teamID = team.teamID and
		Account.username = Team_Members.username and
		Account.username like @username and
		activity.projectID = @projectID
end
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllActivitiesRelevantToTaskAndProject]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proceduce_GetAllActivitiesRelevantToTaskAndProject](@projectID int, @taskID int)
as
begin
	Select * from Activity, project, team, team_members, account
	where
		activity.projectID = project.projectID and
		project.teamID = team.teamID and
		Team_Members.teamID = team.teamID and
		Account.username = Team_Members.username and
		Account.username = activity.username and
		activity.projectID = @projectID and
		activity.objectID = @taskID 
end
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllProjectsRelevantToAccount]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proceduce_GetAllProjectsRelevantToAccount](@username varchar(50))
as
begin
	Select * from project, team, team_members, account
	where
		project.teamID = team.teamID and
		Team_Members.teamID = team.teamID and
		Account.username = Team_Members.username and
		Account.username like @username
end
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllProjectsRelevantToAccountPrivate]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proceduce_GetAllProjectsRelevantToAccountPrivate](@username varchar(50),@email varchar(50))
as
begin
	DECLARE @MyVariable VARCHAR(50);
	SET @MyVariable = @email;
	if exists ( select* from Account ac,Activity act,Project pj,Team t,Team_Members tm,Assigned ass
					where 
					 act.activityID = ass.activityID and
					 pj.projectID = act.projectID and
				     pj.teamID = t.teamID and
					 t.teamID = tm.teamID and 
					 ac.username = tm.username and
					 ac.email = @email)
	begin
		SET @MyVariable = null;
	end

	Select distinct project.projectID from project, Activity, Assigned
	where
		Activity.projectID = project.projectID and
		Assigned.activityID = Activity.activityID and
		Activity.categoryID not in (8) and
		(Activity.username = @username or Activity.username = @MyVariable or Assigned.username = @username)
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_DataLastWeb]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Search the end of sql
create proc [dbo].[sp_DataLastWeb] 
As
begin
	SELECT TOP 1 * FROM Web_Security ORDER BY ID DESC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataAccount]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindDataAccount]
	(@DieuKien nvarchar(100),@Username varchar(100)) 
As
begin
	SELECT * FROM Account ac INNER JOIN Team_Members TM ON ac.username = TM.username WHERE EMAIL LIKE '%'+@DieuKien+'%' or FULLNAME LIKE '%'+@DieuKien+'%' 
	or phONe LIKE '%'+@DieuKien+'%' AND TM.username LIKE @Username
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataProject]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Find data by name project in table Project
create proc [dbo].[sp_FindDataProject]
	(@DieuKien nvarchar(100),@Username varchar(100)) 
As
begin
	SELECT * FROM PROJECT PR INNER JOIN Team T ON PR.teamID = T.teamID INNER JOIN Team_Members TM ON T.teamID = TM.teamID WHERE PR.PROJECTNAME LIKE '%'+@DieuKien+'%'
	AND TM.username LIKE @Username
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataTask]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Find data by name task in table Task
create proc [dbo].[sp_FindDataTask]
	(@DieuKien nvarchar(100),@Username varchar(100)) 
As
begin
	SELECT * FROM TASK t INNER JOIN SectiON sc ON t.sectiONID=sc.sectiONID INNER JOIN Project pro ON sc.projectID=pro.projectID 
	INNER JOIN Team te ON te.teamID = pro.teamID INNER JOIN Team_Members TM ON TM.teamID = te.teamID
	WHERE TASKNAME LIKE '%'+@DieuKien+'%' OR discriptiON LIKE '%'+@DieuKien+'%' AND TM.username LIKE @Username
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataTaskSub]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Find data by disciptiON in table Task_Sub
create proc [dbo].[sp_FindDataTaskSub]
	(@DieuKien nvarchar(100),@Username varchar(100)) 
As
begin
	SELECT * FROM Task_Sub TS INNER JOIN TASK T ON T.taskID = TS.taskID INNER JOIN SECTION SC ON SC.sectionID =T.sectionID
	INNER JOIN PROJECT PRO ON SC.projectID=PRO.projectID INNER JOIN TEAM TE ON TE.teamID =PRO.teamID INNER JOIN Team_Members TMS ON TMS.teamID=TE.teamID
	WHERE TS.discriptiON LIKE '%'+@DieuKien+'%' AND TMS.username LIKE @Username
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataTeam]    Script Date: 18/11/2022 1:52:04 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Find data by name team in table Team
create proc [dbo].[sp_FindDataTeam]
	(@DieuKien nvarchar(100),@Username varchar(100)) 
As
begin
	SELECT * FROM TEAM INNER JOIN Team_Members TM ON TEAM.teamID=TM.teamID WHERE TEAMNAME LIKE '%'+@DieuKien+'%'
	AND TM.username LIKE @Username
end
GO
USE [master]
GO
ALTER DATABASE [PMF] SET  READ_WRITE 
GO
