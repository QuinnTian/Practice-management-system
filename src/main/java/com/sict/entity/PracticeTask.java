package com.sict.entity;

import java.sql.Timestamp;


/**
 * PracticeTask entity. @author MyEclipse Persistence Tools
 */

public class PracticeTask implements java.io.Serializable {

	// Fields

	private String id;
	private String practice_code;//任务编码
	private String task_name;//任务名称
	private String tea_id;//负责老师id
	private Timestamp begin_time;//开始时间
	private Timestamp end_time;//结束时间
	private Timestamp create_time;//创建时间
	private String task_desc;//任务描述
	private String task_place;//任务地点
	private String file_id;//文件id
	private String task_type;//任务类型
	private String parent_id;//父任务id
	private String state;//
	private String grade;//年级
	private String scope;//所属部门
	private String temp1;
	private String temp2;
	private String temp3;
	private double weight_summary;//总结权重
	private double  weight_thesis;//论文权重
	private double  weight_evaluate;//奖惩权重
	private String studyLength;//学制
	
	public double getWeight_summary() {
		return weight_summary;
	}

	public void setWeight_summary(double weight_summary) {
		this.weight_summary = weight_summary;
	}

	public double getWeight_thesis() {
		return weight_thesis;
	}

	public void setWeight_thesis(double weight_thesis) {
		this.weight_thesis = weight_thesis;
	}

	public double getWeight_evaluate() {
		return weight_evaluate;
	}

	public void setWeight_evaluate(double weight_evaluate) {
		this.weight_evaluate = weight_evaluate;
	}

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
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	public Timestamp getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(Timestamp begin_time) {
		this.begin_time = begin_time;
	}
    public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	
    public Timestamp getEnd_time1(String et){
    	Timestamp end_time=Timestamp.valueOf(et);   
    	return end_time;
    }
	public String getTask_desc() {
		return task_desc;
	}
	public void setTask_desc(String task_desc) {
		this.task_desc = task_desc;
	}
	public String getTask_place() {
		return task_place;
	}
	public void setTask_place(String task_place) {
		this.task_place = task_place;
	}
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	public String getTask_type() {
		return task_type;
	}
	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}

	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
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

	public String getStudyLength() {
		return studyLength;
	}

	public void setStudyLength(String studyLength) {
		this.studyLength = studyLength;
	}

	@Override
	public String toString() {
		return "PracticeTask [id=" + id + ", practice_code=" + practice_code
				+ ", task_name=" + task_name + ", tea_id=" + tea_id
				+ ", begin_time=" + begin_time + ", end_time=" + end_time
				+ ", create_time=" + create_time + ", task_desc=" + task_desc
				+ ", task_place=" + task_place + ", file_id=" + file_id
				+ ", task_type=" + task_type + ", parent_id=" + parent_id
				+ ", state=" + state + ", grade=" + grade + ", scope=" + scope
				+ ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3=" + temp3
				+ ", weight_summary=" + weight_summary + ", weight_thesis="
				+ weight_thesis + ", weight_evaluate=" + weight_evaluate
				+ ", studyLength=" + studyLength + "]";
	}
	

}
