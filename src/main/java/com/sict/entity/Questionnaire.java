package com.sict.entity;

import java.util.List;

public class Questionnaire {
	
	
	private String id;
	private String title;
	private String startDate;
	private String endDate;
	private String url;
	private String user_id;
	private String temp1;//问卷使用单位
	private String temp2;//使用者
	private String temp3;//类型
	private String temp4;
	private String temp5;
	
	final static public String qn_wjdc = "wjdc";
	final static public String qn_summary = "summary";
	final static public String qn_month = "month";
	final static public String qn_open = "1";
	final static public String qn_close = "0";
	
	private int qNum;
	
	private Question q;
	private List<Question> question;
	
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
	public List<Question> getQuestion() {
		return question;
	}
	public void setQuestion(List<Question> list) {
		this.question = list;
	}
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public Question getQ() {
		return q;
	}
	public void setQ(Question q) {
		this.q = q;
	}
	
	
}
