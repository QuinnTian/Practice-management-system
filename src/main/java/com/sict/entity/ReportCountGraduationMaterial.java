package com.sict.entity;

public class  ReportCountGraduationMaterial{
	private String group_name; //小组名称
	private String head; //头标题
	private Integer group_number;//提交的分组人数
	private Integer idPassNum=0;//身份证通过的人数
	private Integer contractPassNum=0;//合同通过的人数
	private Integer idNoPassNum=0;//身份证未通过的人数
	private Integer contractNoPassNum=0;//合同未通过的人数
	private String id_pass_rate;//身份证通过率
	private String contract_pass_rate;//合同通过率
	private String count_id_pass_rate;//总的身份证通过率
	private String count_contract_pass_rate;//总的合同通过率
	private Integer countIdPassNum=0;//总的身份证通过的人数
	private Integer countContractPassNum=0;//总的合同通过的人数
	private Integer countIdNoPassNum=0;//总的身份证未通过的人数
	private Integer countContractNoPassNum=0;//总的合同未通过的人数	
	private Integer num_id_pass_rate=0;//总的身份证通过率
	private Integer num_contract_pass_rate=0;//总的合同通过率
	
	private Integer count_group_count_number=0;//总的分组人数
	private Integer group_count_number=0;//每个分组的总人数
	private String id_handin_rate;//身份证的上交率
	private String contract_handin_rate;//合同的上交率
	private String count_id_handin_rate;//总的身份证的上交率
	private String count_contract_handin_rate;//总的合同的上交率
	
	
	public Integer getCount_group_count_number() {
		return count_group_count_number;
	}
	public void setCount_group_count_number(Integer count_group_count_number) {
		this.count_group_count_number = count_group_count_number;
	}
	public String getCount_id_handin_rate() {
		return count_id_handin_rate;
	}
	public void setCount_id_handin_rate(String count_id_handin_rate) {
		this.count_id_handin_rate = count_id_handin_rate;
	}
	public String getCount_contract_handin_rate() {
		return count_contract_handin_rate;
	}
	public void setCount_contract_handin_rate(String count_contract_handin_rate) {
		this.count_contract_handin_rate = count_contract_handin_rate;
	}
	public Integer getGroup_count_number() {
		return group_count_number;
	}
	public void setGroup_count_number(Integer group_count_number) {
		this.group_count_number = group_count_number;
	}
	public String getId_handin_rate() {
		return id_handin_rate;
	}
	public void setId_handin_rate(String id_handin_rate) {
		this.id_handin_rate = id_handin_rate;
	}
	public String getContract_handin_rate() {
		return contract_handin_rate;
	}
	public void setContract_handin_rate(String contract_handin_rate) {
		this.contract_handin_rate = contract_handin_rate;
	}
	public Integer getNum_id_pass_rate() {
		return num_id_pass_rate;
	}
	public void setNum_id_pass_rate(Integer num_id_pass_rate) {
		this.num_id_pass_rate = num_id_pass_rate;
	}
	public Integer getNum_contract_pass_rate() {
		return num_contract_pass_rate;
	}
	public void setNum_contract_pass_rate(Integer num_contract_pass_rate) {
		this.num_contract_pass_rate = num_contract_pass_rate;
	}
	public Integer getCountIdPassNum() {
		return countIdPassNum;
	}
	public void setCountIdPassNum(Integer countIdPassNum) {
		this.countIdPassNum = countIdPassNum;
	}
	public Integer getCountContractPassNum() {
		return countContractPassNum;
	}
	public void setCountContractPassNum(Integer countContractPassNum) {
		this.countContractPassNum = countContractPassNum;
	}
	public Integer getCountIdNoPassNum() {
		return countIdNoPassNum;
	}
	public void setCountIdNoPassNum(Integer countIdNoPassNum) {
		this.countIdNoPassNum = countIdNoPassNum;
	}
	public Integer getCountContractNoPassNum() {
		return countContractNoPassNum;
	}
	public void setCountContractNoPassNum(Integer countContractNoPassNum) {
		this.countContractNoPassNum = countContractNoPassNum;
	}
	public String getCount_id_pass_rate() {
		return count_id_pass_rate;
	}
	public void setCount_id_pass_rate(String count_id_pass_rate) {
		this.count_id_pass_rate = count_id_pass_rate;
	}
	public String getCount_contract_pass_rate() {
		return count_contract_pass_rate;
	}
	public void setCount_contract_pass_rate(String count_contract_pass_rate) {
		this.count_contract_pass_rate = count_contract_pass_rate;
	}
	public Integer getIdNoPassNum() {
		return idNoPassNum;
	}
	public void setIdNoPassNum(Integer idNoPassNum) {
		this.idNoPassNum = idNoPassNum;
	}
	public Integer getContractNoPassNum() {
		return contractNoPassNum;
	}
	public void setContractNoPassNum(Integer contractNoPassNum) {
		this.contractNoPassNum = contractNoPassNum;
	}
	public Integer getIdPassNum() {
		return idPassNum;
	}
	public void setIdPassNum(Integer idPassNum) {
		this.idPassNum = idPassNum;
	}
	public Integer getContractPassNum() {
		return contractPassNum;
	}
	public void setContractPassNum(Integer contractPassNum) {
		this.contractPassNum = contractPassNum;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public Integer getGroup_number() {
		return group_number;
	}
	public void setGroup_number(Integer group_number) {
		this.group_number = group_number;
	}
	public String getId_pass_rate() {
		return id_pass_rate;
	}
	public void setId_pass_rate(String id_pass_rate) {
		this.id_pass_rate = id_pass_rate;
	}
	public String getContract_pass_rate() {
		return contract_pass_rate;
	}
	public void setContract_pass_rate(String contract_pass_rate) {
		this.contract_pass_rate = contract_pass_rate;
	}

	
}
