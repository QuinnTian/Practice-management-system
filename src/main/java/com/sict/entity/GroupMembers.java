package com.sict.entity;

import java.sql.Timestamp;

/**
 * TeaStu entity. @author MyEclipse Persistence Tools
 */

public class GroupMembers implements java.io.Serializable { //分组成员表

	// Fields

	private String id; //标识
	private String group_id; //分组id
	private Timestamp begin_time; //开始时间
	private Timestamp end_time; //结束时间
	private String user_id; //用户id
	private String duty; //组中职责
	private String state; //状态
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public Timestamp getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(Timestamp begin_time) {
		this.begin_time = begin_time;
	}
	public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
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
	@Override
	public String toString() {
		return "GroupMembers [id=" + id + ", group_id=" + group_id
				+ ", begin_time=" + begin_time + ", end_time=" + end_time
				+ ", user_id=" + user_id + ", duty=" + duty + ", state="
				+ state + ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3="
				+ temp3 + "]";
	}
	
	
	
	
	

}