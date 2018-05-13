package com.sict.entity;

public class QAnswer {
	
	private String id;
	private String answertext;
	private String qnanswer_id;
	private String question_id;
	private Option o;
	private Question q;
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
	public Option getO() {
		return o;
	}
	public void setO(Option o) {
		this.o = o;
	}
	public Question getQ() {
		return q;
	}
	public void setQ(Question q) {
		this.q = q;
	}

}
