package com.sict.entity;

public class ReportLogState {
	private String stu_id;//学生id  比如吴敬国的id
	private String operate_time;//开始时间  
	private String end_time;//结束时间
	private String practice_state;//实习状态  130 
	private Integer score;//分数  70
	private String month;//月份   1月
	private String college;//学院名称   电子信息学院
	
	
	
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getOperate_time() {
		return operate_time;
	}
	public void setOperate_time(String operate_time) {
		this.operate_time = operate_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getPractice_state() {
		return practice_state;
	}
	public void setPractice_state(String practice_state) {
		this.practice_state = practice_state;
	}
	
}
