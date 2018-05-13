package com.sict.entity;

import java.sql.Timestamp;

/**
 * EvaluateStandard entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class EvaluateStandard implements java.io.Serializable {

	// Fields

	private String id;
	private String standard_code;//奖惩标准code
	private String standard_name;//奖惩标准名称
	private String type;//奖惩标准类型
	private String description;//奖惩标准描述
	private String scope;//适用范围
	private Timestamp create_time;//创建时间
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStandard_code() {
		return standard_code;
	}
	public void setStandard_code(String standard_code) {
		this.standard_code = standard_code;
	}
	public String getStandard_name() {
		return standard_name;
	}
	public void setStandard_name(String standard_name) {
		this.standard_name = standard_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
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


}