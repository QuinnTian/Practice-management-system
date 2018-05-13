package com.sict.service;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.ApplicationDao;
import com.sict.dao.campus.AssociationDao;
import com.sict.dao.campus.AssociationMembersDao;
import com.sict.entity.Application;
import com.sict.entity.AssociationMembers;
import com.sict.entity.Org;
import com.sict.entity.Student;
import com.sict.util.Common;

/**
 * 功能：Application相关的service 使用 @Repository 注释 TeacherDao by周睿20160115 *
 * 
 * */
@Repository(value = "applicationService")
@Transactional
public class ApplicationService implements BasicService<Application> {

	@Autowired
	ApplicationDao applicationDao;
	@Autowired
	private AssociationMembersDao associationMembersDao;
	@Autowired
	private AssociationDao associationDao;

	public List<Application> selectList(Application application) {
		return applicationDao.selectList(application);
	}

	public Application insert(Application application) {
		application.setId(Common.returnUUID());
		application.setSla_approval_state("1");
		application.setSla_time(Common.getNowTime());
		// DictionaryService.updateLevelApplication(application);/* 更新数据字典的数据syj
		this.applicationDao.insert(application);
		return null;
	}

	public int update(Application application) {
		// DictionaryService.updateLevelApplication(application);/* 更新数据字典的数据syj
		// */
		return this.applicationDao.update(application);

	}

	public int delete(Application application) {
		/* DictionaryService.deleteLevelApplication(application.getId()); *//* 更新数据字典的数据sjy */
		return this.applicationDao.delete(application);
	}

	public Application selectByID(String id) {
		return this.applicationDao.selectByID(id);
	}

	public Application insertOrUpdate(Application application) {
		this.applicationDao.insert(application);
		return null;
	}

	public int selectCount(Application application) {

		return this.applicationDao.selectCount(application);
	}

	/**
	 * by 师杰 20160116
	 */
	public List<Application> selectByTea_id(String tea_id) {
		return applicationDao.selectByTea_id(tea_id);
	}

	/**
	 * 功能：根据班级id、审批状态、请假类型 查询到该班级内的所有学生的请假记录
	 * 
	 * @author 张向杨
	 * @param classId
	 *            可以为学院id 系部id、班级id
	 * 
	 * @param approvalState
	 *            审批状态
	 * 
	 * @param leaveType
	 *            假条类型
	 * 
	 * @param flag
	 *            booean 标记是否去除查询出来的 sla_code的重复项 true:去除 ;false不去除
	 * @since 2016-04-20
	 * */
	public List<Application> selectListByClassIdAndApprovalStateAndleaveType(String classId, String approvalState,
			String leaveType, boolean flag) {
		Org org = DictionaryService.findOrg(classId);
		Map<String, Object> map = new HashMap<String, Object>();
		String type = null;
		if ("1".equals(org.getOrg_level())) {// 学校
			type = "1";
		} else if ("2".equals(org.getOrg_level())) {// 学院
			type = "2";
		} else if ("3".equals(org.getOrg_level())) {// 系部
			type = "3";
		} else if ("4".equals(org.getOrg_level())) {// 专业
			type = "4";
		} else if ("5".equals(org.getOrg_level())) {// 班级
			type = "5";
		}
		map.put("type", type);
		map.put("classId", classId);
		map.put("approvalState", approvalState);
		map.put("leaveType", leaveType);
		map.put("flag", flag);
		return applicationDao.selectListByClassIdAndApprovalStateAndleaveType(map);
	}

	/**
	 * 根据审批状态获取申请信息by 李秋林 20160425
	 */
	public List<Application> selectByApproval_state(String state) {

		return applicationDao.selectByApproval_state(state);
	}

	/**
	 * 功能： 根据学院id查询学院所用学生的请假记录（包括审批通过、未通过、进行中等）
	 * 
	 * @author 张向杨
	 * @param college_id
	 *            学院id
	 * @param approvalState
	 *            审批状态
	 * @since 2016-05-03
	 * @return List<Application>
	 */
	public List<Application> selectByCollegeIdAndApprovalState(String collegeId, String approvalState) {
		return applicationDao.selectByCollegeIdAndApprovalState(collegeId, approvalState);
	}

