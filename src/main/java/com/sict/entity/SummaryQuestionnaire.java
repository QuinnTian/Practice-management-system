package com.sict.entity;

import java.sql.Timestamp;
import java.util.List;

public class SummaryQuestionnaire {
	
	
	private String id;
	private String title;//总结的标题
	private Timestamp createDate;//创建时间
	private String startDate;//总结开始时间
	private String endDate;//总结结束时间
	private String department;//适用部门
	private String user_id;//创建人id
	private String type;//总结的类型
	private String user_type;
	private String state;
	private String year;//学年
	private String studyLength;//学制
	private String temp1;			
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;							//总结创建日期
	private String isHaveSubmit;//是否有提交 吴敬国 2015-6-15 
	
	final static public String USER_TYPE_TEACHER = "1";
	final static public String USER_TYPE_STUDENT = "2";
	final static public String USER_TYPE_ADMIN   = "3";
	
	final static public String STATE_OPEN = "1";
	final static public String STATE_CLOSE = "0";
	
	final static public String TYPE_YEAR_SUMMARY = "1";
	final static public String TYPE_MONTH_SUMMARY = "2";
	final static public String TYPE_WEEK_SUMMARY = "3";
	final static public String TYPE_DAY_SUMMARY = "4";
	
	private int questionNum;							//问题数量
	private int commitNum;      //提交数量
	
	private SummaryQuestion summaryQuestion;
	private List<SummaryQuestion> summaryQuestions;
	
	public String getId() {
		return id;
	}
	public int getCommitNum() {
		return commitNum;
	}
	public void setCommitNum(int commitNum) {
		this.commitNum = commitNum;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	public int getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}
	public SummaryQuestion getSummaryQuestion() {
		return summaryQuestion;
	}
	public void setSummaryQuestion(SummaryQuestion summaryQuestion) {
		this.summaryQuestion = summaryQuestion;
	}
	public List<SummaryQuestion> getSummaryQuestions() {
		return summaryQuestions;
	}
	public void setSummaryQuestions(List<SummaryQuestion> summaryQuestions) {
		this.summaryQuestions = summaryQuestions;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getIsHaveSubmit() {
		return isHaveSubmit;
	}
	public void setIsHaveSubmit(String isHaveSubmit) {
		this.isHaveSubmit = isHaveSubmit;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getStudyLength() {
		return studyLength;
	}
	public void setStudyLength(String studyLength) {
		this.studyLength = studyLength;
	}
	@Override
	public String toString() {
		return "SummaryQuestionnaire [id=" + id + ", title=" + title
				+ ", createDate=" + createDate + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", department=" + department
				+ ", user_id=" + user_id + ", type=" + type + ", user_type="
				+ user_type + ", state=" + state + ", year=" + year
				+ ", studyLength=" + studyLength + ", temp1=" + temp1
				+ ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4=" + temp4
				+ ", temp5=" + temp5 + ", isHaveSubmit=" + isHaveSubmit
				+ ", questionNum=" + questionNum + ", commitNum=" + commitNum
				+ ", summaryQuestion=" + summaryQuestion
				+ ", summaryQuestions=" + summaryQuestions + "]";
	}
	
	
	
}
