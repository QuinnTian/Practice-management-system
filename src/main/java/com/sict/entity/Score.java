package com.sict.entity;

import java.sql.Timestamp;

/**
 * SjScore entity. @author MyEclipse Persistence Tools
 */

public class Score implements java.io.Serializable {

	// Fields
	private String id;
	private String stu_id;//学生id
	private Timestamp time;//生成时间
	private String practice_id;//任务id
	private int year;//学年
	private int term;//学期
	private String type;//成绩类型
	private double score;//分数
	/*添加三个属性，未在数据库定义 邢志武 2015-01-27*/
	private double mouthScore;//月总结分数
	private double theScore;//毕业论文分数
	private double evaScore;//奖惩分数
	private String weight;//权重
	private String note;//备注
	private String temp1;
	private String temp2;
	private String temp3;
	
	public double getMouthScore() {
		return mouthScore;
	}

	public void setMouthScore(double mouthScore) {
		this.mouthScore = mouthScore;
	}

	public double getTheScore() {
		return theScore;
	}

	public void setTheScore(double theScore) {
		this.theScore = theScore;
	}

	public double getEvaScore() {
		return evaScore;
	}

	public void setEvaScore(double evaScore) {
		this.evaScore = evaScore;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}
	public String getPractice_id() {
		return practice_id;
	}

	public void setPractice_id(String practice_id) {
		this.practice_id = practice_id;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
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
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Score [id=" + id + ", stu_id=" + stu_id + ", time=" + time
				+ ", practice_id=" + practice_id + ", year=" + year + ", term="
				+ term + ", score=" + score + ", weight=" + weight + ", note="
				+ note + ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3="
				+ temp3 + "]";
	}


}