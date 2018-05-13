package com.sict.entity;

public class StuGraStateCount {
	private String deptId;		//部门id，如学院或系部
	private String stateCode;	//就业状态编码
	private String stuCount;	//学生人数
	
//	java.lang.NoSuchMethodException: com.sict.entity.StuGraStateCount.<init>()
	public StuGraStateCount(){};//用spring管理的实例对象必须包含一个无参的构造参数 by zcg 2015-2-6
	//自动生成构造函数
	public StuGraStateCount(String deptId, String stateCode, String stuCount) {
		super();
		this.deptId = deptId;
		this.stateCode = stateCode;
		this.stuCount = stuCount;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	public String getStuCount() {
		return stuCount;
	}
	public void setStuCount(String stuCount) {
		this.stuCount = stuCount;
	}
	
	
}
