package com.sict.entity;

import java.sql.Timestamp;

public class Notice {
	private String id;
	private String notice_code;//通知编号
	private String notice_type;//通知类型
	private String content;//通知内容
	private String stu_id;//通知学生id
	private String tea_id;//发布通知教师id
	private String org_id;//通知部门id
	private String title;//通知标题
	private Timestamp create_time;//通知创建时间
	private String temp1;
	private String temp2;
	private String temp3;
	//设置静态变量 页数  
	public static int page =0;
	
	public static Timestamp Current_notice_read;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(String notice_code) {
		this.notice_code = notice_code;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
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
