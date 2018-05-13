package com.sict.entity;

import java.sql.Timestamp;
import java.util.List;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class Role implements java.io.Serializable {

	// Fields

	private String id;
	private String role_code;// 角色编码
	private String role_name;// 角色名字
	private String role_desc;// 角色描述
	private String state;
	private String role_type;
	private String school_id;// 学校id
	private String college_id;// 学院id
	private String create_tea;// 创建人id
	private Timestamp create_time;// 创建时间
	private String temp1;
	private String temp2;
	private String temp3;
	
	private String college_name;
	private String school_name;
	private List<Role> rolelist;
	
	private Boolean isBeOccupied;
	
	private String role_type_name;//角色类型名称  1管理员、2教师、3学生、4领导、5公司
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_desc() {
		return role_desc;
	}
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRole_type() {
		return role_type;
	}
	public void setRole_type(String role_type) {
		this.role_type = role_type;
	}
	public String getSchool_id() {
		return school_id;
	}
	public void setSchool_id(String school_id) {
		this.school_id = school_id;
	}
	public String getCollege_id() {
		return college_id;
	}
	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}
	public String getCreate_tea() {
		return create_tea;
	}
	public void setCreate_tea(String create_tea) {
		this.create_tea = create_tea;
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
	public String getCollege_name() {
		return college_name;
	}
	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}
	public String getSchool_name() {
		return school_name;
	}
	public Boolean getIsBeOccupied() {
		return isBeOccupied;
	}
	public void setIsBeOccupied(Boolean isBeOccupied) {
		this.isBeOccupied = isBeOccupied;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getRole_type_name() {
		return role_type_name;
	}
	public void setRole_type_name(String role_type_name) {
		this.role_type_name = role_type_name;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public List<Role> getRolelist() {
		return rolelist;
	}
	public void setRolelist(List<Role> rolelist) {
		this.rolelist = rolelist;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", role_code=" + role_code + ", role_name="
				+ role_name + ", role_desc=" + role_desc + ", state=" + state
				+ ", role_type=" + role_type + ", school_id=" + school_id
				+ ", college_id=" + college_id + ", create_tea=" + create_tea
				+ ", create_time=" + create_time + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + "]";
	}
	

	
}