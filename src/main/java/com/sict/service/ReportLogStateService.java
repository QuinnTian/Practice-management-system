package com.sict.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.ReportLogStateDao;
import com.sict.entity.ReportLogState;
import com.sict.entity.ReportLogStateTreated;

@Repository(value = "reportLogStateService")
@Transactional
public class ReportLogStateService {

@Autowired
private ReportLogStateDao dao;

	/*
	 * 获取处理过的日志状态数据
	 */
	public List<ReportLogStateTreated> getReportLogStateTreatedData(String college_id){
		List<ReportLogStateTreated> reportLogStateTreated = new ArrayList();//处理过的数据
		List<ReportLogState> ReportLogStateData = new ArrayList();
		//获取一个学院的原始日志状态数据
		ReportLogStateData = getReportLogStateData(college_id);
		//获取处理过的日志数据
		reportLogStateTreated = handleReportLogStateData(ReportLogStateData,college_id);
		return reportLogStateTreated;
	}
	/*
	 * 获取原始日志状态数据
	 */
	private List<ReportLogState> getReportLogStateData(String college_id){
		//List<ReportLogState> ReportLogStateData = new ArrayList();
		List<ReportLogState> ReportLogStateData = dao.selectOneCollegeReportLogState(college_id);
		return ReportLogStateData;
	}
	/*
	 * 获取处理过的日志数据  处理获得的原始数据
	 */
	private List<ReportLogStateTreated> handleReportLogStateData(List<ReportLogState> ReportLogStateData,String college_id){
		List<ReportLogStateTreated> reportLogStateTreated = new ArrayList();
		//取得状态对应的分数
		getStateCorrespondingScore(ReportLogStateData);
		//付给学生信息对应的月份
		setMonthData(ReportLogStateData);
		//取得对应的报表数据
		reportLogStateTreated = getReportData(ReportLogStateData,college_id);
		return reportLogStateTreated;
	}
	/*
	 * 处理数据得到状态相应的分数
	 */
	private void getStateCorrespondingScore(List<ReportLogState> ReportLogStateData){
		for(int i=0;i<ReportLogStateData.size();i++){
			String state = ReportLogStateData.get(i).getPractice_state();
			int score=DictionaryService.findStuGraStateName(state).getStateScore();
			ReportLogStateData.get(i).setScore(score);
		}
	}
	/*
	 * 处理日期数据得到相应的月份  
	 * 把相应的日期划分到不同的月份 吴敬国 2015年5月28日
	 * 
	 */
	private void setMonthData(List<ReportLogState> ReportLogStateData){
		for(int i=0;i<ReportLogStateData.size();i++){
			String begin_time = ReportLogStateData.get(i).getOperate_time();
			String begin_time_m_d=begin_time.substring(5,10);
			DateFormat dateFormat = new SimpleDateFormat("MM-dd");
			Date begin_time_date = new Date();
			try {
				//月份定义，如果是周，以后可以在这修改。比如初始化开始时间等操作
				begin_time_date = dateFormat.parse(begin_time_m_d);
				String January_start = "01-00";
				Date January_start_date = new Date();
				January_start_date = dateFormat.parse(January_start);
				String January_end = "01-32";
				Date January_end_date = new Date();
				January_end_date = dateFormat.parse(January_end);
				String February_start = "02-00";
				Date February_start_date = new Date();
				February_start_date = dateFormat.parse(February_start);
				String February_end = "02-30";
				Date February_end_date = new Date();
				February_end_date = dateFormat.parse(February_end);
				String March_start = "03-00";
				Date March_start_date = new Date();
				March_start_date = dateFormat.parse(March_start);
				String March_end = "03-32";
				Date March_end_date = new Date();
				March_end_date = dateFormat.parse(March_end);
				String April_start = "04-00";
				Date April_start_date = new Date();
				April_start_date = dateFormat.parse(April_start);
				String April_end = "04-31";
				Date April_end_date = new Date();
				April_end_date = dateFormat.parse(April_end);
				String May_start = "05-00";
				Date May_start_date = new Date();
				May_start_date = dateFormat.parse(May_start);
				String May_end = "05-32";
				Date May_end_date = new Date();
				May_end_date = dateFormat.parse(May_end);
				String June_start = "06-00";
				Date June_start_date = new Date();
				June_start_date = dateFormat.parse(June_start);
				String June_end = "06-31";
				Date June_end_date = new Date();
				June_end_date = dateFormat.parse(June_end);
				String July_start = "07-00";
				Date July_start_date = new Date();
				July_start_date = dateFormat.parse(July_start);
				String July_end = "07-32";
				Date July_end_date = new Date();
				July_end_date = dateFormat.parse(July_end);
				String August_start = "08-00";
				Date August_start_date = new Date();
				August_start_date = dateFormat.parse(August_start);
				String August_end = "08-32";
				Date August_end_date = new Date();
				August_end_date = dateFormat.parse(August_end);
				String September_start = "09-00";
				Date September_start_date = new Date();
				September_start_date =  dateFormat.parse(September_start);
				String September_end = "09-31";
				Date September_end_date = new Date();
				September_end_date = dateFormat.parse(September_end);
				String October_start = "10-00";
				Date October_start_date = new Date();
				October_start_date = dateFormat.parse(October_start);
				String October_end = "10-32";
				Date October_end_date = new Date();
				October_end_date = dateFormat.parse(October_end);
				String November_start = "11-00";
				Date November_start_date = new Date();
				November_start_date = dateFormat.parse(November_start);
				String November_end = "11-31";
				Date November_end_date = new Date();
				November_end_date =  dateFormat.parse(November_end);
				String December_start = "12-00";
				Date December_start_date = new Date();
				December_start_date = dateFormat.parse(December_start);
				String December_end = "12-32";
				Date December_end_date = new Date();
				December_end_date = dateFormat.parse(December_end);
			if(begin_time_date.after(January_start_date)&&begin_time_date.before(January_end_date)){
				ReportLogStateData.get(i).setMonth("一月");
			}else if(begin_time_date.after(February_start_date)&&begin_time_date.before(February_end_date)){
				ReportLogStateData.get(i).setMonth("二月");
			}else if(begin_time_date.after(March_start_date)&&begin_time_date.before(March_end_date)){
				ReportLogStateData.get(i).setMonth("三月");
			}else if(begin_time_date.after(April_start_date)&&begin_time_date.before(April_end_date)){
				ReportLogStateData.get(i).setMonth("四月");
			}else if(begin_time_date.after(May_start_date)&&begin_time_date.before(May_end_date)){
				ReportLogStateData.get(i).setMonth("五月");
			}else if(begin_time_date.after(June_start_date)&&begin_time_date.before(June_end_date)){
				ReportLogStateData.get(i).setMonth("六月");
			}else if(begin_time_date.after(July_start_date)&&begin_time_date.before(July_end_date)){
				ReportLogStateData.get(i).setMonth("七月");
			}else if(begin_time_date.after(August_start_date)&&begin_time_date.before(August_end_date)){
				ReportLogStateData.get(i).setMonth("八月");
			}else if(begin_time_date.after(September_start_date)&&begin_time_date.before(September_end_date)){
				ReportLogStateData.get(i).setMonth("九月");
			}else if(begin_time_date.after(October_start_date)&&begin_time_date.before(October_end_date)){
				ReportLogStateData.get(i).setMonth("十月");
			}else if(begin_time_date.after(November_start_date)&&begin_time_date.before(November_end_date)){
				ReportLogStateData.get(i).setMonth("十一月");
			}else if(begin_time_date.after(December_start_date)&&begin_time_date.before(December_end_date)){
				ReportLogStateData.get(i).setMonth("十二月");
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}
	/*
	 * 获取报表需要的数据，传进来的参数有成绩、有月份   学院id
	 */
	private List<ReportLogStateTreated> getReportData(List<ReportLogState> ReportLogStateData,String college_id){
		//获得每个月份对应的总人数、总分数
		List<ReportLogStateTreated> ReportLogStateTreated = new ArrayList();//如果按顺序排列可以不用ArrayList
		for(int i=0;i<ReportLogStateData.size();i++){
			System.out.println(ReportLogStateData.get(i).getMonth());
			if(ReportLogStateData.get(i).getMonth().equals("一月")){//按月份进行分类，重新组合数据，组成需要传入报表的数据
				double total_stu_number_1 = 0;//学生人数
				total_stu_number_1++;
				double total_score_1 = 0; //分数
				total_score_1 = ReportLogStateData.get(i).getScore()+total_score_1;
				double avg_1 = total_score_1/total_stu_number_1; //求的平均分
				ReportLogStateTreated reportLogStateTreated_1 = new ReportLogStateTreated();//开始组织报表数据
				reportLogStateTreated_1.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_1.setAvg_score(avg_1);
				reportLogStateTreated_1.setMonth("一月");
				reportLogStateTreated_1.setTotal_score(total_score_1);
				reportLogStateTreated_1.setTotal_stu_num(total_stu_number_1);
				ReportLogStateTreated.add(reportLogStateTreated_1);
			}else if(ReportLogStateData.get(i).getMonth().equals("二月")){
				double total_stu_number_2 = 0;
				total_stu_number_2++;
				double total_score_2 = 0;
				total_score_2 = ReportLogStateData.get(i).getScore()+total_score_2;
				double avg_2 = total_score_2/total_stu_number_2;
				ReportLogStateTreated reportLogStateTreated_2 = new ReportLogStateTreated();
				reportLogStateTreated_2.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_2.setAvg_score(avg_2);
				reportLogStateTreated_2.setMonth("二月");
				reportLogStateTreated_2.setTotal_score(total_score_2);
				reportLogStateTreated_2.setTotal_stu_num(total_stu_number_2);
				ReportLogStateTreated.add(reportLogStateTreated_2);

			}else if(ReportLogStateData.get(i).getMonth().equals("三月")){
				double total_stu_number_3 = 0;
				total_stu_number_3++;
				double total_score_3 = 0;
				total_score_3 = ReportLogStateData.get(i).getScore()+total_score_3;
				double avg_3 = total_score_3/total_stu_number_3;
				ReportLogStateTreated reportLogStateTreated_3 = new ReportLogStateTreated();
				reportLogStateTreated_3.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_3.setAvg_score(avg_3);
				reportLogStateTreated_3.setMonth("三月");
				reportLogStateTreated_3.setTotal_score(total_score_3);
				reportLogStateTreated_3.setTotal_stu_num(total_stu_number_3);
				ReportLogStateTreated.add(reportLogStateTreated_3);

			}else if(ReportLogStateData.get(i).getMonth().equals("四月")){
				double total_stu_number_4 = 0;
				total_stu_number_4++;
				double total_score_4 = 0;
				total_score_4 = ReportLogStateData.get(i).getScore()+total_score_4;
				double avg_4 = total_score_4/total_stu_number_4;
				ReportLogStateTreated reportLogStateTreated_4 = new ReportLogStateTreated();
				reportLogStateTreated_4.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_4.setAvg_score(avg_4);
				reportLogStateTreated_4.setMonth("四月");
				reportLogStateTreated_4.setTotal_score(total_score_4);
				reportLogStateTreated_4.setTotal_stu_num(total_stu_number_4);
				ReportLogStateTreated.add(reportLogStateTreated_4);

			}else if(ReportLogStateData.get(i).getMonth().equals("五月")){
				double total_stu_number_5 = 0;
				total_stu_number_5++;
				double total_score_5 = 0;
				total_score_5 = ReportLogStateData.get(i).getScore()+total_score_5;
				double avg_5 = total_score_5/total_stu_number_5;
				ReportLogStateTreated reportLogStateTreated_5 = new ReportLogStateTreated();
				reportLogStateTreated_5.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_5.setAvg_score(avg_5);
				reportLogStateTreated_5.setMonth("五月");
				reportLogStateTreated_5.setTotal_score(total_score_5);
				reportLogStateTreated_5.setTotal_stu_num(total_stu_number_5);
				ReportLogStateTreated.add(reportLogStateTreated_5);
			}else if(ReportLogStateData.get(i).getMonth().equals("六月")){
				double total_stu_number_6 = 0;
				total_stu_number_6++;
				double total_score_6 = 0;
				total_score_6 = ReportLogStateData.get(i).getScore()+total_score_6;
				double avg_6 = total_score_6/total_stu_number_6;
				ReportLogStateTreated reportLogStateTreated_6 = new ReportLogStateTreated();
				reportLogStateTreated_6.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_6.setAvg_score(avg_6);
				reportLogStateTreated_6.setMonth("六月");
				reportLogStateTreated_6.setTotal_score(total_score_6);
				reportLogStateTreated_6.setTotal_stu_num(total_stu_number_6);
				ReportLogStateTreated.add(reportLogStateTreated_6);

			}else if(ReportLogStateData.get(i).getMonth().equals("七月")){
				double total_stu_number_7 = 0;
				total_stu_number_7++;
				double total_score_7 = 0;
				total_score_7 = ReportLogStateData.get(i).getScore()+total_score_7;
				double avg_7 = total_score_7/total_stu_number_7;
				ReportLogStateTreated reportLogStateTreated_7 = new ReportLogStateTreated();
				reportLogStateTreated_7.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_7.setAvg_score(avg_7);
				reportLogStateTreated_7.setMonth("七月");
				reportLogStateTreated_7.setTotal_score(total_score_7);
				reportLogStateTreated_7.setTotal_stu_num(total_stu_number_7);
				ReportLogStateTreated.add(reportLogStateTreated_7);

			}else if(ReportLogStateData.get(i).getMonth().equals("八月")){
				double total_stu_number_8 = 0;
				total_stu_number_8++;
				double total_score_8 = 0;
				total_score_8 = ReportLogStateData.get(i).getScore()+total_score_8;
				double avg_8 = total_score_8/total_stu_number_8;
				ReportLogStateTreated reportLogStateTreated_8 = new ReportLogStateTreated();
				reportLogStateTreated_8.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_8.setAvg_score(avg_8);
				reportLogStateTreated_8.setMonth("八月");
				reportLogStateTreated_8.setTotal_score(total_score_8);
				reportLogStateTreated_8.setTotal_stu_num(total_stu_number_8);
				ReportLogStateTreated.add(reportLogStateTreated_8);

			}else if(ReportLogStateData.get(i).getMonth().equals("九月")){
				double total_stu_number_9 = 0;
				total_stu_number_9++;
				double total_score_9 = 0;
				total_score_9 = ReportLogStateData.get(i).getScore()+total_score_9;
				double avg_9 = total_score_9/total_stu_number_9;
				ReportLogStateTreated reportLogStateTreated_9 = new ReportLogStateTreated();
				reportLogStateTreated_9.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_9.setAvg_score(avg_9);
				reportLogStateTreated_9.setMonth("九月");
				reportLogStateTreated_9.setTotal_score(total_score_9);
				reportLogStateTreated_9.setTotal_stu_num(total_stu_number_9);
				ReportLogStateTreated.add(reportLogStateTreated_9);

			}else if(ReportLogStateData.get(i).getMonth().equals("十月")){
				double total_stu_number_10 = 0;
				total_stu_number_10++;
				double total_score_10 = 0;
				total_score_10 = ReportLogStateData.get(i).getScore()+total_score_10;
				double avg_10 = total_score_10/total_stu_number_10;
				ReportLogStateTreated reportLogStateTreated_10 = new ReportLogStateTreated();
				reportLogStateTreated_10.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_10.setAvg_score(avg_10);
				reportLogStateTreated_10.setMonth("十月");
				reportLogStateTreated_10.setTotal_score(total_score_10);
				reportLogStateTreated_10.setTotal_stu_num(total_stu_number_10);
				ReportLogStateTreated.add(reportLogStateTreated_10);

			}else if(ReportLogStateData.get(i).getMonth().equals("十一月")){
				double total_stu_number_11 = 0;
				total_stu_number_11++;
				double total_score_11 = 0;
				total_score_11 = ReportLogStateData.get(i).getScore()+total_score_11;
				double avg_11 = total_score_11/total_stu_number_11;
				ReportLogStateTreated reportLogStateTreated_11 = new ReportLogStateTreated();
				reportLogStateTreated_11.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_11.setAvg_score(avg_11);
				reportLogStateTreated_11.setMonth("十一月");
				reportLogStateTreated_11.setTotal_score(total_score_11);
				reportLogStateTreated_11.setTotal_stu_num(total_stu_number_11);
				ReportLogStateTreated.add(reportLogStateTreated_11);

			}else if(ReportLogStateData.get(i).getMonth().equals("十二月")){
				double total_stu_number_12 = 0;
				total_stu_number_12++;
				double total_score_12 = 0;
				total_score_12 = ReportLogStateData.get(i).getScore()+total_score_12;
				double avg_12 = total_score_12/total_stu_number_12;
				ReportLogStateTreated reportLogStateTreated_12 = new ReportLogStateTreated();
				reportLogStateTreated_12.setCollege(DictionaryService.findOrg(college_id).getOrg_name());
				reportLogStateTreated_12.setAvg_score(avg_12);
				reportLogStateTreated_12.setMonth("十二月");
				reportLogStateTreated_12.setTotal_score(total_score_12);
				reportLogStateTreated_12.setTotal_stu_num(total_stu_number_12);
				ReportLogStateTreated.add(reportLogStateTreated_12);
			}
		}
		return ReportLogStateTreated;
	}
	

	
}
