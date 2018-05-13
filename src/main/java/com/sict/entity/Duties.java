package com.sict.entity;

import java.sql.Timestamp;

/**
 * @description 映射数据库中的 SJ_DUTIES数据表
 * @author 张向杨
 * @createDate 2016-05-25
 * @version 2.0
 * 
 * */
public class Duties {
	private String id;
	private String name; // 名称
	private String type; // 职务类型
	private String duties_desc; // 职务描述
	private String creator; // 创建人
	private Timestamp create_time; // 创建时间
	private String state; // 状态
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



	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Timestamp getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Timestamp create_time) {
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

	public String getDuties_desc() {
		return duties_desc;
	}

	public void setDuties_desc(String duties_desc) {
		this.duties_desc = duties_desc;
	}

	@Override
	public String toString() {
		return "Duties [id=" + id + ", name=" + name + ", type=" + type
				+ ", duties_desc=" + duties_desc + ", creator=" + creator
				+ ", create_time=" + create_time + ", state=" + state
				+ ", temp1=" + temp1 + ", temp2=" + temp2 + ", temp3=" + temp3
				+ ", temp4=" + temp4 + ", temp5=" + temp5 + "]";
	}

	// 方便测试


}
