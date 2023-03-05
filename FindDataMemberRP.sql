--Find member in modalMemberList
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

-- Tim kiem activity o trang admin
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

-- Tim kiem project o trang admin
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

-- Tim kiem account o trang admin
create proc [dbo].[sp_FindAccountDataForAdmin]
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
			WHERE acc.status = 1
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