package com.sict.entity;

public class ChartData {
	private String name;
	private String value;
	private String color;
	private String text;
	
	public ChartData() {
		name = "";
		value = "";
		color = "";
	}

	public ChartData(String name, String value, String color) {
		super();
		this.name = name;
		this.value = value;
		this.color = color;
	}
	public ChartData(String name, String value, String color, String text) {
		super();
		this.name = name;
		this.value = value;
		this.color = color;
		this.text = text;
	}
	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "ChartData [name=" + name + ", value=" + value + ", color="
				+ color + "]";
	}
}
