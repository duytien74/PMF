create database PMF_GD2
go
use PMF_GD2
go

drop database PMF

create table Account(
	username varchar(50) not null,
	pass varchar(50) not null,
	fullname nvarchar(250) not null,
	createDate datetime DEFAULT(getDate()),
	email varchar(50) not null,
	phone varchar(20) not null,
	address nvarchar(50) not null ,
	image varchar(250) not null,
	status int not null,
	roleID int not null,
	primary key(username)
)

create table Account_Role(
	roleID int not null,
	roleName nvarchar(250) not null,
	primary key(roleID)
)

create table Team(
	teamID int identity(1,1) not null,
	teamName nvarchar(250) not null,
	primary key(teamID)
)

create table Team_Role(
	roleID int not null,
	roleName nvarchar(250),
	primary key (roleID)
)

create table Team_Members(
	teamID int not null,
	username varchar(50) not null,
	memberID int identity(1,1) not null,
	roleID int not null,
	primary key(teamID, username)
)
create table Project(
	projectID int identity(1,1) not null,
	projectName nvarchar(250) not null,
	createDate datetime  null,
	endDate datetime  null,
	statusID int not null,
	securityID int not null,
	teamID int not null,
	primary key(projectID)
)

create table Project_Status(
	statusID int not null,
	statusName nvarchar(250) not null,
	primary key(statusID)
	
)

create table Project_Security(
	securityID int not null,
	securityName nvarchar(250) not null,
	primary key(securityID)
)

create table Section(
	sectionID int identity(1,1) not null,
	sectionName nvarchar(250) not null,
	sectionNumber int not null,
	projectID int not null,
	primary key(sectionID)

)

create table Task(
	taskID int identity(1,1) not null,
	taskName nvarchar(250) not null,
	createDate datetime not null,
	plannedStartDate datetime null,
	plannedEndDate datetime null,
	taskNumber int not null,
	discription ntext null,
	projectID int not null,
	sectionID int not null,
	priorityID int not null,
	statusID int not null,
	primary key(taskID)
)

