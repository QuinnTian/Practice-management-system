package com.sict.entity;

import java.util.List;

//echart series 封装类
public class EchartSeries {
	private String name;
	private String type;
	private String data="";

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

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public void setData(List<String> list,int size) {
		this.data="[";
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				this.data=data+list.get(i)+",";
			}
		}
		if(list.size()>0){
			if(list.size()!=size){
				for(int b=0;b<(size-list.size());b++){
					this.data=data+0+",";
				}
			}
			data=data.substring(0,data.lastIndexOf(","));
			this.data=data+"]";
		}else{
			for(int i=0;i<size;i++){
				this.data=data+0+",";
			}
			this.data=data.substring(0,data.lastIndexOf(","));
			this.data=data+"]";
		}
	}
	
}
