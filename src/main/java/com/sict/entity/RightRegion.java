package com.sict.entity;

import java.sql.Timestamp;

/**
 * RightRegion entity. @author MyEclipse Persistence Tools
 */

public class RightRegion implements java.io.Serializable {//合理区域表

	// Fields

	private String id; //id
	private String stu_id;//学生id
	private Timestamp begin_time;//开始时间
	private Timestamp end_time; //结束时间
	private String region_id; //区域id
	private double latitude_r;//经度
	private double longitude_r;//纬度
	private double precs_r;//精度
	private String is_right;//是否合理
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
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
	public String getRegion_id() {
		return region_id;
	}
	public void setRegion_id(String region_id) {
		this.region_id = region_id;
	}
	public double getLatitude_r() {
		return latitude_r;
	}
	public void setLatitude_r(double latitude_r) {
		this.latitude_r = latitude_r;
	}
	public double getLongitude_r() {
		return longitude_r;
	}
	public void setLongitude_r(double longitude_r) {
		this.longitude_r = longitude_r;
	}
	public double getPrecs_r() {
		return precs_r;
	}
	public void setPrecs_r(double precs_r) {
		this.precs_r = precs_r;
	}
	
	public String getIs_right() {
		return is_right;
	}
	public void setIs_right(String is_right) {
		this.is_right = is_right;
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
	@Override
	public String toString() {
		return "RightRegion [id=" + id + ", stu_id=" + stu_id + ", begin_time="
				+ begin_time + ", end_time=" + end_time + ", region_id="
				+ region_id + ", latitude_r=" + latitude_r + ", longitude_r="
				+ longitude_r + ", precs_r=" + precs_r + ", is_right="
				+ is_right + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + ", getId()=" + getId()
				+ ", getStu_id()=" + getStu_id() + ", getBegin_time()="
				+ getBegin_time() + ", getEnd_time()=" + getEnd_time()
				+ ", getRegion_id()=" + getRegion_id() + ", getLatitude_r()="
				+ getLatitude_r() + ", getLongitude_r()=" + getLongitude_r()
				+ ", getPrecs_r()=" + getPrecs_r() + ", getIs_right()="
				+ getIs_right() + ", getTemp1()=" + getTemp1()
				+ ", getTemp2()=" + getTemp2() + ", getTemp3()=" + getTemp3()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
	
}