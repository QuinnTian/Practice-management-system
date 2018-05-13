package com.sict.entity;

import java.sql.Timestamp;

/**
 * TrainDetail entity. @author MyEclipse Persistence Tools
 */

public class TrainDetail implements java.io.Serializable {

	// Fields

	private String id;
	private String task_id;//实践教学任务实训id
	private String org_id;//组织id
	private String group_id;//小组id
	private String course_id;//课程id
	private String tea_id;//实际上课教师id
	private Timestamp train_time;//实训时间
	private Integer train_term;//实训学期
	private Integer week_num;//周数
	private String class_num;//节次
	private String train_place;//实训地点
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public Timestamp getTrain_time() {
		return train_time;
	}
	public void setTrain_time(Timestamp train_time) {
		this.train_time = train_time;
	}
	public Integer getTrain_term() {
		return train_term;
	}
	public void setTrain_term(Integer train_term) {
		this.train_term = train_term;
	}
	public Integer getWeek_num() {
		return week_num;
	}
	public void setWeek_num(Integer week_num) {
		this.week_num = week_num;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getTrain_place() {
		return train_place;
	}
	public void setTrain_place(String train_place) {
		this.train_place = train_place;
	}
	public String getTemp1() {
		return temp1;
	}
	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}
	public String getTemp2() {
		return temp2;
	}
	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}
	public String getTemp3() {
		return temp3;
	}
	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}


}