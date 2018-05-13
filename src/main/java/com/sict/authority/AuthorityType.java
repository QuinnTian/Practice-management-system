package com.sict.authority;


/**
 */
public enum AuthorityType{

	ROLE_STUDENT("学生", "ROLE_STUDENT"), 
	ROLE_ADMIN("管理员", "ROLE_ADMIN"),
	ROLE_TEACHER("教师", "ROLE_TEACHER"),
	ROLE_LEADER("领导","ROLE_LEADER"), 
	ROLE_COMPANY("企业指导","ROLE_COMPANY"), 
	ROLE_QUESTIONNAIRE("问卷管理","ROLE_QUESTIONNAIRE"),
	ROLE_SUPER_ADMIN("超级管理员","ROLE_SUPER_ADMIN"),
	;
	private String name;
	private String type;

	private AuthorityType(String name, String index) {
		this.name = name;
		this.type = index;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
