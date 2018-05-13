package com.sict.entity;

import java.util.Arrays;

public class User {

	// Fields

	private String id;
	private String s_t_code;
	private String wx_code;
	private String login_pass;
	private String true_name;
	private String sex;
	private String phone;
	private String qqnum;
	private String email;
	private String homepage;
	private String state;
	private String home_addr;
	private String home_phone;
	private String photo_id;
	private String birthplace;
	private String practice_state;
	private String entry_year;
	private String s_temp1;
	private String s_temp2;
	private String s_temp3;
	private byte[] last_time;
	private byte[] last_latitude;
	private byte[] last_longitude;
	private byte[] last_precs;
	private String id_card;
	private String org_id;
	private String duties;
	private String expertise;
	private String t_temp1;
	private String t_temp2;
	private String t_temp3;
	private String login_name;
	
	private String photoUrl;            //用户头像  
	private String type;                //用户类型（stu/tea）
	private String class_name;			//班级名称
	private int    startPage=0;			//临时记录存放的页数
	private int    endPage=5;				//临时记录存放的页数
	
	


	public String getPhotoUrl() {
		return photoUrl;
	}


	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public User() {
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getS_t_code() {
		return s_t_code;
	}

	
	public String getType() {
		return type;
	}

	
	public String getPhoneUrl() {
		return photoUrl;
	}


	public void setPhoneUrl(String phoneUrl) {
		this.photoUrl = phoneUrl;
	}


	public void setType(String type) {
		this.type = type;
	}


	public void setS_t_code(String s_t_code) {
		this.s_t_code = s_t_code;
	}


	public String getWx_code() {
		return wx_code;
	}


	public void setWx_code(String wx_code) {
		this.wx_code = wx_code;
	}


	public String getLogin_pass() {
		return login_pass;
	}


	public void setLogin_pass(String login_pass) {
		this.login_pass = login_pass;
	}


	public String getTrue_name() {
		return true_name;
	}


	public void setTrue_name(String true_name) {
		this.true_name = true_name;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getQqnum() {
		return qqnum;
	}


	public void setQqnum(String qqnum) {
		this.qqnum = qqnum;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getHomepage() {
		return homepage;
	}


	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}



	public String getHome_addr() {
		return home_addr;
	}


	public void setHome_addr(String home_addr) {
		this.home_addr = home_addr;
	}


	public String getHome_phone() {
		return home_phone;
	}


	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}


	public String getPhoto_id() {
		return photo_id;
	}


	public void setPhoto_id(String photo_id) {
		this.photo_id = photo_id;
	}


	public String getBirthplace() {
		return birthplace;
	}


	public void setBirthplace(String birthplace) {
		this.birthplace = birthplace;
	}


	public String getPractice_state() {
		return practice_state;
	}


	public void setPractice_state(String practice_state) {
		this.practice_state = practice_state;
	}


	public String getEntry_year() {
		return entry_year;
	}


	public void setEntry_year(String entry_year) {
		this.entry_year = entry_year;
	}


	public String getS_temp1() {
		return s_temp1;
	}


	public void setS_temp1(String s_temp1) {
		this.s_temp1 = s_temp1;
	}


	public String getS_temp2() {
		return s_temp2;
	}


	public void setS_temp2(String s_temp2) {
		this.s_temp2 = s_temp2;
	}


	public String getS_temp3() {
		return s_temp3;
	}


	public void setS_temp3(String s_temp3) {
		this.s_temp3 = s_temp3;
	}


	public byte[] getLast_time() {
		return last_time;
	}


	public void setLast_time(byte[] last_time) {
		this.last_time = last_time;
	}


	public byte[] getLast_latitude() {
		return last_latitude;
	}


	public void setLast_latitude(byte[] last_latitude) {
		this.last_latitude = last_latitude;
	}


	public byte[] getLast_longitude() {
		return last_longitude;
	}


	public void setLast_longitude(byte[] last_longitude) {
		this.last_longitude = last_longitude;
	}


	public byte[] getLast_precs() {
		return last_precs;
	}


	public void setLast_precs(byte[] last_precs) {
		this.last_precs = last_precs;
	}


	public String getId_card() {
		return id_card;
	}


	public void setId_card(String id_card) {
		this.id_card = id_card;
	}


	public String getDuties() {
		return duties;
	}


	public void setDuties(String duties) {
		this.duties = duties;
	}


	public String getExpertise() {
		return expertise;
	}


	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}


	public String getT_temp1() {
		return t_temp1;
	}


	public void setT_temp1(String t_temp1) {
		this.t_temp1 = t_temp1;
	}


	public String getT_temp2() {
		return t_temp2;
	}


	public void setT_temp2(String t_temp2) {
		this.t_temp2 = t_temp2;
	}


	public String getT_temp3() {
		return t_temp3;
	}


	public void setT_temp3(String t_temp3) {
		this.t_temp3 = t_temp3;
	}


	public String getLogin_name() {
		return login_name;
	}


	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}


	public String getClass_name() {
		return class_name;
	}


	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}


	public String getOrg_id() {
		return org_id;
	}


	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", s_t_code=" + s_t_code + ", wx_code="
				+ wx_code + ", login_pass=" + login_pass + ", true_name="
				+ true_name + ", sex=" + sex + ", phone=" + phone + ", qqnum="
				+ qqnum + ", email=" + email + ", homepage=" + homepage
				+ ", state=" + state + ", home_addr=" + home_addr
				+ ", home_phone=" + home_phone + ", photo_id=" + photo_id
				+ ", birthplace=" + birthplace + ", practice_state="
				+ practice_state + ", entry_year=" + entry_year + ", s_temp1="
				+ s_temp1 + ", s_temp2=" + s_temp2 + ", s_temp3=" + s_temp3
				+ ", last_time=" + Arrays.toString(last_time)
				+ ", last_latitude=" + Arrays.toString(last_latitude)
				+ ", last_longitude=" + Arrays.toString(last_longitude)
				+ ", last_precs=" + Arrays.toString(last_precs) + ", id_card="
				+ id_card + ", org_id=" + org_id + ", duties=" + duties
				+ ", expertise=" + expertise + ", t_temp1=" + t_temp1
				+ ", t_temp2=" + t_temp2 + ", t_temp3=" + t_temp3
				+ ", login_name=" + login_name + ", class_name=" + class_name
				+ "]";
	}


}