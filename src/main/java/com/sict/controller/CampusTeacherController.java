package com.sict.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.sict.entity.Application;
import com.sict.entity.Association;
import com.sict.entity.AssociationMembers;
import com.sict.entity.ClassRoom;
import com.sict.entity.CourseEvaluate;
import com.sict.entity.Courses;
import com.sict.entity.DailyInspect;
import com.sict.entity.DailyInspectDetails;
import com.sict.entity.Duties;
import com.sict.entity.EvalsIndex;
import com.sict.entity.EvaluateStandard;
import com.sict.entity.LevelApproval;
import com.sict.entity.Org;
import com.sict.entity.Role;
import com.sict.entity.StuLeaders;
import com.sict.entity.Student;
import com.sict.entity.TeachLogs;
import com.sict.entity.Teacher;
import com.sict.entity.TeachingClass;
import com.sict.entity.TeachingClassMembers;
import com.sict.entity.TeachingTask;
import com.sict.entity.UserRole;
import com.sict.service.ApplicationService;
import com.sict.service.ClassRoomService;
import com.sict.service.CompanyService;
import com.sict.service.CourseService;
import com.sict.service.DailyInspectDetailsService;
import com.sict.service.DailyInspectService;
import com.sict.service.DictionaryService;
import com.sict.service.DirectRecordService;
import com.sict.service.DutiesService;
import com.sict.service.EvalsIndexService;
import com.sict.service.EvaluateService;
import com.sict.service.EvaluateStandardService;
import com.sict.service.ExcelService;
import com.sict.service.FilesService;
import com.sict.service.GroupMembersService;
import com.sict.service.GroupsService;
import com.sict.service.LevelApprovalService;
import com.sict.service.NoticeService;
import com.sict.service.OrgService;
import com.sict.service.PracticeRecordService;
import com.sict.service.PracticeTaskService;
import com.sict.service.RecruitInfoService;
import com.sict.service.RoleService;
import com.sict.service.ScoreService;
import com.sict.service.StuLeadersService;
import com.sict.service.StudentService;
import com.sict.service.TeacherService;
import com.sict.service.UserRoleService;
import com.sict.service.campus.AssociationMembersService;
import com.sict.service.campus.AssociationService;
import com.sict.service.campus.CourseEvaluateService;
import com.sict.service.campus.TeachLogsService;
import com.sict.service.campus.TeachingClassMembersService;
import com.sict.service.campus.TeachingClassService;
import com.sict.service.campus.TeachingTaskService;
import com.sict.util.Common;
import com.sict.util.Constants;
import com.sict.util.ExcelUtil;

/*
 * 功能：在校生教师控制器
 * 使用 @Controller 注释
 * byxzw 2015年11月17日10:36:58	 * 
 * 
 * */

@Controller
public class CampusTeacherController {
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
	 * 注入practiceRecordService *by丁乐晓20151224
	 */
	@Resource(name = "practiceRecordService")
	private PracticeRecordService practiceRecordService;

	/**
	 * 注入companyService byxzw20140917 *by丁乐晓20151224
	 */
	@Resource(name = "companyService")
	private CompanyService companyService;
	/**
	 * 注入recruitInfoService by贾建昶2015-12-12 *
	 */
	@Resource(name = "recruitInfoService")
	private RecruitInfoService recruitInfoService;
	/**
	 * 注入groupsService by周睿20151214 *
	 */
	@Resource(name = "groupsService")
	private GroupsService groupsService;
	/**
	 * 注入StudentService by周睿20151214 *
	 */
	@Resource(name = "studentService")
	private StudentService studentService;
	/**
	 * 注入teacherService byjjc20160112 *
	 */
	@Resource(name = "teacherService")
	private TeacherService teacherService;
	/**
	 * 注入directRecordService by周睿 20151217 *
	 */
	@Resource(name = "directRecordService")
	private DirectRecordService directRecordService;
	/**
	 * 注入filesService by周睿 20151217 *
	 */
	@Resource(name = "filesService")
	private FilesService filesService;

	/**
	 * 注入NoticeService 张向杨 20151217 *
	 */

	@Resource(name = "noticeService")
	private NoticeService noticeService;
	/**
	 * 注入PracticeTaskService 张向杨 20151217 *
	 */
	@Resource(name = "practiceTaskService")
	private PracticeTaskService practiceTaskService;
	/**
	 * 注入GroupMembersService 张向杨 20151217 *
	 */
	@Resource(name = "groupMembersService")
	private GroupMembersService groupMembersService;
	/**
	 * 注入evaluateService by周睿20151229 *
	 */
	@Resource(name = "evaluateService")
	private EvaluateService evaluateService;
	/**
	 * 注入EvalsIndexService by周睿20151229 *
	 */
	@Resource(name = "evalsIndexService")
	private EvalsIndexService evalsIndexService;
	/**
	 * 注入ScoreService by李达 20160113 *
	 */
	@Resource(name = "ScoreService")
	private ScoreService ScoreService;
	/**
	 * 注入applicationService by 师杰 20160116
	 */
	@Resource(name = "applicationService")
	private ApplicationService applicationService;
	/**
	 * 注入levelApprovalService by 师杰 20160116
	 */
	@Resource(name = "levelApprovalService")
	private LevelApprovalService levelApprovalService;
	/*
	 * 注入：AssociationService 时间：2016-03-14 作者：张向杨
	 */
	@Resource
	private AssociationService associationService;
	/*
	 * 注入：AssociationService 时间：2016-03-14 作者：张向杨
	 */
	@Resource
	private AssociationMembersService associationMembersService;
	/**
	 * 注入roleService bywtt2014 1130 *
	 * 
	 * */
	@Resource(name = "roleService")
	private RoleService roleService;
	/*
	 * 注入：AssociationService 时间：2016-03-14 作者：张向杨
	 */
	@Resource(name = "userRoleService")
	private UserRoleService userRoleService;

	/**
	 * 注入orgService by张向杨2016-04-20
	 */
	@Resource(name = "orgService")
	private OrgService orgService;
	/**
	 * 注入dailyInspectService by 张邦卿 20160509
	 */
	@Resource(name = "dailyInspectService")
	private DailyInspectService dailyInspectService;

	/**
	 * 注入DutiesService by 张向杨 2016-05-28
	 */
	@Resource(name = "dutiesService")
	private DutiesService dutiesService;

	/**
	 * 注入DutiesService by 张向杨 2016-05-28
	 */
	@Resource(name = "stuLeadersService")
	private StuLeadersService stuLeadersService;
	/**
	 * 注入dailyInspectService by 张邦卿 20160509
	 */
	@Resource(name = "dailyInspectDetailsService")
	private DailyInspectDetailsService dailyInspectDetailsService;
	/**
	 * 注入 courseEvaluateService by 李达 2016.5.14
	 */
	@Resource(name = "courseEvaluateService")
	private CourseEvaluateService courseEvaluateService;

	/**
	 * 注入teachingClassMembers by 李达 2016.5.14
	 */
	@Resource(name = "teachingClassMembersService")
	private TeachingClassMembersService teachingClassMembersService;

	/**
	 * 注入teachingClassService by 李达 2016.5.14
	 */
	@Resource(name = "teachingClassService")
	private TeachingClassService teachingClassService;

	/**
	 * 注入teachingTaskService by 李达 2016.5.14
	 */
	@Resource(name = "teachingTaskService")
	private TeachingTaskService teachingTaskService;

	/**
	 * 注入teachLogsService by 李达 2016.5.14
	 */
	@Resource(name = "teachLogsService")
	private TeachLogsService teachLogsService;

	/**
	 * 注入courseService by 李达 2016.5.14
	 */
	@Resource(name = "courseService")
	private CourseService courseService;

	/**
	 * 注入classRoomService by 李达 2016.5.14
	 */
	@Resource(name = "classRoomService")
	private ClassRoomService classRoomService;

	/**
	 * 注入EvaluateStandard by 李达 2016.5.31
	 */
	@Resource(name = "evaluateStandardService")
	private EvaluateStandardService evaluateStandardService;

	private int pageSizeConstant = Constants.pageSize; // 获取常量分页页大小
	String ret = "";// 定义全局变量：返回类型 zcg 20141020

	@RequestMapping("CampusTeacher/index.do")
	public String toIndex(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		return "/campusViews/campusTeacher/index";
	}

	/**
	 * 功能：获取请假审批列表 by 师杰 20160116
	 */
	@RequestMapping("CampusTeacher/applyLeave.do")
	public ModelAndView applyLeave(HttpSession session, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		String tea_id = teacher.getId();
		// 获取全部申请记录
		List<Application> application = this.applicationService.selectByTea_id(tea_id);
		// 定义三个数组，分别存放未审批，已审批，未通过
		List<Application> approveing = new ArrayList<Application>();// 未审批
		List<Application> approved = new ArrayList<Application>();// 已审批
		List<Application> disapprove = new ArrayList<Application>();// 未通过
		for (Application ap : application) {
			// 设置日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			if (ap.getSla_approval_state().equalsIgnoreCase("1")) {// 1.审批中 2.同意
																	// 3.不同意 |
																	// 未审批1
																	// 已审批23未通过3
				ap.setTemp1(DictionaryService.findStudent(ap.getSla_stu()).getTrue_name());
				ap.setTemp2(sdf.format(ap.getSla_begin_time()));
				ap.setTemp3(sdf.format(ap.getSla_end_time()));
				approveing.add(ap);
			} else if (ap.getSla_approval_state().equalsIgnoreCase("2")
					|| ap.getSla_approval_state().equalsIgnoreCase("3")) {
				ap.setTemp1(DictionaryService.findStudent(ap.getSla_stu()).getTrue_name());
				ap.setTemp2(sdf.format(ap.getSla_begin_time()));
				ap.setTemp3(sdf.format(ap.getSla_end_time()));
				approved.add(ap);
				if (ap.getSla_approval_state().equalsIgnoreCase("3")) {
					ap.setTemp1(DictionaryService.findStudent(ap.getSla_stu()).getTrue_name());
					ap.setTemp2(sdf.format(ap.getSla_begin_time()));
					ap.setTemp3(sdf.format(ap.getSla_end_time()));
					disapprove.add(ap);
				}
			}
		}

