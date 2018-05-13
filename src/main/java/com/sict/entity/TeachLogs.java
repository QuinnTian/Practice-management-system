package com.sict.entity;

import java.sql.Timestamp;

public class TeachLogs {
	private String id;
	private String teaching_task_id;//授课任务表id
	private Timestamp teach_time;//教学日期
	private String section_num;//节次
	private String class_room_id;//地点id
	private Integer absence_num; 
	private String teach_content;//教学内容
	private String note;//备注
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
	public String getTeaching_task_id() {
		return teaching_task_id;
	}
	public void setTeaching_task_id(String teaching_task_id) {
		this.teaching_task_id = teaching_task_id;
	}
	public Timestamp getTeach_time() {
		return teach_time;
	}
	public void setTeach_time(Timestamp teach_time) {
		this.teach_time = teach_time;
	}
	public String getSection_num() {
		return section_num;
	}
	public void setSection_num(String section_num) {
		this.section_num = section_num;
	}
	public String getClass_room_id() {
		return class_room_id;
	}
	public void setClass_room_id(String class_room_id) {
		this.class_room_id = class_room_id;
	}
	public String getTeach_content() {
		return teach_content;
	}
	public void setTeach_content(String teach_content) {
		this.teach_content = teach_content;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
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
		return "TeachLogs [id=" + id + ", teaching_task_id=" + teaching_task_id
				+ ", teach_time=" + teach_time + ", section_num=" + section_num
				+ ", class_room_id=" + class_room_id + ", absence_num="
				+ absence_num + ", teach_content=" + teach_content + ", note="
				+ note + ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3="
				+ temp3 + ", temp4=" + temp4 + ", temp5=" + temp5 + "]";
	}
	public Integer getAbsence_num() {
		return absence_num;
	}
	public void setAbsence_num(Integer absence_num) {
		this.absence_num = absence_num;
	}
	
	
}
