package com.sict.entity;

import java.sql.Timestamp;

/**
 * SjStudent entity. @author MyEclipse Persistence Tools
 */

public class Student {

	// Fields

	private String id;
	private String stu_code;
	private String wx_code;
	private String login_pass;
	private String true_name;
	private String sex;//性别
	private String group_id;//小组名称
	private String id_card;//身份证
	private String phone;//联系电话
	private String class_id;//班级
	private String home_addr;//家庭住址
	private String home_phone;//家庭电话
	private String photo_id;//照片id
	private String birthplace;//
	private String qqnum;//qq
	private String email;//email
	private String homepage;//
	private String entry_year;//入学年份
	private String state;//状态
	private String com_teacher_id;//企业老师id
	private Timestamp last_time;//
	private double last_precs;
	private double last_latitude;
	private double last_longitude;
	private String practice_state;
	private Timestamp current_recruit_read;
	private Timestamp current_notice_read;
	private int current_knowlege_page = 1;// 增加逻辑字段，不存数据库，在字典表中使用，记录学生常见问题的页码，该字段默认-1，加1后取得第一条
	private int current_zpxx_page =-1;							// 2015年6月10日 楚晨晨
	private int All_knowlege_page = 1;// 增加逻辑字段，不存数据库，在字典表中使用，记录学生常见问题的页码，该字段默认-1，加1后取得第一条
										// 2015年6月10日 楚晨晨
	private String tempKey="";
	private String stucontent = "";
	private int current_notice_page = -1;// 增加逻辑字段，不存数据库，在字典表中使用，记录学生读取通知的页码，该字段默认-1，加1后取得第一条
											// 2015年6月10日 楚晨晨
	private int current_recruitInfo_page = -1;// 增加逻辑字段，不存数据库，在字典表中使用，记录学生读取招聘信息的页码，该字段默认-1，加1后取得第一条
												// 2015年6月10日 楚晨晨

	private String currentCompanyId; //当前公司      增加逻辑字段，不存数据库，记录学生总结的成绩 吴敬国 2015-8-16
	private String summaryScore; //总结成绩      增加逻辑字段，不存数据库，记录学生总结的成绩 吴敬国 2015-8-16
	private String summarystartDate;//回答时间     增加逻辑字段，不存数据库，记录学生总结的成绩 吴敬国 2015-8-16


	public String getCurrentCompanyId() {
		return currentCompanyId;
	}


	public void setCurrentCompanyId(String currentCompanyId) {
		this.currentCompanyId = currentCompanyId;
	}


	public String getSummarystartDate() {
		return summarystartDate;
	}


	public void setSummarystartDate(String summarystartDate) {
		this.summarystartDate = summarystartDate;
	}


	public String getSummaryScore() {
		return summaryScore;
	}


	public void setSummaryScore(String summaryScore) {
		this.summaryScore = summaryScore;
	}


	
	
	
	public int getCurrent_notice_page() {
		return current_notice_page;
	}

	public String getCom_teacher_id() {
		return com_teacher_id;
	}

	public void setCom_teacher_id(String com_teacher_id) {
		this.com_teacher_id = com_teacher_id;
	}

	public void setCurrent_notice_page(int current_notice_page) {
		this.current_notice_page = current_notice_page;
	}

	public Timestamp getLast_time() {
		return last_time;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public void setLast_time(Timestamp last_time) {
		this.last_time = last_time;
	}

	public double getLast_precs() {
		return last_precs;
	}

	public void setLast_precs(double last_precs) {
		this.last_precs = last_precs;
	}

	public double getLast_latitude() {
		return last_latitude;
	}

	public void setLast_latitude(double last_latitude) {
		this.last_latitude = last_latitude;
	}

	public double getLast_longitude() {
		return last_longitude;
	}

	public void setLast_longitude(double last_longitude) {
		this.last_longitude = last_longitude;
	}

	public String getPractice_state() {
		return practice_state;
	}

	public void setPractice_state(String practice_state) {
		this.practice_state = practice_state;
	}

	private String temp1;
	private String temp2;
	private String temp3;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStu_code() {
		return stu_code;
	}

	public void setStu_code(String stu_code) {
		this.stu_code = stu_code;
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

	public String getId_card() {
		return id_card;
	}

	public void setId_card(String id_card) {
		this.id_card = id_card;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
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

	public String getEntry_year() {
		return entry_year;
	}

	public void setEntry_year(String entry_year) {
		this.entry_year = entry_year;
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

	public Timestamp getCurrent_notice_read() {
		return current_notice_read;
	}

	public void setCurrent_notice_read(Timestamp current_notice_read) {
		this.current_notice_read = current_notice_read;
	}

	public Timestamp getCurrent_recruit_read() {
		return current_recruit_read;
	}

	public void setCurrent_recruit_read(Timestamp current_recruit_read) {
		this.current_recruit_read = current_recruit_read;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", stu_code=" + stu_code + ", wx_code="
				+ wx_code + ", login_pass=" + login_pass + ", true_name="
				+ true_name + ", sex=" + sex + ", group_id=" + group_id
				+ ", id_card=" + id_card + ", phone=" + phone + ", class_id="
				+ class_id + ", home_addr=" + home_addr + ", home_phone="
				+ home_phone + ", photo_id=" + photo_id + ", birthplace="
				+ birthplace + ", qqnum=" + qqnum + ", email=" + email
				+ ", homepage=" + homepage + ", entry_year=" + entry_year
				+ ", state=" + state + ", com_teacher_id=" + com_teacher_id
				+ ", last_time=" + last_time + ", last_precs=" + last_precs
				+ ", last_latitude=" + last_latitude + ", last_longitude="
				+ last_longitude + ", practice_state=" + practice_state
				+ ", current_recruit_read=" + current_recruit_read
				+ ", current_notice_read=" + current_notice_read + ", temp1="
				+ temp1 + ", temp2=" + temp2 + ", temp3=" + temp3 + "]";
	}

	public int getCurrent_recruitInfo_page() {
		return current_recruitInfo_page;
	}

	public void setCurrent_recruitInfo_page(int current_recruitInfo_page) {
		this.current_recruitInfo_page = current_recruitInfo_page;
	}

	public int getCurrent_knowlege_page() {
		return current_knowlege_page;
	}

	public void setCurrent_knowlege_page(int current_knowlege_page) {
		this.current_knowlege_page = current_knowlege_page;
	}

	public int getAll_knowlege_page() {
		return All_knowlege_page;
	}

	public void setAll_knowlege_page(int all_knowlege_page) {
		All_knowlege_page = all_knowlege_page;
	}

	public String getStucontent() {
		return stucontent;
	}

	public void setStucontent(String stucontent) {
		this.stucontent = stucontent;
	}

	public int getCurrent_zpxx_page() {
		return current_zpxx_page;
	}

	public void setCurrent_zpxx_page(int current_zpxx_page) {
		this.current_zpxx_page = current_zpxx_page;
	}

	public String getTempKey() {
		return tempKey;
	}

	public void setTempKey(String tempKey) {
		this.tempKey = tempKey;
	}

}