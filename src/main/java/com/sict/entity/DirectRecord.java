package com.sict.entity;

import java.sql.Timestamp;

/**
 * DirectRecord entity. @author MyEclipse Persistence Tools
 */

public class DirectRecord implements java.io.Serializable {

	// Fields

	private String id;
	private String practice_id;//实习任务id
	private String title;//标题

	private Timestamp direct_time;//指导时间
	private String direct_place;//指导地点

	private String org_id;//指导组织id
	private String stu_id;//指导学生id
	private String direct_desc;//文字描述
	private String file_id;//文件id
	private String temp1;
	private String temp2;
	private String temp3;
	private Timestamp create_time;//创建时间
	private String temp4;
	private String temp5;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPractice_id() {
		return practice_id;
	}
	public void setPractice_id(String practice_id) {
		this.practice_id = practice_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getDirect_time() {
		return direct_time;
	}
	public void setDirect_time(Timestamp direct_time) {
		this.direct_time = direct_time;
	}
	public String getDirect_place() {
		return direct_place;
	}
	public void setDirect_place(String direct_place) {
		this.direct_place = direct_place;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getDirect_desc() {
		return direct_desc;
	}
	public void setDirect_desc(String direct_desc) {
		this.direct_desc = direct_desc;
	}
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
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
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
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


}