create table Task_Status(
	statusID int not null,
	statusName nvarchar(250) not null,
	primary key (statusID)
)

 create table Task_Priority(
	priorityID int not null,
	priorityName nvarchar(250) not null,
	primary key(priorityID)
 )

 create table Task_Sub(
	subID int identity(1,1) not null,
	taskID int not null,
	discription ntext null,
	status bit not null,
	primary key(subID)
 )

 create table Activity(
	activityID int identity(1,1) not null,
	objectID int null,
	activityName nvarchar(250) not null,
	startDate datetime not null,
	username varchar(50) null,
	discription ntext null,
	projectID int null,
	categoryID int not null,
	primary key(activityID)
 )

 create table Activity_Category(
	categoryID int not null,
	categoryName nvarchar(250) not null,
	primary key (categoryID)
 )

 create table Assigned(
	id int identity(1,1) not null,
	startDate datetime not null,
	username varchar(50) not null,
	activityID int not null,
	primary key(activityID, username)
 )
 create table Web_Security(
	id int identity(1,1) not null,
	name nvarchar(250) not null,
	content ntext,
	note ntext,
	statusWeb bit,
	versionWeb float,	
	startDate datetime,
	endDate datetime,	
	primary key (id)
 )

 create table Schedule(
	jobID varchar(250) not null,
	cronExpress varchar(50) not null,
	title nvarchar(250) null,
	link varchar(max) null,
	description ntext not null,
	projectID int null,
	taskID int null,
	username varchar(50) not null,
	cateID int not null,
	status int not null,
	primary key (jobID)
)



 create table Schedule_Category(
	cateID int not null,
	cateName nvarchar(250) not null,
	primary key(cateID)
 )


 insert into Schedule_Category values
 (1,'Task'),
 (2,'Meeting')

  -- ---------Ràng buộc---------
 
 alter table Schedule
 add constraint FK_Schedule_Project
 foreign key (projectID) references Project(projectID)

 alter table Schedule
 add constraint FK_Schedule_Task
 foreign key (taskID) references Task(taskID)

 alter table Schedule
 add constraint FK_Schedule_Account
 foreign key (username) references Account(username)

 alter table Schedule
 add constraint FK_Schedule_Schedule_Category
 foreign key (cateID) references Schedule_Category(cateID)
 

 -- ---------Ràng buộc---------
 -- Account -> Account Role
 alter table Account
 add constraint FK_Account_Account_Role
 foreign key (roleID) references Account_Role(roleID)
 -- Team_Members -> Account
 alter table Team_Members
 add constraint FK_Team_Members_Account
 foreign key (username) references Account(username)
 -- Team_Members -> Team_Role
 alter table Team_Members
 add constraint FK_Team_Members_Team_Role
 foreign key (roleID) references Team_Role(roleID)
 -- Team_Members -> Team
 alter table Team_Members
 add constraint FK_Team_Members_Team
 foreign key (teamID) references Team(teamID)
 -- Project -> Team
 alter table Project
 add constraint FK_Project_Team
 foreign key (teamID) references Team(teamID)
 -- Project -> Project_Status
 alter table Project
 add constraint FK_Project_Project_Status
 foreign key (statusID) references Project_Status(statusID)
 -- Project -> Project_Security
 alter table Project
 add constraint FK_Project_Project_Security
 foreign key (securityID) references Project_Security(securityID)
  -- Section -> Project
 alter table Section
 add constraint FK_Section_Project
 foreign key (projectID) references Project(projectID)
 -- Task -> Section
 alter table Task
 add constraint FK_Task_Section
 foreign key (sectionID) references Section(sectionID)
 -- Task -> Task_Status
 alter table Task
 add constraint FK_Task_Task_Status
 foreign key (statusID) references Task_Status(statusID)
 -- Task -> Task_Priority
 alter table Task
 add constraint FK_Task_Task_Priority
 foreign key (priorityID) references Task_Priority(priorityID)
 -- Task_Sub -> Task
 alter table Task_Sub
 add constraint FK_Task_Sub_Task
 foreign key (taskID) references Task(taskID)
 -- Activity -> Activity_Category
 alter table Activity
 add constraint FK_Activity_Activity_Category
 foreign key (categoryID) references Activity_Category(categoryID)
 -- Assigned -> Activity
 alter table Assigned
 add constraint FK_Assigned_Activity
 foreign key (activityID) references Activity(activityID)
 -- Dữ liệu mẫu
 -- Account_Role
 insert into Account_Role(roleID, roleName)
 values (1, 'Admin'),
		(2, 'User')
 -- Account
 insert into Account(username, pass, fullname, email, phone, address, image, status, roleID)
 values ('admin123', '123456', N'Nguyễn Văn Admin', 'admin123@gmail.com','0123456789','Ho Chi Minh city','admin.png',1 , 1),
		('user123', '123456', N'Nguyễn Thị User', 'user123@gmail.com','0123456789','Ho Chi Minh city','user.png',1 , 2)
-- Team_Role
insert into Team_Role(roleID, roleName)
values (1, 'Product Owner'),
	   (2, 'EditableGuest'),
	   (3, 'ReadOnlyGuest')
-- Team
insert into Team(teamName)
values ('Bruh123'),
	   ('BonAnhDangDiLen')
-- Team_Members
insert into Team_Members(teamID, username, roleID)
values (1, 'admin123',1),
	   (1, 'user123',2)
-- Project_Security
insert into Project_Security(securityID, securityName)
values (1, 'Public'),
	   (2, 'Private')
-- Project_Status
insert into Project_Status(statusID, statusName)
values (1, 'Active'),
	   (2, 'Unactive')
-- Project
insert into Project(projectName, createDate, endDate, statusID, securityID, teamID)
values (N'Đây là động đất ư, không phải','','',1,1,1),
       (N'Đây là bọn anh đang đi lên','','',2,2,2)
-- Section
insert into Section(sectionName, sectionNumber, projectID)
values (N'Đi lên', 1, 1),
       (N'Đi xuống', 1, 2)
