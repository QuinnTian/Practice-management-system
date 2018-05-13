package com.sict.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.sict.entity.Application;
import com.sict.entity.Association;
import com.sict.entity.AssociationMembers;
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
import com.sict.entity.Teacher;
import com.sict.service.ApplicationService;
import com.sict.service.DailyInspectDetailsService;
import com.sict.service.DailyInspectService;
import com.sict.service.DictionaryService;
import com.sict.service.DutiesService;
import com.sict.service.EvalsIndexService;
import com.sict.service.EvaluateStandardService;
import com.sict.service.ExcelService;
import com.sict.service.LevelApprovalService;
import com.sict.service.OrgService;
import com.sict.service.RoleService;
import com.sict.service.StuLeadersService;
import com.sict.service.StudentService;
import com.sict.service.TeacherService;
import com.sict.service.UserRoleService;
import com.sict.service.campus.AssociationMembersService;
import com.sict.service.campus.AssociationService;
import com.sict.util.Common;
import com.sict.util.Constants;

/*
 * 功能：在校生学生控制器
 * 使用 @Controller 注释
 * byxzw 2015年11月17日10:36:58	 * 
 * 
 * */
@Controller
public class CampusStudentController {
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
	 * 注入studentService by周睿20160113 *
	 */
	@Resource(name = "studentService")
	private StudentService studentService;

	/**
	 * 注入LevelApprovalService 师杰 20160119
	 * 
	 */
	@Resource(name = "levelApprovalService")
	private LevelApprovalService levelApprovalService;

	/**
	 * 注入applicationService by 苏衍静20160115
	 */
	@Resource(name = "applicationService")
	private ApplicationService applicationService;
	/**
	 * 注入orgService by 苏衍静20160120
	 */
	@Resource(name = "orgService")
	private OrgService orgService;
	/**
	 * 注入teacherService by 苏衍静20160120
	 */
	@Resource(name = "teacherService")
	private TeacherService teacherService;
	/**
	 * 注入DailyInspectService by 李达20160123
	 */
	@Resource(name = "dailyInspectService")
	private DailyInspectService dailyInspectService;
	/**
	 * 注入evaluateStandardService by 李达20160301
	 */
	@Resource(name = "evaluateStandardService")
	private EvaluateStandardService evaluateStandardService;
	/**
	 * 注入dailyInspectDetailsService by 李达20160303
	 */
	@Resource(name = "dailyInspectDetailsService")
	private DailyInspectDetailsService dailyInspectDetailsService;
	/**
	 * 注入associationService by 李达20160329
	 */
	@Resource(name = "associationService")
	private AssociationService associationService;
	/**
	 * 注入associationMembersService by 李达20160329
	 */
	@Resource(name = "associationMembersService")
	private AssociationMembersService associationMembersService;
	/**
	 * 注入evalsIndexService by 李达20160329
	 */
	@Resource(name = "evalsIndexService")
	private EvalsIndexService evalsIndexService;

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
	 * 注入DutiesService by 张向杨 2016-05-28
	 */
	@Resource(name = "stuLeadersService")
	private StuLeadersService stuLeadersService;
	/**
	 * 注入DutiesService by 张向杨 2016-05-28
	 */
	@Resource(name = "dutiesService")
	private DutiesService dutiesService;
	String ret = "";// 定义全局变量：返回类型 zcg 20141020

	@RequestMapping("campusStudent/index.do")
	public String toindex(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		return "/campusViews/campusStudent/index";
	}
	/**
	 * 早操自习请假跳转页面   贾建昶 2016年9月2日
	 * @param modelMap
	 * @param request
	 * @param session
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("campusStudent/InManage.do")
	public String toInManage(ModelMap modelMap, HttpServletRequest request,
			HttpSession session, HttpServletResponse response)
			throws IOException, ServletException {
		Student stu = (Student) session.getAttribute("current_user");// 获得当前的学生用户
		String type = request.getParameter("type");
		JSONArray jsonArray = new JSONArray();
		if (type.equals("zixi")) {
			if (roleService.SelectRoleByUseID(stu.getId(),
					"ROLE_STUDENT_INSPECT_MANAGER") != null) {// 纪检部长
				JSONObject jsonObject1 = new JSONObject();
				jsonObject1.put("title", "部长分配任务");
				jsonObject1.put("map", "nightClassDistribution.do");
				JSONObject jsonObject2 = new JSONObject();
				jsonObject2.put("title", "部长查看结果");
				jsonObject2.put("map", "ministerCheckNight.do");
				JSONObject jsonObject3 = new JSONObject();
				jsonObject3.put("title", "干事工作");
				jsonObject3.put("map", "nightExercises.do");
				jsonArray.add(jsonObject1);
				jsonArray.add(jsonObject2);
				jsonArray.add(jsonObject3);
				modelMap.put("message", "欢迎您~~");
			} else if (roleService.SelectRoleByUseID(stu.getId(),
					"ROLE_STUDENT_INSPECT_MEMBER") != null) {
				modelMap.put("message", "欢迎您~~");
				JSONObject jsonObject3 = new JSONObject();
				jsonObject3.put("title", "干事工作");
				jsonObject3.put("map", "nightExercises.do");
				jsonArray.add(jsonObject3);

			} else {
				JSONObject jsonObject3 = new JSONObject();
				jsonObject3.put("title", "返回主页");
				jsonObject3.put("map", "index.do");
				jsonArray.add(jsonObject3);
				modelMap.put("message", "对不起您的权限不够！");
			}
		} else if (type.equals("zhaochao")) {
			if (roleService.SelectRoleByUseID(stu.getId(),
					"ROLE_STUDENT_PE_MANAGER") != null) {// 体育部长
				JSONObject jsonObject1 = new JSONObject();
				jsonObject1.put("title", "部长分配任务");
				jsonObject1.put("map", "classDistribution.do");
				JSONObject jsonObject2 = new JSONObject();
				jsonObject2.put("title", "部长查看结果");
				jsonObject2.put("map", "ministerCheckMorning.do");
				JSONObject jsonObject3 = new JSONObject();
				jsonObject3.put("title", "干事工作");
				jsonObject3.put("map", "morningExercises.do");
				jsonArray.add(jsonObject1);
				jsonArray.add(jsonObject2);
				jsonArray.add(jsonObject3);
				modelMap.put("message", "欢迎您~~");
			} else if (roleService.SelectRoleByUseID(stu.getId(),
					"ROLE_STUDENT_PE_MEMBER") != null) {// 体育干事
				JSONObject jsonObject3 = new JSONObject();
				jsonObject3.put("title", "干事工作");
				jsonObject3.put("map", "morningExercises.do");
				jsonArray.add(jsonObject3);
				modelMap.put("message", "欢迎您~~");
			} else {
				JSONObject jsonObject3 = new JSONObject();
				jsonObject3.put("title", "返回主页");
				jsonObject3.put("map", "index.do");
				jsonArray.add(jsonObject3);
				modelMap.put("message", "对不起您的权限不够！");
			}
		} else if (type.equals("qingjia")) {
			return "redirect:MyApplication.do";
		} else {
			return "redirect:index.do";
		}

		modelMap.put("map", jsonArray);
		modelMap.put("title", stu.getTrue_name());
		return "/campusViews/campusStudent/INmanage";
	}

	/**
	 * 功能：学生在校管理--显示学生的请假申请(主页面) 20160115 syj
	 * 
	 */
	private int pageSizeConstant = Constants.pageSize; // 获取常量分页页大小

	@RequestMapping("campusStudent/MyApplication.do")
	public String toMyApplication(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Student stu = (Student) session.getAttribute("current_user");// 获得当前的学生用户
		Application a = new Application(); // 新建一个申请
		a.setSla_stu(Common.getOneStuId(session));
		List<Application> appList = this.applicationService.selectList(a);// 得到自己发布的申请

		// 分页
		int pageSize = pageSizeConstant;
		int Currentpage = 1;

		// 获取当前页集合
		List<Application> listCurrentPage = Common.getListCurrentPage(appList, pageSize, Currentpage);
		// 得到总页数
		int pageCount = Common.getPageCount(appList, pageSize, Currentpage);

		modelMap.put("SelfCount", pageCount);
		modelMap.put("SelfnowPage", Currentpage);

		List<Application> passApplicationList = new ArrayList<Application>();// 同意之后的集合（已审批）
		List<Application> failApplicationList = new ArrayList<Application>();// 不同意之后的集合（已审批）
		List<Application> noApplicationList = new ArrayList<Application>(); // 未审批的集合
		for (Application k : appList) {
			if (k.getSla_type().equalsIgnoreCase("1")) {
				k.setSla_type("事假");
			} else if (k.getSla_type().equalsIgnoreCase("2")) {
				k.setSla_type("病假");
			} else if (k.getSla_type().equalsIgnoreCase("3")) {
				k.setSla_type("探亲");
			} else if (k.getSla_type().equalsIgnoreCase("4")) {
				k.setSla_type("旅游");
			} else {
				k.setSla_type("其他");
			}

			if (k.getSla_approval_state().equals("1")) {
				k.setSla_approval_state("未审核");
				noApplicationList.add(k);

			} else if (k.getSla_approval_state().equals("2")) {
				k.setSla_approval_state("同意");
				passApplicationList.add(k);

			} else {
				k.setSla_approval_state("未同意");
				failApplicationList.add(k);
			}
		}
		modelMap.put("passApplicationList", passApplicationList);
		modelMap.put("failApplicationList", failApplicationList);
		modelMap.put("noApplicationList", noApplicationList);

		return "/campusViews/campusStudent/MyApplication";
	}

