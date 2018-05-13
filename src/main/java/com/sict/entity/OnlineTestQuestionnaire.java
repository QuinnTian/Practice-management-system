package com.sict.entity;

import java.sql.Timestamp;
import java.util.List;

public class OnlineTestQuestionnaire {
	
	
	private String id;
	private String title;
	private Timestamp createDate;
	private Timestamp startDate;
	private Timestamp endDate;
	private String url;
	private String user_id;
	private String org_id;
	private String user_type;
	private String state;
	private String temp1;			//测验是否公开
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	
	final static public String teacher = "1";
	final static public String student = "2";
	final static public String admin   = "3";
	
	final static public String open = "1";
	final static public String close = "0";
	
	private int qNum;
	
	private OnlineTestQuestion onlineTestQuestion;
	private List<OnlineTestQuestion> onlineTestQuestions;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public String getOrg_id() {
		return org_id;
	}

	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	public OnlineTestQuestion getOnlineTestQuestion() {
		return onlineTestQuestion;
	}
	public void setOnlineTestQuestion(OnlineTestQuestion onlineTestQuestion) {
		this.onlineTestQuestion = onlineTestQuestion;
	}
	public List<OnlineTestQuestion> getOnlineTestQuestions() {
		return onlineTestQuestions;
	}
	public void setOnlineTestQuestions(List<OnlineTestQuestion> onlineTestQuestions) {
		this.onlineTestQuestions = onlineTestQuestions;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	


	
	
}
