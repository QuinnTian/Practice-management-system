package com.sict.entity;

import java.sql.Timestamp;

/**
 * @description 映射数据库中的 SJ_STU_LEADERS 数据表
 * @author 张向杨
 * @createDate 2016-05-25
 * @version 2.0
 * 
 * */
public class StuLeaders {
	private String id;
	private String ssl_year;// 学年
	private String ssl_term;// 学期
	private String ssl_org_id;// 组织id 班级ID
	private String ssl_stu_id;// 学生id
	private String ssl_duties_id;// 职位id
	private Timestamp begin_time;// 开始时间
	private Timestamp end_time;// 结束时间
	private String ssl_role_id;// 是否组织管理员
	private String ssl_note;// 描述 工作内容、表现情况
	private String ssl_quit_reason;// 退出原因
	private Timestamp ssl_create_time;// 创建时间
	private String ssl_create_user;// 创建人
	private String state;// 状态 1.在职2.离职 默认为1
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

	public String getSsl_year() {
		return ssl_year;
	}

	public void setSsl_year(String ssl_year) {
		this.ssl_year = ssl_year;
	}

	public String getSsl_term() {
		return ssl_term;
	}

	public void setSsl_term(String ssl_term) {
		this.ssl_term = ssl_term;
	}

	public String getSsl_org_id() {
		return ssl_org_id;
	}

	public void setSsl_org_id(String ssl_org_id) {
		this.ssl_org_id = ssl_org_id;
	}

	public String getSsl_stu_id() {
		return ssl_stu_id;
	}

	public void setSsl_stu_id(String ssl_stu_id) {
		this.ssl_stu_id = ssl_stu_id;
	}

	public String getSsl_duties_id() {
		return ssl_duties_id;
	}

	public void setSsl_duties_id(String ssl_duties_id) {
		this.ssl_duties_id = ssl_duties_id;
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

	public String getSsl_role_id() {
		return ssl_role_id;
	}

	public void setSsl_role_id(String ssl_role_id) {
		this.ssl_role_id = ssl_role_id;
	}

	public String getSsl_note() {
		return ssl_note;
	}

	public void setSsl_note(String ssl_note) {
		this.ssl_note = ssl_note;
	}

	public String getSsl_quit_reason() {
		return ssl_quit_reason;
	}

	public void setSsl_quit_reason(String ssl_quit_reason) {
		this.ssl_quit_reason = ssl_quit_reason;
	}

	public Timestamp getSsl_create_time() {
		return ssl_create_time;
	}

	public void setSsl_create_time(Timestamp ssl_create_time) {
		this.ssl_create_time = ssl_create_time;
	}

	public String getSsl_create_user() {
		return ssl_create_user;
	}

	public void setSsl_create_user(String ssl_create_user) {
		this.ssl_create_user = ssl_create_user;
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
		return "StuLeaders [id=" + id + ", ssl_year=" + ssl_year
				+ ", ssl_term=" + ssl_term + ", ssl_org_id=" + ssl_org_id
				+ ", ssl_stu_id=" + ssl_stu_id + ", ssl_duties_id="
				+ ssl_duties_id + ", begin_time=" + begin_time + ", end_time="
				+ end_time + ", ssl_role_id=" + ssl_role_id + ", ssl_note="
				+ ssl_note + ", ssl_quit_reason=" + ssl_quit_reason
				+ ", ssl_create_time=" + ssl_create_time + ", ssl_create_user="
				+ ssl_create_user + ", state=" + state + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4=" + temp4
				+ ", temp5=" + temp5 + "]";
	}

}