		map.put("teacher", teacher);
		map.put("application", application);
		map.put("approveing", approveing);
		map.put("approved", approved);
		map.put("disapprove", disapprove);
		return new ModelAndView("/campusViews/campusTeacher/applyLeave", map);
	}

	/**
	 * 功能：请假审批 by 师杰 20160116
	 */

	@RequestMapping("CampusTeacher/applyLeavedetails.do")
	public ModelAndView applyLeavedetails(HttpSession session, HttpServletRequest request) {
		// 获取当前用户
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		String id = request.getParameter("id");
		String stu_id = request.getParameter("stu_id");
		Student student = this.studentService.selectByID(stu_id);
		String class_name = DictionaryService.findOrg(student.getClass_id()).getOrg_name();
		Application application = applicationService.selectByID(id);

		String sla_type = application.getSla_type();
		if (sla_type.equalsIgnoreCase("1")) {
			sla_type = "事假";
		} else if (sla_type.equalsIgnoreCase("2")) {
			sla_type = "病假";
		} else if (sla_type.equalsIgnoreCase("3")) {
			sla_type = "旅游";
		} else if (sla_type.equalsIgnoreCase("4")) {
			sla_type = "探亲";
		} else {
			sla_type = "其他";
		}

		String sla_rank = application.getSla_rank();
		if (sla_rank.equalsIgnoreCase("1")) {
			sla_rank = "比较着急";
		} else if (sla_rank.equalsIgnoreCase("2")) {
			sla_rank = "不是很着急";
		} else {
			sla_rank = "不着急";
		}

		map.put("application", application);
		map.put("sla_rank", sla_rank);
		map.put("sla_type", sla_type);
		map.put("teacher", teacher);
		map.put("student", student);
		map.put("class_name", class_name);
		map.put("id", id);
		return new ModelAndView("/campusViews/campusTeacher/applyLeavedetails", map);
	}

	/**
	 * 不同意的页面 没有按钮 师杰 20160116
	 * */
	@RequestMapping("CampusTeacher/applyLeavedDetails.do")
	public ModelAndView applyLeavedDetails(HttpSession session, HttpServletRequest request) {
		// 获取当前用户
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		String id = request.getParameter("id");
		String stu_id = request.getParameter("stu_id");
		Student student = (Student) this.studentService.selectByID(stu_id);
		String class_name = DictionaryService.findOrg(student.getClass_id()).getOrg_name();
		Application application = applicationService.selectByID(id);

		String sla_type = application.getSla_type();
		if (sla_type.equalsIgnoreCase("1")) {
			sla_type = "事假";
		} else if (sla_type.equalsIgnoreCase("2")) {
			sla_type = "病假";
		} else if (sla_type.equalsIgnoreCase("3")) {
			sla_type = "旅游";
		} else if (sla_type.equalsIgnoreCase("4")) {
			sla_type = "探亲";
		} else {
			sla_type = "其他";
		}

		String sla_rank = application.getSla_rank();
		if (sla_rank.equalsIgnoreCase("1")) {
			sla_rank = "比较着急";
		} else if (sla_rank.equalsIgnoreCase("2")) {
			sla_rank = "不是很着急";
		} else {
			sla_rank = "不着急";
		}
		LevelApproval la = (LevelApproval) this.levelApprovalService.selectByLevel_App_ID(id);
		String opinion = la.getApproval_opinion();

		map.put("application", application);
		map.put("sla_rank", sla_rank);
		map.put("sla_type", sla_type);
		map.put("teacher", teacher);
		map.put("student", student);
		map.put("class_name", class_name);
		map.put("opinion", opinion);
		return new ModelAndView("/campusViews/campusTeacher/applyLeavedDetails", map);
	}

	/**
	 * 功能：更新审批结果 by 师杰 20160116
	 */
	@RequestMapping("CampusTeacher/ajaxcheck.do")
	public String ajaxcheck(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		request.setCharacterEncoding("UTF-8");
		String tea_id = teacher.getId();
		String i = request.getParameter("i");
		int x = Integer.parseInt(i);
		String id = request.getParameter("id");
		String opinion = request.getParameter("opinion");
		opinion = new String(opinion.getBytes("iso-8859-1"), "UTF-8");
		Timestamp d = new Timestamp(System.currentTimeMillis());

		if (x == 1) {// 上交
			Application apl = (Application) this.applicationService.selectByID(id);
			// apl.setIs_file(i);
			applicationService.update(apl);
			response.getWriter().println(apl.toString());
		} else if (x == 2) {// 通过
			Application apl = (Application) this.applicationService.selectByID(id);
			apl.setFinal_approval_tea(tea_id);
			apl.setFinal_approval_time(d);
			apl.setSla_approval_state("2");
			applicationService.update(apl);
			LevelApproval la = (LevelApproval) this.levelApprovalService.selectByLevel_App_ID(id);
			la.setApproval_tea(tea_id);
			la.setApproval_time(d);
			la.setApproval_state("2");
			la.setApproval_opinion(opinion);
			la.setIs_approval_pass("1");

			levelApprovalService.update(la);
			response.getWriter().println(apl.toString());
			response.getWriter().println(la.toString());
		} else if (x == 3) {// 不通过
			Application apl = (Application) this.applicationService.selectByID(id);
			apl.setFinal_approval_tea(tea_id);
			apl.setFinal_approval_time(d);
			apl.setSla_approval_state("3");
			applicationService.update(apl);
			LevelApproval la = (LevelApproval) this.levelApprovalService.selectByLevel_App_ID(id);
			la.setApproval_tea(tea_id);
			la.setApproval_time(d);
			la.setApproval_state("2");
			la.setApproval_opinion(opinion);
			la.setIs_approval_pass("2");

			levelApprovalService.update(la);
			response.getWriter().println(apl.toString());
			response.getWriter().println(la.toString());

		}

		return null;
	}

	// --------2016-05-21 张向杨 start ---------------------------------
	/**
	 * 查看学生会干部 查看学生会的信息.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/seeStuUnion.do")
	public String seeStuUnion(ModelMap modelMap, HttpSession session) {
		// 获得学院id
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String college_id = Common.getCollegeId(tea.getDept_id());
		Association association = new Association();
		association.setSa_category("1");
		association.setSa_college_id(college_id);
		association.setState("1");
		association.setSa_tea_id(tea.getId());
		List<Association> associationList = associationService.selectList(association);

		modelMap.put("associationList", associationList);
		return "/campusViews/campusTeacher/seeStuUnion";
		// return "student/seeStuUnonOrAssociation";
	}

	/**
	 * 查看学生会具体部门的成员信息.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/seeStuUnionMemberDetail.do")
	public String seeStuUnionMemberDetail(ModelMap modelMap, String id) {
		// 定义变量 接受id ---为以后维护知道id是什么id
		String sam_association_id = null;
		// id不为空执行以下代码
		if (id != null) {
			sam_association_id = id;
			AssociationMembers associationMembers = new AssociationMembers();
			associationMembers.setSam_association_id(sam_association_id);
			associationMembers.setState("1");
			List<AssociationMembers> associationMembersList = associationMembersService.selectList(associationMembers);
			if (associationMembersList != null) {
				modelMap.put("associationMembersList", associationMembersList);
			}
		}

		modelMap.put("id", sam_association_id);
		return "/campusViews/campusTeacher/seeStuUnionMemberDetail";
		// return "student/showStuUnionOrAssNumber";
	}

	/**
	 * 添加学生会干部成员.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/stuUnionMemberAdd.do")
	public String stuUnionNumberAdd(ModelMap modelMap, String id, HttpSession session) {
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 初始化变量
		String college_id = null;
		List<Role> roleList = null;

		if (tea != null) {
			college_id = Common.getCollegeId(tea.getDept_id());
			if (college_id != null)
				roleList = roleService.selectByCollegeId(college_id, "ROLE_STUDENT");
		}
		modelMap.put("roleList", roleList);
		modelMap.put("id", id);
		return "/campusViews/campusTeacher/stuUnionMemberAdd";
		// return "student/stuUnionOrAssAdd";
	}

	/**
	 * 功能： ajax验证单个添加的学生会或者社团成员是否在我们的系统中、是否已经存在该社团中
	 * 
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonGenerationException
	 * 
	 * @Author 鲁雪艳 张向杨 时间：　２０１６－０３－１８
	 */
	@ResponseBody
	@RequestMapping("CampusTeacher/web/checkStuCode.do")
	public String checkStuCode(String stu_code, String assication_id, HttpServletResponse response)
			throws JsonGenerationException, JsonMappingException, IOException {
		response.setCharacterEncoding("UTF-8");
		StringBuilder stringBuilder = new StringBuilder();
		String info = "";
		Student stu = new Student();
		// 根据学生的学号 得到学生的id
		String stu_id = studentService.getStudentIdByCode(stu_code);
		// 判断该学生 是否在数据库中
		if (stu_id != null) {
			stu = DictionaryService.findStudent(stu_id);
			AssociationMembers associationMembers = new AssociationMembers();
			associationMembers.setSam_stu_id(stu_id);
			associationMembers.setSam_association_id(assication_id);
			// 判断学生还没有添加 该学生
			if (associationMembersService.selectList(associationMembers).size() == 0) {
				info = "学号可以使用";
			} else {
				info = "学号已经在该组织内";
			}
		} else {
			info = "系统没有该学号";
		}
		stu.setTemp1(info);
		ObjectMapper objectMapper = new ObjectMapper();
		String ajaxData = objectMapper.writeValueAsString(stu);
		stringBuilder.append(info);

		try {
			// response.getWriter().println(stringBuilder.toString());
			response.getWriter().println(ajaxData);
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return null;
	}

	/*
	 * 功能： 保存添加的学生会人员 时间：　２０１６－０３－１８
	 * 
	 * @Author 鲁雪艳
	 */
	@RequestMapping("CampusTeacher/web/doSaveStuUnionMember.do")
	public String doSaveStuUnionMember(HttpServletRequest request) {
		// 得到当前用户
		Teacher tea = (Teacher) request.getSession().getAttribute("current_user");
		// 得到当前用户的部门id
		String dept_id = tea.getDept_id();
		// 获得前台表单数据
		String stu_code = request.getParameter("stu_code");
		// 性别暂时没有用到
		String sex = request.getParameter("sex");
		String duties = request.getParameter("duties");
		String association_id = request.getParameter("id");
		String role_id = request.getParameter("role_id");
		String stu_id = studentService.getStudentIdByCode(stu_code);
		if (role_id != null && (!"0".equals(role_id))) {
			userRoleService.saveUserRole(stu_id, role_id);
			/* 存任职表 */
			StuLeaders sld = new StuLeaders();
			sld.setSsl_stu_id(stu_id);// 学生ID
			sld.setSsl_org_id(association_id);// 学生会或者社团ID
			sld.setSsl_role_id(role_id);// 角色ID
			sld.setSsl_create_user(tea.getId());// 创建人ID
			stuLeadersService.insert(sld);
		}
		// 获得当天系统时间
		Timestamp nousedate = Common.getNowTime();
		// 新建对象 用于插入数据库
		AssociationMembers associationMembers = new AssociationMembers();
		associationMembers.setSam_duty(duties);
		associationMembers.setBegin_time(nousedate);
		associationMembers.setSam_stu_id(stu_id);
		associationMembers.setSam_association_id(association_id);
		// 插入到数据库
		associationMembersService.insert(associationMembers);
		return "redirect:seeStuUnionMemberDetail.do?id=" + association_id;
	}

	/**
	 * 导入学生会的成员信息.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/importStuUnionMember.do")
	public String importStuUnionNumber(ModelMap modelMap, String id, HttpSession session) {
		// 定义变量记录导入的是学生会成员
		String type = null;
		// id不为空
		if (id != null) {

			Association association = associationService.selectByID(id);
			if (association != null) {
				// 通过查询得到导入的type类型---是导入的学生会还是社团 成员
				if (association.getSa_category().equals("1")) {
					type = "StudentUnionExcel";
				} else if (association.getSa_category().equals("2")) {
					type = "AssociationExcel";
				} else {// 没有该类型 返回null
					return null;
				}
				session.setAttribute("StuUnionOrAsso_id", id);
				modelMap.put("id", id);
				modelMap.put("type", type);
			}
		}
		return "/campusViews/campusTeacher/importStuUnionMember";
	}

	/**
	 * 验证导入的学生会 或者社团干部的成员信息. 导入学生会 社团通用
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping(value = "CampusTeacher/web/checkStuUnionOrAssMembe.do", method = RequestMethod.POST)
	public String checkStuUnionOrAssMembe(MultipartHttpServletRequest request, ModelMap modelMap, HttpSession session)
			throws Exception {

		String type = Common.NulltoBlank(request.getParameter("type"));

		// 取到用户提交来的excel文件
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession()
				.getServletContext());
		// 不为空就要操作文件、
		if (multipartResolver.isMultipart(request)) {

			MultipartHttpServletRequest multiRequest = request;
			// 遍历得到用户提交的文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next().toString());
				if (file != null) {

					String file_type = "";
					if (type.equals("StudentUnionExcel")) {
						file_type = "StudentUnionExcel";
					} else if (type.equals("AssociationExcel")) {
						file_type = "AssociationExcel";
					}

					String project_path = request.getSession().getServletContext().getRealPath("/");

					String fileName = file.getOriginalFilename();
					String filepos = "Import" + "/" + file_type + "_";
					String filePosition = "Import" + "/" + file_type + "_" + fileName;
					String real_path = Constants.FILE_ROUTE;
					String file_path = project_path + real_path + filePosition;
					String file_pa = project_path + real_path + filepos;
					// float filesize = file.getSize();//
					// 使用getSize()方法获得文件长度，以此决定允许上传的文件大小。
					file.transferTo(new File(file_path));// 使用transferTo（dest）方法将上传文件写到服务器上指定的文件
					// 文件的属性
					File f = new File(file_pa + fileName);
					// 判断导入数据表类型

					// String StuUnionOrAsso_id =
					// request.getParameter("StuUnionOrAsso_id");
					String StuUnionOrAsso_id = (String) session.getAttribute("StuUnionOrAsso_id");

					// 获得excel文件中的数据封装成java对象放进集合
					List<Student> stuList = ExcelService.analysisStrUnionOrAssciationSutdent(f);

					session.setAttribute("students", stuList);
					// 对学生表的数据验证编号是否重复
					List<String> codeList = new ArrayList<String>();// 声明集合，存储学生编号，为了验证表格中的学生编号是否重复。
					List<String> classidList = new ArrayList<String>();// 声明集合，存储表格中班级编号，为得到每个班级的人数。
					String infor = "";// 声明变量，存储表格中未按要求的信息存储。
					String information = "";// 声明information，得到各班级个数。
					int b;
					int c;
					// 表格的数据验证
					// Student类中的temp2 暂时存放的是 ----学生会成员的职责
					// 定义变量 记录导入的人数
					int num = 0;
					for (Student student : stuList) {
						num++;
						b = this.studentService.selectByStuCode(student.getStu_code());
						// 验证学号 不能为空、不能为空字符串、必须在本数据库中
						if (student.getStu_code() == null) {
							infor = infor + "学号不能为空,";
						} else if (b == 0) {
							infor = "请检查您的学号 数据库没有该学生学号,";
						} else if (student.getStu_code().substring(0, 4).equals(student.getEntry_year())) {
							// 判断入学年份和学号的前四位是否相同---这里用不到
						} else if (b > 0) {
							AssociationMembers associationMembers = new AssociationMembers();
							associationMembers.setSam_association_id(StuUnionOrAsso_id);
							associationMembers.setSam_stu_id(DictionaryService.findStudentByCode(student.getStu_code())
									.getId());

							List<AssociationMembers> AssociationMembersList = associationMembersService
									.selectList(associationMembers);

							if (AssociationMembersList.size() > 0)
								infor = student.getTrue_name() + "已经在该组织中,";

						}

						Student stu = DictionaryService.findStudentByCode(student.getStu_code());
						// 验证姓名 必须不能为空、 不能为空字符串、必须和数据中的姓名一致
						if (stu != null) {
							if (student.getTrue_name() == null || student.getTrue_name().equals(""))
								infor = infor + "姓名不能为空";
							else if (!stu.getTrue_name().equals(student.getTrue_name().trim()))
								infor = infor + "姓名和数据库中的名字不一致";
						}
						// 验证性别---暂时没有用
						if (student.getSex() == null) {
							infor = infor + "性别不能为空,";
						} else if (student.getSex().equals("男") || student.getSex().equals("女")) {

						} else {
							infor = infor + "亲，人只有男女之分奥！,";
						}
						// 验证是否有管理权限

						if (student.getTemp3() == null || "".equals(student.getTemp3().trim())) {

						} else if (student.getTemp3().trim() != null && student.getTemp3().trim().equals("是")) {

						} else if (student.getTemp3().trim() != null && student.getTemp3().trim().equals("否")) {

						} else if (!student.getTemp3().trim().equalsIgnoreCase("是")
								|| !student.getTemp3().trim().equalsIgnoreCase("否")) {
							infor = infor + "指定请填 是 否则填 否或者不填,";
						}

						if (codeList.size() != 0) {
							infor = infor + isCodeExist(student.getStu_code(), codeList, "学生编号");
						}

						if (infor.trim().equals("")) {
							infor = "无";
						}
						student.setTemp1(infor.trim());
						infor = "";
						// 讲学生的编号添加到集合中
						if (student.getStu_code() != null) {
							codeList.add(student.getStu_code());
						}

						// 判断学生编号是否在excel中重复
						String[] co = new String[codeList.size()];
						for (int a = 0; a < codeList.size(); a++) {
							co[a] = codeList.get(a);
						}
					}

					information = "您共有 " + num + " 条记录被成功认证";
					modelMap.put("information", information);
					modelMap.put("ss", stuList);
					modelMap.put("type", type);
					modelMap.put("fileName", fileName);
				}
			}
		}

		if ("StudentUnionExcel".equals(type))
			ret = "/campusViews/campusTeacher/importStuUnionMember";
		else if ("AssociationExcel".equals(type))
			ret = "/campusViews/campusTeacher/importAssociationMember";

		return ret;
	}

	/**
	 * 保存 导入的学生会成员、社团成员
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/saveStuUnionOrAssMember.do")
	public String saveStuUnionOrAss(HttpSession session, ModelMap modelMap, String id, String fileName, String type) {

		String project_path = session.getServletContext().getRealPath("/");
		String real_path = Constants.FILE_ROUTE;
		String filepos = "Import" + "/" + type + "_";
		// 所要保存至数据库的excel的名称
		/*
		 * String file_pa = real_path + "WEB-INF/uploadedfiles/Import/" +
		 * fileName;
		 */
		String file_pa = project_path + real_path + filepos + fileName;
		File f = new File(file_pa);
		// 获得验证方法里面的放进session的集合
		List<Student> stuList = (List<Student>) session.getAttribute("students");
		// 获得系统当前时间
		Timestamp nousedate = Common.getNowTime();
		// 获得用户导入的类型的id 学生会 或者 社团的id
		String StuUnionOrAsso_id = (String) session.getAttribute("StuUnionOrAsso_id");
		AssociationMembers associationMembers = null;
		String sa_category = DictionaryService.findAssociation(StuUnionOrAsso_id).getSa_category();
		// 得到当前用户
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 得到当前用户的部门id
		String tea_dept_id = tea.getDept_id();
		String stu_college_id = Common.getCollegeId(tea_dept_id);
		for (Student student : stuList) {
			Student student2 = (Student) studentService.selectByCode(student.getStu_code());

			if (student2 != null) {
				if (sa_category != null && "1".equals(sa_category)) {// 导入的为学生会
					Role managerRole = roleService.getRoleByColegeIdAndRoleTemplateId(stu_college_id,
							"ROLE_STUDENT_PE_MANAGER");
					Role memberRole = roleService.getRoleByColegeIdAndRoleTemplateId(stu_college_id,
							"ROLE_STUDENT_PE_MEMBER");
					// 给用户指定的成员添加用户角色
					if (student.getTemp3() == null || student.getTemp3().equals("")) {

					} else if (student.getTemp3().trim() != null) {
						if (student.getTemp3().trim().equals("是")) {// 如果导入表格中显示是管理的角色，则保存管理角色，否则保存成员角色
							userRoleService.saveUserRole(student2.getId(), managerRole.getId());
							/* 存任职表 */
							StuLeaders stuld = new StuLeaders();
							stuld.setSsl_stu_id(student2.getId());// 学生ID
							stuld.setSsl_org_id(StuUnionOrAsso_id);// 学生会或者社团ID
							stuld.setSsl_role_id(managerRole.getId());// 角色ID
							stuld.setSsl_create_user(tea.getId());// 创建人ID
							stuLeadersService.insert(stuld);
						} else {
							userRoleService.saveUserRole(student2.getId(), memberRole.getId());
						}
					}

				} else if (sa_category != null && "2".equals(sa_category)) {// 导入的社团

					// 给用户指定的成员添加用户角色
					if (student.getTemp3() == null || student.getTemp3().equals("")) {

					} else if (student.getTemp3().trim() != null) {
						if (student.getTemp3().trim().equals("是"))
							userRoleService.saveUserRole(student2.getId(), "ROLE_STUDENT_ASSOCIATION_MANAGER");
						/* 存职务表 */
						Duties dut = new Duties();
						if (student.getTemp3().trim().equals("社长")) {
							dut.setName("社长");
						} else if (student.getTemp3().trim().equals("副社长")) {
							dut.setName("社长");
						}
						dut.setType("3");
						dut.setCreator(tea.getId());
						dut.setId(Common.returnUUID());
						dutiesService.insert(dut);
						/* 存任职表 */
						StuLeaders stuld = new StuLeaders();
						stuld.setSsl_stu_id(student2.getId());// 学生ID
						stuld.setSsl_org_id(StuUnionOrAsso_id);// 学生会或者社团ID
						stuld.setSsl_role_id("ROLE_STUDENT_ASSOCIATION_MANAGER");// 角色ID
						stuld.setSsl_create_user(tea.getId());// 创建人ID
						stuLeadersService.insert(stuld);
					}
				}
			}
			if (student2 != null) {
				String duty = student.getTemp2();
				if (StuUnionOrAsso_id != null) {
					Association association = associationService.selectByID(StuUnionOrAsso_id);
					if (association != null) {
						// 判断转存数据库
						if (association.getSa_category().equals("1")) {
							if (duty.trim().equals("学生会主席"))
								duty = "1";
							else if (duty.trim().equals("学生会副主席"))
								duty = "2";
							else if (duty.trim().equals("部长"))
								duty = "3";
							else if (duty.trim().equals("副部长"))
								duty = "4";
							else if (duty.trim().equals("普通干事"))
								duty = "5";
							else
								duty = "5";
						} else if (association.getSa_category().equals("2")) {

							if (duty.trim().equals("会长"))
								duty = "1";
							else if (duty.trim().equals("副会长"))
								duty = "2";
							else if (duty.trim().equals("会员"))
								duty = "3";
							else
								duty = "3";

						} else {// 没有该类型 返回nullq
							return null;
						}
					}

				}

				associationMembers = new AssociationMembers();

				associationMembers.setSam_stu_id(student2.getId());
				associationMembers.setSam_duty(duty);
				associationMembers.setBegin_time(nousedate);
				associationMembers.setSam_association_id(StuUnionOrAsso_id);
				// 循环插入到数据库
				associationMembersService.insert(associationMembers);

			}
		}
		modelMap.put("s", stuList);
		modelMap.put("id", StuUnionOrAsso_id);
		Association ass = associationService.selectByID(StuUnionOrAsso_id);
		if (ass != null) {
			if ("1".equals(ass.getSa_category()))
				ret = "/campusViews/campusTeacher/importStuUnionSuccess";
			else if ("2".equals(ass.getSa_category()))
				ret = "/campusViews/campusTeacher/importAssociationSuccess";
		}

		return ret;
		// return "student/importStuUnionOrAssSuccess";
	}

	/**
	 * 社团指导教师-社团管理
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */
	@RequestMapping("CampusTeacher/web/seeAssociation.do")
	public String seeAssociation(ModelMap modelMap, HttpSession session) {
		// 获得学院id
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String college_id = Common.getCollegeId(tea.getDept_id());
		// 新建Association 对象 ---用于做查询参数
		Association association = new Association();
		association.setSa_category("2");
		association.setSa_college_id(college_id);
		association.setState("1");
		association.setSa_tea_id(tea.getId());
		// 查询社团
		List<Association> associationList = associationService.selectList(association);
		modelMap.put("associationList", associationList);
		return "/campusViews/campusTeacher/seeAssociation";
		// return "student/seeStuUnonOrAssociation";
	}

	/**
	 * 社团干部查看具体部门的成员信息.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/seeAssociationMemberDetail.do")
	public String seeAssociationMemberDetail(ModelMap modelMap, String id) {
		// 定义变量 接受id ---为以后维护知道id是什么
		String sam_association_id = null;
		// id不为空执行以下代码
		if (id != null) {
			sam_association_id = id;
			AssociationMembers associationMembers = new AssociationMembers();
			associationMembers.setSam_association_id(sam_association_id);
			associationMembers.setState("1");
			List<AssociationMembers> associationMembersList = associationMembersService.selectList(associationMembers);
			if (associationMembersList != null) {
				modelMap.put("associationMembersList", associationMembersList);
			}
		}
		modelMap.put("id", sam_association_id);
		return "/campusViews/campusTeacher/seeAssociationMemberDetail";
	}

	/**
	 * 添加社团干部成员.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/associationMemberAdd.do")
	public String associationAdd(ModelMap modelMap, String id, HttpSession session) {
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 初始化变量
		String college_id = null;
		List<Role> roleList = null;
		// 得到老师不为空 查看学生角色
		if (tea != null) {
			college_id = Common.getCollegeId(tea.getDept_id());
			if (college_id != null)
				roleList = roleService.selectByCollegeId(college_id, "ROLE_STUDENT");
		}
		modelMap.put("roleList", roleList);
		modelMap.put("id", id);
		return "/campusViews/campusTeacher/associationMemberAdd";
		// return "student/stuUnionOrAssAdd";
	}

	/*
	 * 功能： 保存添加的社团人员 时间：　２０１６－０３－１８
	 * 
	 * 张向杨 鲁雪艳
	 */
	@RequestMapping("CampusTeacher/web/doSaveAssociationMumber.do")
	public String doSaveStuUnionOrAssMumber(HttpServletRequest request) {
		// 获得前台表单数据
		String stu_code = request.getParameter("stu_code");
		// 性别暂时没有用到
		String sex = request.getParameter("sex");
		String duties = request.getParameter("duties");
		String association_id = request.getParameter("id");
		String stu_id = studentService.getStudentIdByCode(stu_code);
		String role_id = request.getParameter("role_id");
		// 给选中的学生身份---给与身份
		if (role_id != null && (!"0".equals(role_id)))
			userRoleService.saveUserRole(stu_id, role_id);
		// 获得当天系统时间
		Timestamp nousedate = Common.getNowTime();
		// 新建对象 用于插入数据库
		AssociationMembers associationMembers = new AssociationMembers();
		associationMembers.setSam_duty(duties);
		associationMembers.setBegin_time(nousedate);
		associationMembers.setSam_stu_id(stu_id);
		associationMembers.setSam_association_id(association_id);
		// 插入到数据库
		associationMembersService.insert(associationMembers);
		return "redirect:seeAssociationMemberDetail.do?id=" + association_id;
	}

	/**
	 * 导入社团干部的成员信息.
	 * 
	 * @author 张向杨
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("CampusTeacher/web/importAssociationMember.do")
	public String importAssociationMember(ModelMap modelMap, String id, HttpSession session) {
		String type = null;

		if (id != null) {
			Association association = associationService.selectByID(id);
			if (association != null) {
				if (association.getSa_category().equals("1")) {
					type = "StudentUnionExcel";
				} else if (association.getSa_category().equals("2")) {
					type = "AssociationExcel";
				} else {// 没有该类型 返回nullq
					return null;
				}
			}
			session.setAttribute("StuUnionOrAsso_id", id);
			modelMap.put("id", id);
			modelMap.put("type", type);
		}
		return "/campusViews/campusTeacher/importAssociationMember";

	}

	/*
	 * 功能：检验编号是否在表格中是否重复 by王磊 2014/1/6
	 */
	public static String isCodeExist(String currentCode, List d, String souce) {
		int count = 0;
		String temp = "";
		for (int i = 0; i < d.size(); i++) {
			temp = (String) d.get(i);
			if (temp.equals(currentCode)) {
				count++;
			}
		}
		if (count > 0) {
			return "表格中" + souce + "列不能重复。";
		} else {
			return "";
		}
	}

	/**
	 * 
	 * 班主任,辅导员： 查看审批同学的请假申请
	 * 
	 * @since 2016-04-20
	 * @author 张向杨
	 * @param type
	 *            type为1---代表班主任 type为2---代表辅导员
	 * @return /campusViews/campusTeacher/approvalLeavejsp页面
	 * 
	 * */
	@RequestMapping(value = "CampusTeacher/web/seeStudentLeaveList.do", params = { "type" })
	public String seeStudentLeaveList(String type, HttpSession session, ModelMap modelMap) {
		Teacher teacher = (Teacher) session.getAttribute("current_user");

		List<Application> oneAndTeamApplicationListAll = new ArrayList<Application>();
		if (teacher != null) {
			Org org = new Org();
			org.setState("1");
			// type=1代表班主任
			if (type.equals("1")) {
				org.setHead_tea_id(teacher.getId());
			} else if (type.equals("2")) {// type=2代表辅导员
				org.setCounselor_id(teacher.getId());
			}
			List<Org> classList = orgService.selectList(org);
			for (int i = 0; i < classList.size(); i++) {

				// 一个班级个人请假
				List<Application> appList = applicationService.selectListByClassIdAndApprovalStateAndleaveType(
						classList.get(i).getId(), "1", "1", true);
				// 个人未审批
				for (Application application : appList) {
					oneAndTeamApplicationListAll.add(application);
				}
			}
			if (type.equals("2")) {// type=2代表辅导员
				// 一个系部的集体请假
				List<Application> groupAppList = applicationService.selectListByClassIdAndApprovalStateAndleaveType(
						teacher.getDept_id(), "1", "234", true);
				for (int x = 0; x < groupAppList.size(); x++) {
					// 记录一个系部 集体请假学生的id
					String realStudentsId = null;
					String applicationId = null;
					List<Application> temp = applicationService.selectListByClassIdAndApprovalStateAndleaveType(
							teacher.getDept_id(), "1", "234", false);
					for (int j = 0; j < temp.size(); j++) {
						if (groupAppList.get(x).getSla_code().equals(temp.get(j).getSla_code())) {
							if (realStudentsId == null && applicationId == null) {
								realStudentsId = temp.get(j).getSla_real_students_id();
								applicationId = temp.get(j).getId();
							} else {
								realStudentsId += "," + temp.get(j).getSla_real_students_id();
								applicationId += "," + temp.get(j).getId();
							}
						}
					}
					groupAppList.get(x).setSla_real_students_id(realStudentsId);
					groupAppList.get(x).setId(applicationId);

					oneAndTeamApplicationListAll.add(groupAppList.get(x));
				}
			}
			modelMap.put("type", type);
		}
		modelMap.put("ApprovalLevelNumber", oneAndTeamApplicationListAll.size());
		// 个人和集体 请假未审批记录传到前台
		modelMap.put("applicationListAll", oneAndTeamApplicationListAll);
		return "/campusViews/campusTeacher/approvalLeave";
	}

	/**
	 * 班主任、辅导员： 通过 ajax获得学生已审批记录（通过、不通过、其他老师审批的记录）
	 * 
	 * @author 张向杨
	 * @param flag
	 *            标记用户点击的按钮
	 * @param type
	 *            标记用户类型
	 * @param date
	 *            字符串日期
	 * @param response
	 *            HttpServletResponse对象
	 * @param session
	 *            HttpSession对象
	 * @throws IOException
	 * @since 2016-04-21
	 * 
	 * 
	 * @updateAuthor 张向杨
	 * @updateDate 2016-05-19 修改内容：增加date参数 用于兼容根据日期查询
	 * @param date
	 *            检索日期
	 * */
	@RequestMapping("CampusTeacher/web/ajaxGetApprovalLeave.do")
	public String ajaxGetApprovalLeave(String type, String flag, String date, HttpServletResponse response,
			HttpSession session) throws IOException {
		// 时间过滤
		if ("null".equals(date)) {
			date = null;
		}
		response.setCharacterEncoding("utf-8");
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		// 声明集合，用于存放本班未审批学生的请假记录
		List<LevelApproval> approvalLevelApprList = new ArrayList<LevelApproval>();
		// 查看通过、未通过记录
		if (teacher != null) {
			List<Org> classList = null;
			// 班主任身份
			if (type != null && "1".equals(type)) {
				Org org = new Org();
				org.setState("1");
				org.setHead_tea_id(teacher.getId());
				classList = orgService.selectList(org);
			}
			// 记录请假状态
			String approvalState = null;
			if (classList != null) {
				String techerId = null;
				for (int i = 0; i < classList.size(); i++) {
					if ("no".equals(flag)) {// 审批未通过
						approvalState = "3";
						techerId = teacher.getId();
					} else if ("yes".equals(flag)) {// 审批已通过
						approvalState = "2";
						techerId = teacher.getId();
					} else if ("others".equals(flag)) {// 其他人审批
						approvalState = "23456";
						techerId = teacher.getId() + "othes";
					} else if ("subLeader".equals(flag)) {// 交领导审批
						approvalState = "4";
						techerId = teacher.getId();
					} else {
						approvalState = "23";
						techerId = teacher.getId();
					}
					// 个人请假
					approvalLevelApprList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
							classList.get(i).getId(), approvalState, techerId, "1", false, date);

					// 一个系部的集体请假
					List<LevelApproval> groupLeaveList = levelApprovalService
							.selectByCollegeIdAndApprovalStateAndleaveType(classList.get(i).getId(), approvalState,
									techerId, "2", true, date);
					for (int x = 0; x < groupLeaveList.size(); x++) {
						// 记录一个系部 集体请假学生的id
						String realStudentsId = "";
						List<LevelApproval> temp = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
								teacher.getDept_id(), approvalState, techerId, "234", false, date);
						for (int j = 0; j < temp.size(); j++) {
							if (groupLeaveList.get(x).getApplication().getSla_code()
									.equals(temp.get(j).getApplication().getSla_code())) {
								realStudentsId += temp.get(j).getApplication().getSla_real_students_id() + ",";
							}
						}
						groupLeaveList.get(x).getApplication().setSla_real_students_id(realStudentsId);

						approvalLevelApprList.add(groupLeaveList.get(x));
					}

				}
			}
			String techerId = null;
			// 辅导员
			if ("2".equals(type)) {
				if ("no".equals(flag)) {// 审批未通过
					approvalState = "3";
					techerId = teacher.getId();
				} else if ("yes".equals(flag)) {// 审批已通过
					approvalState = "2";
					techerId = teacher.getId();
				} else if ("others".equals(flag)) {// 班主任审批或者院领导审批
					approvalState = "2356";
					techerId = teacher.getId() + "other";
				} else if ("subLeader".equals(flag)) {// 交领导审批
					approvalState = "4";
					techerId = teacher.getId();
				} else {
					approvalState = "23";
					techerId = teacher.getId();
				}
				// 个人
				approvalLevelApprList = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
						teacher.getDept_id(), approvalState, techerId, "1", false, date);
				// 一个系部的集体请假
				List<LevelApproval> groupLeaveList = levelApprovalService
						.selectByCollegeIdAndApprovalStateAndleaveType(teacher.getDept_id(), approvalState, techerId,
								"234", true, date);
				for (int x = 0; x < groupLeaveList.size(); x++) {
					if (techerId.length() > 18) {
						if (groupLeaveList.get(x).getApplication().getFinal_approval_tea().equals(teacher.getId())) {
							groupLeaveList.remove(x);
							continue;
						}
					}

					// 记录一个系部 集体请假学生的id
					String realStudentsId = "";
					List<LevelApproval> temp = levelApprovalService.selectByCollegeIdAndApprovalStateAndleaveType(
							teacher.getDept_id(), approvalState, techerId, "234", false, date);
					for (int j = 0; j < temp.size(); j++) {
						if (groupLeaveList.get(x).getApplication().getSla_code()
								.equals(temp.get(j).getApplication().getSla_code())) {
							realStudentsId += temp.get(j).getApplication().getSla_real_students_id() + ",";
						}
					}
					groupLeaveList.get(x).getApplication().setSla_real_students_id(realStudentsId);

					approvalLevelApprList.add(groupLeaveList.get(x));
				}

			}
		}

		PrintWriter printWriter = response.getWriter();
		printWriter.println(levelApprovalService.ajaxErgodic(approvalLevelApprList));
		printWriter.close();
		return null;
	}

	/**
	 * 班主任、辅导员: 处理审批假条
	 * 
	 * @author 张向杨
	 * @param type
	 * @since 2016-04-20
	 * */
	@RequestMapping(value = "CampusTeacher/web/ApprovalLeave.do", params = { "type" })
	public String doApprovalLeave(String type, String id, String approval_opinion, String userChoose,
			HttpSession session) {

		if (id != null && approval_opinion != null && userChoose != null) {
			// 单个请假
			if (id.length() == 32) {
				id += ",";
			}
			String[] idArr = id.split(",");
			for (String applId : idArr) {
				// 得到审批的记录
				Application application = applicationService.selectByID(applId.trim());

				LevelApproval levelApproval = new LevelApproval();
				levelApproval.setLevel_application_id(applId.trim());
				levelApproval.setApproval_tea(Common.getOneTeaId(session));
				levelApproval.setApproval_time(Common.getNowTime());
				levelApproval.setApproval_state("2");
				levelApproval.setApproval_opinion(approval_opinion);

				if (userChoose.equals("y")) { // 同意
					levelApproval.setIs_approval_pass("1");
					application.setSla_approval_state("2");
				} else if (userChoose.equals("n")) {// 不同意
					levelApproval.setIs_approval_pass("2");
					application.setSla_approval_state("3");
				} else if (userChoose.equals("ys")) {// 同意提交领导
					levelApproval.setIs_approval_pass("1");
					application.setSla_approval_state("4");
				} else if (userChoose.equals("ns")) {// 不同意提交领导
					levelApproval.setIs_approval_pass("2");
					application.setSla_approval_state("4");
				}
				application.setFinal_approval_tea(Common.getOneTeaId(session));
				application.setFinal_approval_time(Common.getNowTime());
				// 更新请假审批表和请假申请表
				levelApprovalService.insert(levelApproval);
				applicationService.update(application);
			}
		}
		return "redirect:seeStudentLeaveList.do?type=" + type;
	}

	// -----------2016-05-21 张向杨 end --------------------------------
	// ---------------2016-05-23丁乐晓 start查看早操成绩-----------------

	/**
	 * 辅导员查看成绩
	 * 
	 * @author张邦卿
	 * @param type
	 * @since 2016-05-06
	 * */
	@RequestMapping("CampusTeacher/web/seeMorningExerciseReword.do")
	public ModelAndView index(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		return new ModelAndView("/campusViews/campusTeacher/seeMorningExerciseReword");
	}

	/**
	 * 根据日期查看早操成绩
	 * 
	 * @author张邦卿
	 * @param type
	 * @since 2016-05-06
	 * */
	@RequestMapping("CampusTeacher/web/ajaxGetEx.do")
	public ModelAndView ajaxGetEx(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String begin_time = request.getParameter("begin_time");
		String year = request.getParameter("year");
		String type = request.getParameter("type");
		Teacher tea = (Teacher) session.getAttribute("current_user");
		List<DailyInspect> lists = dailyInspectService.getDailyInspectByDYId(tea.getId(), begin_time, type, year);
		String temp1 = "";
		for (DailyInspect dailyInspect : lists) {
			DailyInspectDetails dailyInspectDetails = new DailyInspectDetails();
			dailyInspectDetails.setInspect_id(dailyInspect.getId());
			List<DailyInspectDetails> selectList = dailyInspectDetailsService.selectList(dailyInspectDetails);
			Set<String> set = new HashSet<String>();
			for (DailyInspectDetails a : selectList) {
				String index_id = ((DailyInspectDetails) a).getIndex_id();
				double grade = ((DailyInspectDetails) a).getGrade();
				String object_id = ((DailyInspectDetails) a).getInspect_object_id();// 获取同一扣分项下的对象
				String stus_name = "";
				if (object_id != null) {
					String[] result = object_id.split(",");
					for (int i = 0; i < result.length; i++) {
						String stu_id = result[i];
						Student stu = studentService.selectByID1(stu_id);
						if (stu != null) {
							String stu_name = stu.getTrue_name();
							stus_name = stus_name + stu_name + " ";
						}
					}
				}
				String indexs_id = DictionaryService.findEvalsIndex(index_id).getIndex_name();
				if (!set.contains(indexs_id)) {
					temp1 += DictionaryService.findEvalsIndex(index_id).getIndex_name() + ":" + stus_name + " ";
					set.add(indexs_id);
				} else {
					temp1 += stus_name + ";";
				}
			}
			dailyInspect.setTemp1(temp1);
			temp1 = "";
		}
		StringBuilder sb = new StringBuilder();
		for (DailyInspect dailyInspect : lists) {
			sb.append("<tr>");
			String className = DictionaryService.findOrg(dailyInspect.getSdi_class_id()).getOrg_name();
			sb.append("	<td align='center'>" + className + "</td>");
			String teacherid = DictionaryService.findOrg(dailyInspect.getSdi_class_id()).getHead_tea_id();
			String teacherName = DictionaryService.findTeacher(teacherid).getTrue_name();
			sb.append("	<td align='center'>" + teacherName + "</td>");
			sb.append("	<td align='center'>" + dailyInspect.getSum_grade() + "</td>");
			sb.append("	<td align='center'>" + dailyInspect.getTemp1() + "</td>");
			sb.append("	<td align='center'>" + (lists.indexOf(dailyInspect) + 1) + "</td>");
			sb.append("</tr>");
		}
		try {
			response.getWriter().print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 班主任查看早操成绩 by宋浩 2016-05-16
	 * */
	@RequestMapping("CampusTeacher/web/headmasterSeeMorningExerciseReword.do")
	public ModelAndView headmasterSeeMorningExerciseReword(HttpSession session, String current_role_selected,
			HttpServletRequest request) {
		if (current_role_selected != null) {
			session.setAttribute("current_role_selected", current_role_selected);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Teacher tea = (Teacher) session.getAttribute("current_user");
		DailyInspect di = new DailyInspect();
		String type = "1";
		String year = "2015";
		List<DailyInspect> lists = dailyInspectService.getHeadteaDailyInspectByDYId(tea.getId(), sdf.format(date),
				type, year);
		String temp1 = "";
		for (DailyInspect dailyInspect : lists) {
			DailyInspectDetails dailyInspectDetails = new DailyInspectDetails();
			dailyInspectDetails.setInspect_id(dailyInspect.getId());
			List<DailyInspectDetails> selectList = dailyInspectDetailsService.selectList(dailyInspectDetails);
			Set<String> set = new HashSet<String>();
			for (DailyInspectDetails a : selectList) {
				String index_id = ((DailyInspectDetails) a).getIndex_id();
				double grade = ((DailyInspectDetails) a).getGrade();
				String object_id = ((DailyInspectDetails) a).getInspect_object_id();// 获取同一扣分项下的对象
				String stus_name = "";
				if (object_id != null) {
					String[] result = object_id.split(",");
					for (int i = 0; i < result.length; i++) {
						String stu_id = result[i];
						Student stu = studentService.selectByID1(stu_id);
						if (stu != null) {
							String stu_name = stu.getTrue_name();
							stus_name = stus_name + stu_name + " ";
						}
					}
				}
				String indexs_id = DictionaryService.findEvalsIndex(index_id).getIndex_name();
				if (!set.contains(indexs_id)) {
					temp1 += DictionaryService.findEvalsIndex(index_id).getIndex_name() + ":" + stus_name + " ";
					set.add(indexs_id);
				} else {
					temp1 += stus_name + ";";
				}
			}
			dailyInspect.setTemp1(temp1);
			temp1 = "";
		}

		map.put("orgList", lists);
		return new ModelAndView("/campusViews/campusTeacher/headmasterSeeMorningExerciseReword", map);
	}

	/**
	 * 根据日期、年级、量化类别查看早操成绩 by 宋浩 2016-05-17
	 * */
	@RequestMapping("CampusTeacher/web/ajaxGetDailyIns.do")
	public ModelAndView ajaxGetDailyIns(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String begin_time = request.getParameter("begin_Time");
		String year = request.getParameter("year");
		String type = request.getParameter("leibie");
		response.setCharacterEncoding("utf-8");
		Teacher tea = (Teacher) session.getAttribute("current_user");
		List<DailyInspect> lists = dailyInspectService
				.getHeadteaDailyInspectByDYId(tea.getId(), begin_time, type, year);
		String temp1 = "";
		for (DailyInspect dailyInspect : lists) {
			DailyInspectDetails dailyInspectDetails = new DailyInspectDetails();
			dailyInspectDetails.setInspect_id(dailyInspect.getId());
			List<DailyInspectDetails> selectList = dailyInspectDetailsService.selectList(dailyInspectDetails);
			Set<String> set = new HashSet<String>();
			for (DailyInspectDetails a : selectList) {
				String index_id = ((DailyInspectDetails) a).getIndex_id();
				double grade = ((DailyInspectDetails) a).getGrade();
				String object_id = ((DailyInspectDetails) a).getInspect_object_id();// 获取同一扣分项下的对象
				String stus_name = "";
				if (object_id != null) {
					String[] result = object_id.split(",");
					for (int i = 0; i < result.length; i++) {
						String stu_id = result[i];
						Student stu = studentService.selectByID1(stu_id);
						if (stu != null) {
							String stu_name = stu.getTrue_name();
							stus_name = stus_name + stu_name + " ";
						}
					}
				}
				String indexs_id = DictionaryService.findEvalsIndex(index_id).getIndex_name();
				if (!set.contains(indexs_id)) {
					temp1 += DictionaryService.findEvalsIndex(index_id).getIndex_name() + ":" + stus_name + " ";
					set.add(indexs_id);
				} else {
					temp1 += stus_name + ";";
				}
			}
			dailyInspect.setTemp1(temp1);
			temp1 = "";
		}
		StringBuilder sb = new StringBuilder();
		for (DailyInspect dailyInspect : lists) {
			sb.append("<tr>");
			String className = DictionaryService.findOrg(dailyInspect.getSdi_class_id()).getOrg_name();
			sb.append("	<td align='center'>" + className + "</td>");
			sb.append("	<td align='center'>" + dailyInspect.getSum_grade() + "</td>");
			sb.append("	<td align='center'>" + dailyInspect.getTemp1() + "</td>");
			sb.append("</tr>");
		}
		try {
			response.getWriter().print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 班主任：查看班级学生职务
	 * 
	 * @author 张向杨
	 * @param flag
	 *            标记用户点击的按钮
	 * @param type
	 *            标记用户类型
	 * @param date
	 *            字符串日期
	 * @since 2016-04-21 检索日期
	 * */
	@RequestMapping("CampusTeacher/web/classManager.do")
	public String classManager(HttpSession session, ModelMap modelMap) {
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		Org org = new Org();
		org.setHead_tea_id(teacher.getId());
		org.setState("1");
		// 老师带的班级
		List<Org> classList = orgService.selectList(org);

		Student stu = new Student();
		stu.setClass_id(classList.get(0).getId());
		stu.setState("1");
		// 班级学生
		List<Student> stuList = studentService.selectList(stu);

		StuLeaders stuLeaders = new StuLeaders();
		stuLeaders.setState("1");
		stuLeaders.setSsl_org_id(classList.get(0).getId());
		// 班级职务人员
		List<StuLeaders> stuLeadersList = stuLeadersService.selectList(stuLeaders);
		// 处理有职务的学生
		for (StuLeaders stuLeaders2 : stuLeadersList) {

			for (int i = 0; i < stuList.size(); i++) {
				if (stuLeaders2.getSsl_stu_id().equals(stuList.get(i).getId())) {
					Duties duties = dutiesService.selectByID(stuLeaders2.getSsl_duties_id());
					stuList.get(i).setTemp1(duties.getName());
				}
			}
		}
		Duties duties = new Duties();
		duties.setType("2");
		duties.setState("1");
		// 学生职务
		List<Duties> dutiesList = dutiesService.selectList(duties);

		modelMap.put("dutiesList", dutiesList);
		modelMap.put("stuList", stuList);
		modelMap.put("classList", classList);
		return "/campusViews/campusTeacher/classManager";
	}

	/**
	 * 班主任班级管理： ajax获得所带班级学生,ajax撤销学生职务
	 * 
	 * @author 张向杨
	 * @createDate 2016-05-29
	 * @param classId
	 *            班级id
	 * @param stuId
	 *            撤职学生id
	 * 
	 * @param quitReason
	 *            离职原因
	 * 
	 * @throws IOException
	 * */
	@RequestMapping("CampusTeacher/web/ajaxGetStudents.do")
	public String ajaxGetStudents(@RequestParam("classId") String classId, String stuId, String duty,
			String quitReason, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");

		// 处理撤职学生
		if (stuId != null) {
			if (!(duty.equals("") || duty == null)) {
				StuLeaders stuLeaders = new StuLeaders();
				stuLeaders.setSsl_org_id(DictionaryService.findStudent(stuId).getClass_id());
				stuLeaders.setSsl_stu_id(stuId);
				stuLeaders.setState("1");
				// 取出数据
				List<StuLeaders> selectList = stuLeadersService.selectList(stuLeaders);
				StuLeaders stuLeader = selectList.get(0);
				stuLeader.setEnd_time(Common.getNowTime());
				stuLeader.setSsl_quit_reason(quitReason);
				stuLeader.setState("2");
				// 修改职务表
				stuLeadersService.update(stuLeader);

				// 删除管理身份
				if (selectList.get(0).getSsl_role_id() != null) {
					UserRole userRole = new UserRole();
					userRole.setUser_id(stuId);
					userRole.setRole_id("ROLE_STUDENT_CLASS_MANAGER");
					userRole.setState("1");
					List selectList2 = userRoleService.selectList(userRole);
					// 删除
					userRoleService.delete((UserRole) selectList2.get(0));
				}
			}

		}

		Student stu = new Student();
		stu.setClass_id(classId);
		stu.setState("1");
		// 班级学生
		List<Student> stuList = studentService.selectList(stu);

		StuLeaders stuLeaders = new StuLeaders();
		stuLeaders.setState("1");
		stuLeaders.setSsl_org_id(classId);
		// 班级职务人员
		List<StuLeaders> stuLeadersList = stuLeadersService.selectList(stuLeaders);

		for (StuLeaders stuLeaders2 : stuLeadersList) {

			for (Student student : stuList) {
				if (stuLeaders2.getSsl_stu_id().equals(student.getId())) {
					Duties duties = dutiesService.selectByID(stuLeaders2.getSsl_duties_id());
					student.setTemp1(duties.getName());
				}
			}
		}
		StringBuilder sb = new StringBuilder();
		int i = 0;
		for (Student student : stuList) {
			sb.append("<tr>");
			sb.append("<td>" + (++i) + "</td>");
			sb.append("<td>" + student.getStu_code() + "</td>");
			sb.append("<td>" + student.getTrue_name() + "</td>");
			sb.append("<td>" + DictionaryService.findOrg(student.getClass_id()).getOrg_name() + "</td>");
			sb.append("<td>" + student.getSex() + "</td>");
			sb.append("<td>" + student.getPhone() + "</td>");
			if (student.getTemp1() != null)
				sb.append("<td id='" + student.getId() + "'>" + student.getTemp1() + "</td>");
			else
				sb.append("<td id='" + student.getId() + "'>" + "" + "</td>");

			sb.append("<td> <button class='btn btn-success' onclick='openModel(" + "\"" + student.getId() + "\""
					+ ")'>" + "任职</button>");
			sb.append("<button class='btn btn-default' onclick='dismissal(" + "\"" + student.getId() + "\"" + ")'>"
					+ "离职</button></td>");
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.println(sb.toString());
		printWriter.close();

		return null;
	}

	/**
	 * 班主任班级管理： 保存学生职务
	 * 
	 * @author 张向杨
	 * @createDate 2016-05-29
	 * @param dutiesId
	 *            职务id
	 * @param flag
	 *            标识符：y 代表有管理身份 n代表没有管理身份
	 * @param stuId
	 *            学生id
	 * @param note
	 *            备注
	 * */
	@RequestMapping("CampusTeacher/web/saveStudentDuties.do")
	public String saveStudentDuties(String dutiesId, String flag, String stuId, String note, HttpSession session) {
		// 班级id
		String classId = DictionaryService.findStudent(stuId).getClass_id();

		StuLeaders stuLeaders = new StuLeaders();
		stuLeaders.setSsl_create_user(Common.getOneTeaId(session));
		stuLeaders.setSsl_duties_id(dutiesId);
		stuLeaders.setSsl_org_id(classId);
		stuLeaders.setSsl_stu_id(stuId);
		stuLeaders.setSsl_note(note);
		if (flag.equals("y")) {
			stuLeaders.setSsl_role_id("ROLE_STUDENT_CLASS_MANAGER");
			userRoleService.saveUserRole(stuId, "ROLE_STUDENT_CLASS_MANAGER");
		} else {
			// 什么都不做
		}
		stuLeadersService.insert(stuLeaders);
		return "redirect:classManager.do";
	}

	/**
	 * @Description 课堂管理首页
	 * @author 李达
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/CourseManageIndex.do")
	public ModelAndView CourseManageIndex(HttpSession session, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = (Teacher) session.getAttribute("current_user");

		// 定义3个List集合，分别用于保存教学日志表、教学班表、课程信息表
		List<TeachLogs> tls = new ArrayList<TeachLogs>();
		List<TeachingClass> tcs = new ArrayList<TeachingClass>();
		List<Courses> courses = new ArrayList<Courses>();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		TeachLogs t3 = new TeachLogs(); // 教师第一次登陆使用无数据时的初始化数据-提示信息
		t3.setId("1");
		t3.setTemp4("您还没有授课记录！");
		t3.setSection_num("0");
		t3.setTemp5("");
		tls.add(t3);// 将此信息保存到集合tls中

		List<TeachingTask> ts = teachingTaskService.selectByTeaId(teacher.getId());// 根据教师ID获取此教师所有授课任务表
		for (TeachingTask t : ts) { // 遍历授课任务表集合 ts
			String teaching_task_id = t.getId(); // 获取授课任务表ID
			tcs.add(teachingClassService.selectByID(t.getTeaching_class_id())); // 保存此教师的教学班信息到集合tcs
			tls.addAll(teachLogsService.selectByTeaching_task_id(teaching_task_id)); // 将此教师所有教学日志表保存到tls中
			
		}

		if (tls.size() > 1) {// 如果教学日志表数量大于1，表示存在教学日志，则删除初始化提示信息
			int i = 0;
			if (tls.get(i).getId() == "1") { // 查找id=1的记录(此记录为初始化信息)并删除
				tls.remove(i);
				i++;
			}

			for (TeachLogs t : tls) {// 遍历所有有效的教学日志表
				t.setTemp5(((Courses) courseService
						.selectByID(teachingClassService.selectByID(
								teachingTaskService.selectByID(t.getTeaching_task_id()).getTeaching_class_id())
								.getCourses_id())).getCourse_name()); // 将课程名暂存到备用字段5
				t.setTemp4(sdf.format(t.getTeach_time()));// 将教学日期暂存到备用字段4
			}
		}
		// 对集合tls按照学号从小到大排序
		Collections.sort(tls, new Comparator<TeachLogs>() {
			public int compare(TeachLogs arg1, TeachLogs arg0) {
				return (arg0.getTeach_time()+arg0.getSection_num()).compareTo((arg1.getTeach_time()+arg1.getSection_num()));
			}
		});
		//最近的10节
		for(int u = 0;u<=tls.size();u++){
			if(u > 9){
				tls.remove(8);
			}
		}
		java.util.Date nowDate = new java.util.Date();
		String date = sdf.format(nowDate);
		
		map.put("date", date);
		map.put("tcs", tcs);
		map.put("tls", tls);
		return new ModelAndView("/campusViews/campusTeacher/CourseManageIndex", map);
	}

	/**
	 * @Description 课堂管理首页-ajax根据课程获取相应授课记录
	 * @author 李达
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 * @throws ParseException 
	 */
	@RequestMapping("CampusTeacher/ajaxGetScope.do")
	public String ajaxGetScope(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws ParseException {
		response.setCharacterEncoding("UTF-8");
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String tea_id = teacher.getId(); // 获取教师id
		String sel = request.getParameter("sel"); // 课程id
		String begin_date  = request.getParameter("begin_date"); //开始日期
		String end_date  = request.getParameter("end_date"); //结束日期
		Date date2 = sdf.parse(end_date);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		cal2.add(Calendar.DAY_OF_MONTH, +1);
		String et = sdf.format(cal2.getTime());
		StringBuffer sb = new StringBuffer();
		java.sql.Date begin_time = java.sql.Date.valueOf(begin_date);
		java.sql.Date end_time = java.sql.Date.valueOf(et);

		sb.append("<ul id='inx' class='listitem'>");
		if (sel.equals("all") || sel == "all") {// 显示全部，基本与ManageIndex相同
			List<TeachLogs> tls = new ArrayList<TeachLogs>();
			List<TeachingTask> ts = teachingTaskService.selectByTeaId(tea_id); // 根据教师ID获取所有授课任务表
			for (TeachingTask t : ts) { // 遍历授课任务表，将所有教学日志表保存到 集合tls中
				List<TeachLogs> tl = teachLogsService.selectByTeaching_task_id(t.getId());
				tls.addAll(tl);
			}
			
			if (tls.size() < 1 || tls == null) {
				sb.append("<li>您还没有授课记录！</li>");
			} else if (tls.size() >= 1) {
				// 对集合tls按照学号从小到大排序
				Collections.sort(tls, new Comparator<TeachLogs>() {
					public int compare(TeachLogs arg1, TeachLogs arg0) {
						return (arg0.getTeach_time()+arg0.getSection_num()).compareTo((arg1.getTeach_time()+arg1.getSection_num()));
					}
				});
				//最近的10节
				for(int u = 0;u<=tls.size();u++){
					if(u > 9){
						tls.remove(8);
					}
				}
				for (TeachLogs t1 : tls) {// 遍历所有有效的教学日志表
					String class_name = ((Courses) courseService.selectByID(teachingClassService.selectByID(
							teachingTaskService.selectByID(t1.getTeaching_task_id()).getTeaching_class_id())
							.getCourses_id())).getCourse_name();// 获取
					String time = sdf.format(t1.getTeach_time());// 格式化教学日期
					sb.append("<a data-toggle='html' href='CourseDetailsView.do?id=" + t1.getId() + "'><li>" + time
							+ " " + t1.getSection_num() + "节 " + class_name + "</li></a>");
				}
			}

		} else {// 根据选择的课程id：sel 获取授课任务表
			/* TeachingTask tct = new TeachingTask(); */
			TeachingClass tcs = teachingClassService.selectByID(sel);
			TeachingTask tt = teachingTaskService.selectByTc_idAndTea_id(tcs.getId(), tea_id);
			/*
			 * for (TeachingClass t : tcs) { TeachingTask tt =
			 * teachingTaskService.selectByTc_idAndTea_id(t.getId(), tea_id); if
			 * (tt != null) ; tct = tt; }
			 */
			// 获取相关教学日志表
			List<TeachLogs> tls = teachLogsService.selectByTimeAndTtId(begin_time, end_time, tt.getId());
			// 对集合tls按照学号从小到大排序
			Collections.sort(tls, new Comparator<TeachLogs>() {
				public int compare(TeachLogs arg1, TeachLogs arg0) {
					return (arg0.getTeach_time()+arg0.getSection_num()).compareTo((arg1.getTeach_time()+arg1.getSection_num()));
				}
			});
			if (tls.size() > 0) {
				for (TeachLogs t1 : tls) {// 遍历所有有效的教学日志表
					String class_name = ((Courses) courseService.selectByID(teachingClassService.selectByID(
							teachingTaskService.selectByID(t1.getTeaching_task_id()).getTeaching_class_id())
							.getCourses_id())).getCourse_name();// 获取
					String time = sdf.format(t1.getTeach_time());// 格式化教学日期

					sb.append("<a data-toggle='html' href='CourseDetailsView.do?id=" + t1.getId() + "'><li>" + time
							+ " " + t1.getSection_num() + "节 " + class_name + "</li></a>");
				}
			} else {
				sb.append("<li>您还没有此课程的授课记录！</li>");
			}
		}
		sb.append("<li style='display:none'><br></li>");
		sb.append("</ul>");

		try {
			response.getWriter().println(sb.toString());
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description 课堂点名：选择课堂信息界面
	 * @author 李达
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/CourseRollCall.do")
	public ModelAndView CourseRollCall(HttpSession session, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		String tea_id = teacher.getId(); // 获取教师id
		String year = Common.getSchoolYear(); // 获取学年
		String semester = Common.getSemester(); // 获取学期
		String section_num = Common.getSectionNum(); // 获取节次
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date nowDate = new java.util.Date();
		String date = sdf.format(nowDate);

		List<TeachingClass> tcss = new ArrayList<TeachingClass>();

		// 根据教师ID获取所有授课任务表
		List<TeachingTask> ts = teachingTaskService.selectByTeaId(tea_id);
		for (TeachingTask t : ts) {// 遍历授课任务表，将教学班保存到集合tcss中
			tcss.add(teachingClassService.selectByID(t.getTeaching_class_id()));
		}

		map.put("date", date);
		map.put("section_num", section_num);
		map.put("year", year);
		map.put("semester", semester);
		map.put("tcss", tcss);
		return new ModelAndView("/campusViews/campusTeacher/CourseRollCall", map);
	}

	/**
	 * @Description 课堂点名：选择课堂信息界面-ajax获取教室
	 * @author 李达
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/ajaxGetCRSelect.do")
	public String ajaxGetCRSelect(HttpServletResponse response, HttpServletRequest request) {
		response.setCharacterEncoding("UTF-8");
		String msg = request.getParameter("msg");
		List<ClassRoom> cr = classRoomService.selectByScrNum(msg);

		StringBuffer sb = new StringBuffer();
		sb.append("<select class='select' id='classroom'>");
		for (ClassRoom c : cr) {
			sb.append("<option value='" + c.getId() + "'>" + c.getScr_name() + "</option>");
		}
		sb.append("</select>");

		try {
			response.getWriter().println(sb.toString());
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description 课堂点名：点名界面
	 * @author 李达
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/goRollCall.do")
	public ModelAndView goRollCall(HttpSession session, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String classroom = request.getParameter("c"); // 教室id
		String tc_id = request.getParameter("d"); // 教学班id
		String date = request.getParameter("a"); // 日期
		String section_num = request.getParameter("b"); // 节次
		String year = Common.getSchoolYear(); // 获取学年
		String semester = Common.getSemester(); // 获取学期
		String cs_name = classRoomService.selectByID(classroom).getScr_name();
		String time = null;
		Timestamp nowtime;
		// 根据节次判断时间 点，并与年月日date组合
		if (section_num.equals("1-2")) {
			time = date + " 08:30:01";
		} else if (section_num.equals("3-4")) {
			time = date + " 10:30:01";
		} else if (section_num.equals("5-6")) {
			time = date + " 13:30:01";
		} else if (section_num.equals("7-8")) {
			time = date + " 15:30:01";
		} else if (section_num.equals("9-10")) {
			time = date + " 17:30:01";
		}

		nowtime = Timestamp.valueOf(time);// String转换为Timestamp

		List<TeachingClassMembers> tcms = teachingClassMembersService.selectByTc_id(tc_id);// 根据教学班ID获取教学班所有成员
		List<Student> allstus = new ArrayList<Student>();// 预定义list：存放班级所有学生

		// 遍历教学班成员 表，根据学生获取所有学生，并将学生保存到集合allstus中
		for (TeachingClassMembers t : tcms) {
			allstus.add(studentService.selectByID(t.getStudent_id()));
		}
		// 对集合allstus按照学号从小到大排序
		Collections.sort(allstus, new Comparator<Student>() {
			public int compare(Student arg0, Student arg1) {
				return arg0.getStu_code().compareTo(arg1.getStu_code());
			}
		});

		String tc_name = teachingClassService.selectByID(tc_id).getTc_name();// 获取教学班名
		for (Student s : allstus) {
			// 根据学生 ID和上课时间 获取请假申请表 ，2为影响范围：上课，若当前处于请假状态，则返回请假 记录表，否则为null
			Application app = applicationService.CheckByStuId(s.getId(), nowtime, "2");
			String mark;// 标记字段 ：标记是否请假
			if (app == null) {
				mark = "";
			} else {
				mark = "（请假）";
			}
			s.setTemp3(mark);
		}

		map.put("semester", semester);
		map.put("year", year);
		map.put("tc_name", tc_name);
		map.put("cs_name", cs_name);
		map.put("classroom", classroom);
		map.put("allstus", allstus);
		map.put("section_num", section_num);
		map.put("date", date);
		map.put("tc_id", tc_id);
		return new ModelAndView("/campusViews/campusTeacher/CourseDoRollCall", map);
	}

	/**
	 * @Description 课堂点名：保存此次点名信息，以及旷课学生
	 * @author 李达
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/doSubmitRollCall.do")
	public String doSubmitRollCall(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String tea_id = ((Teacher) session.getAttribute("current_user")).getId();// 获取教师ID
		String classroom = request.getParameter("classroom");
		String tc_id = request.getParameter("tc_id");
		String date = request.getParameter("date");
		String section_num = request.getParameter("section_num");
		String classreduce = request.getParameter("reduce");// 获取旷课人员
		String[] reduceList = classreduce.split(",");// 存入数组
		String log_id = request.getParameter("log_id");
		Timestamp nowtime;
		String time = null;
		Boolean b = false;
		List<Student> stus = new ArrayList<Student>();

		for (int i = 0; i < reduceList.length; i++) {
			stus.add(studentService.selectByID(reduceList[i]));
		}

		if (stus == null || null == stus.get(0) || stus.size() < 1) {
			b = false;
		} else {
			b = true;
		}

		String tt_id = teachingTaskService.selectByTc_idAndTea_id(tc_id, tea_id).getId();

		if (section_num.equals("1-2")) {
			time = date + " 10:00:00";
		} else if (section_num.equals("3-4")) {
			time = date + " 12:00:00";
		} else if (section_num.equals("5-6")) {
			time = date + " 15:00:00";
		} else if (section_num.equals("7-8")) {
			time = date + " 16:50:00";
		} else if (section_num.equals("9-10")) {
			time = date + " 19:00:00";
		}

		String id;
		nowtime = Timestamp.valueOf(time);
		CourseEvaluate ce = new CourseEvaluate();
		TeachLogs tl1 = new TeachLogs();
		java.sql.Date date1 = java.sql.Date.valueOf(date);
		// 判断当前时间、节次、教学任务ID和 地点是否 有相同 教学日志表记录
		TeachLogs tl2 = teachLogsService.selectByTCsIdSnAndCrId((java.sql.Date) date1, tt_id, classroom, section_num);

		/**
		 * 要求全校唯一指标，类型为课堂,且第一条指标为缺勤
		 */
		EvaluateStandard e = (EvaluateStandard) evaluateStandardService.selectByTypeAndScope("课堂", "szxy");
		String es_id = e.getId();
		List<EvalsIndex> ei = evalsIndexService.selectByStandId(es_id);
		String index_id = ei.get(0).getId();
		if (log_id != null) { // 修改点名
			id = log_id;
			TeachLogs tl3 = teachLogsService.selectByID(log_id);
			tl3.setAbsence_num(stus.size());
			teachLogsService.update(tl3);
			if (b == true) {
				List<CourseEvaluate> ces = courseEvaluateService.selectByIndexIdAndLogId(index_id, log_id);
				for (CourseEvaluate c : ces) {
					courseEvaluateService.delete(c);
				}
				for (Student s : stus) {
					Timestamp d = new Timestamp(System.currentTimeMillis());
					ce.setId(Common.returnUUID());
					ce.setEval_time(d);// 当前时间
					ce.setTeach_log_id(log_id);
					ce.setEval_user_id(tea_id);// 教师ID
					ce.setStu_id(s.getId());
					ce.setEval_type("1");// 老师评价学生
					ce.setStandard_id(es_id);
					ce.setIndex_id(index_id);
					courseEvaluateService.insert(ce);
				}
			}
		} else {

			if (tl2 == null) {// 如果没有本节课程的 任何信息
				tl1.setId(Common.returnUUID());
				tl1.setTeaching_task_id(tt_id);
				tl1.setSection_num(section_num);
				tl1.setClass_room_id(classroom);
				tl1.setTeach_time(nowtime);
				tl1.setAbsence_num(stus.size());
				teachLogsService.insert(tl1);
				id = tl1.getId();
				if (b == true) {
					for (Student s : stus) {
						ce.setId(Common.returnUUID());
						ce.setEval_time(nowtime);// 当前时间
						ce.setTeach_log_id(tl1.getId());
						ce.setEval_user_id(tea_id);// 教师ID
						ce.setStu_id(s.getId());
						ce.setEval_type("1");// 老师评价学生
						ce.setStandard_id(es_id);
						ce.setIndex_id(index_id);
						courseEvaluateService.insert(ce);
					}
				}
			} else {
				id = tl2.getId();
				tl1.setAbsence_num(stus.size());
				teachLogsService.update(tl2);
				if (b == true) {
					List<CourseEvaluate> ces = courseEvaluateService.selectByLogId(tl2.getId());
					for (CourseEvaluate c : ces) {
						courseEvaluateService.delete(c);
					}
					for (Student s : stus) {
						Timestamp d = new Timestamp(System.currentTimeMillis());
						ce.setId(Common.returnUUID());
						ce.setEval_time(d);// 当前时间
						ce.setTeach_log_id(tl2.getId());
						ce.setEval_user_id(tea_id);// 教师ID
						ce.setStu_id(s.getId());
						ce.setEval_type("1");// 老师评价学生
						ce.setStandard_id(es_id);
						ce.setIndex_id(index_id);
						courseEvaluateService.insert(ce);
					}
				}
			}
		}
		return "redirect:CourseDetailsView.do?id=" + id;// 修改为跳转到查看页面
	}

	/**
	 * @Description 课堂评价-选择课堂信息界面
	 * @author 师杰
	 * @CreateDate 2016-05-15
	 * @version 1.0
	 */
	@RequestMapping("CampusTeacher/CourseAssessment.do")
	public ModelAndView CourseAssessment(HttpSession session, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String tea_id = ((Teacher) session.getAttribute("current_user")).getId();// 获取教师ID
		String year = Common.getSchoolYear();// 获取学年
		String semester = Common.getSemester();// 获取学期
		String section_num = Common.getSectionNum();// 获取节次

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date nowDate = new java.util.Date();
		String date = sdf.format(nowDate);

		List<TeachingClass> tcss = new ArrayList<TeachingClass>();
		// 根据教师ID获取所有授课任务表
		List<TeachingTask> ts = teachingTaskService.selectByTeaId(tea_id);

		for (TeachingTask t : ts) {// 遍历授课任务表
			tcss.add(teachingClassService.selectByID(t.getTeaching_class_id()));
		}

		List<Student> stus = new ArrayList<Student>();
		List<Student> stus1 = new ArrayList<Student>();

		for (TeachingClass t : tcss) {
			String tc_id = t.getId();
			List<TeachingClassMembers> tcms = teachingClassMembersService.selectByTc_id(t.getId());// 获取教学班所有学生
			for (TeachingClassMembers t1 : tcms) {
				Student st = studentService.selectByID1(t1.getId());
				stus.add(st);
			}
			map.put(tc_id, stus);// 键：教学班ID 值：教学班所有学生
		}
		map.put("stus1", stus1);
		map.put("date", date);
		map.put("section_num", section_num);
		map.put("year", year);
		map.put("semester", semester);
		map.put("tcss", tcss);
		return new ModelAndView("/campusViews/campusTeacher/CourseAssessment", map);

	}

	/**
	 * @Description 课堂评价-评价教学班
	 * @author 师杰
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/CourseAmClass.do")
	public ModelAndView CourseAmClass(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		String classroom = request.getParameter("classroom"); // 获取教室id
		String tc_id = request.getParameter("tc_id"); // 获取教学班id
		String date = request.getParameter("date"); // 获取日期
		String section_num = request.getParameter("section_num"); // 获取节次
		String d = request.getParameter("desc"); // 获取评价
		if (d != null) {
			String desc = new String(d.getBytes("iso-8859-1"), "utf-8");
			map.put("desc", desc);
		}
		String year = Common.getSchoolYear();
		String semester = Common.getSemester();
		String tc_name = teachingClassService.selectByID(tc_id).getTc_name();
		String cs_name = classRoomService.selectByID(classroom).getScr_name();

		map.put("cs_name", cs_name);
		map.put("classroom", classroom);
		map.put("tc_id", tc_id);
		map.put("tc_name", tc_name);
		map.put("date", date);
		map.put("section_num", section_num);
		map.put("year", year);
		map.put("semester", semester);
		return new ModelAndView("/campusViews/campusTeacher/CourseAmClass", map);
	}

	/**
	 * @Description 课堂评价-评价个人
	 * @author 师杰
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/CourseAmPerson.do")
	public ModelAndView CourseAmPerson(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		String classroom = request.getParameter("classroom"); // 获取教室id
		String tc_id = request.getParameter("tc_id"); // 获取教学班id
		String date = request.getParameter("date"); // 获取日期
		String section_num = request.getParameter("section_num"); // 获取节次
		String year = Common.getSchoolYear();
		String semester = Common.getSemester();
		List<TeachingClassMembers> tcms = teachingClassMembersService.selectByTc_id(tc_id);
		List<Student> stus = new ArrayList<Student>();
		for (TeachingClassMembers t : tcms) {
			Student s = studentService.selectByID1(t.getStudent_id());
			stus.add(s);
		}
		// 对集合stus按照学号从小到大排序
		Collections.sort(stus, new Comparator<Student>() {
			public int compare(Student arg0, Student arg1) {
				return arg0.getStu_code().compareTo(arg1.getStu_code());
			}
		});
		String tc_name = teachingClassService.selectByID(tc_id).getTc_name();
		// 要求全校唯一指标
		EvaluateStandard e = (EvaluateStandard) evaluateStandardService.selectByTypeAndScope("课堂", "szxy");
		String es = e.getId();
		List<EvalsIndex> ei = evalsIndexService.selectByStandId(e.getId());
		ei.remove(0);
		String cs_name = classRoomService.selectByID(classroom).getScr_name();
		map.put("cs_name", cs_name);
		map.put("es", es);
		map.put("ei", ei);
		map.put("classroom", classroom);
		map.put("tc_id", tc_id);
		map.put("tc_name", tc_name);
		map.put("date", date);
		map.put("section_num", section_num);
		map.put("stus", stus);
		map.put("year", year);
		map.put("semester", semester);
		return new ModelAndView("/campusViews/campusTeacher/CourseAmPerson", map);
	}

	/**
	 * @Description 课堂评价-保存对教学班评价
	 * @author 师杰
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/doSubmitAmClass.do")
	public String doSubmitAmClass(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String tea_id = ((Teacher) session.getAttribute("current_user")).getId();// 获取教师ID
		String tx = request.getParameter("tx"); // 获取评价内容
		String section_num = request.getParameter("section_num"); // 获取节次
		String classroom = request.getParameter("classroom"); // 获取教室id
		String date = request.getParameter("date"); // 获取日期
		String tc_id = request.getParameter("tc_id"); // 获取教学班id
		String id = null;
		Timestamp nowtime;
		String time = null;
		String tt_id = teachingTaskService.selectByTc_idAndTea_id(tc_id, tea_id).getId();

		if (section_num.equals("1-2")) {
			time = date + " 10:00:00";
		} else if (section_num.equals("3-4")) {
			time = date + " 12:00:00";
		} else if (section_num.equals("5-6")) {
			time = date + " 15:00:00";
		} else if (section_num.equals("7-8")) {
			time = date + " 16:50:00";
		} else if (section_num.equals("9-10")) {
			time = date + " 19:00:00";
		}

		nowtime = Timestamp.valueOf(time);
		CourseEvaluate ce = new CourseEvaluate();

		java.sql.Date date1 = java.sql.Date.valueOf(date);
		// 判断当前时间、节次、教学任务ID和 地点是否 有相同 教学日志表记录
		TeachLogs tl2 = teachLogsService.selectByTCsIdSnAndCrId((java.sql.Date) date1, tt_id, classroom, section_num);
		Timestamp d = new Timestamp(System.currentTimeMillis());

		if (tl2 == null) {// 如果没有本节课程的 任何信息
			TeachLogs tl1 = new TeachLogs();
			tl1.setId(Common.returnUUID());
			tl1.setTeaching_task_id(tt_id);
			tl1.setSection_num(section_num);
			tl1.setClass_room_id(classroom);
			tl1.setTeach_time(nowtime);
			tl1.setAbsence_num(-1);
			teachLogsService.insert(tl1);

			ce.setId(Common.returnUUID());
			ce.setEval_time(d);
			ce.setTeach_log_id(tl1.getId());
			ce.setEval_user_id(tea_id);
			ce.setClass_id(tc_id);
			ce.setEval_type("1");
			ce.setEval_desc(tx);
			courseEvaluateService.insert(ce);

			id = tl1.getId();
		} else {// 遍历cev，查看是否有过对此班级的评价，若有则更新为此次评价内容
			int i = 0;
			List<CourseEvaluate> cev = courseEvaluateService.selectByLogId(tl2.getId());
			for (CourseEvaluate c : cev) {
				String class_id = c.getClass_id();
				if (class_id != null) {
					if (class_id.equals(tc_id)) {
						id = tl2.getId();
						c.setEval_desc(tx);
						courseEvaluateService.update(c);
						break;
					} else {
						i++;
					}
				} else {
					i++;
				}
			}
			if (i == cev.size()) {
				id = tl2.getId();
				ce.setId(Common.returnUUID());
				ce.setEval_time(d);
				ce.setTeach_log_id(tl2.getId());
				ce.setEval_user_id(tea_id);
				ce.setClass_id(tc_id);
				ce.setEval_type("1");
				ce.setEval_desc(tx);
				courseEvaluateService.insert(ce);
			}
		}

		return "redirect:CourseDetailsView.do?id=" + id;
	}

	/**
	 * @Description 课堂评价-保存对学生个人评价
	 * @author 师杰
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 */
	@RequestMapping("CampusTeacher/doSubmitAmPerson.do")
	public String doSubmitAmPerson(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String tea_id = ((Teacher) session.getAttribute("current_user")).getId();// 获取教师ID
		String es = request.getParameter("es");
		String index_id2 = request.getParameter("index_id2"); // 原来的评价指标
		String index_id = request.getParameter("index_id"); // 新的评价指标
		String section_num = request.getParameter("section_num"); // 获取节次
		String classroom = request.getParameter("classroom"); // 获取教室id
		String date = request.getParameter("date"); // 获取日期
		String log_id = request.getParameter("log_id");
		String tc_id = request.getParameter("tc_id"); // 获取教学班id
		String classreduce = request.getParameter("reduce");// 获取旷课人员
		String[] reduceList = classreduce.split(",");// 存入数组
		Timestamp nowtime;
		String time = null;
		String id;
		List<Student> stus = new ArrayList<Student>();// 所有被标记学生
		String tt_id = teachingTaskService.selectByTc_idAndTea_id(tc_id, tea_id).getId();
		if (reduceList[0] != "") {
			for (int i = 0; i < reduceList.length; i++) {
				String stu_id = reduceList[i];
				Student stu = studentService.selectByID(stu_id);
				stus.add(stu);
			}
		}
		if (section_num.equals("1-2")) {
			time = date + " 10:00:00";
		} else if (section_num.equals("3-4")) {
			time = date + " 12:00:00";
		} else if (section_num.equals("5-6")) {
			time = date + " 15:00:00";
		} else if (section_num.equals("7-8")) {
			time = date + " 16:50:00";
		} else if (section_num.equals("9-10")) {
			time = date + " 19:00:00";
		}
		nowtime = Timestamp.valueOf(time);
		CourseEvaluate ce = new CourseEvaluate();
		Timestamp d = new Timestamp(System.currentTimeMillis());
		java.sql.Date date1 = java.sql.Date.valueOf(date);
		// 判断当前时间、节次、教学任务ID和 地点是否 有相同 教学日志表记录
		TeachLogs tl2 = teachLogsService.selectByTCsIdSnAndCrId((java.sql.Date) date1, tt_id, classroom, section_num);
		if (log_id != null) { // 修改评价
			id = log_id;
			List<CourseEvaluate> ce2 = courseEvaluateService.selectByIndexIdAndLogId(index_id2, log_id);
			for (CourseEvaluate c : ce2) {
				courseEvaluateService.delete(c); // 将原来的指标记录删除
			}
			if (stus != null && stus.size() > 0) { // 存在学生
				for (Student s : stus) {
					CourseEvaluate ce1 = courseEvaluateService.selectByLogIdAndStuIdAndIndexId(log_id, s.getId(),
							index_id);
					if (ce1 == null) {
						ce.setId(Common.returnUUID());
						ce.setEval_time(d);// 当前时间
						ce.setTeach_log_id(log_id);
						ce.setEval_user_id(tea_id);// 教师ID
						ce.setStu_id(s.getId());
						ce.setEval_type("1");// 老师评价学生
						ce.setStandard_id(es);
						ce.setIndex_id(index_id);
						courseEvaluateService.insert(ce);
					}
				}
			} else {
			}
		} else {
			if (tl2 == null) {// 如果没有本节课程的 任何信息
				TeachLogs tl1 = new TeachLogs();
				tl1.setId(Common.returnUUID());
				tl1.setTeaching_task_id(tt_id);
				tl1.setSection_num(section_num);
				tl1.setClass_room_id(classroom);
				tl1.setTeach_time(nowtime);
				tl1.setAbsence_num(-1);
				teachLogsService.insert(tl1);

				for (Student s : stus) {
					CourseEvaluate ce1 = courseEvaluateService.selectByLogIdAndStuIdAndIndexId(tl1.getId(), s.getId(),
							index_id);
					if (ce1 == null) {
						ce.setId(Common.returnUUID());
						ce.setEval_time(d);// 当前时间
						ce.setTeach_log_id(tl1.getId());
						ce.setEval_user_id(tea_id);// 教师ID
						ce.setStu_id(s.getId());
						ce.setEval_type("1");// 老师评价学生
						ce.setStandard_id(es);
						ce.setIndex_id(index_id);
						courseEvaluateService.insert(ce);
					} else {
						continue;
					}
				}

				id = tl1.getId();
			} else {
				id = tl2.getId();
				for (Student s : stus) {
					CourseEvaluate ce1 = courseEvaluateService.selectByLogIdAndStuIdAndIndexId(tl2.getId(), s.getId(),
							index_id);
					if (ce1 == null) {
						ce.setId(Common.returnUUID());
						ce.setEval_time(d);// 当前时间
						ce.setTeach_log_id(tl2.getId());
						ce.setEval_user_id(tea_id);// 教师ID
						ce.setStu_id(s.getId());
						ce.setEval_type("1");// 老师评价学生
						ce.setStandard_id(es);
						ce.setIndex_id(index_id);
						courseEvaluateService.insert(ce);
					} else {
						continue;
					}
				}
			}
		}
		return "redirect:CourseDetailsView.do?id=" + id;// 修改为跳转到查看页面
	}

	/**
	 * @Description 查看 课堂点名及评价
	 * @author 师杰
	 * @CreateDate 2016-05-31
	 * @version 1.3
	 * @throws UnsupportedEncodingException
	 */
	@SuppressWarnings("unused")
	@RequestMapping("CampusTeacher/CourseDetailsView.do")
	public ModelAndView CourseDetailsView(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id");// 获取教学日志id
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int del1 = 0; // 点名显隐
		int del2 = 0; // 评价显隐
		int del3 = 0;
		int true_num = 0; // 应到人数
		int app_num = 0; // 请假人数
		int lev_num = 0; // 缺勤人数

		String time = ""; // 日期
		TeachingClass tc_class = new TeachingClass(); // 教学班
		List<CourseEvaluate> evals = new ArrayList<CourseEvaluate>(); // 旷课记录
		List<CourseEvaluate> eevals = new ArrayList<CourseEvaluate>(); // 评价记录
		List<CourseEvaluate> evals_one = new ArrayList<CourseEvaluate>(); // 个人评价记录
		List<CourseEvaluate> evals_class = new ArrayList<CourseEvaluate>(); // 教学班评价记录
		List<CourseEvaluate> evals_ones = new ArrayList<CourseEvaluate>();
		List<Student> stus = new ArrayList<Student>(); // 教学班成员
		List<Student> app_stus = new ArrayList<Student>(); // 请假人员
		List<Student> lev_stus = new ArrayList<Student>(); // 旷课人员
		TeachLogs logs = new TeachLogs();
		String place = null;
		logs = teachLogsService.selectByID(id); // 获取教学日志表
		place = classRoomService.selectByID(logs.getClass_room_id()).getScr_name(); // 获取教室名

		if (logs.getAbsence_num() == -1) { // -1为缺勤人数默认值，表示未点名
			del1 = 0; // 隐藏点名信息
		} else {
			del1 = 1; // 显示点名信息
		}

		Timestamp t = logs.getTeach_time(); // 获取教学日期
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		try {
			time = sdf.format(t); // 格式化时间
		} catch (Exception e2) {
			e2.printStackTrace();
		}

		TeachingTask teach_task = teachingTaskService.selectByID(logs.getTeaching_task_id()); // 获取教学任务表

		tc_class = teachingClassService.selectByID(teach_task.getTeaching_class_id()); // 获取教学班
		// 获取班级成员表学生信息-应到人数；迟到学生信息-缺勤人数；请假人员信息-请假人数；实到人数=应到-缺勤-请假

		List<TeachingClassMembers> tcms = teachingClassMembersService.selectByTc_id(teach_task.getTeaching_class_id());
		true_num = tcms.size(); // 应到人数
		for (TeachingClassMembers tcm : tcms) {
			stus.add(studentService.selectByID1(tcm.getStudent_id()));
		}

		for (Student s : stus) {
			// 根据学生 ID和上课时间 获取请假申请表 ，若当前处于请假状态，则返回请假 记录表，否则为null
			Application app = applicationService.CheckByStuId(s.getId(), t, "2");
			if (app != null) {
				app_stus.add(studentService.selectByID1(app.getSla_real_students_id()));
			}
		}
		app_num = app_stus.size(); // 请假人数

		List<CourseEvaluate> evaluates = courseEvaluateService.selectByLogId(id);
		String evi = "111"; // 当前默认旷课保存 指标id：111 待修改
		if (evaluates.size() > 0) { // 若存在课堂记录
			EvaluateStandard e = (EvaluateStandard) evaluateStandardService.selectByTypeAndScope("课堂", "szxy");
			String es_id = e.getId();
			List<EvalsIndex> ei = evalsIndexService.selectByStandId(es_id);
			String index_id = ei.get(0).getId();
			for (CourseEvaluate c : evaluates) {
				if (c.getIndex_id() == null) {
					eevals.add(c);
				} else if (c.getIndex_id().equals(index_id)) {
					evals.add(c);
				} else {
					eevals.add(c);
				}
			}
			for (CourseEvaluate ce : evals) {
				Student stu2 = studentService.selectByID1(ce.getStu_id());
				lev_stus.add(stu2);
			}
		}
		lev_num = lev_stus.size(); // lev_num = logs.getAbsence_num();

		if (eevals.size() > 0) { // 若存在评价记录
			for (CourseEvaluate e : eevals) {
				if (e.getStu_id() != null) {
					evals_one.add(e);
				} else {
					evals_class.add(e);
				}
			}

			List<CourseEvaluate> ces = new ArrayList<CourseEvaluate>();
			if (evals_one.size() > 0) { // 存在对个人的评价
				List<String> indexs = new ArrayList<String>();
				List<String> stu_ids = new ArrayList<String>();
				int j = 0;
				for (CourseEvaluate e1 : evals_one) { // 取出所有被评价学生
					String index_id = e1.getIndex_id(); // 指标id
					for (int i = 0; i < indexs.size(); i++) {
						if (indexs.get(i).equals(e1.getIndex_id())) {
							continue;
						} else {
							j++;
						}
					}
					if (j == indexs.size()) {
						j = 0;
						indexs.add(e1.getIndex_id());
						EvalsIndex ev = (EvalsIndex) evalsIndexService.selectByID(e1.getIndex_id());
						List<CourseEvaluate> cei = courseEvaluateService.selectByIndexIdAndLogId(e1.getIndex_id(),
								e1.getTeach_log_id());
						String stu_names = "";
						for (CourseEvaluate c : cei) {
							stu_names = stu_names + " " + studentService.selectByID1(c.getStu_id()).getTrue_name();
						}
						e1.setTemp5(stu_names);
						e1.setTemp4(ev.getIndex_name());
					} else {
						j = 0;
					}
				}
				/*
				 * 学生姓名对应指标 List<String> stu_ids = new ArrayList<String>(); for
				 * (CourseEvaluate e1 : evals_one) { int j = 0; for (int i = 0;
				 * i < stu_ids.size(); i++) { if
				 * (stu_ids.get(i).equals(e1.getStu_id())) { continue; } else {
				 * j++; } } if (j == stu_ids.size() || stu_ids.size() == 0) {
				 * String index_name = ""; ces =
				 * courseEvaluateService.selectByLogIdAndStuId
				 * (e1.getTeach_log_id(), e1.getStu_id());
				 * stu_ids.add(stu_ids.size(), e1.getStu_id());
				 * e1.setTemp4(studentService
				 * .selectByID1(e1.getStu_id()).getTrue_name()); // 学生姓名
				 * 
				 * for (CourseEvaluate c1 : ces) { EvalsIndex ev = (EvalsIndex)
				 * evalsIndexService.selectByID(c1.getIndex_id()); index_name =
				 * index_name + " " + ev.getIndex_name(); }
				 * 
				 * e1.setTemp5(index_name); } }
				 */
			}
			// 消除重复数据
			for (CourseEvaluate aaa : evals_one) {
				if (aaa.getTemp5() != null) {
					evals_ones.add(aaa);
				}
			}

			if (evals_class.size() > 0) { // 存在对教学班 的评价
				del3 = 1;
				for (CourseEvaluate e2 : evals_class) {
					TeachingClass tc = teachingClassService.selectByID(e2.getClass_id());
					e2.setTemp3(tc.getTc_name());
				}
			}
		}

		if (eevals == null || eevals.size() == 0) {
			del2 = 0;
		} else {
			del2 = 1;
		}

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String section_num = teachLogsService.selectByID(id).getSection_num();
		String date = sdf1.format(teachLogsService.selectByID(id).getTeach_time());
		String classroom = teachLogsService.selectByID(id).getClass_room_id();
		// 控制显隐
		map.put("del1", del1);
		map.put("del2", del2);
		map.put("del3", del3);

		map.put("time", time);
		map.put("logs", logs);
		map.put("place", place);

		map.put("true_num", true_num);
		map.put("app_num", app_num);
		map.put("lev_num", lev_num);
		map.put("stus", stus);
		map.put("app_stus", app_stus);
		map.put("lev_stus", lev_stus);

		map.put("tc_class", tc_class);
		map.put("evals_one", evals_ones);
		map.put("evals_class", evals_class);

		map.put("date", date);
		map.put("section_num", section_num);
		map.put("classroom", classroom);
		return new ModelAndView("/campusViews/campusTeacher/CourseDetailsView", map);
	}

	/**
	 * @Description 课堂点名：修改点名界面
	 * @author 李达
	 * @CreateDate 2016-06-08
	 * @version 1.0
	 */
	@RequestMapping("CampusTeacher/editRollCall.do")
	public ModelAndView editRollCall(HttpSession session, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String log_id = request.getParameter("log_id"); // 日志id
		String classroom = request.getParameter("classroom"); // 教室id
		String tc_id = request.getParameter("tc_id"); // 教学班id
		String date = request.getParameter("date"); // 日期
		String section_num = request.getParameter("section_num"); // 节次
		String year = Common.getSchoolYear(); // 获取学年
		String semester = Common.getSemester(); // 获取学期
		String cs_name = classRoomService.selectByID(classroom).getScr_name();
		String time = null;
		Timestamp nowtime;
		// 根据节次判断时间 点，并与年月日date组合
		if (section_num.equals("1-2")) {
			time = date + " 08:30:01";
		} else if (section_num.equals("3-4")) {
			time = date + " 10:30:01";
		} else if (section_num.equals("5-6")) {
			time = date + " 13:30:01";
		} else if (section_num.equals("7-8")) {
			time = date + " 15:30:01";
		} else if (section_num.equals("9-10")) {
			time = date + " 17:30:01";
		}

		nowtime = Timestamp.valueOf(time);// String转换为Timestamp

		List<TeachingClassMembers> tcms = teachingClassMembersService.selectByTc_id(tc_id);// 根据教学班ID获取教学班所有成员
		List<Student> allstus = new ArrayList<Student>();// 预定义list：存放班级所有学生

		// 遍历教学班成员 表，根据学生获取所有学生，并将学生保存到集合allstus中
		for (TeachingClassMembers t : tcms) {
			allstus.add(studentService.selectByID(t.getStudent_id()));
		}
		// 对集合allstus按照学号从小到大排序
		Collections.sort(allstus, new Comparator<Student>() {
			public int compare(Student arg0, Student arg1) {
				return arg0.getStu_code().compareTo(arg1.getStu_code());
			}
		});

		String tc_name = teachingClassService.selectByID(tc_id).getTc_name();// 获取教学班名
		for (Student s : allstus) {
			// 根据学生 ID和上课时间 获取请假申请表 ，2为影响范围：上课，若当前处于请假状态，则返回请假 记录表，否则为null
			Application app = applicationService.CheckByStuId(s.getId(), nowtime, "2");
			String mark;// 标记字段 ：标记是否请假
			if (app == null) {
				mark = "";
			} else {
				mark = "（请假）";
			}
			s.setTemp3(mark);
		}
		List<CourseEvaluate> ces1 = courseEvaluateService.selectByLogId(log_id);
		List<String> ces2 = new ArrayList<String>(); // 获取缺勤人员
		for (CourseEvaluate c : ces1) {
			EvaluateStandard e = (EvaluateStandard) evaluateStandardService.selectByTypeAndScope("课堂", "szxy");
			List<EvalsIndex> ei = evalsIndexService.selectByStandId(e.getId());
			if (c.getIndex_id() != null && c.getIndex_id().equals(ei.get(0).getId())) {
				ces2.add(c.getStu_id());
			} else {
				continue;
			}
		}
		map.put("log_id", log_id);
		map.put("ces2", ces2);
		map.put("semester", semester);
		map.put("year", year);
		map.put("tc_name", tc_name);
		map.put("cs_name", cs_name);
		map.put("classroom", classroom);
		map.put("allstus", allstus);
		map.put("section_num", section_num);
		map.put("date", date);
		map.put("tc_id", tc_id);
		return new ModelAndView("/campusViews/campusTeacher/CourseEditRollCall", map);
	}

	/**
	 * @Description 课堂评价：修改对学生个人评价
	 * @author 李达
	 * @CreateDate 2016-06-12
	 * @version 1.0
	 */
	@RequestMapping("CampusTeacher/editAmPerson.do")
	public ModelAndView editAmPerson(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		String eva_id = request.getParameter("eva_id"); // 评价表id
		String log_id = request.getParameter("log_id"); // 日志id
		String classroom = request.getParameter("classroom"); // 获取教室id
		String tc_id = request.getParameter("tc_id"); // 获取教学班id
		String date = request.getParameter("date"); // 获取日期
		String section_num = request.getParameter("section_num"); // 获取节次

		String year = Common.getSchoolYear();
		String semester = Common.getSemester();

		List<TeachingClassMembers> tcms = teachingClassMembersService.selectByTc_id(tc_id);
		List<Student> stus = new ArrayList<Student>();
		for (TeachingClassMembers t : tcms) {
			Student s = studentService.selectByID1(t.getStudent_id());
			stus.add(s);
		}
		// 对集合stus按照学号从小到大排序
		Collections.sort(stus, new Comparator<Student>() {
			public int compare(Student arg0, Student arg1) {
				return arg0.getStu_code().compareTo(arg1.getStu_code());
			}
		});
		String tc_name = teachingClassService.selectByID(tc_id).getTc_name();
		// 要求全校唯一指标
		EvaluateStandard e = (EvaluateStandard) evaluateStandardService.selectByTypeAndScope("课堂", "szxy");
		String es = e.getId();
		List<EvalsIndex> ei = evalsIndexService.selectByStandId(e.getId());
		ei.remove(0);
		String cs_name = classRoomService.selectByID(classroom).getScr_name(); // 教室名

		List<String> ces2 = new ArrayList<String>(); // 获取指标对应的学生
		CourseEvaluate ce = courseEvaluateService.selectByID(eva_id);
		String index_id = ce.getIndex_id();
		List<CourseEvaluate> ces1 = courseEvaluateService.selectByIndexIdAndLogId(index_id, log_id);
		for (CourseEvaluate c : ces1) {
			ces2.add(c.getStu_id());
		}
		map.put("index_id", index_id);
		map.put("ces2", ces2);
		map.put("cs_name", cs_name);
		map.put("es", es);
		map.put("ei", ei);
		map.put("classroom", classroom);
		map.put("tc_id", tc_id);
		map.put("tc_name", tc_name);
		map.put("date", date);
		map.put("section_num", section_num);
		map.put("stus", stus);
		map.put("year", year);
		map.put("log_id", log_id);
		map.put("semester", semester);
		return new ModelAndView("/campusViews/campusTeacher/CourseEditAmPerson", map);
	}

	/**
	 * @Description 课堂管理web：学生考勤/课堂评价情况
	 * @author 李达
	 * @CreateDate 2016-06-13
	 * @version 1.0
	 * @throws ParseException
	 */
	@RequestMapping("CampusTeacher/web/courseAttendance.do")
	public ModelAndView courseAttendance(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher tea = (Teacher) session.getAttribute("current_user"); // 当前教师
		String nowYear = Common.getSchoolYear(); // 当前学年2015-2016 2015.9-2016.7
		String semester = Common.getSemester(); // 当前学期
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowDate = sdf.format(d);
		// 截取字符串，重新拼成yyyy-MM-dd格式
		String[] years = nowYear.split("-");
		String s_year = null;
		String e_year = null;
		if (semester.equals("1")) {
			s_year = years[0] + "-08-01";
			e_year = years[1] + "-02-28";
		} else if (semester.equals("2")) {
			s_year = years[1] + "-03-01";
			e_year = years[1] + "-07-31";
		}

		java.sql.Date sy = java.sql.Date.valueOf(s_year); // 开始日期
		java.sql.Date ey = java.sql.Date.valueOf(e_year); // 结束日期
		// 此教师的所有授课任务表
		List<TeachingClass> tc = new ArrayList<TeachingClass>();
		try {
			List<TeachingTask> tt = teachingTaskService.selectByTimeAndTeaId(sy, ey, tea.getId());

			for (TeachingTask t : tt) {
				tc.add(teachingClassService.selectByID(t.getTeaching_class_id()));
			}
			map.put("tc", tc);
		} catch (Exception e) {
			TeachingClass t1 = new TeachingClass();
			t1.setId("");
			t1.setTc_name("无");
			tc.add(t1);
			map.put("tc", tc);
		}
		map.put("nowDate", nowDate);
		map.put("nowYear", nowYear);
		map.put("semester", semester);
		return new ModelAndView("/campusViews/campusTeacher/courseAttendance", map);
	}

	/**
	 * @Description ajax查询教学班
	 * @author 李达
	 * @CreateDate 2016-06-13
	 * @version 1.0
	 * @throws ParseException
	 */
	@RequestMapping("CampusTeacher/web/ajaxGetTClass.do")
	public String ajaxGetTClass(HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws ParseException {
		response.setCharacterEncoding("UTF-8");
		Teacher tea = (Teacher) session.getAttribute("current_user"); // 当前教师
		String schoolYear = request.getParameter("schoolYear");
		String semester = request.getParameter("semester");
		String[] years = schoolYear.split("-");
		String s_year = null;
		String e_year = null;
		if (semester.equals("1")) {
			s_year = years[0] + "-08-01";
			e_year = years[1] + "-02-28";
		} else if (semester.equals("2")) {
			s_year = years[1] + "-03-01";
			e_year = years[1] + "-07-31";
		}

		java.sql.Date sy = java.sql.Date.valueOf(s_year); // 开始日期
		java.sql.Date ey = java.sql.Date.valueOf(e_year); // 结束日期
		List<TeachingClass> tc = new ArrayList<TeachingClass>();
		/*
		 * //此教师的所有授课任务表 List<TeachingTask> tt =
		 * teachingTaskService.selectByTimeAndTeaId(sy, ey, tea.getId());
		 * //获取此教师所有教学班
		 * 
		 * for(TeachingTask t : tt){
		 * tc.add(teachingClassService.selectByID(t.getTeaching_class_id())); }
		 */
		try {
			List<TeachingTask> tt = teachingTaskService.selectByTimeAndTeaId(sy, ey, tea.getId());

			for (TeachingTask t : tt) {
				tc.add(teachingClassService.selectByID(t.getTeaching_class_id()));
			}
		} catch (Exception e) {
			TeachingClass t1 = new TeachingClass();
			t1.setId("");
			t1.setTc_name("无");
			tc.add(t1);
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<select id='tc_id' name='tc_id'>");
		if (tc != null) {
			for (TeachingClass t1 : tc) {
				sb.append("<option value=" + t1.getId() + ">" + t1.getTc_name() + "</option>");
			}
		}
		sb.append("</select>");
		try {
			// response.getWriter().println(stringBuilder.toString());
			response.getWriter().println(sb.toString());
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return null;

	}

	/**
	 * @Description ajax查询学生考勤/课堂评价情况
	 * @author 李达
	 * @CreateDate 2016-06-13
	 * @version 1.0
	 * @throws ParseException
	 */
	@RequestMapping("CampusTeacher/web/ajaxGetAttendance.do")
	public String ajaxGetAttendance(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws ParseException {
		response.setCharacterEncoding("UTF-8");
		Teacher tea = (Teacher) session.getAttribute("current_user"); // 当前教师
		/*
		 * String schoolYear = request.getParameter("schoolYear"); //学年 String
		 * semester = request.getParameter("semester"); //学期
		 */String tc_id = request.getParameter("tc_id"); // 教学班id
		String begin_time = request.getParameter("begin_time"); // 开始日期
		String end_time = request.getParameter("end_time"); // 结束日期
		session.setAttribute("webAmScopBt", begin_time);
		session.setAttribute("webAmScopEt", end_time);
		String scope = request.getParameter("scope"); // 查询项
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date2 = sdf.parse(end_time);
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);
		cal2.add(Calendar.DAY_OF_MONTH, +1);
		String et = sdf.format(cal2.getTime());
		java.sql.Date bd = java.sql.Date.valueOf(begin_time); // 开始日期
		java.sql.Date ed = java.sql.Date.valueOf(et); // 结束日期

		String tea_name = tea.getTrue_name(); // 教师名
		String course_id = teachingClassService.selectByID(tc_id).getCourses_id(); // 课程id
		Courses course = (Courses) courseService.selectByID(course_id); // 课程记录
		String course_name = course.getCourse_name(); // 课程名

		List<Student> allstus = new ArrayList<Student>(); // 所有学生
		List<Student> app_lev_stus = new ArrayList<Student>(); // 所有请假+旷课学生
		List<Student> am_stus = new ArrayList<Student>(); // 所有评价学生
		// 获取教学班所有成员,并将学生存到all_stus中
		List<TeachingClassMembers> tcm = teachingClassMembersService.selectByTc_id(tc_id);
		for (TeachingClassMembers t3 : tcm) {
			allstus.add(studentService.selectByID1(t3.getStudent_id()));
		}

		List<TeachLogs> tl = new ArrayList<TeachLogs>(); // 获取所有教学日志表

		// 要求全校唯一指标
		EvaluateStandard e = (EvaluateStandard) evaluateStandardService.selectByTypeAndScope("课堂", "szxy"); // 获取课堂评分标准
		// 获取指标，取第一个：缺勤
		List<EvalsIndex> ei = evalsIndexService.selectByStandId(e.getId());
		String lev_index = ei.get(0).getId(); // 缺勤指标
		ei.remove(0);

		StringBuffer sb = new StringBuffer();
		// 根据此教师和教学班id查询教学任务表
		TeachingTask teat = teachingTaskService.selectByTc_idAndTea_id(tc_id, tea.getId());

		tl.addAll(teachLogsService.selectByTimeAndTtId(bd, ed, teat.getId()));
		List<Student> stuList = null;

		if (scope.equals("1")) { // 查询考勤
			sb.append("<tr id='biaotou' >");
			sb.append("<td width='10'>序号</td>");
			sb.append("<td width='40'>教师姓名</td>");
			sb.append("<td width='100'>课程名称</td>");
			sb.append("<td width='60'>日期</td>");
			sb.append("<td width='40'>节次</td>");
			sb.append("<td width='60'>班级</td>");
			sb.append("<td width='40'>学生姓名</td>");
			sb.append("<td width='50'>学号</td>");
			sb.append("<td width='120'>请假/缺勤</td></tr>");
			for (TeachLogs t2 : tl) {
				Timestamp teach_time = t2.getTeach_time(); // 获取上课时间
				String teach_time1 = sdf.format(teach_time); // 教学日期
				String section_num = t2.getSection_num(); // 节次
				// 1.查询请假人员
				for (Student s : allstus) {
					// 根据学生 ID和上课时间 获取请假申请表 ，若当前处于请假状态，则返回请假 记录表，否则为null
					Application app = applicationService.CheckByStuId(s.getId(), teach_time, "2");
					if (app != null) {
						Student stu = studentService.selectByID1(app.getSla_real_students_id());
						Student stu1 = new Student();
						stu1.setId(stu.getId()); // id
						stu1.setTrue_name(stu.getTrue_name()); // 姓名
						stu1.setStu_code(stu.getStu_code()); // 学号
						stu1.setLogin_pass(teach_time1); // 日期
						stu1.setWx_code(section_num); // 节次
						stu1.setHome_addr(DictionaryService.findOrg(stu.getClass_id()).getOrg_name()); // 班级
						stu1.setBirthplace("请假"); // 请假
						app_lev_stus.add(stu1);
					}
				}
				// 2.查缺勤人员
				// 根据日志表id和缺勤指标查询所有 缺勤评价记录
				List<CourseEvaluate> lev_ce = courseEvaluateService.selectByIndexIdAndLogId(lev_index, t2.getId());
				for (CourseEvaluate c : lev_ce) {
					Student stu = studentService.selectByID1(c.getStu_id());
					Student stu2 = new Student();
					stu2.setId(stu.getId()); // id
					stu2.setTrue_name(stu.getTrue_name()); // 姓名
					stu2.setStu_code(stu.getStu_code()); // 学号
					stu2.setLogin_pass(teach_time1); // 日期
					stu2.setWx_code(section_num); // 节次
					stu2.setHome_addr(DictionaryService.findOrg(stu.getClass_id()).getOrg_name()); // 班级
					stu2.setBirthplace("缺勤"); // 请假
					app_lev_stus.add(stu2);
				}
			}
			if (app_lev_stus.size() > 0 && app_lev_stus != null) {
				Collections.sort(app_lev_stus, new Comparator<Student>() {
					public int compare(Student arg0, Student arg1) {
						return (arg1.getLogin_pass() + arg1.getWx_code()).compareTo((arg0.getLogin_pass() + arg0
								.getWx_code()));
					}
				});
				stuList = app_lev_stus;
				session.setAttribute("tea_name", tea_name);
				session.setAttribute("course_name", course_name);
				session.setAttribute("app_lev_stus", app_lev_stus);
				app_lev_stus = Common.getListCurrentPage(app_lev_stus, pageSizeConstant, Integer.parseInt("1"));

				for (int i = 0; i < app_lev_stus.size(); i++) {
					sb.append("<tr id='biaotou'>");
					sb.append("<td width='10'>" + (i + 1) + "</td>"); // 序号
					sb.append("<td width='40'>" + tea_name + "</td>"); // 教师姓名
					sb.append("<td width='100'>" + course_name + "</td>"); // 课程名
					sb.append("<td width='60'>" + app_lev_stus.get(i).getLogin_pass() + "</td>"); // 日期
					sb.append("<td width='40'>" + app_lev_stus.get(i).getWx_code() + "</td>"); // 节次

					sb.append("<td width='60'>" + app_lev_stus.get(i).getHome_addr() + "</td>"); // 班级
					sb.append("<td width='40'>" + app_lev_stus.get(i).getTrue_name() + "</td>"); // 学生名
					sb.append("<td width='50'>" + app_lev_stus.get(i).getStu_code() + "</td>"); // 学号
					sb.append("<td width='120'>" + app_lev_stus.get(i).getBirthplace() + "</td>"); // 缺勤
																									// 请假
					sb.append("</tr>");
				}
			}
		} else if (scope.equals("2")) { // 查询评价
			sb.append("<tr id='biaotou' >");
			sb.append("<td width='10'>序号</td>");
			sb.append("<td width='40'>教师姓名</td>");
			sb.append("<td width='100'>课程名称</td>");
			sb.append("<td width='60'>日期</td>");
			sb.append("<td width='40'>节次</td>");
			sb.append("<td width='60'>班级</td>");
			sb.append("<td width='40'>学生姓名</td>");
			sb.append("<td width='50'>学号</td>");
			sb.append("<td width='120'>评价内容</td></tr>");
			for (TeachLogs t2 : tl) {
				Timestamp teach_time = t2.getTeach_time(); // 获取上课时间
				String teach_time1 = sdf.format(teach_time); // 教学日期
				String section_num = t2.getSection_num(); // 节次
				// 用于保存所有学生被评价的记录
				List<CourseEvaluate> am_ce = new ArrayList<CourseEvaluate>();
				// 根据日志表id和缺勤指标查询所有 缺勤评价记录
				for (EvalsIndex e2 : ei) {
					List<CourseEvaluate> ce = courseEvaluateService.selectByIndexIdAndLogId(e2.getId(), t2.getId());
					am_ce.addAll(ce);
				}

				for (CourseEvaluate c : am_ce) {
					EvalsIndex es = (EvalsIndex) evalsIndexService.selectByID(c.getIndex_id());
					String desc = es.getIndex_name();
					Student stu = studentService.selectByID1(c.getStu_id());
					Student stu2 = new Student();
					stu2.setId(stu.getId()); // id
					stu2.setTrue_name(stu.getTrue_name()); // 姓名
					stu2.setStu_code(stu.getStu_code()); // 学号
					stu2.setLogin_pass(teach_time1); // 日期
					stu2.setWx_code(section_num); // 节次
					stu2.setHome_addr(DictionaryService.findOrg(stu.getClass_id()).getOrg_name()); // 班级
					stu2.setBirthplace(desc); // 评价
					am_stus.add(stu2);
				}
			}
			if (am_stus.size() > 0 && am_stus != null) {
				Collections.sort(am_stus, new Comparator<Student>() {
					public int compare(Student arg0, Student arg1) {
						return (arg1.getLogin_pass() + arg1.getWx_code()).compareTo((arg0.getLogin_pass() + arg0
								.getWx_code()));
					}
				});
				stuList = am_stus;
				session.setAttribute("tea_name", tea_name);
				session.setAttribute("course_name", course_name);
				session.setAttribute("am_stus", am_stus);
				am_stus = Common.getListCurrentPage(am_stus, pageSizeConstant, Integer.parseInt("1"));

				for (int i = 0; i < am_stus.size(); i++) {
					sb.append("<tr id='biaotou'>");
					sb.append("<td width='10'>" + (i + 1) + "</td>"); // 序号
					sb.append("<td width='40'>" + tea_name + "</td>"); // 教师姓名
					sb.append("<td width='100'>" + course_name + "</td>"); // 课程名
					sb.append("<td width='60'>" + am_stus.get(i).getLogin_pass() + "</td>"); // 日期
					sb.append("<td width='40'>" + am_stus.get(i).getWx_code() + "</td>"); // 节次

					sb.append("<td width='60'>" + am_stus.get(i).getHome_addr() + "</td>"); // 班级
					sb.append("<td width='40'>" + am_stus.get(i).getTrue_name() + "</td>"); // 学生名
					sb.append("<td width='50'>" + am_stus.get(i).getStu_code() + "</td>"); // 学号
					sb.append("<td width='120'>" + am_stus.get(i).getBirthplace() + "</td>"); // 评价
					sb.append("</tr>");
				}
			}
		}

		// 分页
		int pageSize = 15;
		int Currentpage = 1;// 初始值1// 得到总页数
		int pageCount = 1;
		try {
			pageCount = Common.getPageCount(stuList, pageSize, Currentpage);
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		// 放到session，方便分页时调用
		session.setAttribute("stuList", stuList);
		session.setAttribute("AmPageCount", pageCount);
		session.setAttribute("nowPage", Currentpage);

		try {
			response.getWriter().println(sb.toString());
			response.getWriter().close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description 生成课堂考勤、评价 的excel表格
	 * @author 李达
	 * @CreateDate 2016-06-15
	 * @version 1.0
	 */
	@RequestMapping("CampusTeacher/web/exportAmExcel.do")
	public ModelAndView exportAmExcel(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String scope = request.getParameter("scope");
		String fileName = "excel文件";
		// 获取session数据
		String begin_time = (String) session.getAttribute("webAmScopBt"); // 查询开始时间
		String end_time = (String) session.getAttribute("webAmScopEt"); // 查询结束时间
		String tea_name = (String) session.getAttribute("tea_name");
		String course_name = (String) session.getAttribute("course_name");
		List<Student> stus1 = (List<Student>) session.getAttribute("app_lev_stus");
		List<Student> stus2 = (List<Student>) session.getAttribute("am_stus");
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		List<Map<String, Object>> list;
		if (scope.equals("1")) {
			fileName = begin_time + "到" + end_time + course_name + "考勤表";
			list = createExcelRecord(stus1, tea_name, course_name);
			String columnNames[] = { "序列", "教师姓名", "课程名称", "日期", "节次", "班级", "学生姓名", "学号", "请假/缺勤" };// 列名
			String keys[] = { "id", "tea_name", "course_name", "Login_pass", "Wx_code", "Home_addr", "True_name",
					"Stu_code", "Birthplace" };// map中的key
			try {
				ExcelUtil.createWorkBook(list, keys, columnNames).write(os);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if (scope.equals("2")) {
			fileName = begin_time + "到" + end_time + course_name + "评价表";
			list = createExcelRecord(stus2, tea_name, course_name);
			String columnNames[] = { "序列", "教师姓名", "课程名称", "日期", "节次", "班级", "学生姓名", "学号", "评价" };// 列名
			String keys[] = { "id", "tea_name", "course_name", "Login_pass", "Wx_code", "Home_addr", "True_name",
					"Stu_code", "Birthplace" };// map中的key
			try {
				ExcelUtil.createWorkBook(list, keys, columnNames).write(os);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		byte[] content = os.toByteArray();
		InputStream is = new ByteArrayInputStream(content);
		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
		ServletOutputStream out = response.getOutputStream();
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			bis = new BufferedInputStream(is);
			bos = new BufferedOutputStream(out);
			byte[] buff = new byte[2048];
			int bytesRead;
			// Simple read/write loop.
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (final IOException e) {
			throw e;
		} finally {
			if (bis != null)
				bis.close();
			if (bos != null)
				bos.close();
		}
		return null;
	}

	/**
	 * @Description 下载课堂考勤、评价 的excel表格
	 * @author 李达
	 * @CreateDate 2016-06-15
	 * @version 1.0
	 */
	private List<Map<String, Object>> createExcelRecord(List<Student> stus, String tea_name, String course_name) {

		List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sheetName", "sheet1");
		listmap.add(map);
		Student stu = null;
		for (int j = 0; j < stus.size(); j++) {
			stu = stus.get(j);
			Map<String, Object> mapValue = new HashMap<String, Object>();
			mapValue.put("id", (j + 1));
			mapValue.put("tea_name", tea_name);
			mapValue.put("course_name", course_name);
			mapValue.put("Login_pass", stu.getLogin_pass());
			mapValue.put("Wx_code", stu.getWx_code());
			mapValue.put("Home_addr", stu.getHome_addr());
			mapValue.put("True_name", stu.getTrue_name());
			mapValue.put("Stu_code", stu.getStu_code());
			mapValue.put("Birthplace", stu.getBirthplace());
			listmap.add(mapValue);
		}
		return listmap;
	}

	/**
	 * @Description 实现分页功能
	 * @author 李达
	 * @CreateDate 2016-06-16
	 * @version 1.0
	 */
	@RequestMapping("CampusTeacher/web/getStudentByPage.do")
	public String getStudentByPage(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		String tea_name = (String) session.getAttribute("tea_name");
		String course_name = (String) session.getAttribute("course_name");
		List<Student> result = (List<Student>) session.getAttribute("stuList");
		String toPage = request.getParameter("toPage");
		List<Student> newResult;// 当前页的集合
		newResult = Common.getListCurrentPage(result, pageSizeConstant, Integer.parseInt(toPage));
		StringBuffer sb = new StringBuffer();
		int j = 1 + (Integer.parseInt(toPage) - 1) * 15;
		for (int i = 0; i < newResult.size(); i++) {
			sb.append("<tr id='biaotou'>");
			sb.append("<td width='10'>" + j + "</td>"); // 序号
			sb.append("<td width='40'>" + tea_name + "</td>"); // 教师姓名
			sb.append("<td width='100'>" + course_name + "</td>"); // 课程名
			sb.append("<td width='60'>" + newResult.get(i).getLogin_pass() + "</td>"); // 日期
			sb.append("<td width='40'>" + newResult.get(i).getWx_code() + "</td>"); // 节次
			j++;
			sb.append("<td width='60'>" + newResult.get(i).getHome_addr() + "</td>"); // 班级
			sb.append("<td width='40'>" + newResult.get(i).getTrue_name() + "</td>"); // 学生名
			sb.append("<td width='50'>" + newResult.get(i).getStu_code() + "</td>"); // 学号
			sb.append("<td width='120'>" + newResult.get(i).getBirthplace() + "</td>"); // 评价
			sb.append("</tr>");
		}
		sb.append("FENGETEACHER" + toPage);
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @Description 刷新同步页面上的"共n页"
	 * @author 李达
	 * @CreateDate 2016-06-15
	 * @version 1.0
	 */
	@RequestMapping("CampusTeacher/web/ajaxRefreshCount.do")
	public String ajaxRefreshCount(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws ParseException {
		response.setCharacterEncoding("UTF-8");
		String json = "";
		try {
			List<Student> result = (List<Student>) session.getAttribute("stuList");
			int pageSize = 15;
			int Currentpage = 1;
			int counta = Common.getPageCount(result, pageSize, Currentpage);
			json = "{\"AmPageCount\":" + counta + "}";
		} catch (Exception e1) {
			e1.printStackTrace();
			json = "{\"AmPageCount\":\"1\"}";
		}

		try {
			response.getWriter().println(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
