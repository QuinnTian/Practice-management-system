package com.sict.entity;

import java.util.List;

public class OnlineTestQuestion {
	
	private String id;
	private String type;
	private String other;	//是否有其他
	private String answer;	//是否必答
	private String title;
	private String style;
	private String depend;
	private String questionnaire_id;
	private String score;
	private String qindex;	//序列
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;	//分析时，临时用为参与此问题的人数;
	
	private String q_value;
	private int oNum;
	private OnlineTestOption onlineTestOption;
	private List<OnlineTestOption> onlineTestOptions;
	private ChartModel chartModel;
	
	public static final String type_multipleChoice = "1";
	public static final String type_singleChoice = "2";
	public static final String type_text = "3";
	public static final String type_illustration = "4";
	
	public static final String [] typeEnum = new String[]{"多选","单选","文本","说明"};
	
	public static final String getTypeNum(String typeStr){
		for (int i = 0; i < typeEnum.length; i++) {
			String str = typeEnum[i];
			if(str.equals(typeStr)){
				return String.valueOf(i+1);
			}
		}
		return null;
	}
	
	public static final String type_choice = type_multipleChoice +"," +type_singleChoice;
	
	public static final String style_default = "1";
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getDepend() {
		return depend;
	}
	public void setDepend(String depend) {
		this.depend = depend;
	}
	public String getQuestionnaire_id() {
		return questionnaire_id;
	}
	public void setQuestionnaire_id(String questionnaire_id) {
		this.questionnaire_id = questionnaire_id;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQindex() {
		return qindex;
	}
	public void setQindex(String qindex) {
		this.qindex = qindex;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public String getQ_value() {
		return q_value;
	}
	public void setQ_value(String q_value) {
		this.q_value = q_value;
	}
	public ChartModel getChartModel() {
		return chartModel;
	}
	public void setChartModel(ChartModel chartModel) {
		this.chartModel = chartModel;
	}
	public OnlineTestOption getOnlineTestOption() {
		return onlineTestOption;
	}
	public void setOnlineTestOption(OnlineTestOption onlineTestOption) {
		this.onlineTestOption = onlineTestOption;
	}
	public List<OnlineTestOption> getOnlineTestOptions() {
		return onlineTestOptions;
	}
	public void setOnlineTestOptions(List<OnlineTestOption> onlineTestOptions) {
		this.onlineTestOptions = onlineTestOptions;
	}

}
