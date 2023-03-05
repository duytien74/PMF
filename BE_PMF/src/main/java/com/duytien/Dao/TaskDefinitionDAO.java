package com.duytien.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.duytien.Model.TaskDefinition;

public interface TaskDefinitionDAO extends JpaRepository<TaskDefinition, String> {
	@Query(value = "exec sp_findDateSchedule ?1", nativeQuery = true)
	public List<TaskDefinition> findDataByUsername(String username);

	@Query("SELECT sc from TaskDefinition sc where sc.status = ?1")
	List<TaskDefinition> getScheduleByStatus(Integer status);

	@Query("SELECT o FROM TaskDefinition o WHERE o.jobID = ?1")
	public TaskDefinition getMeetingById(String jobID);

	@Query(value = "exec sp_MembersInMeeting ?1,?2", nativeQuery = true)
	List<TaskDefinition> getMembersInMeetingCondition(int projectId, int decision);

	@Query(value = "exec sp_MembersInMeetingCondition ?1, ?2", nativeQuery = true)
	List<TaskDefinition> getMembersInMeeting(int projectId, String jobId);

	@Query(value = "SELECT o FROM TaskDefinition o WHERE o.account.username like ?1 AND o.decision =3")
	public List<TaskDefinition> getScheduleByUsername(String username);

	@Query(value = "SELECT o FROM TaskDefinition o WHERE o.account.username like ?1 and o.link like ?2",nativeQuery = false)
	public TaskDefinition getUserInMeeting(String username, String link);
	
	@Transactional
	@Modifying
	@Query("delete TaskDefinition task where task.task.taskID = ?1")
	void deleteAllSheduleByTask(Integer taskID);
}
