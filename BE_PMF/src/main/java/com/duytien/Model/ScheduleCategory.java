package com.duytien.Model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Schedule_Category")
public class ScheduleCategory {
	@Id
	@Column(name="cateid")
	private int cateID;
	@Column(name="catename")
	private String cateName;
	@OneToMany(mappedBy="sc") @JsonIgnore
    private List<TaskDefinition> td;
}
