package com.sict.service;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.GroupMembersDao;
import com.sict.dao.LogDao;
import com.sict.dao.OrgDao;
import com.sict.dao.ReportLogStateDao;
import com.sict.dao.TeacherDao;
import com.sict.entity.GroupMembers;
import com.sict.entity.Log;
import com.sict.entity.Org;
import com.sict.entity.ReportLogState;
import com.sict.entity.Teacher;

/**
 * 功能：学生实习状态分数相关的service 
 *  by吴敬国2015-5-31
 */
@Repository(value = "reportStudentStateService")
@Transactional
public class ReportStudentStateService {

	@Autowired
	private LogDao logdao;
	@Autowired
	private GroupMembersDao groupMembersdao;
	@Autowired
	private TeacherDao teacherdao;
	@Autowired
	private OrgDao orgdao;
	/**
	 * 功能：得到一个学生的分数
	 * by吴敬国
	 * 2015-5-31
	 * @param	String stu_id,String time
	 * @return int score
	 */
	public int getStateByOneStuIdAndTime(String stu_id,String time){
		int score=0;
		Log ReportLogStateData = logdao.selectStateByOneStuIdAndTime(stu_id,time);
		if(ReportLogStateData!=null){
			String state=ReportLogStateData.getPractice_state();
			if(DictionaryService.findStuGraStateName(state)!=null){
				score=DictionaryService.findStuGraStateName(state).getStateScore();
			}
		}
		return score;
	}

	/**
	 * 功能：得到一个教师的平均分数
	 * by吴敬国
	 * 2015-5-31
	 * @param	String stu_id,Timestamp time
	 * @return int score
	 */
	public int getTeaGrade(String tea_id,String time){
		List<GroupMembers> gm=groupMembersdao.selectBytea_id(tea_id);
		int allStuscore=0;
		int averScore=0;
		for(GroupMembers g:gm){
			String stu_id=g.getUser_id();
			int oneStuScore=getStateByOneStuIdAndTime(stu_id,time);
			allStuscore=oneStuScore+allStuscore;
		}
		int stuCount=gm.size();
		if(stuCount!=0){
			averScore=allStuscore/stuCount;
		}else{
			averScore=0;
		}
		return averScore;
	}
	
	/**
	 * 功能：得到一个系的平均分数
	 * by吴敬国
	 * 2015-5-31
	 * @param	String stu_id,Timestamp time
	 * @return int score
	 */
	public int getOnedeptGrade(String dept_id,String time){
		int allTeascore=0;
		int averScore=0;
		List<Teacher> tea=teacherdao.getTeachersByDeptId(dept_id);//如果没有教师加上判断
		for(Teacher t:tea){
			String tea_id=t.getId();
			int OneDeptScore=getTeaGrade(tea_id,time);
			allTeascore=allTeascore+OneDeptScore;
		}
		int teaCount=tea.size();
		if(teaCount!=0){
			averScore=allTeascore/teaCount;
		}else{
			averScore=0;
		}
		return averScore;
	}
	/**
	 * 功能：得到整个学院的分数
	 * by吴敬国
	 * 2015-5-31
	 * @param	String stu_id,Timestamp time
	 * @return int score
	 */
	public int getOneCollegeGrade(String college_id,String time){
		int allDeptscore=0;
		List<Org> org=orgdao.selectByXyId(college_id);
		for(Org o:org){
			String dept_id=o.getId();
			int OneCollegeGrade=getOnedeptGrade(dept_id,time);
			allDeptscore=allDeptscore+OneCollegeGrade;
		}
		int deptCount=org.size();
		int averScore=allDeptscore/deptCount;
		return averScore;
	}
	
	
	
	
	
}
