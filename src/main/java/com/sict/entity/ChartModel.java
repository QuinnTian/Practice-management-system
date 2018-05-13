package com.sict.entity;

import java.util.List;

public class ChartModel {
	private List<ChartData> listData;

	public List<ChartData> getListData() {
		return listData;
	}

	public void setListData(List<ChartData> listData) {
		this.listData = listData;
	}

	public String getJsonData(){
		String result="[";
		for(ChartData d : listData){
			//将各学院的name变成简称   2016/4/14  杨梦肖
			String  name=d.getName();
			if(name.equals("金融高等职业学院")){
				name="金融";
			}
			if(name.equals("外语与国际交流学院")){
				name="外交";
			}
			if(name.equals("会计学院")){
				name="会计";
			}
			if(name.equals("工商管理学院")){
				name="工管";
			}
			if(name.equals("艺术与建筑学院")){
				name="艺建";
			}
			if(name.equals("人文学院")){
				name="人文";
			}
			if(name.equals("电子信息学院")){
				name="电信";
			}
			if(name.equals("食品药品学院")){
				name="食药";
			}
			if(name.equals("机电与汽车学院")){
				name="机电";
			}
			
			result += ("{name : '"+name);
			result += ("',value : '"+d.getValue());
			result += ("',color : '"+d.getColor() +"'},");
		}
		if(result.length() >= 2){
			result = result.substring(0,result.length()-1);
		}
		result += "]";
		return result;
	}
	/**
	 * 增加text属性	by 郑春光 2015-2-11
	 * @return
	 */
	public String getJsonDataNew(){
		String result="[";
		for(ChartData d : listData){
			result += ("{name : '"+d.getText());
			result += ("',value : '"+d.getValue());
			result += ("',text : '"+d.getName());
			result += ("',color : '"+d.getColor() +"'},");
		}
		if(result.length() >= 2){
			result = result.substring(0,result.length()-1);
		}
		result += "]";
		return result;
	}
	
	
	
	
}
