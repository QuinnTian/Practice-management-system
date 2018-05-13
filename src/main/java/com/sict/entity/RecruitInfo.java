package com.sict.entity;

import java.sql.Timestamp;

/**
 * RecruitInfo entity. @author MyEclipse Persistence Tools
 */

public class RecruitInfo implements java.io.Serializable {

	// Fields

	private String id;
	private Timestamp create_time;//发布时间
	private String com_id;//企业id
	private String type1;//
	private String type2;//
	private String type3;//
	private String post_id;//岗位名称
	private String recruit_prof;//招聘专业
	private Timestamp effect_time;//有效时间
	private Timestamp end_time;//结束时间
	private String recruit_desc;//招聘描述
	private Integer recruit_num;//招聘人数
	private String college_id;//发布学院
	private String state;//
	private String temp1;
	private String temp2;
	private String temp3;
	//设置静态变量   
		public static String oldcontent = "";
		public static String newcontent="";
	public Timestamp getEffect_time() {
		return effect_time;
	}
	public void setEffect_time(Timestamp effect_time) {
		this.effect_time = effect_time;
	}
	public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	
	public String getRecruit_prof() {
		return recruit_prof;
	}
	public void setRecruit_prof(String recruit_prof) {
		this.recruit_prof = recruit_prof;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public String getType3() {
		return type3;
	}
	public void setType3(String type3) {
		this.type3 = type3;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getRecruit_desc() {
		return recruit_desc;
	}
	public void setRecruit_desc(String recruit_desc) {
		this.recruit_desc = recruit_desc;
	}
	
	public Integer getRecruit_num() {
		return recruit_num;
	}
	public void setRecruit_num(Integer recruit_num) {
		this.recruit_num = recruit_num;
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
	
	public String getCollege_id() {
		return college_id;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}

	@Override
	public String toString() {
		return "RecruitInfo [id=" + id + ", create_time=" + create_time
				+ ", com_id=" + com_id + ", type1=" + type1 + ", type2="
				+ type2 + ", type3=" + type3 + ", post_id=" + post_id
				+ ", recruit_prof=" + recruit_prof + ", effect_time="
				+ effect_time + ", end_time=" + end_time + ", recruit_desc="
				+ recruit_desc + ", recruit_num=" + recruit_num
				+ ", college_id=" + college_id + ", state=" + state
				+ ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3=" + temp3
				+ "]";
	}
	

	
}