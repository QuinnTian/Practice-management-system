package com.sict.entity;

import java.sql.Timestamp;

/**
 * InfocheckRecord entity. @author MyEclipse Persistence Tools
 */

public class InfoCheckRecord implements java.io.Serializable {

	// Fields

	private String id;
	private String checktask_id;//核对任务id
	private String stu_id;//学生id
	private Timestamp check_time;//核对时间
	private String check_result;//核对结果
	private String note;//备注 学生填写
	private String temp1;
	private String temp2;
	private String temp3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChecktask_id() {
		return checktask_id;
	}
	public void setChecktask_id(String checktask_id) {
		this.checktask_id = checktask_id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public Timestamp getCheck_time() {
		return check_time;
	}
	public void setCheck_time(Timestamp check_time) {
		this.check_time = check_time;
	}
	public String getCheck_result() {
		return check_result;
	}
	public void setCheck_result(String check_result) {
		this.check_result = check_result;
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
	@Override
	public String toString() {
		return "InfocheckRecord [id=" + id + ", checktask_id=" + checktask_id
				+ ", stu_id=" + stu_id + ", check_time=" + check_time
				+ ", check_result=" + check_result + ", note=" + note
				+ ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3=" + temp3
				+ "]";
	}



}