	/**
	 * 
	 * 功能：跳转至请假申请页面
	 * 
	 * @author syj 20160119
	 * 
	 */
	@RequestMapping("campusStudent/ApplyForLeave.do")
	public ModelAndView toApplyForLeave(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		Student stu = (Student) session.getAttribute("current_user");// 获得当前的学生用户
		Org org = orgService.selectByID(stu.getClass_id());// 通过学生的班级的id（即组织表的id）得到一条组织表中的记录

		String head_tea_id = org.getHead_tea_id(); // 通过得到的组织表中的记录得到班主任的id
		String counselor_id = org.getCounselor_id(); // 通过得到的组织表中的记录得到导员的id

		Teacher Head_tea = (Teacher) teacherService.selectByID(head_tea_id); // 通过班主任id得到班主任相对应的记录
		Teacher counselor = (Teacher) teacherService.selectByID(counselor_id);// 通过班主任id得到班主任相对应的记录

		String teacherName = Head_tea.getTrue_name(); // 班主任的姓名
		String teaId = Head_tea.getId(); // 获得班主任的id

		String conselorName = counselor.getTrue_name(); // 班主任的姓名
		String counselorId = counselor.getId(); // 获得班主任的id

		map.put("teacherName", teacherName);
		map.put("teaId", teaId);
		map.put("conselorName", conselorName);
		map.put("counselorId", counselorId);
		map.put("Head_tea", Head_tea);
		return new ModelAndView("/campusViews/campusStudent/ApplyForLeave", map);
	}

	/**
	 * 功能：学生在校管理--查看已提交的请假申请表详情）
	 * 
	 * @author syj 20160116
	 * 
	 */
	@RequestMapping("campusStudent/ApplyForLeavee.do")
	public ModelAndView toApplyForLeavee(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id");
		Application a = (Application) applicationService.selectByID(id);// 通过id得到申请的相关记录
		LevelApproval la = (LevelApproval) this.levelApprovalService.selectByLevel_App_ID(id);// 通过id得到审批的相关记录

		if (a.getSla_type().equalsIgnoreCase("1")) {
			a.setSla_type("事假");
		} else if (a.getSla_type().equalsIgnoreCase("2")) {
			a.setSla_type("病假");
		} else if (a.getSla_type().equalsIgnoreCase("3")) {
			a.setSla_type("探亲");
		} else if (a.getSla_type().equalsIgnoreCase("4")) {
			a.setSla_type("旅游");
		} else {
			a.setSla_type("其他");
		}

		if (a.getSla_approval_state().equals("1")) {
			a.setSla_approval_state("未审核");
		} else if (a.getSla_approval_state().equals("2")) {
			a.setSla_approval_state("同意");
		} else {
			a.setSla_approval_state("未同意");
		}

		if (a.getSla_rank().equals("1")) {
			a.setSla_rank("比较着急");
		} else if (a.getSla_approval_state().equals("2")) {
			a.setSla_rank("不是很着急");
		} else {
			a.setSla_rank("不着急");
		}

		// String teaId = a.getSla_approval_tea(); // 获得老师的id（根据申请人id）
		// String teaName =
		// DictionaryService.findTeacher(teaId).getTrue_name();// 根据老师ID获取教师姓名
		String approval_opinion = la.getApproval_opinion(); // 获得审批人的意见

		modelMap.put("a", a);
		// modelMap.put("teaName", teaName);
		modelMap.put("approval_opinion", approval_opinion);
		return new ModelAndView("/campusViews/campusStudent/ApplyForLeavee", map);
	}

	/**
	 * 
	 * 功能：学生在校管理---已提交的请假申请表的删除
	 * 
	 * @author syj 20160117
	 * 
	 */
	@RequestMapping("campusStudent/deleteApplication.do")
	public String deleteApplication(HttpServletRequest request) {
		String id = request.getParameter("id");
		Application a = applicationService.selectByID(id);
		applicationService.delete(a);
		return "redirect:MyApplication.do"; // 撤销成功后重定向到列表页面
	}

