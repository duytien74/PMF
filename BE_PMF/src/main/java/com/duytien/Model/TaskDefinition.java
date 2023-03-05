package com.duytien.Model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Schedule")
public class TaskDefinition {
	@Id
	@Column(name="jobid")
	private String jobID;
	@Column(name="cronexpress")
	private String cronExpress;
	@Column(name="title")
	private String title;
	@Column(name="link")
	private String link;
	@Column(name="description")
	private String description;
	@ManyToOne @JoinColumn(name="projectID")
    private Project project;
	@ManyToOne @JoinColumn(name="taskID")//null
    private Task task;
	@ManyToOne @JoinColumn(name="username")// 
    private Account account;
	@ManyToOne @JoinColumn(name="cateID")// number 2
    private ScheduleCategory sc;
	@Column(name="status")
	private int status;
	@Column(name="startdate")
	private Date startDate;
	@Column(name="decision")
	private int decision;
	//Team role 1 owner
    
}
