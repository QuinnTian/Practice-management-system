package com.sict.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sict.dao.LevelApprovalDao;
import com.sict.dao.campus.AssociationDao;
import com.sict.dao.campus.AssociationMembersDao;
import com.sict.entity.LevelApproval;
import com.sict.entity.Org;
import com.sict.entity.Student;
import com.sict.util.Common;

@Repository(value = "levelApprovalService")
@Transactional
public class LevelApprovalService implements BasicService<LevelApproval> {

	@Autowired
	private LevelApprovalDao levelApprovalDao;
	@Autowired
	private AssociationMembersDao associationMembersDao;
	@Autowired
	private AssociationDao associationDao;

	public List<LevelApproval> selectList(LevelApproval levelApproval) {

		return levelApprovalDao.selectList(levelApproval);
	}

	public LevelApproval insert(LevelApproval levelApproval) {
		levelApproval.setId(Common.returnUUID());
		levelApprovalDao.insert(levelApproval);
		return null;
	}

	public int update(LevelApproval levelApproval) {
		return levelApprovalDao.update(levelApproval);
	}

	public int delete(LevelApproval levelApproval) {
		return levelApprovalDao.delete(levelApproval);
	}

	public LevelApproval selectByID(String id) {

		return levelApprovalDao.selectByID(id);
	}

	public LevelApproval insertOrUpdate(LevelApproval levelApproval) {
		return null;
	}

	public int selectCount(LevelApproval levelApproval) {
		return levelApprovalDao.selectCount(levelApproval);
	}

	/**
	 * 根据申请ID获取审批记录 by 师杰 20160118
	 */
	public LevelApproval selectByLevel_App_ID(String id) {
		return levelApprovalDao.selectByLevel_App_ID(id);
	}

	/**
	 * 根班级id 获得对应的审批记录
	 * 
	 * @author 张向杨
	 * @param classId
	 * @since 2016-04-21
	 * @return List<LevelApproval>
	 */
	public List<LevelApproval> selectByClassId(String classId) {

		return levelApprovalDao.selectByClassId(classId);
	}

	/**
	 * 根学院id 获得对应的审批记录
	 * 
	 * 
	 * @author 张向杨
	 * @param collegeId
	 *            可以是学院id、系部id、班级id
	 * @param approvalState
	 *            审批状态
	 * @param teacherId
	 *            审批老师
	 * @param leaveType
	 *            假条类型
	 * @param flag
	 *            标识符：true按照sla_code分组 false不分组
	 * @param date
	 *            审批时间
	 * @since 2016-05-03
	 * @return List<LevelApproval>
	 * 
	 * 
	 * 
	 * @UpdateAuthor 张向杨
	 * @updateDate 2016-05-19 修改内容：新增参数 date 兼容根据指定日期模糊查询
	 */
	public List<LevelApproval> selectByCollegeIdAndApprovalStateAndleaveType(String collegeId, String approvalState,
			String teacherId, String leaveType, boolean flag, String date) {
		Org org = DictionaryService.findOrg(collegeId);
		Map<String, Object> map = new HashMap<String, Object>();
		if (teacherId != null) {
			String tempTeacherId = teacherId;
			String newFlag = teacherId.substring(teacherId.length() - 5, teacherId.length());
			if (newFlag.equals("other")) {
				teacherId = newFlag;
				map.put("teaId", tempTeacherId.substring(0, tempTeacherId.length() - 5));
			}
			if (newFlag.equals("othes")) {
				teacherId = newFlag;
				map.put("teaId", tempTeacherId.substring(0, tempTeacherId.length() - 5));
			}
		}
		map.put("type", org.getOrg_level());
		map.put("teacherId", teacherId);
		map.put("collegeId", collegeId);
		map.put("approvalState", approvalState);
		map.put("leaveType", leaveType);
		map.put("flag", flag);
		map.put("date", date);
		return levelApprovalDao.selectByCollegeIdAndApprovalStateAndleaveType(map);
	}

	/**
	 * 功能： 根据申请人id，请假条类型 获得对应的审批记录
	 * 
	 * @author 张向杨
	 * @param stuId
	 *            申请人id
	 * @param leaveType
	 *            请假条类型
	 * @param b
	 *            是否去除请假条编码相同的记录 true:去除 false:不去除
	 * @since 2016-05-13
	 * @return List<LevelApproval>
	 */
	public List<LevelApproval> selectByStuIdAndLeaveType(String stuId, String leaveType, boolean b, String date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stuId", stuId);
		map.put("leaveType", leaveType);
		map.put("b", b);
		map.put("date", date);
		return levelApprovalDao.selectByStuIdAndLeaveType(map);
	}

	/**
	 * 根班级id 获得对应的有效的请假记录
	 * 
	 * @author 丁乐晓
	 * @param classId
	 * @since 2016-05-12
	 * @return List<LevelApproval>
	 */
	public List<LevelApproval> selectPassByClassId(String classid, String sla_effects) {

		return levelApprovalDao.selectPassByClassId(classid, sla_effects);
	}

