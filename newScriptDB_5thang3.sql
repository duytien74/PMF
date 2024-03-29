create database PMF
USE [PMF]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Account_Role]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Activity]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Activity_Category]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Assigned]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Project_Security]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Project_Status]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Schedule]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[jobID] [varchar](250) NOT NULL,
	[cronExpress] [varchar](50) NOT NULL,
	[title] [nvarchar](250) NULL,
	[link] [varchar](max) NULL,
	[description] [ntext] NOT NULL,
	[projectID] [int] NULL,
	[taskID] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[cateID] [int] NOT NULL,
	[status] [int] NOT NULL,
	[startDate] [datetime] NULL,
	[decision] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule_Category]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule_Category](
	[cateID] [int] NOT NULL,
	[cateName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Task_File]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_File](
	[fileID] [int] IDENTITY(1,1) NOT NULL,
	[taskID] [int] NOT NULL,
	[projectID] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
	[code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[fileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_Priority]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Task_Status]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Task_Sub]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Team]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Team_Members]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Team_Role]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  Table [dbo].[Web_Security]    Script Date: 2/7/2023 8:55:43 AM ******/
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
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'admin123', N'123456', N'Nguyễn Văn Admin', CAST(N'2022-11-02T01:15:25.427' AS DateTime), N'admin123@gmail.com', N'0374038128', N'Ho Chi Minh city', N'admin.png', 1, 1)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user111', N'123456', N'Nguyễn Lê Duy Tiến', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'tiennld2002@gmail.com', N'0374038128', N'Ho Chi Minh City', N'face17.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user123', N'123456', N'Nguyễn Thị User10', CAST(N'2022-11-02T01:15:25.427' AS DateTime), N'mmm@gmail.com', N'0374038128', N'Ho Chi Minh city', N'1691796.jpg', 2, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user222', N'123456', N'Trần Phạm Phi Hùng', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'2002dtn@gmail.com', N'0374038128', N'Ho Chi Minh city', N'face3.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user333', N'123456', N'Võ Thanh Nhã', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'hungtppps16493@fpt.edu.vn', N'0374038128', N'Ho Chi Minh city', N'user3.jpg', 3, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user444', N'123456', N'Trận Thị Thu Diệu', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'2001dtn@gmail.com', N'0374038128', N'Ho Chi Minh city', N'user4.jpg', 2, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user555', N'123456', N'Trưng Trắc', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'2004dtn@gmail.com', N'0374038128', N'Ho Chi Minh city', N'user5.jpg', 3, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user666', N'123456', N'Trưng Nhị', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'vothanhnha744@gmail.com', N'0374038128', N'Ho Chi Minh city', N'user6.jpg', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user777', N'123456', N'Nguyễn Ngọc Thái Duy', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'user777@gmail.com', N'0374038128', N'Ho Chi Minh city', N'user7.jpg', 2, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user888', N'0e5f8ce1-8b99-45cc-9004-a75f383f05d3', N'Nguyễn Thị User8', CAST(N'2022-11-02T01:15:25.427' AS DateTime), N'user888@gmail.com', N'0374038128', N'Ho Chi Minh city', N'user8.png', 1, 2)
INSERT [dbo].[Account] ([username], [pass], [fullname], [createDate], [email], [phone], [address], [image], [status], [roleID]) VALUES (N'user999', N'fba28bea-0107-448f-983c-ac421fce3cb4', N'Nguyễn Thị User9', CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'nhavtps16559@fpt.edu.vn', N'0374038128', N'Ho Chi Minh City', N'hinh-anh-gai-xinh-de-thuong-nhat-1.jpg', 1, 2)
GO
INSERT [dbo].[Account_Role] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Account_Role] ([roleID], [roleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1695, 0, N'Project (Project Management PMF) has created by user (user111)', CAST(N'2022-12-26T11:34:47.140' AS DateTime), N'user111', NULL, 9, 1)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1696, 20, N'The Project Owner(user111) has changed the name of the section Untitled section to ''To do''', CAST(N'2022-12-26T11:36:15.750' AS DateTime), NULL, NULL, 9, 24)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1697, 1, N'Task (Notification with SMS) has been moved from section (To do) to (Doing) by (user111)', CAST(N'2022-12-26T11:39:50.367' AS DateTime), N'user111', NULL, 9, 5)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1698, 2, N'Task (Notification with SMS) has been moved from section (Doing) to (To do) by (user111)', CAST(N'2022-12-26T11:39:56.417' AS DateTime), N'user111', NULL, 9, 5)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1699, 51, N'The Project Owner(user111) has changed the name of the task Check maintain when login to ''Check maintenance when login''', CAST(N'2022-12-26T11:45:52.057' AS DateTime), NULL, NULL, 9, 25)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1700, 54, N'The Project Owner(user111) has changed the name of the task Registration to ''Register''', CAST(N'2022-12-26T11:47:11.267' AS DateTime), NULL, NULL, 9, 25)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1701, 54, N'The Project Owner(user111) has changed the name of the task Register to ''Create user account''', CAST(N'2022-12-26T11:47:21.477' AS DateTime), NULL, NULL, 9, 25)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1702, 58, N'The Project Owner(user111) has changed the name of the task Create brand "DuyTien" to ''Create brand for each member''', CAST(N'2022-12-26T11:49:27.927' AS DateTime), NULL, NULL, 9, 25)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1703, 59, N'The Project Owner(user111) has changed the name of the task Create brand "" to ''Push DAO, Model of project''', CAST(N'2022-12-26T11:50:09.573' AS DateTime), NULL, NULL, 9, 25)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1704, 63, N'The Project Owner(user111) has changed the name of the task Create new Responsiti to ''Responsitory''', CAST(N'2022-12-26T11:51:28.667' AS DateTime), NULL, NULL, 9, 25)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1705, 63, N'The Project Owner(user111) has changed the name of the task Responsitory to ''Create new responsitory''', CAST(N'2022-12-26T11:51:44.163' AS DateTime), NULL, NULL, 9, 25)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1706, 0, N'Project Owner(user111) has invited user (user222) to project Project Management PMF', CAST(N'2022-12-26T11:52:17.070' AS DateTime), N'user222', NULL, 9, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1707, 0, N'Project Owner(user111) has invited user (user333) to project Project Management PMF', CAST(N'2022-12-26T11:52:17.077' AS DateTime), N'user333', NULL, 9, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1708, 0, N'Project Owner(user111) has invited user (user444) to project Project Management PMF', CAST(N'2022-12-26T11:52:17.083' AS DateTime), N'user444', NULL, 9, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1709, 0, N'Project Owner(user111) has invited user (user777) to project Project Management PMF', CAST(N'2022-12-26T11:52:17.087' AS DateTime), N'user777', NULL, 9, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1710, 0, N'User (user222) has accepted to join in the project  Project Management PMF', CAST(N'2022-12-26T11:52:30.600' AS DateTime), N'user222', NULL, 9, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1711, 0, N'User (user333) has accepted to join in the project  Project Management PMF', CAST(N'2022-12-26T11:52:37.250' AS DateTime), N'user333', NULL, 9, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1712, 0, N'User (user444) has accepted to join in the project  Project Management PMF', CAST(N'2022-12-26T11:53:01.717' AS DateTime), N'user444', NULL, 9, 7)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1713, 40, N'user111 changed the planned start date into 20-12-2022 11:53:00', CAST(N'2022-12-26T11:53:40.323' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1714, 40, N'user111 changed the planned end date into 27-12-2022 11:53:00', CAST(N'2022-12-26T11:53:45.240' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1715, 40, N'The Project Owner(user111) has handled the task Connect to Banking for the member (user111)', CAST(N'2022-12-26T11:53:46.520' AS DateTime), N'user111', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1716, 40, N'Project Owner (user111) has canceled the assigning task Connect to Banking with reason ''f ''', CAST(N'2022-12-26T11:53:49.703' AS DateTime), N'user111', N'f', 9, 22)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1717, 40, N'The Project Owner(user111) has handled the task Connect to Banking for the member (user222)', CAST(N'2022-12-26T11:53:53.613' AS DateTime), N'user222', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1718, 40, N'The member (user222) has acepted to handle the task Connect to Banking', CAST(N'2022-12-26T11:54:02.380' AS DateTime), N'user222', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1719, 39, N'user111 changed the planned start date into 14-12-2022 11:54:00', CAST(N'2022-12-26T11:54:12.083' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1720, 39, N'user111 changed the planned end date into 28-12-2022 11:54:00', CAST(N'2022-12-26T11:54:16.130' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1721, 39, N'The Project Owner(user111) has handled the task Notification with SMS for the member (user333)', CAST(N'2022-12-26T11:54:17.770' AS DateTime), N'user333', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1722, 39, N'The member (user333) has acepted to handle the task Notification with SMS', CAST(N'2022-12-26T11:54:26.550' AS DateTime), N'user333', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1723, 42, N'user111 changed the planned start date into 08-12-2022 11:54:00', CAST(N'2022-12-26T11:54:37.263' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1724, 42, N'user111 changed the planned end date into 30-12-2022 11:54:00', CAST(N'2022-12-26T11:54:43.017' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1725, 42, N'The Project Owner(user111) has handled the task Update project status for the member (user444)', CAST(N'2022-12-26T11:54:44.657' AS DateTime), N'user444', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1726, 42, N'The member (user444) has refused to handle the task Update project status with reason ''ff ''', CAST(N'2022-12-26T11:54:52.840' AS DateTime), N'user444', N'ff', 9, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1727, 46, N'user111 changed the planned start date into 13-12-2022 11:54:00', CAST(N'2022-12-26T11:55:02.000' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1728, 46, N'user111 changed the planned end date into 29-12-2022 11:55:00', CAST(N'2022-12-26T11:55:05.620' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1729, 46, N'The Project Owner(user111) has handled the task Show project notification for the member (user222)', CAST(N'2022-12-26T11:55:07.583' AS DateTime), N'user222', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1730, 48, N'user111 changed the planned start date into 21-12-2022 11:55:00', CAST(N'2022-12-26T11:55:13.670' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1731, 52, N'user111 changed the planned start date into 27-12-2022 11:55:00', CAST(N'2022-12-26T11:55:28.163' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1732, 52, N'user111 changed the planned end date into 28-12-2022 11:55:00', CAST(N'2022-12-26T11:55:31.543' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1733, 52, N'The Project Owner(user111) has handled the task Edit profile of self for the member (user222)', CAST(N'2022-12-26T11:55:33.047' AS DateTime), N'user222', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1734, 52, N'The member (user222) has acepted to handle the task Edit profile of self', CAST(N'2022-12-26T11:55:36.823' AS DateTime), N'user222', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1735, 53, N'user111 changed the planned start date into 20-12-2022 11:55:00', CAST(N'2022-12-26T11:55:44.467' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1736, 53, N'user111 changed the planned end date into 25-12-2022 11:55:00', CAST(N'2022-12-26T11:55:51.523' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1737, 53, N'The Project Owner(user111) has handled the task Login for the member (user333)', CAST(N'2022-12-26T11:55:53.363' AS DateTime), N'user333', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1738, 53, N'The member (user333) has acepted to handle the task Login', CAST(N'2022-12-26T11:55:56.850' AS DateTime), N'user333', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1739, 54, N'user111 changed the planned start date into 21-12-2022 11:56:00', CAST(N'2022-12-26T11:56:07.700' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1740, 54, N'user111 changed the planned end date into 17-1-2023 11:56:00', CAST(N'2022-12-26T11:56:11.997' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1741, 54, N'The Project Owner(user111) has handled the task Create user account for the member (user444)', CAST(N'2022-12-26T11:56:14.057' AS DateTime), N'user444', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1742, 54, N'The member (user444) has acepted to handle the task Create user account', CAST(N'2022-12-26T11:56:16.800' AS DateTime), N'user444', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1743, 55, N'user111 changed the planned start date into 19-12-2022 11:56:00', CAST(N'2022-12-26T11:56:25.613' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1744, 55, N'user111 changed the planned end date into 21-12-2022 11:56:00', CAST(N'2022-12-26T11:56:30.000' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1745, 55, N'The Project Owner(user111) has handled the task Create project for the member (user444)', CAST(N'2022-12-26T11:56:32.010' AS DateTime), N'user444', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1746, 55, N'The member (user444) has acepted to handle the task Create project', CAST(N'2022-12-26T11:56:36.450' AS DateTime), N'user444', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1747, 45, N'user111 changed the planned start date into 25-12-2022 12:32:00', CAST(N'2022-12-26T12:32:05.180' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1748, 45, N'user111 changed the planned end date into 28-12-2022 12:32:00', CAST(N'2022-12-26T12:32:08.423' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1749, 45, N'The Project Owner(user111) has handled the task Create meeting for the member (user333)', CAST(N'2022-12-26T12:32:11.490' AS DateTime), N'user333', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1750, 45, N'Project Owner (user111) has canceled the assigning task Create meeting with reason ''vxcv ''', CAST(N'2022-12-26T12:32:30.557' AS DateTime), N'user333', N'vxcv', 9, 22)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1751, 45, N'The member (user333) has refused to handle the task Create meeting with reason ''bcvbcv ''', CAST(N'2022-12-26T12:32:53.557' AS DateTime), N'user333', N'bcvbcv', 9, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1752, 45, N'The member (user333) has acepted to handle the task Create meeting', CAST(N'2022-12-26T12:34:31.110' AS DateTime), N'user333', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1753, 45, N'Project Owner (user111) has canceled the assigning task Create meeting with reason ''xczxczx ''', CAST(N'2022-12-26T12:34:40.647' AS DateTime), N'user333', N'xczxczx', 9, 22)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1754, 45, N'The Project Owner(user111) has handled the task Create meeting for the member (user333)', CAST(N'2022-12-26T12:34:56.120' AS DateTime), N'user333', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1755, 45, N'Project Owner (user111) has canceled the assigning task Create meeting with reason ''czxczx ''', CAST(N'2022-12-26T12:35:01.093' AS DateTime), N'user333', N'czxczx', 9, 22)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1756, 0, N'Project (Buid Calculator) has created by user (user111)', CAST(N'2022-12-26T13:16:52.647' AS DateTime), N'user111', NULL, 10, 1)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1757, 41, N'user111 changed the planned start date into 25-12-2022 01:19:00', CAST(N'2022-12-26T13:19:03.657' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1758, 41, N'user111 changed the planned end date into 30-12-2022 13:19:00', CAST(N'2022-12-26T13:19:07.383' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1759, 41, N'The Project Owner(user111) has handled the task Create chatbox for the member (user222)', CAST(N'2022-12-26T13:19:36.970' AS DateTime), N'user222', NULL, 9, 9)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1760, 41, N'The member (user222) has acepted to handle the task Create chatbox', CAST(N'2022-12-26T13:20:27.203' AS DateTime), N'user222', NULL, 9, 10)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1761, 41, N'user111 changed the planned start date into 18-12-2022 01:19:00', CAST(N'2022-12-26T13:25:40.660' AS DateTime), N'user111', NULL, 9, 16)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1762, 41, N'user111 changed the planned end date into 21-12-2022 13:25:00', CAST(N'2022-12-26T13:25:48.863' AS DateTime), N'user111', NULL, 9, 17)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1763, 41, N'user222 changed the status into Off track', CAST(N'2022-12-26T13:25:55.540' AS DateTime), N'user222', NULL, 9, 19)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1764, 41, N'user111 changed the priority into High', CAST(N'2022-12-26T13:26:29.977' AS DateTime), N'user111', NULL, 9, 18)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1765, 41, N'The member (user222) has refused to handle the task Create chatbox with reason ''MET QUA ''', CAST(N'2022-12-26T13:30:04.980' AS DateTime), N'user222', N'MET QUA', 9, 11)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1766, 0, N'Project Owner(user111) has invited user (user222) to project Buid Calculator', CAST(N'2022-12-26T13:31:45.483' AS DateTime), N'user222', NULL, 10, 6)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1767, 66, N'The Project Owner(user111) has handled the subtask Create button của task Create chatbox for the member (user222)', CAST(N'2022-12-26T13:41:59.153' AS DateTime), N'user222', NULL, 9, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1768, 66, N'The member (user222) has acepted to handle the subtask Create button of the task Create chatbox', CAST(N'2022-12-26T13:42:14.310' AS DateTime), N'user222', NULL, 9, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1769, 66, N'Project Owner (user111) has canceled the assigning subtask Create button of the task Create chatbox with reason ''qUA YEU ''', CAST(N'2022-12-26T13:42:25.530' AS DateTime), N'user222', N'qUA YEU', 9, 23)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1770, 66, N'The Project Owner(user111) has handled the subtask Create button của task Create chatbox for the member (user333)', CAST(N'2022-12-26T13:42:56.117' AS DateTime), N'user333', NULL, 9, 12)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1771, 66, N'The member (user333) has acepted to handle the subtask Create button of the task Create chatbox', CAST(N'2022-12-26T13:43:08.537' AS DateTime), N'user333', NULL, 9, 13)
INSERT [dbo].[Activity] ([activityID], [objectID], [activityName], [startDate], [username], [discription], [projectID], [categoryID]) VALUES (1772, 2, N'Project Project Management PMF has been shut down by Project Owner(user111) with reason ''mmmm''', CAST(N'2022-12-26T13:44:05.090' AS DateTime), N'user111', N'mmmm', 9, 97)
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
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (20, N'Set task status description')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (21, N'Remove member')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (22, N'Cancel task')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (23, N'Cancel subtask')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (24, N'Change section name')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (25, N'Change task name')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (26, N'Change subtask name')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (27, N'Delete section')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (28, N'Delete task')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (29, N'Delete subtask')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (30, N'Shut down project')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (31, N'Active project')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (97, N'Update project status')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (98, N'Enable Account')
INSERT [dbo].[Activity_Category] ([categoryID], [categoryName]) VALUES (99, N'Unlock Premium')
GO
SET IDENTITY_INSERT [dbo].[Assigned] ON 

INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1670, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1695)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1671, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1696)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1672, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1697)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1673, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1698)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1674, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1699)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1675, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1700)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1676, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1701)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1677, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1702)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1678, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1703)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1679, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1704)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1680, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1705)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1681, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1706)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1682, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1707)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1683, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1708)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1684, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1709)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1685, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user222', 1710)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1686, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user333', 1711)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1687, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user444', 1712)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1688, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1713)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1689, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1714)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1690, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1715)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1691, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1716)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1692, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1717)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1693, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user222', 1718)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1694, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1719)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1695, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1720)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1696, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1721)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1697, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user333', 1722)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1698, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1723)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1699, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1724)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1700, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1725)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1701, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user444', 1726)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1702, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1727)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1703, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1728)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1704, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1729)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1705, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1730)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1706, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1731)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1707, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1732)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1708, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1733)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1709, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user222', 1734)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1710, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1735)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1711, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1736)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1712, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1737)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1713, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user333', 1738)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1714, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1739)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1715, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1740)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1716, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1741)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1717, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user444', 1742)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1718, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1743)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1719, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1744)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1720, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1745)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1721, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user444', 1746)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1722, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1747)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1723, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1748)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1724, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1749)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1725, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1750)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1726, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user333', 1751)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1727, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user333', 1752)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1728, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1753)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1729, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1754)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1730, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1755)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1731, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1756)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1732, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1757)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1733, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1758)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1734, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1759)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1735, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user222', 1760)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1736, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1761)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1737, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1762)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1738, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user222', 1763)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1739, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1764)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1740, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user222', 1765)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1741, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1766)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1742, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1767)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1743, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user222', 1768)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1744, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1769)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1745, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1770)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1746, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user333', 1771)
INSERT [dbo].[Assigned] ([id], [startDate], [username], [activityID]) VALUES (1747, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'user111', 1772)
SET IDENTITY_INSERT [dbo].[Assigned] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([projectID], [projectName], [createDate], [endDate], [statusID], [securityID], [teamID]) VALUES (9, N'Project Management PMF', CAST(N'2022-12-26T00:00:00.000' AS DateTime), NULL, 2, 1, 19)
INSERT [dbo].[Project] ([projectID], [projectName], [createDate], [endDate], [statusID], [securityID], [teamID]) VALUES (10, N'Buid Calculator', CAST(N'2022-12-26T00:00:00.000' AS DateTime), NULL, 1, 1, 20)
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
INSERT [dbo].[Project_Security] ([securityID], [securityName]) VALUES (1, N'Public')
INSERT [dbo].[Project_Security] ([securityID], [securityName]) VALUES (2, N'Private')
GO
INSERT [dbo].[Project_Status] ([statusID], [statusName]) VALUES (1, N'Active')
INSERT [dbo].[Project_Status] ([statusID], [statusName]) VALUES (2, N'In-active')
GO
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'2E838736-E1D6-47C0-86A3-288221E05263', N'0 25 12 21 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 41, N'user222', 1, 1, CAST(N'2022-12-18T13:19:00.000' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'342601E2-6E11-4077-BDCE-3E9F9315025B', N'0 49 12 26 12 ? ', N'Test Notification', N'Pd40H9IVtpCrD1CHL3T16HMYfZaA3n', N'Crete meeting', 9, NULL, N'user444', 2, 1, CAST(N'2022-12-26T13:49:00.000' AS DateTime), 2)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'3C3CFC92-681D-401E-AB99-7ABB433951BD', N'0 49 12 26 12 ? ', N'Test Notification', N'Pd40H9IVtpCrD1CHL3T16HMYfZaA3n', N'Crete meeting', 9, NULL, N'user333', 2, 1, CAST(N'2022-12-26T13:49:00.000' AS DateTime), 3)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'7AFBC421-0A7B-42A1-BB00-09060465B0EA', N'0 53 10 27 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 40, N'user222', 1, 1, CAST(N'2022-12-26T11:54:02.390' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'AB03E9DF-8018-4CF5-A8F6-16CC756D40BB', N'0 55 10 28 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 52, N'user222', 1, 1, CAST(N'2022-12-26T11:55:36.840' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'B4BEBEF2-D4AD-423D-8BFE-8888CC867CF9', N'0 54 10 28 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 39, N'user333', 1, 1, CAST(N'2022-12-26T11:54:26.557' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'B6F4DFF5-649B-4CDF-BE0D-EC5F2889C09F', N'0 55 10 25 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 53, N'user333', 1, 1, CAST(N'2022-12-26T11:55:56.860' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'DA1F9B69-FE84-4CEA-8252-62F0BCC2AB6E', N'0 32 11 28 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 45, N'user333', 1, 1, CAST(N'2022-12-26T12:34:31.137' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'E1856A1B-42D1-44D8-B732-B1D51E89CF6C', N'0 56 10 21 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 55, N'user444', 1, 1, CAST(N'2022-12-26T11:56:36.457' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'E407C8BF-5B45-4677-8F14-CFAA9979095B', N'0 49 12 26 12 ? ', N'Test Notification', N'Pd40H9IVtpCrD1CHL3T16HMYfZaA3n', N'Crete meeting', 9, NULL, N'user111', 2, 1, CAST(N'2022-12-26T13:49:00.000' AS DateTime), 1)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'F348FCAD-7E61-420E-9EE2-82F692E25717', N'0 49 12 26 12 ? ', N'Test Notification', N'Pd40H9IVtpCrD1CHL3T16HMYfZaA3n', N'Crete meeting', 9, NULL, N'user222', 2, 1, CAST(N'2022-12-26T13:49:00.000' AS DateTime), 3)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'F9875FAF-5029-4734-A78E-00B6F6CA67F4', N'0 56 10 17 1 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 54, N'user444', 1, 1, CAST(N'2022-12-26T11:56:16.807' AS DateTime), 0)
INSERT [dbo].[Schedule] ([jobID], [cronExpress], [title], [link], [description], [projectID], [taskID], [username], [cateID], [status], [startDate], [decision]) VALUES (N'FD4E0CA4-4C91-4B30-9211-EED1990D53CB', N'0 19 12 30 12 ? ', NULL, NULL, N'60 minutes left until the deadline', 9, 41, N'user222', 1, 1, CAST(N'2022-12-26T13:20:27.217' AS DateTime), 0)
GO
INSERT [dbo].[Schedule_Category] ([cateID], [cateName]) VALUES (1, N'Task')
INSERT [dbo].[Schedule_Category] ([cateID], [cateName]) VALUES (2, N'Meeting')
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (20, N'To do', 1, 9)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (21, N'Doing', 2, 9)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (22, N'Done', 3, 9)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (23, N'Github', 4, 9)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (24, N'Sources', 5, 9)
INSERT [dbo].[Section] ([sectionID], [sectionName], [sectionNumber], [projectID]) VALUES (25, N'Untitled section', 1, 10)
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (39, N'Notification with SMS', CAST(N'2022-12-26T11:37:43.050' AS DateTime), CAST(N'2022-12-14T11:54:00.000' AS DateTime), CAST(N'2022-12-28T11:54:00.000' AS DateTime), 2, NULL, 9, 20, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (40, N'Connect to Banking', CAST(N'2022-12-26T11:38:16.077' AS DateTime), CAST(N'2022-12-20T11:53:00.000' AS DateTime), CAST(N'2022-12-27T11:53:00.000' AS DateTime), 1, NULL, 9, 20, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (41, N'Create chatbox', CAST(N'2022-12-26T11:38:39.150' AS DateTime), CAST(N'2022-12-18T13:19:00.000' AS DateTime), CAST(N'2022-12-21T13:25:00.000' AS DateTime), 3, NULL, 9, 20, 3, 3)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (42, N'Update project status', CAST(N'2022-12-26T11:40:27.733' AS DateTime), CAST(N'2022-12-08T11:54:00.000' AS DateTime), CAST(N'2022-12-30T11:54:00.000' AS DateTime), 4, NULL, 9, 20, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (43, N'Reportting', CAST(N'2022-12-26T11:40:50.337' AS DateTime), NULL, NULL, 5, NULL, 9, 20, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (44, N'Check authorization when click to project', CAST(N'2022-12-26T11:42:33.393' AS DateTime), NULL, NULL, 6, NULL, 9, 20, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (45, N'Create meeting', CAST(N'2022-12-26T11:42:48.313' AS DateTime), CAST(N'2022-12-25T12:32:00.000' AS DateTime), CAST(N'2022-12-28T12:32:00.000' AS DateTime), 1, NULL, 9, 21, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (46, N'Show project notification', CAST(N'2022-12-26T11:43:15.793' AS DateTime), CAST(N'2022-12-13T11:54:00.000' AS DateTime), CAST(N'2022-12-29T11:55:00.000' AS DateTime), 2, NULL, 9, 21, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (47, N'Show private notification', CAST(N'2022-12-26T11:43:24.903' AS DateTime), NULL, NULL, 3, NULL, 9, 21, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (48, N'Show list member in project', CAST(N'2022-12-26T11:43:50.287' AS DateTime), CAST(N'2022-12-21T11:55:00.000' AS DateTime), NULL, 4, NULL, 9, 21, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (49, N'Remove member from project', CAST(N'2022-12-26T11:44:13.737' AS DateTime), NULL, NULL, 5, NULL, 9, 21, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (50, N'Refused invitation from task assignee', CAST(N'2022-12-26T11:44:52.863' AS DateTime), NULL, NULL, 6, NULL, 9, 21, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (51, N'Check maintenance when login', CAST(N'2022-12-26T11:45:14.867' AS DateTime), NULL, NULL, 7, NULL, 9, 21, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (52, N'Edit profile of self', CAST(N'2022-12-26T11:46:17.260' AS DateTime), CAST(N'2022-12-27T11:55:00.000' AS DateTime), CAST(N'2022-12-28T11:55:00.000' AS DateTime), 1, NULL, 9, 22, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (53, N'Login', CAST(N'2022-12-26T11:46:24.823' AS DateTime), CAST(N'2022-12-20T11:55:00.000' AS DateTime), CAST(N'2022-12-25T11:55:00.000' AS DateTime), 2, NULL, 9, 22, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (54, N'Create user account', CAST(N'2022-12-26T11:46:33.857' AS DateTime), CAST(N'2022-12-21T11:56:00.000' AS DateTime), CAST(N'2023-01-17T11:56:00.000' AS DateTime), 3, NULL, 9, 22, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (55, N'Create project', CAST(N'2022-12-26T11:47:36.827' AS DateTime), CAST(N'2022-12-19T11:56:00.000' AS DateTime), CAST(N'2022-12-21T11:56:00.000' AS DateTime), 4, NULL, 9, 22, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (56, N'Create task', CAST(N'2022-12-26T11:47:42.997' AS DateTime), NULL, NULL, 5, NULL, 9, 22, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (57, N'Edit task detail', CAST(N'2022-12-26T11:47:48.873' AS DateTime), NULL, NULL, 6, NULL, 9, 22, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (58, N'Create brand for each member', CAST(N'2022-12-26T11:48:44.683' AS DateTime), NULL, NULL, 1, NULL, 9, 23, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (59, N'Push DAO, Model of project', CAST(N'2022-12-26T11:48:56.040' AS DateTime), NULL, NULL, 2, NULL, 9, 23, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (60, N'Create Database', CAST(N'2022-12-26T11:50:41.750' AS DateTime), NULL, NULL, 1, NULL, 9, 24, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (61, N'Create DAO, Model', CAST(N'2022-12-26T11:50:49.607' AS DateTime), NULL, NULL, 2, NULL, 9, 24, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (62, N'Create Project', CAST(N'2022-12-26T11:50:56.897' AS DateTime), NULL, NULL, 3, NULL, 9, 24, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (63, N'Create new responsitory', CAST(N'2022-12-26T11:51:12.067' AS DateTime), NULL, NULL, 3, NULL, 9, 23, 1, 1)
INSERT [dbo].[Task] ([taskID], [taskName], [createDate], [plannedStartDate], [plannedEndDate], [taskNumber], [discription], [projectID], [sectionID], [priorityID], [statusID]) VALUES (64, N'Draw number', CAST(N'2022-12-26T13:17:37.157' AS DateTime), NULL, NULL, 1, NULL, 10, 25, 1, 1)
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[Task_File] ON 

INSERT [dbo].[Task_File] ([fileID], [taskID], [projectID], [username], [createDate], [name], [status], [code]) VALUES (23, 41, 9, N'user222', CAST(N'2022-12-26T13:27:01.427' AS DateTime), N'Bao_Cao_Nhom_4.docx', 0, N'1eHSNIrnQGfj-eDhe94Nkpd77WxRXDcZb')
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

INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (65, 40, N'Paypal', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (66, 41, N'Create button', 1)
INSERT [dbo].[Task_Sub] ([subID], [taskID], [discription], [status]) VALUES (67, 41, N'BN', 0)
SET IDENTITY_INSERT [dbo].[Task_Sub] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (19, N'Rocket')
INSERT [dbo].[Team] ([teamID], [teamName]) VALUES (20, N'BAN')
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[Team_Members] ON 

INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (19, N'user111', 36, 1)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (19, N'user222', 37, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (19, N'user333', 38, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (19, N'user444', 39, 2)
INSERT [dbo].[Team_Members] ([teamID], [username], [memberID], [roleID]) VALUES (20, N'user111', 40, 1)
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
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Account]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Project] FOREIGN KEY([projectID])
REFERENCES [dbo].[Project] ([projectID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Project]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Schedule_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Schedule_Category] ([cateID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Schedule_Category]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Task] FOREIGN KEY([taskID])
REFERENCES [dbo].[Task] ([taskID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Task]
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
/****** Object:  StoredProcedure [dbo].[PMF_Report1_Admin]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PMF_Report1_Admin]
As
begin
SELECT count(pr.projectID)as N'Tổng dự án', tm.username, ac.fullname, ac.image FROM Project pr inner join Team t on pr.teamID = t.teamID inner join Team_Members tm on t.teamID = tm.teamID 
inner join Account ac on tm.username = ac.username  group by  tm.username ,ac.fullname, ac.image ORDER BY count(pr.projectID) DESC
end
GO
/****** Object:  StoredProcedure [dbo].[PMF_Top1_User]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PMF_Top1_User]
As
begin
SELECT TOP 1 count(pr.projectID)as N'Tổng dự án', tm.username, ac.fullname FROM Project pr inner join Team t on pr.teamID = t.teamID inner join Team_Members tm on t.teamID = tm.teamID 
inner join Account ac on tm.username = ac.username  group by  tm.username ,ac.fullname ORDER BY count(pr.projectID) DESC
end
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllActivitiesRelevantToInvitationInfor]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proceduce_GetAllActivitiesRelevantToInvitationInfor](@projectID int,@username varchar(50),@email varchar(50))
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
		(Activity.categoryID = 6 or Activity.categoryID = 7 or Activity.categoryID = 8 or Activity.categoryID =21)
		and Activity.projectID = @projectID and (Activity.username = @username or Activity.username = @MyVariable)

		

end
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllActivitiesRelevantToProjectAndAccount]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proceduce_GetAllActivitiesRelevantToProjectAndAccount](@projectID int, @username varchar(50))
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
		and (Activity.categoryID = 1 or
		Activity.categoryID = 2 or
		Activity.categoryID = 3 or 
		Activity.categoryID = 4 or 
		Activity.categoryID = 5 or 
		Activity.categoryID = 7 or 
		Activity.categoryID = 10 or 
		Activity.categoryID = 13 or
		Activity.categoryID = 21 or 
		Activity.categoryID = 22 or 
		Activity.categoryID = 23 or 
		Activity.categoryID = 24 or 
		Activity.categoryID = 25 or 
		Activity.categoryID = 26 or 
		Activity.categoryID = 27 or 
		Activity.categoryID = 28 or
		Activity.categoryID = 29 or 
		Activity.categoryID = 30 or 
		Activity.categoryID = 31 or 
		Activity.categoryID = 97)
end
GO
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllActivitiesRelevantToTaskAndProject]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllProjectsRelevantToAccount]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  StoredProcedure [dbo].[proceduce_GetAllProjectsRelevantToAccountPrivate]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proceduce_GetAllProjectsRelevantToAccountPrivate](@username varchar(50),@email varchar(50))
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
		Activity.categoryID not in (8) and Activity.categoryID not in (21) and
		(Activity.username = @username or Activity.username = @MyVariable or Assigned.username = @username)
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_DataLastWeb]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_FindAccountDataForAdmin]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_FindAccountDataForAdmin]
	(@DieuKien nvarchar(100)) 
As
begin
	if(@DieuKien Like '%banned%')
		begin
			SELECT * FROM Account acc
			WHERE acc.status = 3
		end
	if(@DieuKien Like '%trial%')
		begin
			SELECT * FROM Account acc
			WHERE  acc.status = 1
		end
	if(@DieuKien Like '%premium%')
		begin
			SELECT * FROM Account acc
			WHERE acc.status = 2
		end
	else
		begin
			SELECT * FROM Account acc
			WHERE (acc.username LIKE '%'+@DieuKien+'%'
			OR acc.fullname LIKE '%'+@DieuKien+'%'
			OR acc.email LIKE '%'+@DieuKien+'%'
			OR acc.phone LIKE '%'+@DieuKien+'%') 
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindAccountPaid]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- TIm kiem nguoi dung da thanh toan o trang admin
create proc [dbo].[sp_FindAccountPaid]
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * from Activity act 
	WHERE (act.username LIKE '%'+@DieuKien+'%' 
	OR act.activityName LIKE '%'+@DieuKien+'%'
	OR act.startDate LIKE '%'+@DieuKien+'%')
	AND act.categoryID  = 99  
	order by act.startDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindActivityData]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindActivityData]
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * from Activity act 
	inner join Activity_Category acate on acate.categoryID = act.categoryID
	where (act.username LIKE '%'+@DieuKien+'%' 
	OR act.discription LIKE '%'+@DieuKien+'%'
	OR acate.categoryName LIKE '%'+@DieuKien+'%'
	OR act.activityID LIKE '%'+@DieuKien+'%'
	OR act.discription LIKE '%'+@DieuKien+'%'
	OR act.activityName LIKE '%'+@DieuKien+'%'
	OR act.startDate LIKE '%'+@DieuKien+'%')
	and(act.categoryID  = 1 
	or act.categoryID  = 98 
	or act.categoryID  = 99
    or act.categoryID = 97)
	order by act.startDate desc

	SELECT * from Activity act 
	WHERE (act.username LIKE '%'+@DieuKien+'%' 
	OR act.activityName LIKE '%'+@DieuKien+'%'
	OR act.startDate LIKE '%'+@DieuKien+'%')
	AND act.categoryID  = 99  
	order by act.startDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindAssigneeFromAssigned]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindAssigneeFromAssigned]
	(@projectID int, @username nvarchar(50) )
As
begin
	select * from Activity 
	where (categoryID = 9 or categoryID = 10 or categoryID = 11 or categoryID = 12 or categoryID = 13 or categoryID = 14)
	and projectID = @projectID and username = @username
	order by activityID desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataAccount]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_FindDataAccount]
	(@DieuKien nvarchar(100),@Username varchar(100)) 
As
begin
	SELECT distinct ac.username FROM Account ac INNER JOIN Team_Members TM ON ac.username = TM.username 
	WHERE (EMAIL LIKE '%'+@DieuKien+'%' or FULLNAME LIKE '%'+@DieuKien+'%' 
	or phONe LIKE '%'+@DieuKien+'%') AND TM.username LIKE @Username
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataProject]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_FindDataTask]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Find data by name task in table Task
CREATE proc [dbo].[sp_FindDataTask]
	(@DieuKien nvarchar(100),@Username varchar(100)) 
As
begin
	SELECT *  FROM TASK t 
	INNER JOIN Project pro ON t.projectID=pro.projectID 
	INNER JOIN Team te ON te.teamID = pro.teamID 
	INNER JOIN Team_Members TM ON TM.teamID = te.teamID
	WHERE (TASKNAME LIKE '%'+@DieuKien+'%' 
	OR discriptiON LIKE '%'+@DieuKien+'%') AND TM.username LIKE @Username 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindDataTaskSub]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_FindDataTeam]    Script Date: 2/7/2023 8:55:43 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_findDateSchedule]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_findDateSchedule]
@DIEUKIEN nvarchar(100)
as
begin
select * from schedule where username like @DIEUKIEN
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindMemberData]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindMemberData]
	(@DieuKien nvarchar(100), @pid int) 
As
begin
	SELECT * FROM Team_Members tm
	INNER JOIN Team t ON t.teamID = tm.teamID
	INNER JOIN Project pr ON pr.teamID = t.teamID
	Inner join Account acc on acc.username = tm.username
	WHERE (acc.username LIKE '%'+@DieuKien+'%' 
	OR acc.fullname LIKE '%'+@DieuKien+'%') AND pr.projectID LIKE @pid
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindProjectData]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_FindProjectData]
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * FROM Project pr
	INNER JOIN Project_Status ps ON ps.statusID = pr.statusID
	INNER JOIN Team t ON t.teamID = pr.teamID
	WHERE (pr.projectName LIKE '%'+@DieuKien+'%' 
	OR pr.createDate LIKE '%'+@DieuKien+'%'
	OR t.teamName LIKE '%'+@DieuKien+'%'
	OR ps.statusName LIKE '%'+@DieuKien+'%')
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindSubTaskFromAssigned]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_FindSubTaskFromAssigned]
	(@projectID int, @taskID int) 
As
begin
	select Top 1  * from Activity 
	where (categoryID = 12 or categoryID = 13 or categoryID = 14 or categoryID = 23)
	and projectID = @projectID and objectID = @taskID
	order by activityID desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindTaskFromAssigned]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_FindTaskFromAssigned]
	(@projectID int, @taskID int) 
As
begin
	select Top 1  * from Activity 
	where (categoryID = 9 or categoryID = 10 or categoryID = 11 or categoryID = 22)
	and projectID = @projectID and objectID = @taskID
	order by activityID desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_FindTaskOverdue]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_FindTaskOverdue]
	(@projectID int, @taskID int )
As
begin
	select Top 1 * from Activity 
	where (categoryID = 19)
	and projectID = @projectID and objectID = @taskID
	order by activityID desc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MeetingOfUser]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[sp_MeetingOfUser] 
@Dieukien nvarchar(max)
as
begin 
SELECT USERNAME,title,projectID,startDate FROM Schedule WHERE USERNAME = @Dieukien
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MembersInMeeting]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MembersInMeeting]
@DieuKien1 varchar(50),
@DieuKien2 varchar(50)
as
begin
SELECT * FROM Schedule where projectID =@DieuKien1 and decision = @DieuKien2 and cateID = 2
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MembersInMeetingCondition]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MembersInMeetingCondition]
@DieuKien1 varchar(50)
,@DieuKien2 varchar(max)
as
begin
SELECT * FROM Schedule where projectID =@DieuKien1  and cateID = 2 and link = @DieuKien2
end
GO
/****** Object:  StoredProcedure [dbo].[SP_OwnerProject]    Script Date: 2/7/2023 8:55:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_OwnerProject] 
@DIEUKIEN VARCHAR (200)
AS
BEGIN
SELECT ac.username FROM ACCOUNT AC INNER JOIN Team_Members TM ON AC.USERNAME = TM.USERNAME
 INNER JOIN TEAM T ON TM.TEAMID = T.TEAMID INNER JOIN PROJECT PR ON T.teamID =PR.teamID WHERE TM.ROLEID=1 AND PR.PROJECTID =@DIEUKIEN
END
GO
