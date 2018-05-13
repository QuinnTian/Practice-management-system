package com.sict.entity;

/**
 * 实训安排报表 entity. 
 * @author 张超
 * 吴敬国 2015-6-12  备注
 */
public class ReportTrainDetail {
	private String group_id; //小组id
	private String group_name; //小组名字
	private String course_name; //课程名字
	private String teacher_name; //教师名字
	private String week_num; //周次
	private String train_time; //实训时间
	private String class_num;// 
	private String train_place;//实训地点
	
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getWeek_num() {
		return week_num;
	}
	public void setWeek_num(String week_num) {
		this.week_num = week_num;
	}
	public String getTrain_time() {
		return train_time;
	}
	public void setTrain_time(String train_time) {
		this.train_time = train_time;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getTrain_place() {
		return train_place;
	}
	public void setTrain_place(String train_place) {
		this.train_place = train_place;
	}
	
}
