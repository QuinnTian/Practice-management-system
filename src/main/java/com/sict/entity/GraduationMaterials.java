package com.sict.entity;

import java.sql.Timestamp;

public class GraduationMaterials {
	private String id;//id
	private String practice_id;//实习id
	private String stu_id;//学生id
	private String materials_type;//材料类型
	private String materials_name;//材料名称
	private Timestamp create_time;//上传时间
	private Timestamp check_time;//审核时间
	private String check_state;//审核状态
	private String note;//备注
	private String file_id;
	private String temp1;
	private String temp2;
	private String temp3;

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

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getMaterials_type() {
		return materials_type;
	}

	public void setMaterials_type(String materials_type) {
		this.materials_type = materials_type;
	}

	public String getMaterials_name() {
		return materials_name;
	}

	public void setMaterials_name(String materials_name) {
		this.materials_name = materials_name;
	}

	public Timestamp getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}

	public Timestamp getCheck_time() {
		return check_time;
	}

	public void setCheck_time(Timestamp check_time) {
		this.check_time = check_time;
	}
	public String getCheck_state() {
		return check_state;
	}

	public void setCheck_state(String check_state) {
		this.check_state = check_state;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public String getFile_id() {
		return file_id;
	}

	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	@Override
	public String toString() {
		return "GraduationMaterials [ id="
				+ id + ", practice_id=" + practice_id + ", stu_id=" + stu_id
				+ ", materials_type=" + materials_type + ", materials_name="
				+ materials_name + ", create_time=" + create_time
				+ ", check_time=" + check_time + ", check_state=" + check_state
				+ ", note=" + note + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + ", getPracticeTask()="
				+ ", getId()=" + getId()
				+ ", getPractice_id()=" + getPractice_id() + ", getStu_id()="
				+ getStu_id() + ", getMaterials_type()=" + getMaterials_type()
				+ ", getMaterials_name()=" + getMaterials_name()
				+ ", getCreate_time()=" + getCreate_time()
				+ ", getCheck_time()=" + getCheck_time()
				+ ", getCheck_state()=" + getCheck_state() + ", getNote()="
				+ getNote() + ", getTemp1()=" + getTemp1() + ", getTemp2()="
				+ getTemp2() + ", getTemp3()=" + getTemp3() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}


	
}
