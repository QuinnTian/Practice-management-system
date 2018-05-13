package com.sict.entity;

public class TeachingClassMembers {
	private String id;//id
	private String teaching_class_id;//教学班id
	private String student_id;//成员id
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
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
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
		return "TeachingClassMembers [id=" + id + ", teaching_class_id="
				+ teaching_class_id + ", student_id=" + student_id + ", temp1="
				+ temp1 + ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4="
				+ temp4 + ", temp5=" + temp5 + "]";
	}
	
}
