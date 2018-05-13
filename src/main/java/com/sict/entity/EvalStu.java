package com.sict.entity;

import java.sql.Timestamp;

public class EvalStu {
	private String id;
	private String eval_type;//评价类型
	private String eval_title;//标题
	private int eval_score;//分数
	private String eval_content;//类型
	private Timestamp eval_time;//时间
	private String tea_id;//评价教师id
	private String stu_id;//学生id
	private String temp1;
	private String temp2;
	private String temp3;
	
	private String company_name; //逻辑字段
	private String tea_name; //逻辑字段
	
	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getTea_name() {
		return tea_name;
	}

	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEval_type() {
		return eval_type;
	}

	public void setEval_type(String eval_type) {
		this.eval_type = eval_type;
	}

	public String getEval_title() {
		return eval_title;
	}

	public void setEval_title(String eval_title) {
		this.eval_title = eval_title;
	}

	public int getEval_score() {
		return eval_score;
	}

	public void setEval_score(int eval_score) {
		this.eval_score = eval_score;
	}

	public String getEval_content() {
		return eval_content;
	}

	public void setEval_content(String eval_content) {
		this.eval_content = eval_content;
	}

	public Timestamp getEval_time() {
		return eval_time;
	}

	public void setEval_time(Timestamp eval_time) {
		this.eval_time = eval_time;
	}

	public String getTea_id() {
		return tea_id;
	}

	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
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
		return "EvalStu [id=" + id + ", eval_type=" + eval_type
				+ ", eval_title=" + eval_title + ", eval_score=" + eval_score
				+ ", eval_content=" + eval_content + ", eval_time=" + eval_time
				+ ", tea_id=" + tea_id + ", stu_id=" + stu_id + ", temp1="
				+ temp1 + ", temp2=" + temp2 + ", temp3=" + temp3 + "]";
	}
	
}
