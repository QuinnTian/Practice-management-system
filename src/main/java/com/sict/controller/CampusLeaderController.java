package com.sict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sict.entity.Application;
import com.sict.entity.LevelApproval;
import com.sict.entity.Org;
import com.sict.entity.Teacher;
import com.sict.service.ApplicationService;
import com.sict.service.DictionaryService;
import com.sict.service.LevelApprovalService;
import com.sict.service.OrgService;
import com.sict.util.Common;

/*
 * 功能：手机端领导控制器
 * 使用 @Controller 注释
 * byxzw 2015年11月17日10:36:58	 * 
 * 
 * */
@Controller
public class CampusLeaderController {

	/**
	 * @author WuGee
	 * @param modelMap
	 * @param request
	 * @param response
	 * @return 跳转至首页
	 * @throws IOException
	 * @throws ServletException
	 *             2015年12月2日14:44:06
	 */

	/**
	 * 注入levelApprovalService by李秋林20160421 *
	 * 
	 * */
	@Resource(name = "levelApprovalService")
	private LevelApprovalService levelApprovalService;

	/**
	 * 注入orgService by李秋林20160421 *
	 * 
	 * */
	@Resource(name = "orgService")
	private OrgService orgService;

	/**
	 * 注入applicationService by李秋林20160421 *
	 * 
	 * */
	@Resource(name = "applicationService")
	private ApplicationService applicationService;

	@RequestMapping("CampusLeader/index.do")
	public String toIndex(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		return "/campusViews/campusLeader/index";
	}

	// ----------2016-05-21 张向杨 start -----------------------------
	/**
	 * 院领导:查看督导员或者班主任抄送同学的请假申请
	 * 
	 * @author 李秋林
	 * @since 2016-4-21
	 * @param session
	 *            回话对象
	 * @param modelMap
	 * @throws IOException
	 *             ServletException
	 * */
	@RequestMapping("CampusLeader/web/seeStudentLeaveList.do")
	public String seeStudentLeaveList(ModelMap modelMap, HttpSession session) throws IOException, ServletException {
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		// "4":推送给院领导的假条
		// "1":个人请假类型
		List<LevelApproval> levelApprList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
				Common.getCollegeId(teacher.getDept_id()), "4", null, "1", false, null);

		List<Org> selectByXueYuanId = orgService.getCollegeAndAllDeptByCollegeID(Common.getCollegeId(teacher
				.getDept_id()));

