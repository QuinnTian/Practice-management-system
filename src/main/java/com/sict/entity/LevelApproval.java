package com.sict.entity;

import java.sql.Timestamp;

public class LevelApproval {
	private String id;
	private String level_application_id;// 这个地方名称错了。等测试完功能同意改
										// leave_application_id
	private String approval_tea;
	private Timestamp approval_time;
	private String approval_state;
	private String approval_opinion;
	private String last_approval_id;
	private String is_approval_pass;

	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	// 增加一对一引用关系
	private Application application;

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLevel_application_id() {
		return level_application_id;
	}

	public void setLevel_application_id(String level_application_id) {
		this.level_application_id = level_application_id;
	}

	public String getApproval_tea() {
		return approval_tea;
	}

	public void setApproval_tea(String approval_tea) {
		this.approval_tea = approval_tea;
	}

	public Timestamp getApproval_time() {
		return approval_time;
	}

	public void setApproval_time(Timestamp approval_time) {
		this.approval_time = approval_time;
	}

	public String getApproval_state() {
		return approval_state;
	}

	public void setApproval_state(String approval_state) {
		this.approval_state = approval_state;
	}

	public String getApproval_opinion() {
		return approval_opinion;
	}

	public void setApproval_opinion(String approval_opinion) {
		this.approval_opinion = approval_opinion;
	}

	public String getLast_approval_id() {
		return last_approval_id;
	}

	public void setLast_approval_id(String last_approval_id) {
		this.last_approval_id = last_approval_id;
	}

	public String getIs_approval_pass() {
		return is_approval_pass;
	}

	public void setIs_approval_pass(String is_approval_pass) {
		this.is_approval_pass = is_approval_pass;
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

	public String getTemp4() {
		return temp4;
	}

	public void setTemp4(String temp4) {
		this.temp4 = temp4;
	}

	public String getTemp5() {
		return temp5;
	}

	public void setTemp5(String temp5) {
		this.temp5 = temp5;
	}

	@Override
	public String toString() {
		return "LevelApproval [id=" + id + ", level_application_id=" + level_application_id + ", approval_tea="
				+ approval_tea + ", approval_time=" + approval_time + ", approval_state=" + approval_state
				+ ", approval_opinion=" + approval_opinion + ", last_approval_id=" + last_approval_id
				+ ", is_approval_pass=" + is_approval_pass + ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3="
				+ temp3 + ", temp4=" + temp4 + ", temp5=" + temp5 + ", application=" + application + "]";
	}

}