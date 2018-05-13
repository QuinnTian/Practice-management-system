package com.sict.entity;

import java.sql.Date;

public class ClassRoom {
	private String id;
	private String scr_code;// 教室编号
	private String scr_name;// 教室名称
	private String scr_floor;// 楼层
	private String scr_num;// 楼号
	private String scr_capabilit;// 容纳人数
	private String scr_type;// 教室类型
	private String scr_userdept;// 所属部门
	private String scr_contacat;// 负责人id
	private String scr_devices;// 配套描述
	private String scr_note;// 备注
	private String scr_campus;// 校区
	private String create_people;// 创建人
	private Date create_time;// 创建时间
	private String state;// 状态 默认为1
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getScr_code() {
		return scr_code;
	}

	public void setScr_code(String scr_code) {
		this.scr_code = scr_code;
	}

	public String getScr_name() {
		return scr_name;
	}

	public void setScr_name(String scr_name) {
		this.scr_name = scr_name;
	}

	public String getScr_floor() {
		return scr_floor;
	}

	public void setScr_floor(String scr_floor) {
		this.scr_floor = scr_floor;
	}

	

	public String getScr_num() {
		return scr_num;
	}

	public void setScr_num(String scr_num) {
		this.scr_num = scr_num;
	}

	public String getScr_capabilit() {
		return scr_capabilit;
	}

	public void setScr_capabilit(String scr_capabilit) {
		this.scr_capabilit = scr_capabilit;
	}

	public String getScr_type() {
		return scr_type;
	}

	public void setScr_type(String scr_type) {
		this.scr_type = scr_type;
	}

	public String getScr_userdept() {
		return scr_userdept;
	}

	public void setScr_userdept(String scr_userdept) {
		this.scr_userdept = scr_userdept;
	}

	public String getScr_contacat() {
		return scr_contacat;
	}

	public void setScr_contacat(String scr_contacat) {
		this.scr_contacat = scr_contacat;
	}

	public String getScr_devices() {
		return scr_devices;
	}

	public void setScr_devices(String scr_devices) {
		this.scr_devices = scr_devices;
	}

	public String getScr_note() {
		return scr_note;
	}

	public void setScr_note(String scr_note) {
		this.scr_note = scr_note;
	}

	public String getScr_campus() {
		return scr_campus;
	}

	public void setScr_campus(String scr_campus) {
		this.scr_campus = scr_campus;
	}

	public String getCreate_people() {
		return create_people;
	}

	public void setCreate_people(String create_people) {
		this.create_people = create_people;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	@Override
	public String toString() {
		return "ClassRoom [id=" + id + ", scr_code=" + scr_code + ", scr_name="
				+ scr_name + ", scr_floor=" + scr_floor + ", scr_num="
				+ scr_num + ", scr_capabilit=" + scr_capabilit + ", scr_type="
				+ scr_type + ", scr_userdept=" + scr_userdept
				+ ", scr_contacat=" + scr_contacat + ", scr_devices="
				+ scr_devices + ", scr_note=" + scr_note + ", scr_campus="
				+ scr_campus + ", create_people=" + create_people
				+ ", create_time=" + create_time + ", state=" + state
				+ ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3=" + temp3
				+ ", temp4=" + temp4 + ", temp5=" + temp5 + "]";
	}

	

}