		for (int i = 0; i < selectByXueYuanId.size(); i++) {
			if (selectByXueYuanId.get(i).getOrg_level().equals("2")) {
				selectByXueYuanId.remove(i);
			}
		}
		for (Org org : selectByXueYuanId) {
			// 一个系部的集体请假
			List<LevelApproval> teamLeaveList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
					org.getId(), "4", null, "234", true, null);
			for (int x = 0; x < teamLeaveList.size(); x++) {
				// 记录一个系部 集体请假学生的id
				String realStudentsId = null;
				// 记录一个系部 集体请假审批的id
				String levelApprovalId = null;
				// 记录一个系部 集体请假的申请id
				String applicationId = null;

				List<LevelApproval> temp = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
						org.getId(), "4", null, "234", false, null);
				for (int j = 0; j < temp.size(); j++) {
					if (teamLeaveList.get(x).getApplication().getSla_code()
							.equals(temp.get(j).getApplication().getSla_code())) {

						if (realStudentsId == null && levelApprovalId == null && applicationId == null) {
							realStudentsId = teamLeaveList.get(x).getApplication().getSla_real_students_id();
							levelApprovalId = temp.get(j).getId();
							applicationId = temp.get(j).getApplication().getId();
						} else {
							realStudentsId += "," + temp.get(j).getApplication().getSla_real_students_id();
							levelApprovalId += "," + temp.get(j).getId();
							applicationId += "," + temp.get(j).getApplication().getId();
						}

					}
				}
				teamLeaveList.get(x).getApplication().setSla_real_students_id(realStudentsId);
				teamLeaveList.get(x).setId(levelApprovalId);
				teamLeaveList.get(x).getApplication().setId(applicationId);
				// 集体请假添加到集合
				levelApprList.add(teamLeaveList.get(x));
			}
		}

		modelMap.put("ApprovalLevelNumber", levelApprList.size());
		modelMap.put("levelApprList", levelApprList);

		return "/campusViews/campusLeader/seeStudentLeaveList";
	}

	/**
	 * 院领导 ： 处理审批假条
	 * 
	 * @author 作者名
	 * @param id
	 *            请假id
	 * @param levelApprovalId
	 *            辅导员或者班主任审批记录的id
	 * @param approval_opinion
	 *            审批意见
	 * @param userChoose
	 *            用户选择操作
	 * @param session
	 *            session对象
	 * @createTime 2016-05-03
	 * */
	@RequestMapping("CampusLeader/web/ApprovalLeave.do")
	public String doApprovalLeave(String id, String levelApprovalId, String approval_opinion, String userChoose,
			HttpSession session) {

		if (id != null && approval_opinion != null && userChoose != null) {

			if (id.length() == 32) {
				id += ",";
			}
			if (levelApprovalId.length() == 32) {
				levelApprovalId += "";
			}
			String[] realStudentLeaveIdArr = id.split(",");
			String[] levelApprovalArr = levelApprovalId.split(",");
			for (int i = 0; i < realStudentLeaveIdArr.length; i++) {
				// 得到审批的记录
				Application application = applicationService.selectByID(realStudentLeaveIdArr[i].trim());

				LevelApproval levelApproval = new LevelApproval();
				levelApproval.setLevel_application_id(realStudentLeaveIdArr[i].trim());
				levelApproval.setApproval_tea(Common.getOneTeaId(session));
				levelApproval.setApproval_time(Common.getNowTime());
				levelApproval.setApproval_state("2");// 2:审批结束
				levelApproval.setApproval_opinion(approval_opinion);

				if (application.getSla_leave_type().equals("1")) {// 个人请假
					levelApproval.setLast_approval_id(levelApprovalId);// 第一次审批id
				} else {// 集体请假
					levelApproval.setLast_approval_id(levelApprovalArr[i].trim());// 第一次审批id
				}

				if (userChoose.equals("y")) { // 同意
					levelApproval.setIs_approval_pass("1");
					application.setSla_approval_state("5");
				} else if (userChoose.equals("n")) {// 不同意
					levelApproval.setIs_approval_pass("2");
					application.setSla_approval_state("6");
				}

				application.setFinal_approval_tea(Common.getOneTeaId(session));
				application.setFinal_approval_time(Common.getNowTime());
				// 更新请假审批表和请假申请表
				levelApprovalService.insert(levelApproval);
				applicationService.update(application);
			}

		}
		return "redirect:seeStudentLeaveList.do";
	}

	/**
	 * 院领导： 通过 ajax获得学生已审批记录（通过、不通过、其他老师审批的记录）
	 * 
	 * @author 张向杨
	 * @param flag
	 *            标记用户点击的按钮
	 * @param response
	 *            HttpServletResponse对象
	 * @param session
	 *            HttpSession对象
	 * @throws IOException
	 * @since 2016-04-21
	 * 
	 * @updateAuthor 张向杨
	 * @updateDate 2016-05-19 修改内容：增加date参数 用于兼容根据日期查询
	 * @param date
	 *            检索日期
	 * */
	@RequestMapping("CampusLeader/web/ajaxGetApprovalLeave.do")
	public String ajaxGetApprovalLeave(String flag, String date, HttpServletResponse response, HttpSession session)
			throws IOException {
		// 时间过滤
		if ("null".equals(date)) {
			date = null;
		}
		response.setCharacterEncoding("utf-8");
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		List<LevelApproval> approvalLevelApprList = null;
		// 查看通过、未通过记录
		if (teacher != null) {
			// 个人
			if ("no".equals(flag)) {// 审批未通过
				approvalLevelApprList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
						Common.getCollegeId(teacher.getDept_id()), "6", teacher.getId(), "1", false, date);

			} else if ("yes".equals(flag)) {// 审批已通过
				approvalLevelApprList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
						Common.getCollegeId(teacher.getDept_id()), "5", teacher.getId(), "1", false, date);

			} else if ("others".equals(flag)) {// 其他院领导审批
				approvalLevelApprList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
						Common.getCollegeId(teacher.getDept_id()), "56", teacher.getId() + "other", "1", false, date);
			} else {
				approvalLevelApprList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
						Common.getCollegeId(teacher.getDept_id()), "56", teacher.getId(), "1", false, date);
			}
			String approvalState = null;
			String techerId = null;
			// 集体
			if ("no".equals(flag)) {// 审批未通过
				approvalState = "6";
				techerId = teacher.getId();
			} else if ("yes".equals(flag)) {// 审批已通过
				approvalState = "5";
				techerId = teacher.getId();
			} else if ("others".equals(flag)) {// 其他领导审批
				approvalState = "56";
				techerId = teacher.getId() + "other";
			} else {
				approvalState = "56";
				techerId = teacher.getId();
			}

			List<Org> selectByXueYuanId = orgService.getCollegeAndAllDeptByCollegeID(Common.getCollegeId(teacher
					.getDept_id()));
			// "4":推送给院领导的假条
			// "2":集体请假类型
			for (int i = 0; i < selectByXueYuanId.size(); i++) {
				if (selectByXueYuanId.get(i).getOrg_level().equals("2")) {
					selectByXueYuanId.remove(i);
				}
			}
			for (Org org : selectByXueYuanId) {
				// 一个系部的集体请假
				List<LevelApproval> teamLeaveList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
						org.getId(), approvalState, techerId, "234", true, date);
				for (int x = 0; x < teamLeaveList.size(); x++) {
					if (techerId.length() > 18) {
						if (teamLeaveList.get(x).getApplication().getFinal_approval_tea().equals(teacher.getId())) {
							teamLeaveList.remove(x);
							continue;
						}
					}
					// 记录一个系部 集体请假学生的id
					String realStudentsId = "";
					List<LevelApproval> temp = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
							org.getId(), approvalState, techerId, "234", false, date);
					for (int j = 0; j < temp.size(); j++) {
						if (teamLeaveList.get(x).getApplication().getSla_code()
								.equals(temp.get(j).getApplication().getSla_code())) {
							realStudentsId += temp.get(j).getApplication().getSla_real_students_id() + ",";
						}
					}
					teamLeaveList.get(x).getApplication().setSla_real_students_id(realStudentsId);

					approvalLevelApprList.add(teamLeaveList.get(x));
				}
			}
		}

		PrintWriter printWriter = response.getWriter();
		printWriter.println(levelApprovalService.ajaxErgodic(approvalLevelApprList));
		printWriter.close();
		return null;
	}

	/**
	 * 功能：查出系部所对应的班级信息 by:李秋林：2016-4-21
	 * 
	 * */
	@RequestMapping("CampusLeader/web/classList.do")
	public String classList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("utf-8");
		String tj = request.getParameter("tiaojian");
		int a = tj.indexOf(",");
		String student_dept_id = tj.substring(a + 1, tj.length());
		session.setAttribute("student_dept_id", student_dept_id);
		String student_class_id = (String) session.getAttribute("student_class_id");
		boolean b = false;
		Org org = new Org();
		if (DictionaryService.findOrg(student_class_id) != null) {
			b = student_class_id.equals(DictionaryService.findOrg(student_class_id).getId());
		}
		List<Org> o = this.orgService.getAllClass(student_dept_id);// 通过系部查出班级
		StringBuffer sb = new StringBuffer();
		sb.append("<select id='classId' name='classId' style='width:150px' onChange='changeSai()'>");
		if (b == false || o.size() == 0) {
			sb.append("<option>请选择班级 </option>");
			for (Org c : o) {
				sb.append("<option " + "value=" + c.getId() + ">" + c.getOrg_name() + "</option>");
			}
		} else {
			org = DictionaryService.findOrg(student_class_id);
			for (int i = 0; i < o.size(); i++) {
				if (o.get(i).getId().equals(student_class_id)) {
					o.add(0, org);
					o.remove(i + 1);
				}
			}
			for (Org c : o) {
				sb.append("<option " + "value=" + c.getId() + ">" + c.getOrg_name() + "</option>");
			}
		}
		sb.append("</select>");
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 功能：根据班级编号查出给班级的学生ajax 李秋林2016-4-21 wjg注释 2016-5-22
	 * */
	/*
	 * @RequestMapping("CampusLeader/web/studentList.do") public String
	 * studentListAjax(HttpSession session, HttpServletRequest request,
	 * HttpServletResponse response) { response.setCharacterEncoding("utf-8");
	 * String student_class_id = request.getParameter("ClassId");
	 * session.setAttribute("student_class_id", student_class_id); List<Student>
	 * s = this.orgService.selectClassIdByXiId(student_class_id); StringBuffer
	 * sb = new StringBuffer(); sb.append("<table border='1' width='1300'>");
	 * sb.append(
	 * "<tr> <th width='60'>序号</th><th width='150'>学号</th> <th width='100'>姓名</th><th width='60'>性别</th><th width='100'>身份证号</th><th width='150'>手机号</th><th width='170'>班级名称</th><th width='100'>家庭电话</th><th width='300'>籍贯</th><th width='300'>空间主页</th><th width='50' align='center'>状态</th><th width='80'>操作</th> </tr>"
	 * );
	 * 
	 * sb.append("</table>"); try { response.getWriter().println(sb.toString());
	 * } catch (IOException e) { e.printStackTrace(); } return null;
	 * 
	 * }
	 */
	// ---------------2016-05-21 张向杨 end -----------------------------
}
