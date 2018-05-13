package com.sict.entity;

public class DailyInspectDetails {
	private String id;			 //id
	private String affect_object;//作用对象
	private String sdid_class_id;//班级ID
	private String sdid_room_id; //宿舍ID
	private String inspect_object_id;//检查对象ID
	private String index_id;     //指标id
	private Double grade;        //得分
	private Integer occur_num;       //发生人次
	private String inspect_id;   //检查id
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
	public String getAffect_object() {
		return affect_object;
	}
	public void setAffect_object(String affect_object) {
		this.affect_object = affect_object;
	}
	public String getSdid_class_id() {
		return sdid_class_id;
	}
	public void setSdid_class_id(String sdid_class_id) {
		this.sdid_class_id = sdid_class_id;
	}
	public String getSdid_room_id() {
		return sdid_room_id;
	}
	public void setSdid_room_id(String sdid_room_id) {
		this.sdid_room_id = sdid_room_id;
	}
	public String getInspect_object_id() {
		return inspect_object_id;
	}
	public void setInspect_object_id(String inspect_object_id) {
		this.inspect_object_id = inspect_object_id;
	}
	public String getIndex_id() {
		return index_id;
	}
	public void setIndex_id(String index_id) {
		this.index_id = index_id;
	}
	
	public Double getGrade() {
		return grade;
	}
	public void setGrade(Double grade) {
		this.grade = grade;
	}
	public Integer getOccur_num() {
		return occur_num;
	}
	public void setOccur_num(Integer occur_num) {
		this.occur_num = occur_num;
	}
	public String getInspect_id() {
		return inspect_id;
	}
	public void setInspect_id(String inspect_id) {
		this.inspect_id = inspect_id;
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
		return "DailyInspectDetails [id=" + id + ", affect_object="
				+ affect_object + ", sdid_class_id=" + sdid_class_id
				+ ", sdid_room_id=" + sdid_room_id + ", inspect_object_id="
				+ inspect_object_id + ", index_id=" + index_id + ", grade="
				+ grade + ", occur_num=" + occur_num + ", inspect_id="
				+ inspect_id + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + ", temp4=" + temp4 + ", temp5=" + temp5
				+ "]";
	}
	
	
}
