package com.sict.entity;

public class Param {
	private String id;//编号
	private String task_id;//任务ID
	private String dept_id;//部门ID
	private String param_code;//参数
	private String param_name;//参数名称
	private String param_value;//参数数值
	private String year;//学年
	private String state;//状态 1有效 2删除无效 
	private String term;//学期
	
	
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
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getParam_code() {
		return param_code;
	}
	public void setParam_code(String param_code) {
		this.param_code = param_code;
	}
	public String getParam_name() {
		return param_name;
	}
	public void setParam_name(String param_name) {
		this.param_name = param_name;
	}
	public String getParam_value() {
		return param_value;
	}
	public void setParam_value(String param_value) {
		this.param_value = param_value;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
		return "Param [id=" + id + ", task_id=" + task_id + ", dept_id="
				+ dept_id + ", param_code=" + param_code + ", param_name="
				+ param_name + ", param_value=" + param_value + ", year="
				+ year + ", state=" + state + ", term=" + term + ", temp1="
				+ temp1 + ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4="
				+ temp4 + ", temp5=" + temp5 + ", getId()=" + getId()
				+ ", getTask_id()=" + getTask_id() + ", getDept_id()="
				+ getDept_id() + ", getParam_code()=" + getParam_code()
				+ ", getParam_name()=" + getParam_name()
				+ ", getParam_value()=" + getParam_value() + ", getYear()="
				+ getYear() + ", getState()=" + getState() + ", getTerm()="
				+ getTerm() + ", getTemp1()=" + getTemp1() + ", getTemp2()="
				+ getTemp2() + ", getTemp3()=" + getTemp3() + ", getTemp4()="
				+ getTemp4() + ", getTemp5()=" + getTemp5() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	
}
