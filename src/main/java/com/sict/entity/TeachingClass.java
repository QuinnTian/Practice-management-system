package com.sict.entity;

import java.sql.Timestamp;
import java.util.List;

public class TeachingClass {

	private String id;//id
	private String tc_name;//教学班名称
	private String year;//学年
	private String semester;//学期
	private String courses_id;//课程id
	private String courses_type;//开课类型
	private Double credit;//学分
	private Integer hours;//学时
	private String create_people;//创建人
	private Timestamp create_time;//创建时间
    private String state;//状态
    private String week_desc;//周数描述
	    
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	
	private String tea_id;//临时存放sj_teaching_task表中的tea_id
	private Timestamp begin_time;//开始时间
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTc_name() {
		return tc_name;
	}
	public void setTc_name(String tc_name) {
		this.tc_name = tc_name;
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
	public String getCourses_id() {
		return courses_id;
	}
	public void setCourses_id(String courses_id) {
		this.courses_id = courses_id;
	}
	public String getCourses_type() {
		return courses_type;
	}
	public void setCourses_type(String courses_type) {
		this.courses_type = courses_type;
	}
	public Double getCredit() {
		return credit;
	}
	public void setCredit(Double credit) {
		this.credit = credit;
	}
	public Integer getHours() {
		return hours;
	}
	public void setHours(Integer hours) {
		this.hours = hours;
	}
	public String getCreate_people() {
		return create_people;
	}
	public void setCreate_people(String create_people) {
		this.create_people = create_people;
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
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public String getWeek_desc() {
		return week_desc;
	}
	public void setWeek_desc(String week_desc) {
		this.week_desc = week_desc;
	}
	public Timestamp getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(Timestamp begin_time) {
		this.begin_time = begin_time;
	}
	
	
	
	
	
	
}
