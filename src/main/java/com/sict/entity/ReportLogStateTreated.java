package com.sict.entity;

public class ReportLogStateTreated {
	private double avg_score;//平均分数
	private double total_score;//总分数
	private double total_stu_num;//总人数
	private String month;//月份
	private String college; //学院
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public double getTotal_score() {
		return total_score;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public void setTotal_score(double total_score) {
		this.total_score = total_score;
	}

	public double getTotal_stu_num() {
		return total_stu_num;
	}

	public void setTotal_stu_num(double total_stu_num) {
		this.total_stu_num = total_stu_num;
	}

	public double getAvg_score() {
		return avg_score;
	}

	public void setAvg_score(double avg_score) {
		this.avg_score = avg_score;
	}
	
	
}
