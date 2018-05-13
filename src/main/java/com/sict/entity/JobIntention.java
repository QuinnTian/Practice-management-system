package com.sict.entity;

import java.sql.Timestamp;

/**
 * JobIntention entity. @author MyEclipse Persistence Tools
 */

public class JobIntention implements java.io.Serializable {//就业意向表

	// Fields

	private String id; //id
	private Timestamp create_time; //创建时间
	private String stu_id; //学生id
	private String is_recommend; //是否需要推荐
	private String post_one; //岗位一
	private String post_two; //岗位二
	private String post_there; //岗位三
	private Integer salary; //期待待遇
	private String region; //期待地点
	private String reason; //不需要的原因
	private String temp1;
	private String temp2;
	private String temp3;

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

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getIs_recommend() {
		return is_recommend;
	}

	public void setIs_recommend(String is_recommend) {
		this.is_recommend = is_recommend;
	}

	public String getPost_one() {
		return post_one;
	}

	public void setPost_one(String post_one) {
		this.post_one = post_one;
	}

	public String getPost_two() {
		return post_two;
	}

	public void setPost_two(String post_two) {
		this.post_two = post_two;
	}

	public String getPost_there() {
		return post_there;
	}

	public void setPost_there(String post_there) {
		this.post_there = post_there;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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
		return "JobIntention [id=" + id + ", create_time=" + create_time
				+ ", stu_id=" + stu_id + ", is_recommend=" + is_recommend
				+ ", post_one=" + post_one + ", post_two=" + post_two
				+ ", post_there=" + post_there + ", salary=" + salary
				+ ", region=" + region + ", reason=" + reason + ", temp1="
				+ temp1 + ", temp2=" + temp2 + ", temp3=" + temp3
				+ ", getId()=" + getId() + ", getCreate_time()="
				+ getCreate_time() + ", getStu_id()=" + getStu_id()
				+ ", getIs_recommend()=" + getIs_recommend()
				+ ", getPost_one()=" + getPost_one() + ", getPost_two()="
				+ getPost_two() + ", getPost_there()=" + getPost_there()
				+ ", getSalary()=" + getSalary() + ", getRegion()="
				+ getRegion() + ", getReason()=" + getReason()
				+ ", getTemp1()=" + getTemp1() + ", getTemp2()=" + getTemp2()
				+ ", getTemp3()=" + getTemp3() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	// Property accessors

	

}