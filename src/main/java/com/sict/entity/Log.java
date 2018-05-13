package com.sict.entity;

import java.sql.Timestamp;

/**
 * Log entity日志表 
 * @author 吴敬国
 */

public class Log implements java.io.Serializable {

	private String id;
	private String log_type;//日志类型
	private String user_id;//登录名
	private String stu_id;//学生id
	private String practice_id;//任务id
	private String practice_state;//任务状态
	private Timestamp operate_time;//操作时间
	private Timestamp end_time;//结束时间
	private String operate_type;//操作类型
	private String operate_module;//操作模块
	private String operate_obj;//操作对象
	private String content;//操作内容
	private String temp1;
	private String temp2;
	private String temp3;

	// Constructors

	/** default constructor */
	public Log() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLog_type() {
		return log_type;
	}

	public void setLog_type(String log_type) {
		this.log_type = log_type;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getPractice_id() {
		return practice_id;
	}

	public void setPractice_id(String practice_id) {
		this.practice_id = practice_id;
	}

	public String getPractice_state() {
		return practice_state;
	}

	public void setPractice_state(String practice_state) {
		this.practice_state = practice_state;
	}

	

	public Timestamp getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}

	public Timestamp getOperate_time() {
		return operate_time;
	}

	public void setOperate_time(Timestamp operate_time) {
		this.operate_time = operate_time;
	}

	public String getOperate_type() {
		return operate_type;
	}

	public void setOperate_type(String operate_type) {
		this.operate_type = operate_type;
	}

	public String getOperate_module() {
		return operate_module;
	}

	public void setOperate_module(String operate_module) {
		this.operate_module = operate_module;
	}

	public String getOperate_obj() {
		return operate_obj;
	}

	public void setOperate_obj(String operate_obj) {
		this.operate_obj = operate_obj;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		return "Log [id=" + id + ", log_type=" + log_type + ", user_id="
				+ user_id + ", stu_id=" + stu_id + ", practice_id="
				+ practice_id + ", practice_state=" + practice_state
				+ ", operate_time=" + operate_time + ", end_time=" + end_time
				+ ", operate_type=" + operate_type + ", operate_module="
				+ operate_module + ", operate_obj=" + operate_obj
				+ ", content=" + content + ", temp1=" + temp1 + ", temp2="
				+ temp2 + ", temp3=" + temp3 + "]";
	}

	


	

}