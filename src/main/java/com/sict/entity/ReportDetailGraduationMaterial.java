package com.sict.entity;

public class ReportDetailGraduationMaterial {
	private String stu_id;//学生id
	private String dept_id;//教师的部门id
	private String entry_year;//	年份
	private String task_type;	//任务类型
	private String org_id;// 组织id
	private String parent_id;// 父组织id
	private String group_id;	//小组id
	private String group_name;//小组名称
	private String true_name;// 教师的真实姓名
	private String materials_type;//就业材料类型
	private String check_state;//核对状态
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getEntry_year() {
		return entry_year;
	}
	public void setEntry_year(String entry_year) {
		this.entry_year = entry_year;
	}
	public String getTask_type() {
		return task_type;
	}
	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getTrue_name() {
		return true_name;
	}
	public void setTrue_name(String true_name) {
		this.true_name = true_name;
	}
	public String getMaterials_type() {
		return materials_type;
	}
	public void setMaterials_type(String materials_type) {
		this.materials_type = materials_type;
	}
	public String getCheck_state() {
		return check_state;
	}
	public void setCheck_state(String check_state) {
		this.check_state = check_state;
	}


}
