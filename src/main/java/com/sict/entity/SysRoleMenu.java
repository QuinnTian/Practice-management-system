package com.sict.entity;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class SysRoleMenu implements java.io.Serializable {

	// Fields

	private String id;
	private String srm_role_id;//
	private String srm_menu_id;//
	private String temp1;
	private String temp2;
	private String temp3;
	//角色模板
	final static public  String ROLE_ADMIN_COLLEGE="ROLE_ADMIN_COLLEGE";
	public static String ROLE_ADMIN_EMPLOYMENT="ROLE_ADMIN_EMPLOYMENT";
	public static String ROLE_COMPANY_TEACHER="ROLE_COMPANY_TEACHER";
	
	public static String ROLE_LEADER_COLLEGE="ROLE_LEADER_COLLEGE";
	public static String ROLE_LEADER_SCHOOL="ROLE_LEADER_SCHOOL";
	
	public static String ROLE_STUDENT_PRACTICE="ROLE_STUDENT_PRACTICE";
	public static String ROLE_STUDENT_SCHOOL="ROLE_STUDENT_SCHOOL";

	public static String ROLE_TEACHER_COUNSELLOR="ROLE_TEACHER_COUNSELLOR";
	public static String ROLE_TEACHER_PRACTICE="ROLE_TEACHER_PRACTICE";
	
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSrm_role_id() {
		return srm_role_id;
	}
	public void setSrm_role_id(String srm_role_id) {
		this.srm_role_id = srm_role_id;
	}
	public String getSrm_menu_id() {
		return srm_menu_id;
	}
	public void setSrm_menu_id(String srm_menu_id) {
		this.srm_menu_id = srm_menu_id;
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
		return "SysRoleMenu [id=" + id + ", srm_role_id=" + srm_role_id
				+ ", srm_menu_id=" + srm_menu_id + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + "]";
	}

	
}