	/**
	 * 
	 * 功能:学生在校管理----添加新的请假申请
	 * 
	 * @author syj 20160119
	 * 
	 */
	@RequestMapping("campusStudent/addApplication.do")
	public String addApplication(HttpServletRequest request, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Student stu = (Student) session.getAttribute("current_user");// 获得当前的用户
		String sla_type = request.getParameter("sla_type");
		String sla_approval_tea = request.getParameter("sla_approval_tea");
		Application appli = new Application(); // 新建一个申请
		String org_code = DictionaryService.findOrg(DictionaryService.
				findOrg(stu.getClass_id()).getParent_id()).getOrg_code();//获取学生班级上级组织编码
		Date date = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMdd");
		String dateN = dateformat.format(date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sla_time = sdf.format(date);
		List<Application> todayApps = applicationService.selectBySla_time(sla_time);
		int num = todayApps.size();
		String sla_code ="";
		if(num>=0 && num <10){
			sla_code = org_code+dateN+"00"+String.valueOf(num);
		}else if(num>=10 && num <100){
			sla_code = org_code+dateN+"0"+String.valueOf(num);
		}else if(num>=100 && num <999){
			sla_code = org_code+dateN+String.valueOf(num);
		}else{
			sla_code = org_code+dateN+String.valueOf(num);
		}
		appli.setSla_code(sla_code);
		appli.setSla_stu(stu.getId());
		appli.setSla_type(request.getParameter("sla_type"));
		appli.setSla_rank(request.getParameter("sla_rank"));
		appli.setIs_level_school(request.getParameter("is_level_school"));
		appli.setSla_real_students_id(stu.getId());
		// appli.setSla_approval_tea(request.getParameter("sla_approval_tea"));
		appli.setSla_place(request.getParameter("sla_place"));
		appli.setSla_reason_desc(request.getParameter("sla_reason_desc"));
		appli.setId(Common.returnUUID());// 随机获得一个ID
		appli.setSla_duration(request.getParameter("sla_duration"));
		appli.setSla_approval_state("1");
		appli.setSla_leave_type(sla_type);
		// appli.setIs_file("2");

		String sla_begin_time = request.getParameter("sla_begin_time");// 请假开始时间的转化
		String dateBegin = request.getParameter("dateBegin");
		String beginTime = sla_begin_time + " " + dateBegin;
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:ss:mm");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		Timestamp ts1 = new Timestamp(System.currentTimeMillis());
		String ts2 = format1.format(ts1);
		try {
			ts = new Timestamp(format1.parse(beginTime).getTime());// 时间类型可以封装
			ts1 = new Timestamp(format1.parse(ts2).getTime());// 时间类型可以封装
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		appli.setSla_begin_time(ts);
		appli.setSla_time(ts1);
		String sla_end_time = request.getParameter("sla_end_time");// 请假结束时间的转化
		String dateEnd = request.getParameter("dateEnd");
		String endTime = sla_end_time + " " + dateEnd;

		DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:ss:mm");
		Timestamp tt = new Timestamp(System.currentTimeMillis());
		try {
			ts = new Timestamp(format1.parse(endTime).getTime());// 时间类型可以封装
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		appli.setSla_end_time(tt);
		applicationService.insert(appli);

		LevelApproval la = new LevelApproval();
		la.setId(Common.returnUUID());// 随机获得一个ID
		la.setLevel_application_id(appli.getId());
		la.setApproval_tea(sla_approval_tea);
		la.setApproval_time(appli.getSla_begin_time());
		la.setApproval_state("1");
		levelApprovalService.insert(la);
		return "redirect:MyApplication.do"; // 撤销成功后重定向到列表页面
	}

	// -------------------张向杨 2016-05-21
	// start------------------------------------------------------------------------

	/**
	 * 查看学生会干部 查看学生会的信息.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("campusStudent/web/seeStuUnion.do")
	public String seeStuUnion(ModelMap modelMap, HttpSession session) {
		Student stu = (Student) session.getAttribute("current_user");
		// 定义association_id 用于判断
		String association_id = null;
		// 获得学院id
		String college_id = Common.getCollegeByStuID(Common.getOneStuId(session));
		// 创建对象AssociationMembers 用于查询
		AssociationMembers associationMembers = new AssociationMembers();
		associationMembers.setSam_stu_id(stu.getId());
		List<AssociationMembers> assMember = associationMembersService.selectList(associationMembers);
		if (assMember != null) {
			// 遍历集合assMember 获得学生会的id
			for (AssociationMembers assoMember : assMember) {

				Association ass = associationService.selectByID(assoMember.getSam_association_id());
				if (ass != null) {
					if ("1".equals(ass.getSa_category()))
						association_id = assoMember.getSam_association_id();
					break;
				}

			}
		}
		Association ass = associationService.selectByID(association_id);
		modelMap.put("association", ass);
		return "campusViews/campusStudent/seeStuUnion";
	}

	/**
	 * 查看学生会具体部门的成员信息.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("campusStudent/web/seeStuUnionMemberDetail.do")
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
		return "campusViews/campusStudent/seeStuUnionMemberDetail";
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

	@RequestMapping("campusStudent/web/stuUnionMemberAdd.do")
	public String stuUnionNumberAdd(ModelMap modelMap, String id, HttpSession session) {
		Student student = (Student) session.getAttribute("current_user");
		// 初始化变量
		String college_id = null;
		List<Role> roleList = null;

		if (student != null) {
			college_id = Common.getCollegeByStuID(student.getId());
			if (college_id != null)
				roleList = roleService.selectByCollegeId(college_id, "ROLE_STUDENT");
		}
		modelMap.put("roleList", roleList);
		modelMap.put("id", id);
		return "campusViews/campusStudent/stuUnionMemberAdd";
		// return "student/stuUnionOrAssAdd";
	}

	/**
	 * 功能： ajax验证单个添加的学生会或者社团成员是否在我们的系统中、是否已经存在该社团中
	 * 
	 * @Author 鲁雪艳 张向杨 时间：　２０１６－０３－１８
	 */
	@RequestMapping("campusStudent/web/checkStuCode.do")
	public String checkStuCode(String stu_code, String assication_id, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		StringBuilder stringBuilder = new StringBuilder();
		String info = "";
		// 根据学生的学号 得到学生的id
		String stu_id = studentService.getStudentIdByCode(stu_code);
		// 判断该学生 是否在数据库中
		if (stu_id != null) {
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
		stringBuilder.append(info);

		try {
			response.getWriter().println(stringBuilder.toString());
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
	@RequestMapping("campusStudent/web/doSaveStuUnionMember.do")
	public String doSaveStuUnionMember(HttpServletRequest request) {
		// 得到当前用户
		Student stu = (Student) request.getSession().getAttribute("current_user");
		// 得到当前用户的部门id
		String dept_id = stu.getId();
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
			sld.setSsl_create_user(stu.getId());// 创建人ID
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

	@RequestMapping("campusStudent/web/importStuUnionMember.do")
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
		return "campusViews/campusStudent/importStuUnionMember";
	}

	/**
	 * 验证导入的学生会 或者社团干部的成员信息. 导入学生会 社团通用
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping(value = "campusStudent/web/checkStuUnionOrAssMembe.do", method = RequestMethod.POST)
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
			ret = "campusViews/campusStudent/importStuUnionMember";
		else if ("AssociationExcel".equals(type))
			ret = "campusViews/campusStudent/importAssociationMember";

		return ret;
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
	 * 保存 导入的学生会成员、社团成员
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("campusStudent/web/saveStuUnionOrAssMember.do")
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
		Student stu = (Student) session.getAttribute("current_user");
		// 得到当前用户的部门id
		String tea_dept_id = stu.getId();
		String stu_college_id = stu.getClass_id();
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
							stuld.setSsl_create_user(stu.getId());// 创建人ID
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
						dut.setCreator(stu.getId());
						dut.setId(Common.returnUUID());
						dutiesService.insert(dut);
						/* 存任职表 */
						StuLeaders stuld = new StuLeaders();
						stuld.setSsl_stu_id(student2.getId());// 学生ID
						stuld.setSsl_org_id(StuUnionOrAsso_id);// 学生会或者社团ID
						stuld.setSsl_role_id("ROLE_STUDENT_ASSOCIATION_MANAGER");// 角色ID
						stuld.setSsl_create_user(stu.getId());// 创建人ID
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
				ret = "campusViews/campusStudent/importStuUnionSuccess";
			else if ("2".equals(ass.getSa_category()))
				ret = "campusViews/campusStudent/importAssociationSuccess";
		}

		return ret;
		// return "student/importStuUnionOrAssSuccess";
	}

	/**
	 * 社团干部查看社团信息.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("campusStudent/web/seeAssociation.do")
	public String seeAssociation(ModelMap modelMap, HttpSession session) {
		// 获得学院id
		String college_id = Common.getCollegeByStuID(Common.getOneStuId(session));
		// 新建Association 对象 ---用于做查询参数
		Association association = new Association();
		association.setSa_category("2");
		association.setSa_college_id(college_id);
		association.setState("1");
		// 查询社团
		List<Association> associationList = associationService.selectList(association);

		modelMap.put("associationList", associationList);

		return "campusViews/campusStudent/seeAssociation";
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

	@RequestMapping("campusStudent/web/seeAssociationMemberDetail.do")
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
		return "campusViews/campusStudent/seeAssociationMemberDetail";
	}

	/**
	 * 添加社团干部成员.
	 * 
	 * @author 张向杨 鲁雪艳
	 * @createDate 2016-03-14
	 * @since 3.0
	 * 
	 */

	@RequestMapping("campusStudent/web/associationMemberAdd.do")
	public String associationAdd(ModelMap modelMap, String id) {
		modelMap.put("id", id);
		return "campusViews/campusStudent/associationMemberAdd";
		// return "student/stuUnionOrAssAdd";
	}

	/*
	 * 功能： 保存添加的社团人员 时间：　２０１６－０３－１８
	 * 
	 * 张向杨 鲁雪艳
	 */
	@RequestMapping("campusStudent/web/doSaveAssociationMumber.do")
	public String doSaveStuUnionOrAssMumber(HttpServletRequest request) {
		// 获得前台表单数据
		String stu_code = request.getParameter("stu_code");
		// 性别暂时没有用到
		String sex = request.getParameter("sex");
		String duties = request.getParameter("duties");
		String association_id = request.getParameter("id");
		String stu_id = studentService.getStudentIdByCode(stu_code);
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

	@RequestMapping("campusStudent/web/importAssociationMember.do")
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
		return "campusViews/campusStudent/importAssociationMember";

	}

	/**
	 * 学生： 进入自己的请假历史记录界面
	 * 
	 * @author songhao
	 * @param session
	 * @param modelMap
	 * @param type
	 *            代表学生类型
	 * 
	 * */
	@RequestMapping(value = "campusStudent/web/seeStudentsLeaveList.do", params = { "type" })
	public String seeStudentsLeaveList(HttpSession session, ModelMap modelMap, String type) {
		Application application = new Application();
		application.setSla_real_students_id(Common.getOneStuId(session));
		List<Application> applicationList = applicationService.selectList(application);
		LevelApproval levelApproval = null;
		for (int i = 0; i < applicationList.size(); i++) {
			levelApproval = new LevelApproval();
			levelApproval.setApproval_tea(applicationList.get(i).getFinal_approval_tea());
			levelApproval.setLevel_application_id(applicationList.get(i).getId());
			List<LevelApproval> levelApprovalList = levelApprovalService.selectList(levelApproval);
			if (levelApprovalList.size() > 0) {
				// tmp1存放审批意见
				applicationList.get(i).setTemp1(levelApprovalList.get(0).getApproval_opinion());
			}
		}
		modelMap.put("type", type);
		modelMap.put("applicationList", applicationList);
		return "campusViews/campusStudent/seeStudentsLeaveList";
	}

	/**
	 * 学生： 进入学生请假界面
	 * 
	 * @author songhao
	 * @param session
	 * @param modelMap
	 * @param type
	 *            代表学生类型
	 * @return campusViews/campusStudent/studentsLeave页面
	 * @since 2016-04-25
	 * */
	@RequestMapping(value = "campusStudent/web/studentsLeave.do", params = { "type" })
	public String studentsLeave(HttpSession session, ModelMap modelMap, String type) {
		Student student = (Student) session.getAttribute("current_user");
		modelMap.put("student", student);
		modelMap.put("type", type);
		return "campusViews/campusStudent/studentsLeave";
	}

	/**
	 * 学生会干部、社团干部： 进入为干事记录历史请假界面
	 * 
	 * @author 张向杨
	 * @param session
	 * @param modelMap
	 * @param type
	 *            代表用户类型 3：学生会干部 4：社团干部
	 * @return campusViews/campusStudent/seeGroupStudentsLeaveList.jsp页面
	 * @since 2016-05-13
	 * */
	@RequestMapping(value = "campusStudent/web/seeGroupStudentsLeaveList.do", params = { "type" })
	public String seeGroupStudentsLeaveList(HttpSession session, ModelMap modelMap, String type,
			HttpServletRequest request) {
		Student student = (Student) session.getAttribute("current_user");
		String current_role_selected = (String) session.getAttribute("current_role_selected");

		Association association = stuLeadersService.getStuLeadersAssociation(student.getId(), current_role_selected);

		session.setAttribute("association", association);
		String date = request.getParameter("date");
		// 集体请假审批过的
		List<LevelApproval> approvedGroupLeaveList = levelApprovalService.selectByStuIdAndLeaveType(student.getId(),
				type, true, date);
		for (int x = 0; x < approvedGroupLeaveList.size(); x++) {
			// 记录一个系部 集体请假学生的id
			String realStudentsId = "";
			List<LevelApproval> temp = levelApprovalService.selectByStuIdAndLeaveType(student.getId(), type, false,
					date);
			for (int j = 0; j < temp.size(); j++) {
				if (approvedGroupLeaveList.get(x).getApplication().getSla_code()
						.equals(temp.get(j).getApplication().getSla_code())) {
					realStudentsId += temp.get(j).getApplication().getSla_real_students_id() + ",";
				}
			}
			approvedGroupLeaveList.get(x).getApplication().setSla_real_students_id(realStudentsId);
		}

		// 集体请假未审批的
		List<Application> approvingGroupLeaveList = applicationService.selectByStuIdAndLeaveTypeAndApprovalState(
				student.getId(), type, "1", true, date);
		for (int x = 0; x < approvingGroupLeaveList.size(); x++) {
			// 记录一个系部 集体请假学生的id
			String realStudentsId = "";
			List<Application> temp = applicationService.selectByStuIdAndLeaveTypeAndApprovalState(student.getId(),
					type, "1", false, date);
			for (int j = 0; j < temp.size(); j++) {
				if (approvingGroupLeaveList.get(x).getSla_code().equals(temp.get(j).getSla_code())) {
					realStudentsId += temp.get(j).getSla_real_students_id() + ",";
				}
			}
			approvingGroupLeaveList.get(x).setSla_real_students_id(realStudentsId);
		}

		modelMap.put("type", type);
		modelMap.put("approvingGroupLeaveList", approvingGroupLeaveList);
		modelMap.put("approvedGroupLeaveList", approvedGroupLeaveList);
		modelMap.put("student", student);

		return "campusViews/campusStudent/seeGroupStudentsLeaveList";
	}

	/**
	 * 班级干部(社团干部、学生会干部)给成员请假
	 * 
	 * @author lql
	 * @param type
	 *            代表用户类型 2:班委 3：学生会干部 4：社团干部
	 * @param session
	 * @param modelMap
	 * @return campusViews/campusStudent/studentsLeave页面
	 * @since 2016-04-25
	 * */
	@RequestMapping(value = "campusStudent/web/studentsLeaderLeave.do", params = { "type" })
	public String studentsLeaderave(String type, HttpSession session, ModelMap modelMap) {
		Student student = (Student) session.getAttribute("current_user");
		List<AssociationMembers> associationMembersList = null;
		if (type.equals("2")) {// 2:代表班委
			Student stu = new Student();
			stu.setClass_id(student.getClass_id());
			// 班级所有学生
			List<Student> classMemberList = studentService.selectList(stu);
			modelMap.put("clazz", DictionaryService.findOrg(student.getClass_id()));
			modelMap.put("classMemberList", classMemberList);
		}
		if (type.equals("3") || type.equals("4")) {// 3:学生会干部4:社团干部
			Association association = stuLeadersService.getStuLeadersAssociation(student.getId(),
					(String) session.getAttribute("current_role_selected"));
			associationMembersList = associationMembersService.selectStusByAssId(association.getId());
			modelMap.put("associationMembersList", associationMembersList);
		}

		modelMap.put("type", type);
		modelMap.put("student", student);
		return "campusViews/campusStudent/studentsLeaderLeave";
	}

	/**
	 * 学生请假、班委、学生会干部、社团干部为其部门请假：　保存学生请假记录
	 * 
	 * @author songhao
	 * @param application
	 *            Application对象
	 * @param begin_time
	 *            开始时间
	 * @param end_time
	 *            结束时间
	 * @param type
	 *            用户类型
	 * @return campusViews/campusStudent/studentsLeave页面
	 * @since 2016-04-25
	 * */

	@RequestMapping(value = "campusStudent/web/doStudentsLeave.do", params = { "type" })
	public String doStudentsLeave(Application application, String begin_time, String end_time, HttpSession session,
			HttpServletRequest request, String type) {

		Student student = (Student) session.getAttribute("current_user");
		String collegeId = Common.getCollegeByStuID(student.getId());
		String collegeCode = DictionaryService.findOrg(collegeId).getOrg_code();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String now = sdf.format(new Date());
		String leaveCode = collegeCode + now;
		// 设置请假条编码
		Application MaxCode = applicationService.selectMaxCode(leaveCode);
		if (MaxCode == null) {
			leaveCode += "0001";
		} else {
			String code = MaxCode.getSla_code();
			String num = code.substring(code.length() - 4, code.length());
			int newNum = Integer.parseInt(num) + 1;
			DecimalFormat decimalFormat = new DecimalFormat("0000");
			String stringNewNum = decimalFormat.format(newNum);
			leaveCode += stringNewNum;
		}
		application.setSla_begin_time(Timestamp.valueOf(begin_time));
		application.setSla_end_time(Timestamp.valueOf(end_time));
		// 单个学生处理
		if (application.getSla_real_students_id().length() == 32) {
			application.setSla_real_students_id(application.getSla_real_students_id() + ",");
		}
		String[] realStuIdArr = application.getSla_real_students_id().split(",");
		for (String realStuId : realStuIdArr) {
			application.setSla_real_students_id(realStuId.trim());
			application.setSla_code(leaveCode);
			application.setSla_leave_type(type);
			applicationService.insert(application);
		}
		// 跳转界面
		if ("2".equals(type)) {// 班委请假
			return "redirect:monitorSeeStudentsLeave.do?type=" + type;
		} else if ("3".equals(type) || "4".equals(type)) {// 学生会、社团请假
			return "redirect:seeGroupStudentsLeaveList.do?type=" + type;
		}
		return "redirect:seeStudentsLeaveList.do?type=" + type;// 个人
	}

	/**
	 * 班委 ---查看本班级内学生的请假记录
	 * 
	 * @since 2016-04-20
	 * @author 张向杨
	 * @param session
	 *            modelMap
	 * @param type
	 *            用户类型
	 * 
	 * @return campusViews/campusStudent/monitorSeeStudentsLeave.jsp页面
	 * */

	@RequestMapping(value = "campusStudent/web/monitorSeeStudentsLeave.do", params = { "type" })
	public String monitorSeeStudentsLeave(HttpSession session, ModelMap modelMap, String type,
			HttpServletRequest request) {
		Student student = (Student) session.getAttribute("current_user");
		String date = request.getParameter("date");
		// 声明集合，用于存放本班学生的请假审批记录
		List<Application> applicationList = null;
		// 个人请假未通过的
		applicationList = applicationService.selectListByClassIdAndApprovalStateAndleaveType(student.getClass_id(),
				"14", "1", true);

		// 集体请假未审批的
		List<Application> approvingGroupLeaveList = applicationService.selectByStuIdAndLeaveTypeAndApprovalState(
				student.getId(), "234", "14", true, date);
		for (int x = 0; x < approvingGroupLeaveList.size(); x++) {
			// 记录一个系部 集体请假学生的id
			String realStudentsId = "";
			List<Application> temp = applicationService.selectByStuIdAndLeaveTypeAndApprovalState(student.getId(),
					"234", "14", false, date);
			for (int j = 0; j < temp.size(); j++) {
				if (approvingGroupLeaveList.get(x).getSla_code().equals(temp.get(j).getSla_code())) {
					realStudentsId += temp.get(j).getSla_real_students_id() + ",";
				}
			}
			approvingGroupLeaveList.get(x).setSla_real_students_id(realStudentsId);
		}

		modelMap.put("type", type);
		modelMap.put("approvingGroupLeaveList", approvingGroupLeaveList);
		modelMap.put("ApprovalLevelNumber", applicationList.size() + approvingGroupLeaveList.size());
		modelMap.put("appList", applicationList);
		return "campusViews/campusStudent/monitorSeeStudentsLeave";
	}

	/**
	 * 班委干部 ajax获得学生请假已审批记录（通过、不通过）
	 * 
	 * @author 张向杨
	 * @param type
	 * @throws IOException
	 * @since 2016-04-21
	 * 
	 * */
	@RequestMapping("campusStudent/web/ajaxGetApprovalLeave.do")
	public String ajaxGetApprovalLeave(String flag, String date, HttpServletResponse response, HttpSession session,
			HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("utf-8");
		Student student = (Student) session.getAttribute("current_user");
		List<Application> notApplList = null;// 存放本班未审批学生的请假记录
		if (date.equals("null")) {// 是否可以考虑在前台加上“请选择”
			date = null;
		}
		if (student != null) {
			String approvalState = null;
			if ("no".equals(flag)) {// 审批未通过
				approvalState = "36";
			} else if ("yes".equals(flag)) {// 审批已通过
				approvalState = "25";
			} else {
				approvalState = "123456";
			}
			// 个人请假
			notApplList = applicationService.selectByCollegeIdAndApprovalStateAndleaveTypeSla_time(
					student.getClass_id(), approvalState, "1", false, date);
			// 集体请假
			List<Application> groupLeaveList = applicationService
					.selectByCollegeIdAndApprovalStateAndleaveTypeSla_time(student.getClass_id(), approvalState, "234",
							true, date);
			for (int x = 0; x < groupLeaveList.size(); x++) {
				// 记录一个系部 集体请假学生的id
				String realStudentsId = "";
				List<Application> temp = applicationService.selectByCollegeIdAndApprovalStateAndleaveTypeSla_time(
						student.getClass_id(), approvalState, "234", false, date);
				for (int j = 0; j < temp.size(); j++) {
					if (groupLeaveList.get(x).getSla_code().equals(temp.get(j).getSla_code())) {
						realStudentsId += temp.get(j).getSla_real_students_id() + ",";
					}
				}
				groupLeaveList.get(x).setSla_real_students_id(realStudentsId);

				notApplList.add(groupLeaveList.get(x));
			}
		}
		String str = applicationService.ajaxErgodic(notApplList, student, flag);
		PrintWriter printWriter = response.getWriter();
		printWriter.println(str);
		printWriter.close();
		return null;
	}

	// -------------------张向杨 2016-05-21
	// end------------------------------------------------------------------------

	// -----------------------丁乐晓2016-05-23
	// start 查早操代码整合------------------------------------------------
	/**
	 * 功能：获取当前检查人的检查班级以及历史记录 author: 丁乐晓 time:2016-04-13
	 */
	@RequestMapping("campusStudent/morningExercises.do")
	public ModelAndView morningExercises(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		Student stu = (Student) session.getAttribute("current_user");// 获取当前登录的学生
		String stu_id = stu.getId();// 获取学生id
		session.setAttribute("stu_id", stu_id);// 学生ID存入session
		String type = "1";// 设置当前默认类型为1:'早操'
		List<DailyInspect> dai = this.dailyInspectService.getDailyInspectByStuIdAndType(stu_id, type);// 根据学生id和类型获取此人全部早操记录,且先显示时间近的
		List<DailyInspect> dail = new ArrayList<DailyInspect>();
		Date dd = new Date();
		DateFormat time = new SimpleDateFormat("yyyy-MM-dd");
		String nowtime = time.format(dd);
		for (DailyInspect d : dai) {// 遍历集合dai
			String sdi_class_id = d.getSdi_class_id();// 获取班级id
			String Time = time.format(d.getInspect_time());// 格式化检查时间
			String class_name = DictionaryService.findOrg(sdi_class_id).getOrg_name();// 获取班级名
			d.setTemp1(class_name);// 将班级名储存到temp1中
			d.setTemp2(Time);// 将检查时间名储存到temp2中
			dail.add(d);// 将更改后记录添加到新的集合
		}
		for (DailyInspect m : dai) {
			String sdi_class_id = m.getSdi_class_id();// 获取班级id
			String union_id = m.getStu_union_section();// 获取学生会部门ID
			String Time = time.format(m.getInspect_time());// 格式化检查时间
			String id = m.getId();
			String class_name = DictionaryService.findOrg(sdi_class_id).getOrg_name();// 获取班级名
			if (Time.equals(nowtime)) {// 筛选出今天需要查的班级的记录
				String nowclass = class_name;
				session.setAttribute("inspect_id", id);// 日常检查表ID
				session.setAttribute("sdi_class_id", sdi_class_id);// 班级ID存入session

				/* 显示该班级除去体育部人员之后的总人数 */
				List<Student> class_meb = studentService.getStudentsByClassId(sdi_class_id);// 获取该班级所有成员
				List<LevelApproval> approval = levelApprovalService.selectPassByClassId(sdi_class_id, "1");// 获取该班级请假的人
				List<AssociationMembers> union_student = associationMembersService.selectStusByAssId(union_id);// 查找该部门所有的成员
				Iterator<Student> iter = class_meb.iterator();// 去处该班级中是该部门的人员
				int i = 0;
				while (iter.hasNext()) {
					Student dict = iter.next();
					i++;
					for (AssociationMembers e : union_student) {
						if (dict.getId().equals(e.getSam_stu_id())) {
							iter.remove();
							i--;
						}
					}
					// 去除请假的学生
					for (LevelApproval b : approval) {
						if (dict.getId().equals(b.getApplication().getSla_real_students_id())) {
							iter.remove();
							i--;
						}
					}
				}
				session.setAttribute("union_id", union_id);// 学生会部门ID存入session
				session.setAttribute("i", i);
				map.put("nowclass", nowclass);
				map.put("i", i);
				break;
			}

		}
		map.put("stu", stu);
		map.put("dail", dail);
		return new ModelAndView("/campusViews/campusStudent/morningExercises", map);
	}

	/**
	 * 功能：添加查操基本信息-获取检查班级的当前负责人 author:丁乐晓 time:2016-04-13
	 */
	@RequestMapping("campusStudent/morningExercisesDetailsAdd.do")
	public ModelAndView morningExercisesDetailsAdd(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		String inclass_id = request.getSession().getAttribute("sdi_class_id").toString();// 在session中获取检查班级
		List<Student> students = studentService.getStudentsByClassId(inclass_id);// 查找该班级的所有学生
		String union_id = request.getSession().getAttribute("union_id").toString();
		List<AssociationMembers> union_student = associationMembersService.selectStusByAssId(union_id);// 查找该部门所有的成员
		/* 去除当前登录人的信息 */
		String stu_id = request.getSession().getAttribute("stu_id").toString();
		Iterator<AssociationMembers> iter = union_student.iterator();
		while (iter.hasNext()) {
			AssociationMembers dict = iter.next();
			if ((dict.getSam_stu_id()).equals(stu_id)) {
				iter.remove();
			}
		}

		map.put("students", students);
		map.put("union_student", union_student);
		return new ModelAndView("/campusViews/campusStudent/morningExDetailsAdd", map);
	}

	/**
	 * 功能：更新基本信息，并且跳转至扣分详情添加页面 author:丁乐晓 time:2016-04-13
	 */
	@RequestMapping("campusStudent/morningExercisesAddPoints.do")
	public ModelAndView morningExercisesAddPoints(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		String cl_contact = request.getParameter("b");// 得到当前责任人
		String un_student = request.getParameter("a");// 得到查操合作人
		String id = request.getSession().getAttribute("inspect_id").toString();// 获取检查信息的ID
		DailyInspect inspect_list = dailyInspectService.selectByID(id);
		if (un_student != "") {
			String stu_id = request.getSession().getAttribute("stu_id").toString();
			String inspect_people = stu_id + "," + un_student;
			inspect_list.setInspect_person(inspect_people);
		} else {
			Student stu = (Student) session.getAttribute("current_user");
			String student = stu.getId();
			inspect_list.setInspect_person(student);
		}
		inspect_list.setClass_contact(cl_contact);
		dailyInspectService.update(inspect_list);// 更新检查记录

		String cl_contactid = inspect_list.getClass_contact();// 获取当前责任人
		String cl_contact_name = DictionaryService.findStudent(cl_contactid).getTrue_name();
		session.setAttribute("cl_contact_name", cl_contact_name);

		String type = "早操";
		List<EvaluateStandard> standard = evaluateStandardService.selectByType(type);// 通过类型获得标准
		String ass_id = request.getSession().getAttribute("union_id").toString();// 获取学生会部门ID
		Association ass_information = associationService.selectByID(ass_id);
		String college_id = ass_information.getSa_college_id();// 得到所属的学院
		for (EvaluateStandard e : standard) {
			if (e.getScope().equals(college_id)) {
				String standard_name = e.getStandard_name();
				String standard_id = e.getId();
				session.setAttribute("standard_id", standard_id);// 将检查标准ID存入session
				map.put("standard_name", standard_name);
				session.setAttribute("standard_name", standard_name);
			}
		}

		String inclass_id = request.getSession().getAttribute("sdi_class_id").toString();// 在session中获取检查班级
		String inclass_name = DictionaryService.findOrg(inclass_id).getOrg_name();
		session.setAttribute("inclass_name", inclass_name);

		Date dd = new Date();
		DateFormat time = new SimpleDateFormat("yyyy-MM-dd");
		String nowtime = time.format(dd);
		session.setAttribute("nowtime", nowtime);

		String inspect_manid = inspect_list.getInspect_person();// 获取检查人
		String[] inspect_menid = inspect_manid.split(",");// 将ID字符串分隔开
		StringBuilder inspect_men = new StringBuilder();
		for (int i = 0; i < inspect_menid.length; i++) {
			String inspect_man = DictionaryService.findStudent(inspect_menid[i]).getTrue_name();
			session.setAttribute("inspect_man", inspect_man);
			inspect_men.append(inspect_man + ",");
		}
		inspect_men.toString();
		session.setAttribute("inspect_men", inspect_men);
		String i = request.getSession().getAttribute("i").toString();
		map.put("inclass_name", inclass_name);
		map.put("nowtime", nowtime);
		map.put("inspect_men", inspect_men);
		map.put("cl_contact_name", cl_contact_name);
		map.put("i", i);
		return new ModelAndView("/campusViews/campusStudent/morningExercisesAddPoints", map);
	}

	/**
	 * 功能：添加扣分记录 author:丁乐晓 time:2016-04-15
	 */
	@RequestMapping("campusStudent/morningExPointsAdd.do")
	public ModelAndView morningExPointsAdd(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		String standard_id = request.getSession().getAttribute("standard_id").toString();// 获取评分标准ID
		List<EvalsIndex> index_name = evalsIndexService.selectByStandId(standard_id);// 获取指标详情信息
		String class_mebid = request.getSession().getAttribute("sdi_class_id").toString();
		List<Student> class_meb = studentService.getStudentsByClassId(class_mebid);// 获取该班级所有成员

		// 获取该班级请假的有效的学生记录
		List<LevelApproval> approval = levelApprovalService.selectPassByClassId(class_mebid, "1");
		for (LevelApproval a : approval) {
			String stuid = a.getApplication().getSla_real_students_id();
			String stuname = DictionaryService.findStudent(stuid).getTrue_name();
			DateFormat time = new SimpleDateFormat("yyyy-MM-dd");
			String start_time = time.format(a.getApplication().getSla_begin_time());
			String end_time = time.format(a.getApplication().getSla_end_time());
			String desc = a.getApplication().getSla_reason_desc();
			a.setTemp1(stuname);
			a.setTemp2(start_time);
			a.setTemp3(end_time);
			a.setTemp4(desc);
		}
		String union_id = request.getSession().getAttribute("union_id").toString();
		List<AssociationMembers> union_student = associationMembersService.selectStusByAssId(union_id);// 查找该部门所有的成员
		Iterator<Student> iter = class_meb.iterator();
		while (iter.hasNext()) {
			Student dict = iter.next();
			// 去除该班级中是该部门的人员
			for (AssociationMembers e : union_student) {
				if (dict.getId().equals(e.getSam_stu_id())) {
					iter.remove();
				}
			}
			// 去除请假的学生
			/*
			 * for(LevelApproval b:approval){ if
			 * (dict.getId().equals(b.getApplication
			 * ().getSla_real_students_id())) { iter.remove(); } }
			 */
		}
		String mem = request.getParameter("mem");// 获取已经选择的人的ID，
		if (mem != null) {
			String inspect_id = session.getAttribute("inspect_id").toString();
			ArrayList member = new ArrayList();
			List<DailyInspectDetails> meb = dailyInspectDetailsService.selectByInspect_id(inspect_id);
			for (DailyInspectDetails j : meb) {
				String meb_id = j.getInspect_object_id();
				member.add(meb_id);
			}
			ArrayList newmember = new ArrayList();
			// 在迭代是循环中next调用一次，就要hasNext判断一次
			Iterator it = member.iterator();
			while (it.hasNext()) {
				Object obj = it.next();// next()最好调用一次就hasNext()判断一次否则容易发生异常
				if (!newmember.contains(obj))
					newmember.add(obj);
			}
			map.put("newmember", newmember);
		}
		map.put("index_name", index_name);
		map.put("class_meb", class_meb);
		map.put("approval", approval);

		return new ModelAndView("/campusViews/campusStudent/morningExPointsAdd", map);
	}

	/**
	 * 功能：扣分记录保存 跳转至添加扣分项页面 author:丁乐晓 time:2016-04-20
	 * */
	@RequestMapping("campusStudent/doSubmit.do")
	public ModelAndView doCheckMessaSubmit(HttpSession session, HttpServletRequest request, ModelMap modelMap,
			HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		String standard_name = request.getSession().getAttribute("standard_name").toString();
		String inclass_name = request.getSession().getAttribute("inclass_name").toString();
		String nowtime = request.getSession().getAttribute("nowtime").toString();
		String inspect_men = request.getSession().getAttribute("inspect_men").toString();
		String cl_contact_name = request.getSession().getAttribute("cl_contact_name").toString();
		String inspect_id = session.getAttribute("inspect_id").toString();// 获取日常检查ID
		String class_id = session.getAttribute("sdi_class_id").toString();// 获取班级ID
		String classreduce = request.getParameter("reduce");// 获取班级扣分项
		String[] reduceList = classreduce.split(",");// 存入数组
		String person = request.getParameter("list");// 获取个人以及相对应的扣分项
		String[] personList = person.split(",-,|-");// 拆分字符串存入数组
		List<String> studentlist = new ArrayList<String>();// 存放学生
		List studentreduce = new ArrayList();// 存放学生扣分情况
		DailyInspectDetails inspect_details = new DailyInspectDetails();
		List<Student> use = studentService.getStudentsByClassId(class_id);
		// 存个人的扣分信息
		for (int i = 0; i < personList.length; i++) {
			double stunum = 0.0;
			String name = "";
			String b = personList[i];// 获取第一对人以及对应的扣分项
			String[] a = b.split(":|,");// 拆分字符串存入数组
			for (Student s : use) {
				if (s.getId().equals(a[0])) {
					for (int j = 0; j < a.length; j++) {
						if (j == 0 && a[0] != "") {
							String stu_name = DictionaryService.findStudent(a[0]).getTrue_name();
							s.setTemp1(stu_name);// 存被扣分人的姓名
						} else if (j > 0 && a[j] != "") {
							inspect_details.setInspect_id(inspect_id);// 检查
							inspect_details.setAffect_object("3");// 作用对象
							inspect_details.setSdid_class_id(class_id);// 班级ID
							inspect_details.setId(Common.returnUUID());// 自动生成ID
							inspect_details.setInspect_object_id(a[0]);// 添加作用对象为数组第一个
							inspect_details.setIndex_id(a[j]);// 指标ID
							EvalsIndex grade = (EvalsIndex) evalsIndexService.selectByID(a[j]);// 扣分分数
							double grades = grade.getScore();
							inspect_details.setGrade(grades);
							dailyInspectDetailsService.insert(inspect_details);
							stunum = grades + stunum;
							String index_name = grade.getIndex_name();
							name = name + " " + index_name;
							s.setTemp3(name);// 存扣分原因
						}
						if (stunum != 0.0) {
							if (stunum < -10.0) {
								stunum = -10.0;
							}
							String str_stunum = Double.toString(stunum);
							s.setTemp2(str_stunum);// 存被扣的分数
						}
					}
				}
			}

		}
		map.put("use", use);
		// 存班级的扣分信息
		if (classreduce != "") {
			double num = 0.0;
			for (int c = 0; c < reduceList.length; c++) {
				inspect_details.setInspect_id(inspect_id);// 检查
				inspect_details.setAffect_object("1");// 作用对象
				inspect_details.setSdid_class_id(class_id);// 班级ID
				inspect_details.setId(Common.returnUUID());// 自动生成ID
				inspect_details.setInspect_object_id(class_id);// 作用对象为班级ID
				inspect_details.setIndex_id(reduceList[c]);// 指标ID
				EvalsIndex grade = (EvalsIndex) evalsIndexService.selectByID(reduceList[c]);// 扣分分数
				double grades = grade.getScore();
				inspect_details.setGrade(grades);
				dailyInspectDetailsService.insert(inspect_details);
				num = num + grades;
				if (num < -10.0) {
					num = -10.0;
				}
			}
			map.put("class_id", class_id);
			map.put("num", num);
		}
		map.put("standard_name", standard_name);
		map.put("inclass_name", inclass_name);
		map.put("nowtime", nowtime);
		map.put("inspect_men", inspect_men);
		map.put("cl_contact_name", cl_contact_name);
		return new ModelAndView("/campusViews/campusStudent/morningExercisesAddPoints", map);
	}

	/**
	 * 功能：保存早操检查记录 author:丁乐晓 time:2016-04-20
	 * */
	@RequestMapping("campusStudent/doSaveinformation.do")
	public String doSaveinformation(HttpSession session, HttpServletRequest request, ModelMap modelMap,
			HttpServletResponse response) throws IOException, ServletException {
		// 查出请假的信息，进行扣分
		String classid = request.getSession().getAttribute("sdi_class_id").toString();
		List<LevelApproval> approval = levelApprovalService.selectPassByClassId(classid, "1");// 获取该班级请假的人

		String grade = request.getParameter("sum_l");// 获取分数
		double sum = 10.0;
		if (grade != "") {

			String[] grades = grade.split(",");

			for (int i = 0; i < grades.length; i++) {
				double gradess = Double.parseDouble(grades[i]);
				sum = sum + gradess;
			}
			if (sum < 0.0) {
				sum = 0.0;
			}
			String id = request.getSession().getAttribute("inspect_id").toString();// 获取检查信息的ID
			DailyInspect inspect_list = dailyInspectService.selectByID(id);
			inspect_list.setSum_grade(sum);
			dailyInspectService.update(inspect_list);
		} else {
			sum = 10.0;
			String id = request.getSession().getAttribute("inspect_id").toString();// 获取检查信息的ID
			DailyInspect inspect_list = dailyInspectService.selectByID(id);
			inspect_list.setSum_grade(sum);
			dailyInspectService.update(inspect_list);
		}
		return "redirect:morningExercises.do";
	}

	/**
	 * 功能：查看早操记录管理详情 author:丁乐晓 time:2016-04-21
	 */
	@RequestMapping("campusStudent/morningExercisesDetails.do")
	public ModelAndView morningExercisesDetails(ModelMap modelMap, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id"); // 从检查首页获取到检查表id
		DailyInspect d = (DailyInspect) dailyInspectService.selectByID(id);// 根据id查询到此检查表
		String sdi_index_id = d.getSdi_index_id();// 获取评分标准id
		EvaluateStandard e = (EvaluateStandard) evaluateStandardService.selectByID(sdi_index_id);// 根据指标
																									// id查询指标表
		String standard_name = e.getStandard_name();// 获取指标名
		Timestamp t = d.getInspect_time();
		String time = "";
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		try {
			time = sdf.format(t);// 格式化时间
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		String Inspect_person_id = d.getInspect_person();
		String[] Inspect_person_idlist = Inspect_person_id.split(",");
		/*
		 * ArrayList<String> inspect_person=new ArrayList<String>();
		 */String inspect_person = "";
		for (int i = 0; i < Inspect_person_idlist.length; i++) {
			Student inspect_person_stu = (Student) studentService.selectByID1(Inspect_person_idlist[i]);
			inspect_person = inspect_person + " " + inspect_person_stu.getTrue_name();

		}
		String Sdi_class_id = d.getSdi_class_id();
		Org class1 = (Org) orgService.selectByID(Sdi_class_id);
		String class_name = class1.getOrg_name();

		map.put("time", time);
		map.put("d", d);
		map.put("class_name", class_name);
		map.put("standard_name", standard_name);
		map.put("inspect_person", inspect_person);
		return new ModelAndView("/campusViews/campusStudent/morningExercisesDetails", map);
	}

	/**
	 * 功能：查看早操扣分详情 author:丁乐晓 time:2016-04-21
	 */
	@RequestMapping("campusStudent/morningExercisesAddPointsDetails.do")
	public ModelAndView morningExercisesAddPointsDetails(ModelMap modelMap, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id"); // 从检查详情页获取到检查表id
		List<DailyInspectDetails> dais = dailyInspectDetailsService.groupByIndexId(id);
		String class_id = "";
		String object_id = "";
		for (DailyInspectDetails d : dais) {
			String stus_name = "";
			class_id = d.getSdid_class_id();
			object_id = d.getInspect_object_id();// 获取同一扣分项下的对象
			EvalsIndex e = (EvalsIndex) evalsIndexService.selectByID(d.getIndex_id());
			String points_reasons = e.getIndex_name();
			double reason_grade = e.getScore();
			d.setTemp2(points_reasons);
			if (class_id != null) {
				Org classI = orgService.selectByID(class_id);
				String class_name = classI.getOrg_name();
				d.setTemp1(class_name);
			}
			if (object_id != null) {
				String[] result = object_id.split(",");
				double j = 1.0;
				for (int i = 0; i < result.length; i++) {
					String stu_id = result[i];
					Student stu = studentService.selectByID1(stu_id);
					if (stu != null) {
						double score = reason_grade * j;
						j++;
						String stu_name = stu.getTrue_name();
						stus_name = stus_name + stu_name + " ";
						d.setTemp1(stus_name);
						String scores = String.valueOf(score);
						d.setTemp3(scores);
					} else {
						Org cls = orgService.selectByID(stu_id);
						double score = reason_grade * j;
						j++;
						String stu_name = cls.getOrg_name();
						stus_name = stus_name + stu_name + " ";
						d.setTemp1(stus_name);
						String scores = String.valueOf(score);
						d.setTemp3(scores);
					}
				}
			}
		}
		map.put("dais", dais);
		return new ModelAndView("/campusViews/campusStudent/morningExercisesAddPointsDetails", map);
	}

	/**
	 * 体育部部长分配人员检查班级 2016-01-13 师杰 1.获取体育部成员 2.获取有效班级入学年份 根据年份随机分配班级
	 */
	@RequestMapping("campusStudent/classDistribution.do")
	public ModelAndView classDistribution(ModelMap modelMap, HttpSession session, HttpServletResponse response)
			throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();
		response.setCharacterEncoding("UTF-8");
		Student student = (Student) session.getAttribute("current_user");// 获取当前用户(部长)2645654546

		AssociationMembers sa_code = (AssociationMembers) associationMembersService.selectByStuId(student.getId());// 根据用户获取部门成员表
		List<AssociationMembers> asso = associationMembersService.selectStusByAssId(sa_code.getSam_association_id());// 根据部门ID获取部门所有学生
		List<Org> collage = orgService.selectCollegeByclassId(student.getClass_id());// 根据用户的班级ID获取当前学院

		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(day);// 格式化当前 日期
		List<DailyInspect> dai = dailyInspectService.getDailyInspectByDate(date);// 根据当前日期查出今天所有检查表

		/*
		 * List<Student> stus = new ArrayList<Student>(); for
		 * (AssociationMembers a : asso) {//将 部门 所有未分配成员的 ID存到stus中 String
		 * stus_id = a.getSam_stu_id(); Student s =
		 * studentService.selectByID1(stus_id); int k = 0; for(DailyInspect
		 * d:dai){ if(d.getInspect_person().equals(s.getId())){ k = 1; } }
		 * if(k==0){ stus.add(s); }
		 * 
		 * }
		 */

		ArrayList<String> bengin_year = new ArrayList<String>();// 获取有效年级
		Calendar now = Calendar.getInstance();
		int nowyear = now.get(Calendar.YEAR);// 获取系统时间的年份
		int nowmonth = now.get(Calendar.MONTH) + 1;// 获取系统时间的月份
		int trueyear1;
		int trueyear2;
		List<String> t = new ArrayList<String>();
		if (nowmonth >= 9) {
			trueyear1 = nowyear;
			trueyear2 = nowyear - 1;
			String a = String.valueOf(trueyear1);
			String b = String.valueOf(trueyear2);
			t.add(a);
			t.add(b);
			map.put("trueyear", t);
		} else {
			trueyear1 = nowyear - 1;
			trueyear2 = nowyear - 2;
			String a = String.valueOf(trueyear1);
			String b = String.valueOf(trueyear2);
			t.add(a);
			t.add(b);
			map.put("trueyear", t);
		}
		List<Org> allClass = orgService.getClassByCollegesAndGrade(collage.get(0).getId(), String.valueOf(t));
		String collage1 = collage.get(0).getId();// 获取学院ID
		EvaluateStandard standard = (EvaluateStandard) evaluateStandardService.selectByTypeAndScope("早操", collage1);// 获取固定指标(每个学院在数据库只存一条)
		String standardId = standard.getId();// 获取指标ID

		map.put("standardId", standardId);
		map.put("collage", collage1);
		map.put("bengin_year", bengin_year);
		map.put("allClass", allClass);
		map.put("asso", asso);
		return new ModelAndView("/campusViews/campusStudent/classDistribution", map);
	}

	/**
	 * 得到班级 author：师杰 time:2016-04-13
	 */
	@RequestMapping("campusStudent/getTheClass.do")
	public String getTheClass(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		String year = request.getParameter("year");// 前台获取年级
		String collage = request.getParameter("collage");// 前台获取学院
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(day);// 格式化当前 日期
		List<DailyInspect> dai = dailyInspectService.getDailyInspectByDate(date);// 根据当前日期查出今天所有检查表
		List<Org> clas = orgService.getClassByCollegesAndGrade(collage, year);// 根据学院和年级获取所有有效班级
		int i = (int) (Math.random() * clas.size());// 根据班级的数量随机获取i
		StringBuffer sb = new StringBuffer();
		int j = 0;
		for (DailyInspect d : dai) {// 遍历今天的日常检查表，
			if (d.getSdi_class_id().equals(clas.get(i).getId())) {// 如果今天日常检查表存在班级id与有效班级相同，则重新随机i
				i = (int) (Math.random() * clas.size());
				j++;
			}
		}
		if (j > clas.size() * 10) {

			sb.append("<label id='c' class='label-left' >检查班级</label>");
			sb.append("<div id='cc' data-role='select'class='label-right'>");
			sb.append("<select name='classs' id='classs'>");
			sb.append("<option value='0'>所有班级已经分配完毕</option>");
			sb.append("</select>");
			sb.append("</div>");
		} else {
			sb.append("<label id='c' class='label-left' >检查班级</label>");
			sb.append("<div id='cc' data-role='select'class='label-right'>");
			sb.append("<select name='classs' id='classs'>");
			sb.append("<option value=" + clas.get(i).getId() + ">" + clas.get(i).getOrg_name() + "</option>");
			sb.append("</select>");
			sb.append("</div>");
		}
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 保存数据到数据库 author:师杰 time:2016-04-13
	 * 
	 */
	@RequestMapping("campusStudent/doSaveThis.do")
	public String doSaveThis(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		Student student = (Student) session.getAttribute("current_user");
		List<Org> collage = orgService.selectCollegeByclassId(student.getClass_id());
		String sa_code = ((AssociationMembers) associationMembersService.selectByStuId(student.getId()))
				.getSam_association_id();
		String collage1 = collage.get(0).getId();
		String standardId = request.getParameter("standardId");
		String year = request.getParameter("year");
		String sel = request.getParameter("sel");
		String classs = request.getParameter("classs");
		Timestamp t = new Timestamp(System.currentTimeMillis());

		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(day);
		List<DailyInspect> dai = dailyInspectService.getDailyInspectByDate(date);// 根据日期查出今天所有班级
		int l = 0;
		for (DailyInspect da : dai) {
			if (da.getSdi_class_id().equals(classs)) {
				l = 1;
				System.err.println("数据已存在，不执行保存");
			}
		}
		if (l == 0) {
			DailyInspect d = new DailyInspect();
			d.setId(Common.returnUUID());
			d.setInspect_type("1");
			d.setSdi_college_id(collage1);
			d.setSdi_index_id(standardId);
			d.setInspect_person(sel);
			d.setInspect_time(t);
			d.setInput_person(sel);
			d.setSdi_class_id(classs);
			d.setSdi_year(year);
			d.setStu_union_section(sa_code);
			dailyInspectService.insert(d);
			System.err.println("数据执行保存");
		}

		return null;
	}

	/**
	 * 早操扣分记录修改 师杰 2016-05-01
	 */
	@RequestMapping("campusStudent/morningExPointsEdit.do")
	public ModelAndView morningExPointsEdit(ModelMap modelMap, HttpSession session, HttpServletRequest request)
			throws IOException, ServletException {
		Map<String, Object> map = new HashMap<String, Object>();

		String standard_id = request.getSession().getAttribute("standard_id").toString();// 获取评分标准ID
		List<EvalsIndex> index_name = evalsIndexService.selectByStandId(standard_id);// 获取指标详情信息

		String class_mebid = request.getSession().getAttribute("sdi_class_id").toString();
		String id = session.getAttribute("inspect_id").toString();// 日常检查id
		List<String> dai_web = dailyInspectDetailsService.selectMebByObj(id);
		List<Student> class_meb = new ArrayList<Student>();
		for (String d : dai_web) {
			class_meb.add(studentService.selectByID(d));
		}
		String union_id = request.getSession().getAttribute("union_id").toString();// 获取学生会部门id
		List<AssociationMembers> union_student = associationMembersService.selectStusByAssId(union_id);// 查找该部门所有的成员
		Iterator<Student> iter = class_meb.iterator();// 取出该班级中是该部门的人员
		while (iter.hasNext()) {
			Student dict = iter.next();
			for (AssociationMembers e : union_student) {
				if (dict.getId().equals(e.getSam_stu_id())) {
					iter.remove();
				}
			}
		}
		String mem = request.getParameter("mem");// 获取已经选择的人的ID，
		if (mem != null) {
			String inspect_id = session.getAttribute("inspect_id").toString();// 日常检查id
			ArrayList member = new ArrayList();
			List<DailyInspectDetails> meb = dailyInspectDetailsService.selectByInspect_id(inspect_id);// 通过日常检查id查询出相关的日常检查记录详情
			for (DailyInspectDetails j : meb) {
				String meb_id = j.getInspect_object_id();// 获取作用对象的id 也就是班级id
				member.add(meb_id);
			}
			ArrayList newmember = new ArrayList();
			// 在迭代是循环中next调用一次，就要hasNext判断一次
			Iterator it = member.iterator();
			while (it.hasNext()) {
				Object obj = it.next();// next()最好调用一次就hasNext()判断一次否则容易发生异常
				if (!newmember.contains(obj))
					newmember.add(obj);
			}
			map.put("newmember", newmember);
		}

		map.put("index_name", index_name);
		map.put("class_meb", class_meb);

		return new ModelAndView("/campusViews/campusStudent/morningExPointsEdit", map);
	}

	/**
	 * 班长查看早操成绩
	 * 
	 * by宋浩 2016-05-18
	 * */
	@RequestMapping("CampusStudent/web/MonitorSeeMorningExerciseReword.do")
	public ModelAndView MonitorSeeMorningExerciseReword(HttpSession session, String current_role_selected,
			HttpServletRequest request) {
		if (current_role_selected != null) {
			session.setAttribute("current_role_selected", current_role_selected);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Student stu = (Student) session.getAttribute("current_user");
		DailyInspect di = new DailyInspect();
		String type = "1";
		String Id = stu.getId();
		List<DailyInspect> lists = dailyInspectService.getMonitorDailyInspectByDYId(Id, sdf.format(date), type);
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
						Student stu1 = studentService.selectByID1(stu_id);
						if (stu1 != null) {
							String stu_name = stu1.getTrue_name();
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
		return new ModelAndView("/campusViews/campusStudent/MonitorSeeMorningExerciseReword", map);
	}

	/**
	 * 根据日期、量化类别查看早操成绩 by 宋浩 2016-05-17
	 * */
	@RequestMapping("CampusStudent/web/ajaxGetDailyIns.do")
	public ModelAndView ajaxGetDailyIns(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String begin_time = request.getParameter("begin_Time");
		String type = request.getParameter("leibie");
		response.setCharacterEncoding("utf-8");
		Student stu = (Student) session.getAttribute("current_user");
		List<DailyInspect> lists = dailyInspectService.getMonitorDailyInspectByDYId(stu.getId(), begin_time, type);
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
						Student stu1 = studentService.selectByID1(stu_id);
						if (stu1 != null) {
							String stu_name = stu1.getTrue_name();
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
