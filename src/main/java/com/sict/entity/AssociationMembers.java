package com.sict.entity;

import java.sql.Timestamp;

/**
 * 实体类 ----对应数据库 sj_association
 * */
public class AssociationMembers {
	private String id;
	private String sam_association_id;
	private Timestamp begin_time;
	private Timestamp end_time;
	private String sam_stu_id;// 学生id
	private String sam_duty;// 职责
	private String state;// 状态 1 有效
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSam_association_id() {
		return sam_association_id;
	}

	public void setSam_association_id(String sam_association_id) {
		this.sam_association_id = sam_association_id;
	}

	public String getSam_stu_id() {
		return sam_stu_id;
	}

	public void setSam_stu_id(String sam_stu_id) {
		this.sam_stu_id = sam_stu_id;
	}

	public String getSam_duty() {
		return sam_duty;
	}

	public void setSam_duty(String sam_duty) {
		this.sam_duty = sam_duty;
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

}
