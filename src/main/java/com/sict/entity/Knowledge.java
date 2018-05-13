package com.sict.entity;

import java.sql.Timestamp;

/**
 * Knowledge entity. @author MyEclipse Persistence Tools
 */

public class Knowledge implements java.io.Serializable {

	// Fields

	private String id;
	private String question;//问题内容
	private String answer;//回答老师
	private String messenger_id;//发布人id
	private String scope;//通知范围
	private int category;//问题分类
	private String question_type;//问题类型
	private String answerer;//问题答案
	private Timestamp answer_time;//回答时间
	private Timestamp create_time;//问题创建时间
	private int answer_score;//
	private String temp1;
	private String temp2;
	private String temp3;
	public static int pages = 1;
	public static int  knowsize=0 ;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getAnswer_score() {
		return answer_score;
	}
	public void setAnswer_score(int answer_score) {
		this.answer_score = answer_score;
	}
	public Timestamp getAnswer_time() {
		return answer_time;
	}
	public void setAnswer_time(Timestamp answer_time) {
		this.answer_time = answer_time;
	}
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	public String getAnswerer() {
		return answerer;
	}
	public void setAnswerer(String answerer) {
		this.answerer = answerer;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getMessenger_id() {
		return messenger_id;
	}
	public void setMessenger_id(String messenger_id) {
		this.messenger_id = messenger_id;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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