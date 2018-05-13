package com.sict.entity;

import java.util.List;

public class SummaryQuestion {
	
	private String id;
	private String type;    //问题类型  单选 、多选。。
	private String other;	//是否有其他
	private String answer;	//是否必答
	private String title;  //问题标题
	private String style;  //样式 默认
	private String depend;  //依赖
	private String questionnaire_id; //总结id
	private String qindex;	//序列
	private String type_student;	//适合学生   吴敬国 2015-7-23
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;	//分析时，临时用为参与此问题的人数;
	
	private List<String> answerText;
	
	private int optionNum;
	private SummaryOption summaryOption;
	private List<SummaryOption> summaryOptions;
	private ChartModel chartModel;
	
	public ChartModel getChartModel() {
		return chartModel;
	}
	public void setChartModel(ChartModel chartModel) {
		this.chartModel = chartModel;
	}
	public static final String TYPE_MULTIPLECHOICE = "1";
	public static final String TYPE_SINGLECHOICE = "2";
	public static final String TYPE_TEXT = "3";
	public static final String TYPE_ILLUSTRATION = "4";
	
	public static final String TYPE_STUDENT_NOWORK = "1";  //没有工作
	public static final String TYPE_STUDENT_HAVEWORK = "2";  //有工作
	public static final String TYPE_STUDENT_ENTRANCE = "3";  //升学考试
	public static final String TYPE_STUDENT_COMMEN = "4";  //通用问题
	
	
	
	
	public static final String TYPE_CHOICE = TYPE_MULTIPLECHOICE +"," +TYPE_SINGLECHOICE;
	
	public static final String STYLE_DEFAULT = "1";
	
	public List<String> getAnswerText() {
		return answerText;
	}
	public void setAnswerText(List<String> answerText) {
		this.answerText = answerText;
	}

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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
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
	public String getType_student() {
		return type_student;
	}
	public void setType_student(String type_student) {
		this.type_student = type_student;
	}
	public String getQindex() {
		return qindex;
	}
	public void setQindex(String qindex) {
		this.qindex = qindex;
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
	


	public SummaryOption getSummaryOption() {
		return summaryOption;
	}
	public void setSummaryOption(SummaryOption summaryOption) {
		this.summaryOption = summaryOption;
	}
	public List<SummaryOption> getSummaryOptions() {
		return summaryOptions;
	}
	public void setSummaryOptions(List<SummaryOption> summaryOptions) {
		this.summaryOptions = summaryOptions;
	}
	public int getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}
	

}
