
create proc sp_FindTaskFromAssigned
	(@projectID int, @taskID int) 
As
begin
	select Top 1  * from Activity 
	where (categoryID = 9 or categoryID = 10 or categoryID =11)
	and projectID = @projectID and objectID = @taskID
	order by activityID desc
end
GO

--Find data by name team in table Team
drop proc sp_FindSubTaskFromAssigned

create proc sp_FindSubTaskFromAssigned
	(@projectID int, @taskID int) 
As
begin
	select Top 1  * from Activity 
	where (categoryID = 12 or categoryID = 13 or categoryID = 14)
	and projectID = @projectID and objectID = @taskID
	order by activityID desc
end
GO

--Find data by name team in table Team
drop proc sp_FindAssigneeFromAssigned

create proc sp_FindAssigneeFromAssigned
	(@projectID int, @username nvarchar(50) )
As
begin
	select * from Activity 
	where (categoryID = 9 or categoryID = 10 or categoryID = 11 or categoryID = 12 or categoryID = 13 or categoryID = 14)
	and projectID = @projectID and username = @username
	order by activityID desc
end
GO

exec sp_FindAssigneeFromAssigned 2,'user222'

-- Find task overdue of user in project
create proc [dbo].[sp_FindTaskOverdue]
	(@projectID int, @taskID int )
As
begin
	select Top 1 * from Activity 
	where (categoryID = 19)
	and projectID = 2 and objectID = @taskID
	order by activityID desc
end