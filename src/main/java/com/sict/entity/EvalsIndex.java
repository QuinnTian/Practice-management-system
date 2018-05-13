package com.sict.entity;

import java.sql.Timestamp;

/**
 * EvalsIndex entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class EvalsIndex implements java.io.Serializable {

	// Fields

	private String id;
	private String standard_id;//奖惩标准的id
	private String index_code;//奖惩指标的code
	private String index_name;//奖惩指标的名称
	private String description;//奖惩指标的描述
	private Double score;//奖惩指标分数
	private Timestamp create_time;//奖惩指标创建时间
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStandard_id() {
		return standard_id;
	}
	public void setStandard_id(String standard_id) {
		this.standard_id = standard_id;
	}
	public String getIndex_code() {
		return index_code;
	}
	public void setIndex_code(String index_code) {
		this.index_code = index_code;
	}
	public String getIndex_name() {
		return index_name;
	}
	public void setIndex_name(String index_name) {
		this.index_name = index_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
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