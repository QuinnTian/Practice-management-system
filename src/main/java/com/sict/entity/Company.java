package com.sict.entity;

import java.sql.Timestamp;

/**
 * SjCompany entity. @author MyEclipse Persistence Tools
 */

public class Company implements java.io.Serializable {

	// Fields

	private String id;
	private Timestamp create_time;//企业在表中创建时间
	private String com_name;//企业名称
	private String com_code;//企业code
	private String short_name;//企业短名
	private String contacts;//联系人
	private String phone;//联系电话
	private String address;//公司地址
	private String email;//公司email
	private String check_state;//审核状态
	private String check_note;//审核备注
	private String check_man;//审核人
	private String state;//状态是否有效
	private String industry;//企业所属的行业	
	private String applicable_scope;//企业适用的学院id
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_code() {
		return com_code;
	}
	public void setCom_code(String com_code) {
		this.com_code = com_code;
	}
	public String getShort_name() {
		return short_name;
	}
	public void setShort_name(String short_name) {
		this.short_name = short_name;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getCheck_man() {
		return check_man;
	}
	public void setCheck_man(String check_man) {
		this.check_man = check_man;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getApplicable_scope() {
		return applicable_scope;
	}
	public void setApplicable_scope(String applicable_scope) {
		this.applicable_scope = applicable_scope;
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
		return "Company [id=" + id + ", create_time=" + create_time
				+ ", com_name=" + com_name + ", com_code=" + com_code
				+ ", short_name=" + short_name + ", contacts=" + contacts
				+ ", phone=" + phone + ", address=" + address + ", email="
				+ email + ", check_state=" + check_state + ", check_note="
				+ check_note + ", check_man=" + check_man + ", state=" + state
				+ ", industry=" + industry + ", applicable_scope="
				+ applicable_scope + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + "]";
	}

	

}