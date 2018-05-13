package com.sict.entity;

import java.sql.Timestamp;

public class CourseEvaluate {

	private String id;
	private Timestamp eval_time;//评价时间
	private String teach_log_id;//教学日志id
	private String eval_user_id;//评价人id
	private String stu_id;//学生id
	private String class_id;//班级id
	private String eval_type;//评价类型
	private String standard_id;//评价标准id
	private String index_id;//指标id
	private double grade;//得分
	private String eval_desc;//描述
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getEval_time() {
		return eval_time;
	}
	public void setEval_time(Timestamp eval_time) {
		this.eval_time = eval_time;
	}
	public String getTeach_log_id() {
		return teach_log_id;
	}
	public void setTeach_log_id(String teach_log_id) {
		this.teach_log_id = teach_log_id;
	}
	public String getEval_user_id() {
		return eval_user_id;
	}
	public void setEval_user_id(String eval_user_id) {
		this.eval_user_id = eval_user_id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getEval_type() {
		return eval_type;
	}
	public void setEval_type(String eval_type) {
		this.eval_type = eval_type;
	}
	public String getStandard_id() {
		return standard_id;
	}
	public void setStandard_id(String standard_id) {
		this.standard_id = standard_id;
	}
	public String getIndex_id() {
		return index_id;
	}
	public void setIndex_id(String index_id) {
		this.index_id = index_id;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getEval_desc() {
		return eval_desc;
	}
	public void setEval_desc(String eval_desc) {
		this.eval_desc = eval_desc;
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
	
	@Override
	public String toString() {
		return "CourseEvaluate [id=" + id + ", eval_time=" + eval_time
				+ ", teach_log_id=" + teach_log_id + ", eval_user_id="
				+ eval_user_id + ", stu_id=" + stu_id + ", class_id="
				+ class_id + ", eval_type=" + eval_type + ", standard_id="
				+ standard_id + ", index_id=" + index_id + ", grade=" + grade
				+ ", eval_desc=" + eval_desc + ", temp1=" + temp1 + ", temp2="
				+ temp2 + ", temp3=" + temp3 + ", temp4=" + temp4 + ", temp5="
				+ temp5 + "]";
	}	
}
