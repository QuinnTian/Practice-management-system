package com.sict.entity;

public class StuGraState {
	String stateCode;//学生状态编码
	String stateDesc;//学生状态描述
	int stateScore;//学生状态分数
	public int getStateScore() {
		return stateScore;
	}
	public void setStateScore(int stateScore) {
		this.stateScore = stateScore;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	public String getStateDesc() {
		return stateDesc;
	}
	public void setStateDesc(String stateDesc) {
		this.stateDesc = stateDesc;
	}
	
	public StuGraState() {
		// TODO Auto-generated constructor stub
	}
	public StuGraState(String stateCode,String stateDesc,int stateScore) {
		// TODO Auto-generated constructor stub
		this.stateCode=stateCode;
		this.stateDesc=stateDesc;
		this.stateScore=stateScore;
	}

}
