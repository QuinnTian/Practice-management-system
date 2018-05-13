package com.sict.entity;

import java.sql.Timestamp;

/**
 * SjSign entity. @author MyEclipse Persistence Tools
 */

public class Sign implements java.io.Serializable {
	// Fields
	private String id;
	private Timestamp sign_time;	
	private String stu_id;
	private String sign_place;
	private double latitude;
	private double longitude;
	private Timestamp login_time;
	
	public Timestamp getLogin_time() {
		return login_time;
	}
	public void setLogin_time(Timestamp login_time) {
		this.login_time = login_time;
	}
	private double precs;
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getSign_time() {
		return sign_time;
	}
	public void setSign_time(Timestamp sign_time) {
		this.sign_time = sign_time;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	
	public String getSign_place() {
		return sign_place;
	}
	public void setSign_place(String sign_place) {
		this.sign_place = sign_place;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public double getPrecs() {
		return precs;
	}
	public void setPrecs(double precs) {
		this.precs = precs;
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

}