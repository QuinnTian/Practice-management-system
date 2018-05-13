package com.sict.entity;

import java.sql.Timestamp;

public class TeachingTask {

	private String id;//id
	private String teaching_class_id;//教学班id
	private String tea_id;//教师id
	private Timestamp begin_time;//开始时间
	private Timestamp end_time;//结束时间
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
	public String getTeaching_class_id() {
		return teaching_class_id;
	}
	public void setTeaching_class_id(String teaching_class_id) {
		this.teaching_class_id = teaching_class_id;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
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
		return "TeachingTask [id=" + id + ", teaching_class_id="
				+ teaching_class_id + ", tea_id=" + tea_id + ", begin_time="
				+ begin_time + ", end_time=" + end_time + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4=" + temp4
				+ ", temp5=" + temp5 + "]";
	}
	
	
}
