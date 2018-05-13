package com.sict.entity;

/**
 * SjPosition entity. @author MyEclipse Persistence Tools
 */

public class Position implements java.io.Serializable {

	// Fields

	private String id;
	private String post_type;
	private String post_code;
	private String post_name;
	private String post_duties;
	private String parent_id;
	private String check_state;
	private String check_note;
	private String state;
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPost_type() {
		return post_type;
	}
	public void setPost_type(String post_type) {
		this.post_type = post_type;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getPost_name() {
		return post_name;
	}
	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}
	public String getPost_duties() {
		return post_duties;
	}
	public void setPost_duties(String post_duties) {
		this.post_duties = post_duties;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getCheck_state() {
		return check_state;
	}
	public void setCheck_state(String check_state) {
		this.check_state = check_state;
	}
	public String getCheck_note() {
		return check_note;
	}
	public void setCheck_note(String check_note) {
		this.check_note = check_note;
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
	@Override
	public String toString() {
		return "Position [id=" + id + ", post_type=" + post_type
				+ ", post_code=" + post_code + ", post_name=" + post_name
				+ ", post_duties=" + post_duties + ", parent_id=" + parent_id
				+ ", check_state=" + check_state + ", check_note=" + check_note
				+ ", state=" + state + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + "]";
	}
	
	
	
	 
	
}