	/**
	 * ajax遍历传入集合
	 * 
	 * @author 张向杨
	 * @param levelApprovalList
	 * @param student
	 * @param flag
	 * @since 2016-05-20
	 * @return 集合元素的字符串
	 */
	public String ajaxErgodic(List<LevelApproval> levelApprovalList) {
		StringBuilder sb = new StringBuilder();
		int i = 0;
		Student student = null;
		sb.append("<thead><tr><th>序号</th><th>请假学生</th><th>组织</th><th>请假类型</th><th>请假原因</th><th>申请人</th><th>申请时间</th><th>开始时间</th><th>结束时间</th><th>请假时长</th><th>审批意见</th><th>审批人</th><th>审批时间</th><th>学生电话</th><th>家长电话</th><th>审批状态</th></tr></thead>");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (LevelApproval levelApproval : levelApprovalList) {
			String studentNames = "";// 记录集体请假的人名
			String[] real_students_id_arr = null;// 记录及其请假id
			// 个人请假
			String initName = "";
			int record = 0;
			if (levelApproval.getApplication().getSla_leave_type().equals("1")) {
				student = DictionaryService.findStudent(levelApproval.getApplication().getSla_real_students_id());
			} else {
				String real_students_id = levelApproval.getApplication().getSla_real_students_id();
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

			sb.append("<tr>");
			sb.append("<td>" + (++i) + "</td>");
			if (levelApproval.getApplication().getSla_leave_type().equals("1")) {
				sb.append("<td>" + student.getTrue_name() + "</td>");
				sb.append("<td>" + DictionaryService.findOrg(student.getClass_id()).getOrg_name() + "</td>");
			} else {
				sb.append("<td>");
				String aa = "<button type='button' class='btn btn-default' title='请假人姓名' id='"
						+ levelApproval.getApplication().getSla_code() + "' data-container='body' "
						+ "onmouseover='mouseover(" + "\"" + levelApproval.getApplication().getSla_code() + "\"" + ")'"
						+ " onmouseout=" + "'mouseout(" + "\"" + levelApproval.getApplication().getSla_code() + "\""
						+ ")' " + " data-toggle='popover'  data-placement='bottom' data-content='" + studentNames
						+ "'>" + initName + "等" + real_students_id_arr.length + "人" + "</button>";

				sb.append(aa);
				sb.append("</td>");
				String leaveType = levelApproval.getApplication().getSla_leave_type();
				if (leaveType.equals("2")) {
					String applyClassId = DictionaryService.findStudent(levelApproval.getApplication().getSla_stu())
							.getClass_id();
					sb.append("<td>" + DictionaryService.findOrg(applyClassId).getOrg_name() + "</td>");
				} else if (leaveType.equals("3") || leaveType.equals("4")) {
					sb.append("<td>"
							+ DictionaryService.findAssociation(levelApproval.getApplication().getSla_org_id())
									.getSa_name() + "</td>");
				}
			}

			if ("1".equals(levelApproval.getApplication().getSla_leave_type())) {
				sb.append("<td>" + "个人 请假" + "</td>");
			} else if ("2".equals(levelApproval.getApplication().getSla_leave_type())) {
				sb.append("<td>" + "班级请假" + "</td>");
			} else if ("3".equals(levelApproval.getApplication().getSla_leave_type())) {
				sb.append("<td>" + "学生会请假" + "</td>");
			} else if ("4".equals(levelApproval.getApplication().getSla_leave_type())) {
				sb.append("<td>" + "社团请假" + "</td>");
			}
			sb.append("<td>" + levelApproval.getApplication().getSla_reason_desc() + "</td>");

			Student applyStudent = DictionaryService.findStudent(levelApproval.getApplication().getSla_stu());
			sb.append("<td>" + applyStudent.getTrue_name() + "</td>");
			sb.append("<td>"
					+ df.format(levelApproval.getApplication().getSla_time()).substring(0,
							df.format(levelApproval.getApplication().getSla_time()).length() - 3) + "</td>");

			sb.append("<td>"
					+ df.format(levelApproval.getApplication().getSla_begin_time()).substring(0,
							df.format(levelApproval.getApplication().getSla_begin_time()).length() - 3) + "</td>");

			sb.append("<td>"
					+ df.format(levelApproval.getApplication().getSla_end_time()).substring(0,
							df.format(levelApproval.getApplication().getSla_end_time()).length() - 3) + "</td>");

			sb.append("<td>" + levelApproval.getApplication().getSla_duration() + "</td>");
			sb.append("<td>" + levelApproval.getApproval_opinion() + "</td>");
			sb.append("<td>" + DictionaryService.findTeacher(levelApproval.getApproval_tea()).getTrue_name() + "</td>");

			sb.append("<td>"
					+ df.format(levelApproval.getApproval_time()).substring(0,
							df.format(levelApproval.getApproval_time()).length() - 3) + "</td>");

			if (levelApproval.getApplication().getSla_leave_type().equals("1")) {
				sb.append("<td>" + student.getPhone() + "</td>");
				sb.append("<td>" + student.getHome_phone() + "</td>");
			} else {
				sb.append("<td>" + applyStudent.getPhone() + "</td>");
				sb.append("<td>" + applyStudent.getHome_phone() + "</td>");
			}
			if (levelApproval.getApproval_state().equals("1"))
				sb.append("<td>" + "进行中" + "</td>");
			else if (levelApproval.getApproval_state().equals("2"))
				sb.append("<td>" + "审批结束" + "</td>");
			else
				sb.append("<td>" + "数据有误" + "</td>");

		}

		return sb.toString();
	}

}