-- Task_Status
insert into Task_Status(statusID, statusName)
values (1, 'Done'),
	   (2, 'Undone')
-- Task_Priority
select * from task
insert into Task_Priority(priorityID, priorityName)
values (1, 'High'),
	   (2, 'Medium'),
	   (3, 'Low')
-- Task
insert into Task(taskName, createDate, plannedStartDate, plannedEndDate, taskNumber, discription, projectID, sectionID, priorityID, statusID)
values ('Phải đi lên', '', '', '', 2, N'Bạn phải đi lên, không thì tét đít', 1, 1, 1, 1),
	   ('Phải đi lên', '', '', '', 2, N'Bạn phải đi lên, không thì tét đít', 2, 2, 2, 2)
-- Task_Sub
insert into Task_Sub(taskID, discription, status)
values (1, N'Task nhỏ đi lên', 0),
	   (2, N'Task nhỏ đi xuống', 0)
-- Activity_Category
insert into Activity_Category(categoryID, categoryName)
values (1, 'ProjectActivity'),
       (2, 'TaskActivity')
-- Activity
insert into Activity(objectID, activityName, startDate, username, discription, projectID, categoryID)
values (1, N'Đã đi lên', '','admin123', N'admin đã đi lên, tuyệt vời',1, 1),
	   (2, N'Đã đi xuống', '','admin123', N'user đã đi xuống, ko tuyệt vời cho lắm',2, 2)
-- Assigned
insert into Assigned(startDate, username, activityID)
values ('','admin123',1),
	   ('','user123',2)
-- Proc của Duy
go
create proc proceduce_GetAllProjectsRelevantToAccount(@username varchar(50))
as
begin
	Select * from project, team, team_members, account
	where
		project.teamID = team.teamID and
		Team_Members.teamID = team.teamID and
		Account.username = Team_Members.username and
		Account.username like @username
end
go
create proc proceduce_GetAllActivitiesRelevantToProjectAndAccount(@projectID int, @username varchar(50))
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
go
-- Proc của Nhã
--Find data by email or name in Table Account
create proc sp_FindDataAccount
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * FROM Account WHERE EMAIL LIKE '%'+@DieuKien+'%' or FULLNAME LIKE '%'+@DieuKien+'%'
	or phone LIKE '%'+@DieuKien+'%'
end
GO
--Find data by name task in table Task
create proc sp_FindDataTask
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * FROM TASK WHERE TASKNAME LIKE '%'+@DieuKien+'%' OR discription LIKE '%'+@DieuKien+'%'
end
GO
--Find data by name project in table Project
create proc sp_FindDataProject
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * FROM PROJECT WHERE PROJECTNAME LIKE '%'+@DieuKien+'%'
end
exec sp_FindDataProject 'Đây là động đất ư, không phải' select * from project
GO
--Find data by name team in table Team
create proc sp_FindDataTeam
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * FROM TEAM WHERE TEAMNAME LIKE '%'+@DieuKien+'%'
end
GO
--Find data by disciption in table Task_Sub
create proc sp_FindDataTaskSub
	(@DieuKien nvarchar(100)) 
As
begin
	SELECT * FROM Task_Sub WHERE discription LIKE '%'+@DieuKien+'%'
end
GO
--Search the end of sql
create proc sp_DataLastWeb 
As
begin
	SELECT TOP 1 * FROM Web_Security ORDER BY ID DESC
end
select * from account
/* KHÔNG ĐƯỢC ĐỤNG - HÀM CHECK IP ADDRESS ĐỂ DEPLOY
DECLARE @IPAdress NVARCHAR(50)=''
SELECT @IPAdress = CASE WHEN dec.client_net_address = '<local machine>'
    THEN (SELECT TOP(1) c.local_net_address FROM
        sys.dm_exec_connections AS c WHERE c.local_net_address IS NOT NULL)
    ELSE dec.client_net_address
    END FROM sys.dm_exec_connections AS dec WHERE dec.session_id = @@SPID;
SELECT @IPAdress
*/
