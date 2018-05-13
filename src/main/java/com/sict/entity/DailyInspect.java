package com.sict.entity;

import java.sql.Timestamp;

public class DailyInspect {

	private String id;				//id
	private String inspect_type;	//检查类型
	private String sdi_college_id;  //学院id
	private String department_id;   //系id
	private String sdi_class_id;    //班级id
	private String sdi_index_id;    //评分标准id
	private String stu_union_section;//学生会部委
	private String inspect_person;  //检查人id
	private String class_contact;   //班委负责人
	private Timestamp inspect_time;  //检查时间
	private String input_person;    //录入人
	private double sum_grade;		//总分
	private String sdi_year;			//年度
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
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public String getSdi_class_id() {
		return sdi_class_id;
	}
	public void setSdi_class_id(String sdi_class_id) {
		this.sdi_class_id = sdi_class_id;
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
	public String getInspect_person() {
		return inspect_person;
	}
	public void setInspect_person(String inspect_person) {
		this.inspect_person = inspect_person;
	}
	public String getClass_contact() {
		return class_contact;
	}
	public void setClass_contact(String class_contact) {
		this.class_contact = class_contact;
	}
	public Timestamp getInspect_time() {
		return inspect_time;
	}
	public void setInspect_time(Timestamp inspect_time) {
		this.inspect_time = inspect_time;
	}
	public String getInput_person() {
		return input_person;
	}
	public void setInput_person(String input_person) {
		this.input_person = input_person;
	}
	public double getSum_grade() {
		return sum_grade;
	}
	public void setSum_grade(double sum_grade) {
		this.sum_grade = sum_grade;
	}
	public String getSdi_year() {
		return sdi_year;
	}
	public void setSdi_year(String sdi_year) {
		this.sdi_year = sdi_year;
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
	

