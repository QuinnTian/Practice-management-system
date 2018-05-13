package com.sict.entity;

public class OnlineTestQAnswer {
	
	private String id;
	private String answertext;
	private String qnanswer_id;
	private String question_id;
	private String validity;		//是否正确
	private String score;				//分数
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
//	private OnlineTestOption otOption;
//	private OnlineTestQuestion otQuestion;
	
	public final static String validity_true = "1";
	public final static String validity_false = "0";
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAnswertext() {
		return answertext;
	}
	public void setAnswertext(String answertext) {
		this.answertext = answertext;
	}
	public String getQnanswer_id() {
		return qnanswer_id;
	}
	public void setQnanswer_id(String qnanswer_id) {
		this.qnanswer_id = qnanswer_id;
	}
	public String getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}
	public String getValidity() {
		return validity;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
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

}
