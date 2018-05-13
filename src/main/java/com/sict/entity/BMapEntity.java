package com.sict.entity;

import java.sql.Timestamp;

public class BMapEntity implements java.io.Serializable {
	
	//学生表
	private String true_name;//姓名
	private String sex;//性别
	private String stu_code;//学生学号
	private String stu_id;//学生id
	private String photo_id;//照片
	private String phone;//电话
	private String class_id;//班级
	private String id;//学生id
	//分组成员表
	private String user_id;
	
	//组织表
	private String  org_name;

	//文件表
	private String position ;
	
	//签到表
	private double latitude;//签到经度
	private double longitude;//签到纬度
	private Timestamp sign_time;//签到时间
	
	//合理区域表
	private Timestamp begin_time;//开始时间
	private Timestamp end_time;//结束时间
	private double latitude_r;//地区经度
	private double longitude_r;//地区纬度
	private int signCount;//本月签到次数
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSignCount() {
		return signCount;
	}
	public void setSignCount(int signCount) {
		this.signCount = signCount;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTrue_name() {
		return true_name;
	}
	public void setTrue_name(String true_name) {
		this.true_name = true_name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStu_code() {
		return stu_code;
	}
	public void setStu_code(String stu_code) {
		this.stu_code = stu_code;
	}
	public String getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(String photo_id) {
		this.photo_id = photo_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public Timestamp getSign_time() {
		return sign_time;
	}
	public void setSign_time(Timestamp sign_time) {
		this.sign_time = sign_time;
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
	public double getLatitude_r() {
		return latitude_r;
	}
	public void setLatitude_r(double latitude_r) {
		this.latitude_r = latitude_r;
	}
	public double getLongitude_r() {
		return longitude_r;
	}
	public void setLongitude_r(double longitude_r) {
		this.longitude_r = longitude_r;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

}
