package com.sict.entity;

/**
 * UserRole entity. @author MyEclipse Persistence Tools
 */

public class UserRole implements java.io.Serializable {

	// Fields

	private String id;
	private String user_id;
	private String role_id;
	private String state;
	private String custom_menu_ids;
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	private String temp6;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCustom_menu_ids() {
		return custom_menu_ids;
	}

	public void setCustom_menu_ids(String custom_menu_ids) {
		this.custom_menu_ids = custom_menu_ids;
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

	public String getTemp6() {
		return temp6;
	}

	public void setTemp6(String temp6) {
		this.temp6 = temp6;
	}

	public String toString() {
		return "UserRole [id=" + id + ", user_id=" + user_id + ", role_id="
				+ role_id + ", state=" + state + ", custom_menu_ids="
				+ custom_menu_ids + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + ", temp4=" + temp4 + ", temp5=" + temp5
				+ ", temp6=" + temp6 + "]";
	}

}