	/**
	 * 根据查询时间获得那天的请假数据 by宋浩 20160506
	 */
	public List<Application> selectBySla_time(String sla_time) {
		return applicationDao.selectBySla_time(sla_time);
	}

	/**
	 * 功能： 查询请假条当天请假条的最大编码
	 * 
	 * @author 张向杨
	 * @param code
	 *            请假编码的 学院和日期部分（请假编码=学院编号+当天日期+4位数值）
	 * @return 返回当天请假记录编码最大的记录
	 * @createTime 2016-05-12
	 * */
	public Application selectMaxCode(String code) {

		return applicationDao.selectMaxCode(code);
	}

	/**
	 * 功能：查询给定参数的请假记录
	 * 
	 * @author 张向杨
	 * @param stuId
	 *            申请人id
	 * @param leaveType
	 *            请假条类型
	 * @param approvalState
	 *            审批状态
	 * @param b
	 *            booean 是否去除请假条编码相同的记录 true:去除 false:不去除
	 * @param date
	 *            请假时间
	 * @return List<>
	 * @createTime 2016-05-12 添加date字段 2016-05-19 张邦卿
	 * */
	public List<Application> selectByStuIdAndLeaveTypeAndApprovalState(String stuId, String leaveType,
			String approvalState, boolean b, String date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stuId", stuId);
		map.put("leaveType", leaveType);
		map.put("approvalState", approvalState);
		map.put("b", b);
		map.put("date", date);
		return applicationDao.selectByStuIdAndLeaveTypeAndApprovalState(map);
	}

	/**
	 * 功能：通过学生ID、时间和影响范围判断此学生当前是否处于请假期间
	 * 
	 * @author 李达 2016.5.15
	 * @param stu_id
	 *            ,nowtime
	 * @return Application
	 */
	public Application CheckByStuId(String stu_id, Timestamp nowtime, String scope) {
		return applicationDao.CheckByStuId(stu_id, nowtime, scope);
	}

