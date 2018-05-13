package com.sict.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.ReportTrainDetailDao;
import com.sict.dao.TrainDetailDao;
import com.sict.entity.Groups;
import com.sict.entity.PracticeTask;
import com.sict.entity.ReportTrainDetail;
import com.sict.entity.Teacher;
import com.sict.entity.TrainDetail;
import com.sict.util.Common;

/**
 * 功能：管理员上传实训安排相关的service 
 * by吴敬国20141028 *
 * 	 吴敬国 2015-6-12 
 * */
@Repository(value = "trainDetailService")
@Transactional
public class TrainDetailService implements BasicService {
	@Autowired
	TrainDetailDao trainDetailDao;
	@Autowired
	private ReportTrainDetailDao reportTrainDetailDao;
	/**
	 * 注入teacherService wtt20140910 
	 */
	@Resource(name = "teacherService")
	private TeacherService teacherService;
	/**
	 * 注入orgService 
	 */
	@Resource(name = "orgService")
	private OrgService orgService;

	public List<TrainDetail> selectList(Object o) {
		return trainDetailDao.selectList(o);
	}
	public Object insert(Object o) {
		return trainDetailDao.insert(o);
	}
	public int update(Object o) {
		return trainDetailDao.update(o);
	}
	public int delete(Object o) {
		return this.trainDetailDao.delete(o);
	}
	public Object selectByID(String id) {
		return this.trainDetailDao.selectByID(id);
	}
	public Object insertOrUpdate(Object o) {
		return null;
	}
	public int selectCount(Object o) {
		return this.trainDetailDao.selectCount(o);
	}
	public void select(List<TrainDetail> lists) {
	}
	/**
	 * 功能：管理员 领导 实训安排报表 获取报表数据  
	 * 权限：admin、leader
	 * by张超 
	 * 	   吴敬国 2015年6月12日
	 * @param 
	 * @return
	 */
	public List<ReportTrainDetail> getReportData(Map mapYearAndOrgIdAndTerm){
		List<ReportTrainDetail> li = new ArrayList<ReportTrainDetail>();
		li  = reportTrainDetailDao.getReportTrainDetail(mapYearAndOrgIdAndTerm);
		return li;
	}
	/**
	 * 功能：获取报表title   权限：admin、leader
	 * @param org_id  暂时没用到
	 * @return
	 */
	public String getOrgName(String id){
		String org_name = reportTrainDetailDao.getOrgName(id);
		return org_name;
	}
	/**
	 * 功能：获取报表数据    实训安排报表  教师 权限：teacher
	 * 吴敬国 2015-6-12 备注
	 * @param map：year term
	 * @return
	 */
	public List<ReportTrainDetail> getTeacherReportData(String tea_code,String term,String begin_time,String end_time){
		Map<String, String> param=new HashMap<String, String>();
		param.put("tea_code", tea_code);
		param.put("term", term);
		param.put("begin_time", begin_time);
		param.put("end_time", end_time);
		List<ReportTrainDetail> li = new ArrayList<ReportTrainDetail>();
		li  = reportTrainDetailDao.getTeacherReportTrainDetail(param);
		return li;
	}
	/**
	 * 功能：获取一个组织的  数据
	 * 吴敬国2015-9-8
	 * @param map：year term
	 * @return
	 */
	public List<ReportTrainDetail> getOrgReportData(String org_id,String term,String begin_time,String end_time){
		List<ReportTrainDetail> OneOrgReportTrainDetailList = new ArrayList<ReportTrainDetail>();
		List<Teacher> teaList=teacherService.getTeachersByDeptId(org_id);
		for(Teacher tea:teaList){
			List<ReportTrainDetail> OneTeaReportTrainDetail=getTeacherReportData(tea.getTea_code(), term, begin_time, end_time);
			if(OneTeaReportTrainDetail.size()!=0){
				OneOrgReportTrainDetailList.addAll(OneTeaReportTrainDetail);
			}
		}
		return OneOrgReportTrainDetailList;
	}
	/**
	 * 根据学院id得到本学院的所有的实训安排信息 by王磊2015-1-29
	 */
	public List<TrainDetail> selectListByDeptid(String xy_id){
		return this.trainDetailDao.selectListByDeptid(xy_id);
	}
	/**
	 * 楚晨晨2015-5-27
	 */
	public List<TrainDetail> searchTrain(String task_id, Timestamp ts,Timestamp time) {
		return trainDetailDao.searchTrain(task_id, ts, time);
	}
	/**
	 * 根据部门id该部门的实训安排课表信息
	 * by王磊 2015年6月9日
	 * 
	 */
	public List<TrainDetail> selectByDeptId(String dept_id){
		return this.trainDetailDao.selectByDeptId(dept_id);
	}
	/**
	 * 获取实训安排的年份
	 * by王磊 2015年6月9日
	 * 
	 */
	public List<String> getYears(){
		return this.trainDetailDao.getYears();
	}
	/**
	 * @author 王磊
	 * @param Map(year,term,dept_id) 
	 * @return trainDetail
	 */
	public List<TrainDetail> getTrainsByTermAndYearAndDeptId(Map m){
		return this.trainDetailDao.getTrainsByTermAndYearAndDeptId(m);
	}
	/**
	 * @author 王磊
	 * @param Map(year,term,tea_id) 
	 * @return trainDetail
	 */
	public List<TrainDetail> getTrainsByTermAndYearAndTeaId(Map m){
		return this.trainDetailDao.getTrainsByTermAndYearAndTeaId(m);
	}
	
