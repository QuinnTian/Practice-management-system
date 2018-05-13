package com.sict.entity;

import java.sql.Timestamp;

public class Courses {//课程信息表
	
	private String id;//id
	private String course_code;//课程编码
	private String course_name;//课程名称
	private String org_id;//组织id
	private String class_object;//授课对象
	private Integer class_hour;//课时
	private String description;//描述
	private Timestamp create_time;//创建时间
	private String state;//状态
	private String temp1;
	private String temp2;
	private String temp3;
	//逻辑字段开始
	private String org_name;
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	
	//逻辑字段结束
	public Integer getClass_hour() {
		return class_hour;
	}
	public void setClass_hour(Integer class_hour) {
		this.class_hour = class_hour;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourse_code() {
		return course_code;
	}
	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getClass_object() {
		return class_object;
	}
	public void setClass_object(String class_object) {
		this.class_object = class_object;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