	/**
	 * 根学院id 获得对应的审批记录
	 * 
	 * 
	 * @author 张邦卿
	 * @param collegeId
	 *            可以是学院id、系部id、班级id
	 * @param approvalState
	 *            审批状态
	 * @param leaveType
	 *            假条类型
	 * @param flag
	 *            标识符：true按照sla_code分组 false不分组
	 * @param date
	 *            申请时间
	 * @since 2016-05-20
	 * @return List<application>
	 */
	public List<Application> selectByCollegeIdAndApprovalStateAndleaveTypeSla_time(String collegeId,
			String approvalState, String leaveType, boolean flag, String date) {
		Org org = DictionaryService.findOrg(collegeId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", org.getOrg_level());
		map.put("collegeId", collegeId);
		map.put("approvalState", approvalState);
		map.put("leaveType", leaveType);
		map.put("flag", flag);
		map.put("date", date);
		return applicationDao.selectByCollegeIdAndApprovalStateAndleaveTypeSla_time(map);
	}

	/**
	 * ajax遍历传入集合
	 * 
	 * @author 张向杨
	 * @param applicationList
	 * @param student
	 * @param flag
	 * @since 2016-05-20
	 * @return 集合元素的字符串
	 */
	public String ajaxErgodic(List<Application> applicationList, Student student, String flag) {
		StringBuilder sb = new StringBuilder();
		int i = 0;
		Student stu = null;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (Application application : applicationList) {
			String[] real_students_id_arr = null;// 记录及其请假id
			String studentNames = "";// 记录集体请假的人名
			// 个人请假
			String initName = "";
			int record = 0;
			if (application.getSla_leave_type().equals("1")) {
				student = DictionaryService.findStudent(application.getSla_real_students_id());
			} else {
				String real_students_id = application.getSla_real_students_id();
				real_students_id_arr = real_students_id.split(",");

				for (String str : real_students_id_arr) {
					studentNames += DictionaryService.findStudent(str.trim()).getTrue_name() + ",";
					if (record > 1) {
						continue;
					}
					record++;
					initName += DictionaryService.findStudent(str.trim()).getTrue_name() + ",";
				}
			}

			stu = DictionaryService.findStudent(application.getSla_real_students_id());

			sb.append("<tr>");
			sb.append("<td>" + (++i) + "</td>");
			if (!(flag.equals("stuQuery"))) {

				if (application.getSla_leave_type().equals("1")) {
					sb.append("<td>" + student.getTrue_name() + "</td>");
					sb.append("<td>" + DictionaryService.findOrg(student.getClass_id()).getOrg_name() + "</td>");
				} else {
					sb.append("<td>");
					String aa = "<button type='button' class='btn btn-default' title='请假人姓名' id='"
							+ application.getSla_code() + "' data-container='body' " + "onmouseover='mouseover(" + "\""
							+ application.getSla_code() + "\"" + ")'" + " onmouseout=" + "'mouseout(" + "\""
							+ application.getSla_code() + "\"" + ")' "
							+ " data-toggle='popover'  data-placement='bottom' data-content='" + studentNames + "'>"
							+ initName + "等" + real_students_id_arr.length + "人" + "</button>";

					sb.append(aa);
					sb.append("</td>");
					String leaveType = application.getSla_leave_type();
					AssociationMembers associationMembers = null;
					if (leaveType.equals("2")) {
						sb.append("<td>" + DictionaryService.findOrg(student.getClass_id()).getOrg_name() + "</td>");
					} else if (leaveType.equals("3") || leaveType.equals("4")) {
						sb.append("<td>" + DictionaryService.findAssociation(application.getSla_org_id()).getSa_name()
								+ "</td>");

					}

				}
			}
			if ("1".equals(application.getSla_leave_type())) {
				sb.append("<td>" + "个人请假" + "</td>");
			} else {
				sb.append("<td>" + "集体请假" + "</td>");
			}
			sb.append("<td>" + application.getSla_reason_desc() + "</td>");

			Student applyStudent = DictionaryService.findStudent(application.getSla_stu());
			sb.append("<td>" + applyStudent.getTrue_name() + "</td>");
			sb.append("<td>"
					+ df.format(application.getSla_time()).substring(0,
							df.format(application.getSla_time()).length() - 3) + "</td>");

			sb.append("<td>"
					+ df.format(application.getSla_begin_time()).substring(0,
							df.format(application.getSla_begin_time()).length() - 3) + "</td>");

			sb.append("<td>"
					+ df.format(application.getSla_end_time()).substring(0,
							df.format(application.getSla_end_time()).length() - 3) + "</td>");

			sb.append("<td>" + application.getSla_duration() + "</td>");
			if ((flag.equals("stuQuery"))) {
				sb.append("<td>" + "无法获取" + "</td>");
			}
			if (application.getFinal_approval_tea() != null) {
				sb.append("<td>" + DictionaryService.findTeacher(application.getFinal_approval_tea()).getTrue_name()
						+ "</td>");

				sb.append("<td>"
						+ df.format(application.getFinal_approval_time()).substring(0,
								df.format(application.getFinal_approval_time()).length() - 3) + "</td>");
			} else {
				sb.append("<td>" + "无" + "</td>");
				sb.append("<td>" + "无" + "</td>");

			}

			if (application.getSla_leave_type().equals("1")) {
				sb.append("<td>" + student.getPhone() + "</td>");
				sb.append("<td>" + student.getHome_phone() + "</td>");
			} else {
				sb.append("<td>" + applyStudent.getPhone() + "</td>");
				sb.append("<td>" + applyStudent.getHome_phone() + "</td>");
			}
			if (application.getSla_approval_state().equals("1"))
				sb.append("<td>" + "审批中" + "</td>");
			else if (application.getSla_approval_state().equals("2"))
				sb.append("<td>" + "同意" + "</td>");
			else if (application.getSla_approval_state().equals("3"))
				sb.append("<td>" + "不同意" + "</td>");
			else if (application.getSla_approval_state().equals("4"))
				sb.append("<td>" + "院领导审批中" + "</td>");
			else if (application.getSla_approval_state().equals("5"))
				sb.append("<td>" + "院领导同意" + "</td>");
			else if (application.getSla_approval_state().equals("6"))
				sb.append("<td>" + "院领导不同意" + "</td>");
		}
		return sb.toString();
	}
}
