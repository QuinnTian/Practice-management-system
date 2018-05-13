package com.sict.entity;

import java.sql.Timestamp;

public class Groups {//用户分组表    Timestamp
	
	private String id; //ID
	private String group_name; //分组名称
	private String purpose; //分组目的
	private String description; //分组描述
	private Timestamp create_time; //创建时间
	private Timestamp dismiss_time; //解散时间
	private String tea_id; //创建教师ID
	private String practice_id; //任务ID
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public Timestamp getDismiss_time() {
		return dismiss_time;
	}
	public void setDismiss_time(Timestamp dismiss_time) {
		this.dismiss_time = dismiss_time;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public String getPractice_id() {
		return practice_id;
	}
	public void setPractice_id(String practice_id) {
		this.practice_id = practice_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Groups [id=" + id + ", group_name=" + group_name + ", purpose="
				+ purpose + ", description=" + description + ", create_time="
				+ create_time + ", dismiss_time=" + dismiss_time + ", tea_id="
				+ tea_id + ", practice_id=" + practice_id + "]";
	}
	
	
	
	
	

}