	/**
	 * 解析实训安排表 对表中数据进行的验证
	 * 2016-5-28
	 */
	public List<TrainDetail> validateTrainDwtailExcel(List<TrainDetail> td,String college_id) {
		// 对教师表的数据验证编号是否重复
		String infor = "";// 声明变量，存储表格中未按要求的信息存储。
		int count = 0;// 声明cuont变量，判断是否实训安排是否与数据库记录重复。
		int c;
		List<String> checkRight = new ArrayList();// 声明集合，判断表格中的记录是否重复。
		List<String> class_Numbers = new ArrayList();// 声明集合，储存职能。
		class_Numbers.add("一二节");
		class_Numbers.add("三四节");
		class_Numbers.add("五六节");
		class_Numbers.add("七八节");
		class_Numbers.add("九十节");
		List<String> termMonth = new ArrayList();// 声明集合，判断学期
		termMonth.add("08");
		termMonth.add("09");
		termMonth.add("10");
		termMonth.add("11");
		termMonth.add("12");
		termMonth.add("01");
		for (TrainDetail trainDetail : td) {
			PracticeTask pt = DictionaryService.findPracticeTask(trainDetail.getTask_id());
			Groups g = DictionaryService.findGroups(trainDetail.getGroup_id());
			if (pt == null) {
				infor = infor + "无此任务信息,";
			}
			;
			if (g == null) {
				infor = infor + "无此小组信息,";
			}
			;
			if (DictionaryService.findTeacher(trainDetail.getTea_id()) == null) {
				infor = infor + "无此老师信息,";
			} else {
				String deptId = DictionaryService.findTeacher(trainDetail.getTea_id()).getDept_id();
				c = orgService.checkDpetId(deptId, college_id);
				if (c == 0) {
					infor = infor + "教师所在部门不在当前学院中,";
				}
			}
			;
			if (DictionaryService.findCourses(trainDetail.getCourse_id()) == null) {
				infor = infor + "无此课程信息,";
			}
			;
			if (trainDetail.getTrain_time() == null) {
				infor = infor + "实训时间不能为空,";
			}
			if (trainDetail.getTrain_time().toString().length() >= 9) {
				String month = trainDetail.getTrain_time().toString();
				String nowMonth = month.substring(5, 7);
				if (termMonth.contains(nowMonth) == true) {
					trainDetail.setTrain_term(1);
				} else {
					trainDetail.setTrain_term(2);
				}
			} else {
				infor = infor + "实训时间有问题,";
			}
			if (trainDetail.getWeek_num() == null) {
				infor = infor + "周次不能为空,";
			}
			;
			if (trainDetail.getClass_num() == null) {
				infor = infor + "节次不能为空,";
			} else {
				if (class_Numbers.contains(trainDetail.getClass_num()) == true) {
				} else {
					infor = infor + " 节次格式不正确（例如：一二节）";
				}
			}
			if (trainDetail.getTrain_place() == null) {
				infor = infor + "实训地点不能为空,";
			}
			;
			String pj = trainDetail.getTask_id() + trainDetail.getGroup_id()
					+ trainDetail.getCourse_id() + trainDetail.getTea_id()
					+ trainDetail.getTrain_time() + trainDetail.getClass_num();
			if (checkRight.size() != 0) {
				infor = infor + Common.isCodeExist(pj, checkRight, "(任务，小组，课程，教师，时间，节次)");
			}
			;
			if (infor.trim().equals("")) {
				infor = "无";
			} else {
				String classNumber = trainDetail.getClass_num();
				String trainPlace = trainDetail.getTrain_place();
				int trainTerm = trainDetail.getTrain_term();
				trainDetail.setClass_num(null);
				trainDetail.setTrain_place(null);
				trainDetail.setTrain_term(null);
				count = this.selectCount(trainDetail);
				if (count != 0) {
					infor = infor + "此实训安排重复,    ";
				}
				;
				trainDetail.setClass_num(classNumber);
				trainDetail.setTrain_term(trainTerm);
				trainDetail.setTrain_place(trainPlace);
			}
			trainDetail.setTemp1(infor.trim());
			infor = "";
			checkRight.add(pj);
		}
		return td;
	}
	
	
	
}