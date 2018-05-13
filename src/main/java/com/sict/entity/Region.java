package com.sict.entity;

/**
 * SjOrg entity. @author MyEclipse Persistence Tools
 */

public class Region implements java.io.Serializable {//地点表

	// Fields

	private String id; //id
	private String region_code; //区域编码
	private String region_cn;//区域名称
	private String parent_id;//父ID
	private String region_level; //区域级别
	private String region_fullname_code;//完整编码
	private String region_fullname_cn; //区域全名
	private String area_code;//区号
	private String post_code; //邮政编码
	private String temp1;
	private String temp2;
	private String temp3;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegion_code() {
		return region_code;
	}
	public void setRegion_code(String region_code) {
		this.region_code = region_code;
	}
	public String getRegion_cn() {
		return region_cn;
	}
	public void setRegion_cn(String region_cn) {
		this.region_cn = region_cn;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getRegion_level() {
		return region_level;
	}
	public void setRegion_level(String region_level) {
		this.region_level = region_level;
	}
	public String getRegion_fullname_code() {
		return region_fullname_code;
	}
	public void setRegion_fullname_code(String region_fullname_code) {
		this.region_fullname_code = region_fullname_code;
	}
	public String getRegion_fullname_cn() {
		return region_fullname_cn;
	}
	public void setRegion_fullname_cn(String region_fullname_cn) {
		this.region_fullname_cn = region_fullname_cn;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
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
		return "Region [id=" + id + ", region_code=" + region_code
				+ ", region_cn=" + region_cn + ", parent_id=" + parent_id
				+ ", region_level=" + region_level + ", region_fullname_code="
				+ region_fullname_code + ", region_fullname_cn="
				+ region_fullname_cn + ", area_code=" + area_code
				+ ", post_code=" + post_code + ", temp1=" + temp1 + ", temp2="
				+ temp2 + ", temp3=" + temp3 + ", getId()=" + getId()
				+ ", getRegion_code()=" + getRegion_code()
				+ ", getRegion_cn()=" + getRegion_cn() + ", getParent_id()="
				+ getParent_id() + ", getRegion_level()=" + getRegion_level()
				+ ", getRegion_fullname_code()=" + getRegion_fullname_code()
				+ ", getRegion_fullname_cn()=" + getRegion_fullname_cn()
				+ ", getArea_code()=" + getArea_code() + ", getPost_code()="
				+ getPost_code() + ", getTemp1()=" + getTemp1()
				+ ", getTemp2()=" + getTemp2() + ", getTemp3()=" + getTemp3()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
}