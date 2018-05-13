package com.sict.entity;

import java.sql.Timestamp;

public class OnlineTestQnAnswer {
	
	private String id;
	private Timestamp startdate;
	private Timestamp enddate;
	private String user_id;
	private String questionnaire_id;
	private String accuracy;
	private String score;
	private String temp1;				//测验状态，如果1，则不能修改测验
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	
	private User user;			//用户
	
	public static final String SUMBIT_STATE_CLOSE = "1";		//测验关闭，学生不能再答测验
	public static final String SUMBIT_STATE_OPEN  = "0";		//测验打开，学生可以重答测验
	public static final String SUMBIT_STATE_SUMBIT = "2";		//测验提交，学社和老师都不能再对此测验进行操作
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getStartdate() {
		return startdate;
	}
	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}
	public Timestamp getEnddate() {
		return enddate;
	}
	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getQuestionnaire_id() {
		return questionnaire_id;
	}
	public void setQuestionnaire_id(String questionnaire_id) {
		this.questionnaire_id = questionnaire_id;
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
	public String getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(String accuracy) {
		this.accuracy = accuracy;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
