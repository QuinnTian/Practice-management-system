package com.sict.entity;

public class ReportStuStateGrade {
	private double avg_score;//平均分数
	private double total_score;//总分数
	private double total_stu_num;//总人数
	private String time;//时间
	private String deptortea_name; //部门或者教师name
	public double getAvg_score() {
		return avg_score;
	}
	public void setAvg_score(double avg_score) {
		this.avg_score = avg_score;
	}
	public double getTotal_score() {
		return total_score;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDeptortea_name() {
		return deptortea_name;
	}
	public void setDeptortea_name(String deptortea_name) {
		this.deptortea_name = deptortea_name;
	}
	
	
	
}
