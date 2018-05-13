package com.sict.entity;

import java.sql.Date;

/**
 * @author zxy
 * @since 2016-03-17
 * @version 2.0
 * 
 * */
public class TeaCourses {

	private String id;
	private String tea_id;
	private String courses_id;
	private String year;
	private String semester;// 学期
	private String courses_type;// 课程类型 1.校选修 2.院选修 3 必修课
	private String create_people;// 创建人
	private Date create_time;// 创建人
	private String state;// 状态 1 有效 2 无效 默认为1
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTea_id() {
		return tea_id;
	}

	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}

	public String getCourses_id() {
		return courses_id;
	}

	public void setCourses_id(String courses_id) {
		this.courses_id = courses_id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getCourses_type() {
		return courses_type;
	}

	public void setCourses_type(String courses_type) {
		this.courses_type = courses_type;
	}

	public String getCreate_people() {
		return create_people;
	}

	public void setCreate_people(String create_people) {
		this.create_people = create_people;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
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
