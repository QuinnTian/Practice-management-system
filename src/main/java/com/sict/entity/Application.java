package com.sict.entity;

import java.sql.Timestamp;

public class Application {
	private String id;
	private String sla_type;
	private String sla_place;
	private String sla_rank;
	private String sla_stu;
	private Timestamp sla_time;
	private String sla_real_students_id;
	private Timestamp sla_begin_time;
	private Timestamp sla_end_time;
	private String sla_duration;
	private String sla_reason_desc;
	private String is_level_school;
	private String sla_effects;
	private String sla_approval_state;
	private String final_approval_tea;
	private Timestamp final_approval_time;
	private String sla_code;
	private String sla_leave_type;
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;

	private String sla_org_id;

	public String getSla_org_id() {
		return sla_org_id;
	}

	public void setSla_org_id(String sla_org_id) {
		this.sla_org_id = sla_org_id;
	}

	public String getSla_code() {
		return sla_code;
	}

	public void setSla_code(String sla_code) {
		this.sla_code = sla_code;
	}

	public String getSla_leave_type() {
		return sla_leave_type;
	}

	public void setSla_leave_type(String sla_leave_type) {
		this.sla_leave_type = sla_leave_type;
	}

	public String getSla_effects() {
		return sla_effects;
	}

	public void setSla_effects(String sla_effects) {
		this.sla_effects = sla_effects;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSla_type() {
		return sla_type;
	}

	public void setSla_type(String sla_type) {
		this.sla_type = sla_type;
	}

	public String getSla_place() {
		return sla_place;
	}

	public void setSla_place(String sla_place) {
		this.sla_place = sla_place;
	}

	public String getSla_rank() {
		return sla_rank;
	}

	public void setSla_rank(String sla_rank) {
		this.sla_rank = sla_rank;
	}

	public String getSla_stu() {
		return sla_stu;
	}

	public void setSla_stu(String sla_stu) {
		this.sla_stu = sla_stu;
	}

	public Timestamp getSla_time() {
		return sla_time;
	}

	public void setSla_time(Timestamp sla_time) {
		this.sla_time = sla_time;
	}

	public String getSla_real_students_id() {
		return sla_real_students_id;
	}

	public void setSla_real_students_id(String sla_real_students_id) {
		this.sla_real_students_id = sla_real_students_id;
	}

	public Timestamp getSla_begin_time() {
		return sla_begin_time;
	}

	public void setSla_begin_time(Timestamp sla_begin_time) {
		this.sla_begin_time = sla_begin_time;
	}

	public Timestamp getSla_end_time() {
		return sla_end_time;
	}

	public void setSla_end_time(Timestamp sla_end_time) {
		this.sla_end_time = sla_end_time;
	}

	public String getSla_duration() {
		return sla_duration;
	}

	public void setSla_duration(String sla_duration) {
		this.sla_duration = sla_duration;
	}

	public String getSla_reason_desc() {
		return sla_reason_desc;
	}

	public void setSla_reason_desc(String sla_reason_desc) {
		this.sla_reason_desc = sla_reason_desc;
	}

	public String getIs_level_school() {
		return is_level_school;
	}

	public void setIs_level_school(String is_level_school) {
		this.is_level_school = is_level_school;
	}

	public String getSla_approval_state() {
		return sla_approval_state;
	}

	public void setSla_approval_state(String sla_approval_state) {
		this.sla_approval_state = sla_approval_state;
	}

	public String getFinal_approval_tea() {
		return final_approval_tea;
	}

	public void setFinal_approval_tea(String final_approval_tea) {
		this.final_approval_tea = final_approval_tea;
	}

	public Timestamp getFinal_approval_time() {
		return final_approval_time;
	}

	public void setFinal_approval_time(Timestamp final_approval_time) {
		this.final_approval_time = final_approval_time;
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
		return "Application [id=" + id + ", sla_type=" + sla_type + ", sla_place=" + sla_place + ", sla_rank="
				+ sla_rank + ", sla_stu=" + sla_stu + ", sla_time=" + sla_time + ", sla_real_students_id="
				+ sla_real_students_id + ", sla_begin_time=" + sla_begin_time + ", sla_end_time=" + sla_end_time
				+ ", sla_duration=" + sla_duration + ", sla_reason_desc=" + sla_reason_desc + ", is_level_school="
				+ is_level_school + ", sla_effects=" + sla_effects + ", sla_approval_state=" + sla_approval_state
				+ ", final_approval_tea=" + final_approval_tea + ", final_approval_time=" + final_approval_time
				+ ", sla_code=" + sla_code + ", sla_leave_type=" + sla_leave_type + ", temp1=" + temp1 + ", temp2="
				+ temp2 + ", temp3=" + temp3 + ", temp4=" + temp4 + ", temp5=" + temp5 + ", sla_org_id=" + sla_org_id
				+ "]";
	}

}
