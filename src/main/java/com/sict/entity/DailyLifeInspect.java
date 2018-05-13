package com.sict.entity;

import java.sql.Timestamp;

public class DailyLifeInspect {  //名称和文档不符合,最后统一改
	private String id;// ID
	private String inspect_type;// 检查类型
	private String sdi_college_id;// 学院id
	private String sdi_index_id;// 指标id
	private String stu_union_section;// 学生会部委
	private String sdi_year;// 年度
	private String sdi_semester;// 学期
	private String sdi_weeks_num;// 周数
	private String sdi_week;// 星期
	private String inspect_people;// 检查人id
	private Timestamp inspect_time;// 检查时间
	private String input_people;// 录入人
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	
	private String class_contact;
	private int  should_num;
	private int  actually_num;
	private int  asked_leave_num;
	private double  sum_grade;
	private int  occur_num;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInspect_type() {
		return inspect_type;
	}
	public void setInspect_type(String inspect_type) {
		this.inspect_type = inspect_type;
	}
	public String getSdi_college_id() {
		return sdi_college_id;
	}
	public void setSdi_college_id(String sdi_college_id) {
		this.sdi_college_id = sdi_college_id;
	}
	public String getSdi_index_id() {
		return sdi_index_id;
	}
	public void setSdi_index_id(String sdi_index_id) {
		this.sdi_index_id = sdi_index_id;
	}
	public String getStu_union_section() {
		return stu_union_section;
	}
	public void setStu_union_section(String stu_union_section) {
		this.stu_union_section = stu_union_section;
	}
	public String getSdi_year() {
		return sdi_year;
	}
	public void setSdi_year(String sdi_year) {
		this.sdi_year = sdi_year;
	}
	public String getSdi_semester() {
		return sdi_semester;
	}
	public void setSdi_semester(String sdi_semester) {
		this.sdi_semester = sdi_semester;
	}
	public String getSdi_weeks_num() {
		return sdi_weeks_num;
	}
	public void setSdi_weeks_num(String sdi_weeks_num) {
		this.sdi_weeks_num = sdi_weeks_num;
	}
	public String getSdi_week() {
		return sdi_week;
	}
	public void setSdi_week(String sdi_week) {
		this.sdi_week = sdi_week;
	}
	public String getInspect_people() {
		return inspect_people;
	}
	public void setInspect_people(String inspect_people) {
		this.inspect_people = inspect_people;
	}
	public Timestamp getInspect_time() {
		return inspect_time;
	}
	public void setInspect_time(Timestamp inspect_time) {
		this.inspect_time = inspect_time;
	}
	public String getInput_people() {
		return input_people;
	}
	public void setInput_people(String input_people) {
		this.input_people = input_people;
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
	public String getClass_contact() {
		return class_contact;
	}
	public void setClass_contact(String class_contact) {
		this.class_contact = class_contact;
	}
	public int getShould_num() {
		return should_num;
	}
	public void setShould_num(int should_num) {
		this.should_num = should_num;
	}
	public int getActually_num() {
		return actually_num;
	}
	public void setActually_num(int actually_num) {
		this.actually_num = actually_num;
	}
	public int getAsked_leave_num() {
		return asked_leave_num;
	}
	public void setAsked_leave_num(int asked_leave_num) {
		this.asked_leave_num = asked_leave_num;
	}
	public double getSum_grade() {
		return sum_grade;
	}
	public void setSum_grade(double sum_grade) {
		this.sum_grade = sum_grade;
	}
	public int getOccur_num() {
		return occur_num;
	}
	public void setOccur_num(int occur_num) {
		this.occur_num = occur_num;
	}
}
