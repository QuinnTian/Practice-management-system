package com.sict.entity;

import java.sql.Timestamp;

/**
 * SjPracticeApply entity. @author MyEclipse Persistence Tools
 */

public class PracticeRecord {

	private String id;
	private String practice_id;//实习任务id
	private Timestamp apply_time;//申请时间
	private String stu_id;//学生id
    private String company_id;//企业id
	private String post_id;//岗位
	private String is_netsign;//是否网签
	private String is_contract;//是否签合同
	private String leader;//部门领导
	private String com_teacher;//企业指导老师
	private String com_phone;//企业老师电话
	private Timestamp check_time;//核对时间
	private String check_state;//核对状态
	private Timestamp work_time;//到岗时间
	private Timestamp prct_contract_time;//实习协议时间
	private Timestamp netsign_time;//网签时间
	private Timestamp contract_time;//合同时间
	private Timestamp dimission_time;//离职时间
	private String com_orgion;//公司地区
	private String work_orgion;//工作地区
	private String note;//备注
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
	public Timestamp getApply_time() {
		return apply_time;
	}
	public void setApply_time(Timestamp apply_time) {
		this.apply_time = apply_time;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	
	public String getIs_netsign() {
		return is_netsign;
	}
	public void setIs_netsign(String is_netsign) {
		this.is_netsign = is_netsign;
	}
	public String getIs_contract() {
		return is_contract;
	}
	public void setIs_contract(String is_contract) {
		this.is_contract = is_contract;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getCom_teacher() {
		return com_teacher;
	}
	public void setCom_teacher(String com_teacher) {
		this.com_teacher = com_teacher;
	}
	public String getCom_phone() {
		return com_phone;
	}
	public void setCom_phone(String com_phone) {
		this.com_phone = com_phone;
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
	public Timestamp getWork_time() {
		return work_time;
	}
	public void setWork_time(Timestamp work_time) {
		this.work_time = work_time;
	}
	public Timestamp getPrct_contract_time() {
		return prct_contract_time;
	}
	public void setPrct_contract_time(Timestamp prct_contract_time) {
		this.prct_contract_time = prct_contract_time;
	}
	public Timestamp getNetsign_time() {
		return netsign_time;
	}
	public void setNetsign_time(Timestamp netsign_time) {
		this.netsign_time = netsign_time;
	}
	public Timestamp getContract_time() {
		return contract_time;
	}
	public void setContract_time(Timestamp contract_time) {
		this.contract_time = contract_time;
	}
	public Timestamp getDimission_time() {
		return dimission_time;
	}
	public void setDimission_time(Timestamp dimission_time) {
		this.dimission_time = dimission_time;
	}
	public String getCom_orgion() {
		return com_orgion;
	}
	public void setCom_orgion(String com_orgion) {
		this.com_orgion = com_orgion;
	}
	public String getWork_orgion() {
		return work_orgion;
	}
	public void setWork_orgion(String work_orgion) {
		this.work_orgion = work_orgion;
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
		return "PracticeRecord [id=" + id + ", practice_id=" + practice_id
				+ ", apply_time=" + apply_time + ", stu_id=" + stu_id
				+ ", company_id=" + company_id + ", post_id=" + post_id
				+ ", is_netsign=" + is_netsign + ", is_contract=" + is_contract
				+ ", leader=" + leader + ", com_teacher=" + com_teacher
				+ ", com_phone=" + com_phone + ", check_time=" + check_time
				+ ", check_state=" + check_state + ", work_time=" + work_time
				+ ", prct_contract_time=" + prct_contract_time
				+ ", netsign_time=" + netsign_time + ", contract_time="
				+ contract_time + ", dimission_time=" + dimission_time
				+ ", com_orgion=" + com_orgion + ", work_orgion=" + work_orgion
				+ ", note=" + note + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", temp3=" + temp3 + "]";
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	
	
}