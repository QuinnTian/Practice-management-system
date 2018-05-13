package com.sict.entity;

import java.sql.Timestamp;

public class TemporaryComplish{
	
	private String id;
	private double thesisscoreaccomplish;//论文完成度
	private double mothscoreaccomplish;//月总结完成度
	private String tea_id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getThesisscoreaccomplish() {
		return thesisscoreaccomplish;
	}
	public void setThesisscoreaccomplish(double thesisscoreaccomplish) {
		this.thesisscoreaccomplish = thesisscoreaccomplish;
	}
	public double getMothscoreaccomplish() {
		return mothscoreaccomplish;
	}
	public void setMothscoreaccomplish(double mothscoreaccomplish) {
		this.mothscoreaccomplish = mothscoreaccomplish;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
	}
	
	
}
