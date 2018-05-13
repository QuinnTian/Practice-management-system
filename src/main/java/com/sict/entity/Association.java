package com.sict.entity;

import java.sql.Timestamp;

public class Association {
	private String id;
	private String sa_code;
	private String sa_name;
	private String sa_level;
	private String sa_category;
	private String sa_college_id;
	private String sa_tea_id;
	private String sa_stu_id;
	private String sa_describe;
	private String sa_create_user;
	private Timestamp sa_create_time;
	private String sa_parent_id;
	private String sa_last_edit_user;
	private Timestamp sa_last_edit_time;
	private String state;
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;

	//逻辑字段开始
	private String level_name;//级别名称
	private String college_name;//学院名称
	private String tea_name;//负责教师姓名
	//逻辑字段结束
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSa_code() {
		return sa_code;
	}

	public void setSa_code(String sa_code) {
		this.sa_code = sa_code;
	}

	public String getSa_name() {
		return sa_name;
	}

	public void setSa_name(String sa_name) {
		this.sa_name = sa_name;
	}

	public String getSa_level() {
		return sa_level;
	}

	public void setSa_level(String sa_level) {
		this.sa_level = sa_level;
	}

	public String getSa_category() {
		return sa_category;
	}

	public void setSa_category(String sa_category) {
		this.sa_category = sa_category;
	}

	public String getSa_college_id() {
		return sa_college_id;
	}

	public void setSa_college_id(String sa_college_id) {
		this.sa_college_id = sa_college_id;
	}

	public String getSa_tea_id() {
		return sa_tea_id;
	}

	public void setSa_tea_id(String sa_tea_id) {
		this.sa_tea_id = sa_tea_id;
	}

	public String getSa_stu_id() {
		return sa_stu_id;
	}

	public void setSa_stu_id(String sa_stu_id) {
		this.sa_stu_id = sa_stu_id;
	}

	public String getSa_describe() {
		return sa_describe;
	}

	public void setSa_describe(String sa_describe) {
		this.sa_describe = sa_describe;
	}

	public String getSa_create_user() {
		return sa_create_user;
	}

	public void setSa_create_user(String sa_create_user) {
		this.sa_create_user = sa_create_user;
	}

	public String getSa_parent_id() {
		return sa_parent_id;
	}

	public void setSa_parent_id(String sa_parent_id) {
		this.sa_parent_id = sa_parent_id;
	}

	public Timestamp getSa_create_time() {
		return sa_create_time;
	}

	public void setSa_create_time(Timestamp sa_create_time) {
		this.sa_create_time = sa_create_time;
	}

	public Timestamp getSa_last_edit_time() {
		return sa_last_edit_time;
	}

	public void setSa_last_edit_time(Timestamp sa_last_edit_time) {
		this.sa_last_edit_time = sa_last_edit_time;
	}

	public String getSa_last_edit_user() {
		return sa_last_edit_user;
	}

	public void setSa_last_edit_user(String sa_last_edit_user) {
		this.sa_last_edit_user = sa_last_edit_user;
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
