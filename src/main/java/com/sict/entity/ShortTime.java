package com.sict.entity;

import java.util.List;

public class ShortTime {
	private String id;
	private String org_id;
	private int allnum;
	private  double signnum;
	private String yearmouth;
	private String year;
	private String grade;
	
	public String getOrg_id() {
		return org_id;
	}

	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}

	public double getSignnum() {
		return signnum;
	}

	public void setSignnum(double signnum) {
		this.signnum = signnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public int getAllnum() {
		return allnum;
	}

	public void setAllnum(int allnum) {
		this.allnum = allnum;
	}



	public String getYearmouth() {
		return yearmouth;
	}

	public void setYearmouth(String yearmouth) {
		this.yearmouth = yearmouth;
	}

}
