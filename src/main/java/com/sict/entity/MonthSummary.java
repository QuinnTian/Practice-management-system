package com.sict.entity;

import java.sql.Timestamp;

/**
 * SjMonthSummary entity. @author MyEclipse Persistence Tools
 */

public class MonthSummary implements java.io.Serializable {//毕业实习总结表

	// Fields

	private String id; //id
	private String practice_code;//实习id
	private Timestamp time; //时间
	private String stu_id; //学生id
	private String type; //类型
	private String title; //标题
	private int score; //得分
	private String share_state;//分享状态
	private String share_content;//推荐月总结内容
	private String questionnaire_id;//调查问卷
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPractice_code() {
		return practice_code;
	}
	public void setPractice_code(String practice_code) {
		this.practice_code = practice_code;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getShare_state() {
		return share_state;
	}
	public void setShare_state(String share_state) {
		this.share_state = share_state;
	}
	public String getShare_content() {
		return share_content;
	}
	public void setShare_content(String share_content) {
		this.share_content = share_content;
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
	@Override
	public String toString() {
		return "MonthSummary [id=" + id + ", practice_code=" + practice_code
				+ ", time=" + time + ", stu_id=" + stu_id + ", type=" + type
				+ ", title=" + title + ", score=" + score + ", share_state="
				+ share_state + ", share_content=" + share_content
				+ ", questionnaire_id=" + questionnaire_id + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + ", getId()="
				+ getId() + ", getPractice_code()=" + getPractice_code()
				+ ", getTime()=" + getTime() + ", getStu_id()=" + getStu_id()
				+ ", getType()=" + getType() + ", getTitle()=" + getTitle()
				+ ", getScore()=" + getScore() + ", getShare_state()="
				+ getShare_state() + ", getShare_content()="
				+ getShare_content() + ", getQuestionnaire_id()="
				+ getQuestionnaire_id() + ", getTemp1()=" + getTemp1()
				+ ", getTemp2()=" + getTemp2() + ", getTemp3()=" + getTemp3()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
	
	

}