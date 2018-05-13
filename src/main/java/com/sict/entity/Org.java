package com.sict.entity;

import java.sql.Timestamp;

/**
 * Org entity. @author MyEclipse Persistence Tools
 */

public class Org implements java.io.Serializable {

	// Fields
	
	private String id;
	private String org_code;//组织编码
	private String org_name;//组织名称
	private String org_level;//组织级别
	private String contacts;//组织联系人
	private String head_tea_id;//班主任id
	private String counselor_id;//辅导员id
	private String director;//主管
	private String vice_director;//副主管
	private String phone;//联系电话
	private String parent_id;//上级组织id
	private String class_stunum;//班级人数
	private String state;//
	private String temp1;
	private String temp2;
	private String temp3;
	private Timestamp  begin_time;//成立时间
	private Timestamp end_time ;
	//逻辑字段
	private String parentOngName;//上级组织名称
	private String  head_code;//临时取班主任教工号-ymx
	private String  counselor_code;//临时取班主任教工号-ymx
	private String  contacts_code;//临时取班主任教工号-ymx
	private String head_tea_Name;//班主任
	private String counselorName;//辅导员
	private String orglevelname;//组织级别名称
	private String chotactname;//组织联系名称
	private String  time;//年级  临时存取  杨梦肖
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getHead_code() {
		return head_code;
	}
	public void setHead_code(String head_code) {
		this.head_code = head_code;
	}
	public String getCounselor_code() {
		return counselor_code;
	}
	public void setCounselor_code(String counselor_code) {
		this.counselor_code = counselor_code;
	}
	public String getContacts_code() {
		return contacts_code;
	}
	public void setContacts_code(String contacts_code) {
		this.contacts_code = contacts_code;
	}
	public String getClass_stunum() {
		return class_stunum;
	}
	public void setClass_stunum(String class_stunum) {
		this.class_stunum = class_stunum;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getOrg_level() {
		return org_level;
	}
	public void setOrg_level(String org_level) {
		this.org_level = org_level;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getVice_director() {
		return vice_director;
	}
	public void setVice_director(String vice_director) {
		this.vice_director = vice_director;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
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
	public String getHead_tea_id() {
		return head_tea_id;
	}
	public void setHead_tea_id(String head_tea_id) {
		this.head_tea_id = head_tea_id;
	}
	public String getCounselor_id() {
		return counselor_id;
	}
	public void setCounselor_id(String counselor_id) {
		this.counselor_id = counselor_id;
	}
	public String getParentOngName() {
		return parentOngName;
	}
	public void setParentOngName(String parentOngName) {
		this.parentOngName = parentOngName;
	}
	public String getHead_tea_Name() {
		return head_tea_Name;
	}
	public void setHead_tea_Name(String head_tea_Name) {
		this.head_tea_Name = head_tea_Name;
	}
	public String getCounselorName() {
		return counselorName;
	}
	public String getOrglevelname() {
		return orglevelname;
	}
	public void setOrglevelname(String orglevelname) {
		this.orglevelname = orglevelname;
	}
	public String getChotactname() {
		return chotactname;
	}
	public void setChotactname(String chotactname) {
		this.chotactname = chotactname;
	}
	public void setCounselorName(String counselorName) {
		this.counselorName = counselorName;
	}
	@Override
	public String toString() {
		return "Org [id=" + id + ", org_code=" + org_code + ", org_name="
				+ org_name + ", org_level=" + org_level + ", contacts="
				+ contacts + ", head_tea_id=" + head_tea_id + ", counselor_id="
				+ counselor_id + ", director=" + director + ", vice_director="
				+ vice_director + ", phone=" + phone + ", parent_id="
				+ parent_id + ", state=" + state + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + ", begin_time="
				+ begin_time + ", end_time=" + end_time + "]";
	}
	

	

}
