package com.sict.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.sict.common.CommonSession;
import com.sict.entity.ClassRoom;
import com.sict.entity.Org;
import com.sict.entity.Role;
import com.sict.entity.SysMenu;
import com.sict.entity.Teacher;
import com.sict.entity.UserRole;
import com.sict.service.ClassRoomService;
import com.sict.service.CompanyService;
import com.sict.service.CourseService;
import com.sict.service.DictionaryService;
import com.sict.service.DirectRecordService;
import com.sict.service.EvalsIndexService;
import com.sict.service.EvaluateStandardService;
import com.sict.service.ExcelService;
import com.sict.service.FilesService;
import com.sict.service.GroupMembersService;
import com.sict.service.GroupsService;
import com.sict.service.NoticeService;
import com.sict.service.OrgService;
import com.sict.service.ParamService;
import com.sict.service.PositionService;
import com.sict.service.PracticeTaskService;
import com.sict.service.RecruitInfoService;
import com.sict.service.ReportDetailGraduationMaterialService;
import com.sict.service.ReportStudentStateService;
import com.sict.service.RoleService;
import com.sict.service.ScoreService;
import com.sict.service.StudentService;
import com.sict.service.SysMenuService;
import com.sict.service.SysRoleMenuService;
import com.sict.service.TeaStuService;
import com.sict.service.TeacherService;
import com.sict.service.TrainDetailService;
import com.sict.service.UserRoleService;
import com.sict.util.Common;
import com.sict.util.Constants;
import com.sict.util.DateService;

/**
 * 功能：系统管理员控制器 使用 @Controller 注释 by郑春光20140910 *
 * 
 */
@Controller
public class SchoolAdminController {
	/**
	 * 注入teacherService by郑春光20141105 *
	 * 
	 * */
	@Resource(name = "teacherService")
	private TeacherService teacherService;
	/**
	 * 注入ScoreService by邢志武20150405 *
	 * 
	 * */
	@Resource(name = "ScoreService")
	private ScoreService scoreService;
	/**
	 * 注入studentService by郑春光20141105 *
	 * 
	 * */
	@Resource(name = "studentService")
	private StudentService studentService;
	/**
	 * 注入directRecordService bY xzw 2015-03-23 *
	 */
	@Resource(name = "directRecordService")
	private DirectRecordService directRecordService;
	/**
	 * 注入teaStuService byccc20141105 *
	 * 
	 * */
	@Resource(name = "teaStuService")
	private TeaStuService teaStuService;
	/**
	 * 注入sysRoleMenuService wjg
	 * 
	 * */
	@Resource(name = "sysRoleMenuService")
	private SysRoleMenuService sysRoleMenuService;
	/**
	 * 注入filesService byccc20141105 *
	 * 
	 * */
	@Resource(name = "filesService")
	private FilesService filesService;
	/**
	 * 注入trainDetailService by吴敬国20141105 *
	 * 
	 * */
	@Resource(name = "trainDetailService")
	private TrainDetailService trainDetailService;
	/**
	 * 注入orgService byccc20141105 *
	 * 
	 * */
	@Resource(name = "orgService")
	private OrgService orgService;
	/**
	 * 注入roleService bywtt2014 1130 *
	 * 
	 * */
	@Resource(name = "roleService")
	private RoleService roleService;
	/**
	 * 注入evaluateStandardService by李瑶婷20141105 *
	 * 
	 * */
	@Resource(name = "evaluateStandardService")
	private EvaluateStandardService evaluateStandardService;
	/**
	 * 注入evalsIndexService by李瑶婷20141105 *
	 * 
	 * */
	@Resource(name = "evalsIndexService")
	private EvalsIndexService evalsIndexService;
	/**
	 * 注入ClassRoomService by鲁雪艳2016-5-3 *
	 * 
	 * */
	@Resource(name = "classRoomService")
	private ClassRoomService classRoomService;
	/**
	 * 注入userRoleService by吴敬国20141105 *
	 * 
	 * */
	@Resource(name = "userRoleService")
	private UserRoleService userRoleService;
	/**
	 * 注入companyService by李瑶婷20141105 *
	 * 
	 * */
	@Resource(name = "companyService")
	private CompanyService companyService;
	/**
	 * 注入positionService by李瑶婷20141105 *
	 * 
	 * */
	@Resource(name = "positionService")
	private PositionService positionService;
	/**
	 * 注入courseService bywtt2014 1130 *
	 * 
	 * */
	@Resource(name = "courseService")
	private CourseService courseService;
	/**
	 * 注入noticeService bywtt2014 1130 *
	 * 
	 * */
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	/**
	 * 注入groupsService by吴敬国2014 1209 *
	 * 
	 * */
	@Resource(name = "groupsService")
	private GroupsService groupsService;
	/**
	 * 注入practiceTaskService by孙家胜2014 1212 *
	 * 
	 * */
	@Resource(name = "practiceTaskService")
	private PracticeTaskService practiceTaskService;
	/**
	 * 注入recruitInfoService by孙家胜2014 1212 *
	 * 
	 * */
	@Resource(name = "recruitInfoService")
	private RecruitInfoService recruitInfoService;
	/**
	 * 注入groupMembersService by吴敬国2014 1216 *
	 * 
	 * */
	@Resource(name = "reportStudentStateService")
	private ReportStudentStateService reportStudentStateService;
	/**
	 * 注入reportDetailGraduationMaterialService by张超 2015年1月28日 *
	 * 
	 * */
	@Resource(name = "reportDetailGraduationMaterialService")
	private ReportDetailGraduationMaterialService reportDetailGraduationMaterialService;
	/**
	 * 注入groupMembersService by吴敬国2014 1216 *
	 * 
	 * */
	@Resource(name = "groupMembersService")
	private GroupMembersService groupMembersService;
	/**
	 * 注入sysMenuService 
	 * by吴敬国2015-12-21
	 * 
	 * */
	@Resource(name = "sysMenuService")
	private SysMenuService sysMenuService;
	

	/**
	 * 注入ParamService by丁乐晓20160115 *
	 * 
	 * */
	@Resource(name = "paramService")
	private ParamService paramService;
	
	// 定义返回类型
	String ret = "";

	private Object o;
	private int pageSizeConstant = Constants.pageSize; // 获取常量分页页面大小

	
	/**
	 * 学校管理员首页.
	 * @author 吴敬国
	 * @createDate 2016-3-18
	 * @since 3.0
	 */
	@RequestMapping("schooladmin/index.do")
	public String index(HttpSession session) {
		// 获取负责的学院,通过组织表的联系人id找到负责的学院，限制一个教师只负责一个学院
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// 设置当前权限为管理员 by桑博
		CommonSession.setUserRole(session, CommonSession.roleAdmin);
		return "schooladmin/index";
	}
	
	/**
	 * 角色列表.
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("schooladmin/roleList.do")
	public ModelAndView roleList(HttpSession session)  {
		Role role=new Role();
		//role.setState("1");
		role.setSchool_id(orgService.getSchoolIdByTeaId(session));
		List<Role> roleList=roleService.selectList(role);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleList", roleList);
		return new ModelAndView("schooladmin/roleList", map);
	}
	/**
	 * 添加角色.
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("schooladmin/addRole.do")
	public ModelAndView roleadd(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String schoolId = orgService.getSchoolIdByTeaId(session);
		String schoolCode = DictionaryService.findOrg(schoolId).getOrg_code();
		map.put("schoolCode", schoolCode);
		List<Org> collegeList=orgService.getChildOrgByParentId(schoolId);
		map.put("collegeList", collegeList);
		return new ModelAndView("schooladmin/roleAdd", map);
	}
	/**
	 * 管理员角色管理
	 * ajax 根据角色类型得到角色对应的菜单
	 * @Description
	 * @author 吴敬国 2015-12-23
	 * @return
	 */
	@RequestMapping("schooladmin/getSysMenuByRoletype.do")
	public String role_getSysMenuByRoletype(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String role_type = request.getParameter("role_type");
		SysMenu sysmenu = new SysMenu();
		sysmenu.setTemp1(role_type);
		sysmenu.setSm_is_top("1");
		sysmenu.setSm_used("1");
		List<SysMenu> sysMenuList = sysMenuService.selectTopMenuListByRoleType(sysmenu);
		StringBuffer sb=sysMenuService.StringBufferWithSysMenu(sysMenuList);
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 保存角色.
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("schooladmin/doAddRole.do")
	public String roledoAdd(HttpSession session,HttpServletRequest request)  {
		String roleType = request.getParameter("roleType");
		String role_type = request.getParameter("role_type");
		String basicRole = request.getParameter("basicRole");
		String role_code = request.getParameter("role_code");
		role_code = basicRole + role_code;
		String role_name = request.getParameter("role_name");
		String role_desc = request.getParameter("role_desc");
		String state = request.getParameter("state");

		Role role = new Role();
		role.setId(role_code);
		role.setRole_code(role_code);
		role.setRole_type(role_type);
		role.setRole_name(role_name);
		role.setRole_desc(role_desc);
		role.setSchool_id(orgService.getSchoolIdByTeaId(session));
		role.setCreate_tea(Common.getOneTeaId(session));
		if(roleType.equalsIgnoreCase("学院角色")){
			role.setCollege_id(orgService.getCollegeIdByTeaId(session));
		}
		role.setCreate_time(DateService.getNowTimeTimestamp());
		role.setState(state);
		role.setTemp1(Constants.ROLE_LEVEL_THREE);
		roleService.insert(role);
		String[] sysMenu = request.getParameterValues("roleMenu");
		sysRoleMenuService.insertSysRoleMenuBySrmRoleId(role_code, sysMenu);
		return "redirect:roleList.do"; 
	}
	/**
	 * 初始化学院.
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	@RequestMapping("schooladmin/initCollege.do")
	public ModelAndView initCollege(HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		Role role=DictionaryService.findRole("ROLE_ADMIN_COLLEGE");
		map.put("role_code", role.getRole_code());
		return new ModelAndView("schooladmin/initCollege", map);
	}
	/**
	 * 初始化学院.
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	@RequestMapping("schooladmin/doinitCollege.do")
	public String initCollegeSave(HttpSession session,HttpServletRequest request)  {
		String college_name = request.getParameter("college_name");
		String college_code = request.getParameter("college_code");
		String tea_name = request.getParameter("tea_name");
		String tea_code = request.getParameter("tea_code");
		String tea_sex = request.getParameter("tea_sex");
		String tea_phone = request.getParameter("tea_phone");
		String collegeAdmin = request.getParameter("collegeAdmin");
		//String org_code = request.getParameter("org_code");
		String teaId=Common.returnUUID16();
		String collegeId=Common.returnUUID();
		//添加组织
		Org o = new Org();
		o.setId(collegeId);
		o.setOrg_level(Constants.ORG_LEVEL_COLLEGE);
		o.setBegin_time(DateService.getNowTimeTimestamp());
		o.setContacts(teaId);
		o.setOrg_code(college_code);
		o.setOrg_name(college_name);
		o.setDirector("无");
		o.setPhone(tea_phone);
		o.setParent_id(orgService.getSchoolIdByTeaId(session));//如果以后要是扩展到其他学校，需要修改
		orgService.insert(o);
		//添加管理员信息
		Teacher tea=new Teacher();
		tea.setId(teaId);
		tea.setTea_code(tea_code);
		tea.setTrue_name(tea_name);
		tea.setLogin_pass(tea_code);
		tea.setSex(tea_sex);
		tea.setPhone(tea_phone);
		tea.setDept_id(collegeId);
		tea.setTea_type(Constants.TEA_TYPE_SCHOOL);
		tea.setState(Constants.STATE_USERD);
		teacherService.insert(tea);
		//添加学院管理员角色
		String schoolcode=DictionaryService.findOrg(orgService.getSchoolIdByTeaId(session)).getOrg_code();
		String collegeAdminRole=collegeAdmin+"_"+schoolcode+college_code;
		Role role=new Role();
		role.setId(collegeAdminRole);
		role.setRole_code(collegeAdminRole);
		role.setRole_name(college_name+"管理员");
		role.setRole_desc(college_name+"管理员");
		role.setRole_type("1");
		role.setCreate_time(DateService.getNowTimeTimestamp());
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		role.setCreate_tea(teacher.getId());
		role.setSchool_id(orgService.getSchoolIdByTeaId(session));
		role.setCollege_id(collegeId);
		role.setTemp1(Constants.ROLE_LEVEL_THREE);
		role.setTemp2(Constants.ROLE_ADMIN_COLLEGE);
		roleService.insert(role);
		//添加管理员角色
		UserRole userroleadmin=new UserRole();
		userroleadmin.setRole_id(collegeAdminRole);
		userroleadmin.setUser_id(teaId);
		userRoleService.insert(userroleadmin);
		//给学院管理员角色分配模板中的菜单
		sysRoleMenuService.saveSysRoleMenuByRoleTemplateId(Constants.ROLE_ADMIN_COLLEGE, collegeAdminRole);
		//添加管理员角色和教师基本角色
		userRoleService.saveBasicUserRole(teaId, "ROLE_ADMIN", "ROLE_TEACHER", null,null,null);
		return "redirect:index.do"; 
	}
	
	/**
	 * @param session
	 * @return classroomManage 功能：显示教室信息 鲁雪艳
	 */
	@RequestMapping("schooladmin/classroomManage.do")
	public String classroomManage(String campus, String classType,
			HttpSession session, ModelMap modelMap) {
		// 把学院<此为校级管理员，他的所属学院则为这个校区>从数据库里传入到下拉框
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// List<ClassRoom> selectCampus =
		// classRoomService.selectCampus(tea.getDept_id());
		List<ClassRoom> selectCampus = classRoomService.selectCampus("szxy");
		modelMap.put("selectCampus", selectCampus);
		return "schooladmin/classroomManage";
	}

	/**
	 * @param session
	 * @return ajaxGetClassroom 功能：ajax显示教室信息 鲁雪艳
	 */
	@RequestMapping("schooladmin/getClassroom.do")
	public String classroomAjax(String scr_campus, String classType,
			HttpServletResponse response, HttpServletRequest request)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 获取页面传来的校区，和教室类型
		ClassRoom classRoom = new ClassRoom();
		classRoom.setScr_campus(scr_campus);
		classRoom.setScr_type(classType);
		List<ClassRoom> classRoomList = classRoomService.selectList(classRoom);
		// 创建 stringbuild对象 用于存放 向前台传动的数据
		StringBuilder stringBuilder = new StringBuilder();
		if (classRoomList != null) {
			int i = 0;
			for (ClassRoom classRoom1 : classRoomList) {
				stringBuilder.append("<tr>");
				stringBuilder.append("<td>" + classRoom1.getScr_code()
						+ "</a></td>");
				stringBuilder.append("<td>" + classRoom1.getScr_name()
						+ "</a></td>");
				Teacher teacher = DictionaryService.findTeacher(classRoom1
						.getScr_contacat());
				if (teacher != null) {
					stringBuilder.append("<td>" + teacher.getTrue_name()
							+ "</a></td>");
				} else {
					stringBuilder.append("<td>" + "无" + "</td>");
				}
				stringBuilder.append("<td>" + classRoom1.getScr_devices()
						+ "</td>");
				stringBuilder.append("<td>" + classRoom1.getScr_note()
						+ "</td>");
				stringBuilder.append("<td>" + classRoom1.getScr_capabilit()
						+ "</td>");
				Org org = DictionaryService.findOrg(classRoom1
						.getScr_userdept());
				if (org != null) {
					stringBuilder.append("<td>" + org.getOrg_name() + "</td>");
				} else {
					stringBuilder.append("<td>" + "无" + "</td>");
				}
				String state = classRoom1.getState();
				String stateName = "有效";
				if (state.equals("2")) {
					stateName = "无效";
				}
				stringBuilder.append("<td>" + stateName + "</td>");

				stringBuilder
						.append("<td><input id='"
								+ classRoom1.getId()
								+ "'type='button'onclick='editclassRoom(this)'value='修改'><input id='"
								+ classRoom1.getId()
								+ "'type='button'onclick='deleteclassRoom(this)' value='删除'/></td>");

				stringBuilder.append("</tr>");
			}
			try {
				PrintWriter printWriter = response.getWriter();
				printWriter.println(stringBuilder.toString());
				printWriter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return null;
	}

	/**
	 * @param session
	 * @return classroomEdit 功能：修改教室信息 鲁雪艳
	 */
	@RequestMapping("schooladmin/classroomEdit.do")
	public String classroomEdit(String id, ModelMap modelMap,
			HttpSession session) {
		// 把学院<此为校级管理员，他的所属学院则为这个校区>从数据库里传入到下拉框
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// List<ClassRoom> selectCampus =
		// classRoomService.selectCampus(tea.getDept_id());
		List<ClassRoom> selectCampus = classRoomService.selectCampus("szxy");
		modelMap.put("selectCampus", selectCampus);

		// 获取组织表里的学院菜单
		List<Org> org = orgService.getAllColleges();
		modelMap.put("org", org);
		// 获取系和部门

		String college_id = (String) session.getAttribute("college_id");
		List<Org> Org_NameList = orgService.getCollegeAndAllDeptByCollegeID(college_id);
		List<Org> departmentlist;
		departmentlist = orgService.getAllDeptByParentId(college_id);// 获取系

		modelMap.put("departmentlist", departmentlist);

		ClassRoom classRoom = classRoomService.selectByID(id);
		modelMap.put("classRoom", classRoom);
		return "schooladmin/classroomEdit";
	}

	/**
	 * @param session
	 * @return doClassroomEdit 功能：修改教室信息 提交时执行 鲁雪艳
	 */
	@RequestMapping("schooladmin/doClassroomEdit.do")
	public String classroomEditSave(String id, ModelMap modelMap,
			ClassRoom classRoom, HttpSession session, HttpServletRequest request) {
		ClassRoom selectByID = classRoomService.selectByID(id);
		classRoom.setCreate_people(selectByID.getCreate_people());
		classRoom.setCreate_time(selectByID.getCreate_time());
		classRoom.setState(selectByID.getState());
		classRoom.setId(selectByID.getId());
		classRoomService.update(classRoom);
		return "redirect:classroomManage.do";
	}

	/**
	 * @param session
	 * @return doClassroomDelete 功能：删除教室信息 鲁雪艳
	 */
	@RequestMapping("schooladmin/doClassroomDelete.do")
	public String classroomDelete(String id, ModelMap modelMap,
			HttpSession session, HttpServletRequest request) {
		ClassRoom classRoom = classRoomService.selectByID(id);
		classRoomService.delete(classRoom);
		return "redirect:classroomManage.do";
	}

	/**
	 * @param session
	 * @return classroomAdd 功能：添加教室信息 鲁雪艳
	 */
	@RequestMapping("schooladmin/classroomAdd.do")
	public String classroomAdd(String id, ModelMap modelMap, HttpSession session) {

		// 获取组织表里的学院菜单
		List<Org> org = orgService.getAllColleges();
		modelMap.put("org", org);
		// 获取系和部门

		String college_id = (String) session.getAttribute("college_id");
		List<Org> Org_NameList = orgService.getCollegeAndAllDeptByCollegeID(college_id);
		List<Org> departmentlist;
		departmentlist = orgService.getAllDeptByParentId(college_id);// 获取系

		modelMap.put("departmentlist", departmentlist);
		// 把学院从数据库里传入到下拉框
		Teacher tea = (Teacher) session.getAttribute("current_user");
		// List<ClassRoom> selectCampus =
		// classRoomService.selectCampus(tea.getDept_id());
		List<ClassRoom> selectCampus = classRoomService.selectCampus("szxy");
		modelMap.put("selectCampus", selectCampus);
		return "schooladmin/classroomAdd";
		// 得到前台页面select选中的学院

	}

	/**
	 * @param session
	 * @return ajaxPk_userdept 功能：ajax添加教室信息里的学院和系 鲁雪艳
	 */
	@RequestMapping("schooladmin/ajaxPk_userdept.do")
	public String classRoomajaxPk_userdept(HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String c = request.getParameter("campus");
		StringBuffer s = new StringBuffer();
		s.append("<option  selected='selected'>请选择</option>");
		if (c != null) {
			List<Org> departmentlist = orgService.getAllDeptByParentId(c);
			for (Org scr_userdept : departmentlist) {
				s.append("<option " + "value=" + scr_userdept.getId() + ">"
						+ scr_userdept.getOrg_name() + "</option>");
			}
			try {
				response.getWriter().println(s.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}

	/**
	 * @param session  
	 * @return ajaxPk_contacat 功能：ajax添加教室信息 里的负责人 鲁雪艳
	 */
	@RequestMapping("schooladmin/ajaxPk_contacat.do")
	public String classRoomAjaxGetContacat(HttpServletRequest request,  
			HttpServletResponse response) {
		// 防止乱码
		response.setCharacterEncoding("utf-8");
		// 从前台获取系和部门
		String c = request.getParameter("scr_userdept");
		// 根据获取的系和部门从教师表中查找到教师为负责人，传入前台页面
		StringBuffer s = new StringBuffer();
		s.append("<option  sele	cted='selected'>请选择</option>");
		if (c != null) {
			List<Teacher> t = teacherService.getTeachersByDeptId(c);
			for (Teacher contacat : t) {
				s.append("<option " + "value=" + contacat.getId() + ">"
						+ contacat.getTrue_name() + "</option>");
			}
			try {
				response.getWriter().println(s.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}

	/**
	 * @param session
	 * @return ajaxPk_SchoolContacat 功能：ajax添加校区信息 里的负责人 鲁雪艳
	 */
	@RequestMapping("schooladmin/ajaxPk_SchoolContacat.do")
	public String classRoomajaxGetSchoolContacat(HttpServletRequest request,
			HttpServletResponse response) {
		// 防止乱码
		response.setCharacterEncoding("utf-8");
		// 从前台获取负责人所属学校
		String c = request.getParameter("scr_userdept");
		// 根据获取的负责人所属学校从教师表中查找到教师为负责人，传入前台页面
		StringBuffer s = new StringBuffer();
		s.append("<option  selected='selected'>请选择</option>");
		if (c != null) {
			List<Teacher> t = teacherService.getTeachersByDeptId(c);
			;
			for (Teacher contacat : t) {
				s.append("<option " + "value=" + contacat.getId() + ">"
						+ contacat.getTrue_name() + "</option>");
			}
			try {
				response.getWriter().println(s.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}

	/**
	 * @param session
	 * @return doClassroomAdd 功能：添加教室信息保存时执行 鲁雪艳
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("schooladmin/doClassroomAdd.do")
	public String classroomSave(ModelMap modelMap, HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		// 防止乱码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 获取当前人为创建人
		Teacher create_people = (Teacher) session.getAttribute("current_user");
		// 获取当前时间为
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());

		String scr_campus = request.getParameter("scr_campus");
		String scr_type = request.getParameter("scr_type");
		String scr_num = request.getParameter("scr_num");
		String scr_floor = request.getParameter("scr_floor");
		String scr_code = request.getParameter("scr_code");
		String scr_name = request.getParameter("scr_name");
		String scr_userdept = request.getParameter("scr_userdept");
		String scr_contacat = request.getParameter("scr_contacat");
		String scr_capabilit = request.getParameter("scr_capabilit");
		String scr_devices = request.getParameter("scr_devices");
		String scr_note = request.getParameter("scr_note");
		ClassRoom classroom = new ClassRoom();
		classroom.setCreate_people(create_people.getId());
		classroom.setCreate_time(date);
		classroom.setScr_campus(scr_campus);
		classroom.setScr_type(scr_type);
		classroom.setScr_num(scr_num);
		classroom.setScr_floor(scr_floor);
		classroom.setScr_code(scr_code);
		classroom.setScr_name(scr_name);
		classroom.setScr_userdept(scr_userdept);
		classroom.setScr_contacat(scr_contacat);
		classroom.setScr_capabilit(scr_capabilit);
		classroom.setScr_devices(scr_devices);
		classroom.setScr_note(scr_note);
		classRoomService.insert(classroom);

		return "redirect:classroomManage.do";
	}


	/**
	 * @param session
	 * @return schoolClassroomAdd 功能：添加校区信息 鲁雪艳
	 */
	@RequestMapping("schooladmin/schoolClassroomAdd.do")
	public String schoolClassroomAdd(String id, ModelMap modelMap,
			HttpSession session) {
		// 获取组织表里的学校信息
		List<Org> orgSchool = orgService.getAllSchool();
		modelMap.put("orgSchool", orgSchool);
		return "schooladmin/bigClassroomAdd";
	}

	/**
	 * @param session
	 * @return doBigClassroomAdd 功能：添加校区信息保存时执行 鲁雪艳
	 */
	@RequestMapping("schooladmin/doBigClassroomAdd.do")
	public String doBigClassroomAdd(ModelMap modelMap, HttpSession session,
			HttpServletRequest request, ClassRoom classroom) {
		// 获取当前人为创建人
		Teacher create_people = (Teacher) session.getAttribute("current_user");
		// 获取当前时间为
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
		classroom.setCreate_people(create_people.getId());
		classroom.setCreate_time(date);
		classRoomService.insert(classroom);
		return "redirect:classroomManage.do";
	}

	/**
	 * @param session
	 * @return classroomImport 功能：导入教室信息 鲁雪艳
	 */
	@RequestMapping("schooladmin/classroomImport.do")
	public String classroomImport(String campus, String classType,
			HttpSession session, ModelMap modelMap) {
		modelMap.put("campus", campus);
		modelMap.put("classType", classType);
		return "schooladmin/classroomImport";
	}

	/**
	 * @param sessfion
	 * @return doClassroomImport 功能：导入教室信息 鲁雪艳
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "schooladmin/doClassroomImport.do", method = RequestMethod.POST)
	public String doClassroomImport(MultipartHttpServletRequest request,
			ModelMap modelMap, HttpSession se, String campus, String classType)
			throws IllegalStateException, IOException {
		modelMap.put("campus", campus);
		modelMap.put("classType", classType);
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = request;
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());

				if (file != null) {
					String file_type = "";
					String project_path = request.getSession()
							.getServletContext().getRealPath("/");
					String fileName = file.getOriginalFilename();

					String filepos = "Import" + "/" + file_type + "_";
					String filePosition = "Import" + "/" + file_type + "_"
							+ fileName;
					String real_path = Constants.FILE_ROUTE;
					String file_path = project_path + real_path + filePosition;

					String file_pa = project_path + real_path + filepos;
					// float filesize = file.getSize();//
					// 使用getSize()方法获得文件长度，以此决定允许上传的文件大小。
					file.transferTo(new File(file_path));// 使用transferTo（dest）方法将上传文件写到服务器上指定的文件
					// 文件的属性

					File f = new File(file_pa + fileName);
					List<ClassRoom> clList = ExcelService.AnalysisClassRoom(f);

					HttpSession session = request.getSession();
					session.setAttribute("cl", clList);
					String infor = "";
					int b;
					int i = 0;// 记录验证成功的条数
					for (ClassRoom classroom : clList) {
						// 验证教室编号
						if (classroom.getScr_code() == null
								|| classroom.getScr_code().equals("")) {
							infor = infor + "教室编号不能为空！";
						} else {
							ClassRoom cr = new ClassRoom();
							cr.setScr_code(classroom.getScr_code());
							int num = classRoomService.selectCount(cr);
							if (num > 0) {
								infor = infor + "教室已存在！";
							}
						}
						// 验证教室名称
						if (classroom.getScr_name() == null
								|| classroom.getScr_name().equals("")) {
							infor = infor + "教室名称不能为空！";
						}
						// 验证楼层
						// TODO 验证是数字没有做
						if (classroom.getScr_floor() == null
								|| classroom.getScr_floor().equals("")) {
							infor = infor + "楼层不能为空！";
						} else if (classroom.getScr_floor().length() > 2) {
							infor = infor + "楼层不能大于两位！";
						}
						// 验证楼号
						if (classroom.getScr_num() == null
								|| classroom.getScr_num().equals("")) {
							infor = infor + "楼号不能为空！";
						}
						// 验证容纳人数
						if (classroom.getScr_capabilit() == null
								|| classroom.getScr_capabilit().equals("")) {
							infor = infor + "可容纳人数不能为空！";
						}
						// 验证教工号
						if (classroom.getTemp2() == null
								|| classroom.getTemp2().equals("")) {
							infor = infor + "教工编号不能为空！";
						} else if (classroom.getScr_contacat() == null
								|| classroom.getScr_contacat().equals("")) {
							infor = infor + "负责人不能为空！";
						} else {

							Teacher tea = DictionaryService
									.findTeacherByCode(classroom.getTemp2());
							if (tea != null) {
								if (!tea.getTrue_name().equals(
										classroom.getScr_contacat())) {
									infor = infor + "教工号与负责人不一致！";
								}
							} else {
								infor = infor + "系统中没有该教工号！";
							}

						}
						// 验证配套描述
						if (classroom.getScr_devices() == null
								|| classroom.getScr_devices().equals("")) {
							infor = infor + "配套描述不能为空！";
						}
						// 验证备注
						if (classroom.getScr_note() == null
								|| classroom.getScr_note().equals("")) {
							infor = infor + "所属部门不能为空！";// 要与数据库匹配
						}
						// 验证成功
						if (infor.trim().equals("")) {
							infor = "无";
							i++;
						}
						classroom.setTemp1(infor.trim());
						infor = "";
					}
					modelMap.put("successCheck", "领导您辛苦了，共有 " + i
							+ " 条记录被成功验证通过");
				}
			}
		}
		return "schooladmin/classroomImport";
	}
	/**
	 * 功能：导入excel表格,保存教室 鲁雪艳
	 * 
	 */
	@RequestMapping("schooladmin/doSaveClassroom.do")
	public String doSaveClassroom(String campus, String classType,
			HttpSession session) {
		List<ClassRoom> clList = (List<ClassRoom>) session.getAttribute("cl");
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
		for (ClassRoom classroom : clList) {
			Teacher tea = DictionaryService.findTeacherByCode(classroom
					.getTemp2());
			classroom.setScr_userdept(tea.getDept_id());
			classroom.setScr_contacat(tea.getId());
			classroom.setScr_type(classType);
			classroom.setScr_campus(campus);
			classroom.setCreate_time(date);
			classroom.setCreate_people(Common.getOneTeaId(session));
			classroom.setTemp1(null);
			classroom.setTemp2(null);
			classRoomService.insert(classroom);
		}
		return "schooladmin/classroomImportSuccess";
	}
	
	
	
	
	
	
	
	
	/**
	 * 初始化学院角色及角色菜单.
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	/*@RequestMapping("schooladmin/initCollegeRole.do")
	public ModelAndView initCollegeRole(HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		Org o = new Org();
		o.setOrg_level("2");
		List<Org> orgList = orgService.selectList(o);
		map.put("orgList", orgList);
		return new ModelAndView("schooladmin/initCollegeRole", map);
	}*/
	
	/**
	 * 初始化学院角色及角色菜单.
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	/*@RequestMapping("schooladmin/doinitCollegeRole.do")
	public String  initCollegeRoleSave(HttpSession session,HttpServletRequest request){
		String college_id = request.getParameter("college_id");
		roleService.saveBasicRoleByCollegeId(college_id);
		return "redirect:index.do"; 
	}*/
		
	/**
	 * 学校领导列表.
	 * @author 吴敬国
	 * @createDate 2016-3-11
	 * @since 1.0
	 */
//	@RequestMapping("schooladmin/schoolLeader.do")
//	public ModelAndView schoolLeaderList(HttpSession session) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		
//		
//		map.put("collegeList", collegeList);
//		return new ModelAndView("schooladmin/roleAdd", map);
//	}
	/**
	 * 学院列表
	 * 
	 * @author 周睿
	 * @createDate 2015-12-26
	 * @since 1.0
	 */
	/*@RequestMapping("schooladmin/orgList.do")
	public ModelAndView orgList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Org o = new Org();
		o.setOrg_level("2");
		List<Org> orgList = orgService.selectList(o);
		map.put("orgList", orgList);
		return new ModelAndView("schooladmin/sysOrgList", map);
	}*/


/**
	 * 功能：系统管理员——参数管理by丁乐晓2016o115
	 * 
	 * @param
	 * @return 列表页面
	 */
/*	@RequestMapping("schooladmin/paramList.do")
	public ModelAndView paramList(HttpServletRequest request,
			HttpServletResponse response, String xi_id, HttpSession session,
			String type) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String student_grade = (String) session.getAttribute("student_grade");
		String student_dept_id = (String) session
				.getAttribute("student_dept_id");
		
       //动态获取学年范围
		List<String> grade = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();  
        int find_year = calendar.get(Calendar.YEAR);
        for(int i=2011;i<=find_year;i++){
        	String b=i+"-"+(i+1);
        	grade.add(b);
        }
        
		// 得到所有的学院
		Org o = new Org();
		o.setOrg_level("2");
		List<Org> orgList = orgService.selectList(o);
		map.put("orgList", orgList);
		map.put("grade", grade);
		map.put("student_grade", student_grade);
		map.put("student_dept_id", student_dept_id);
		return new ModelAndView("schooladmin/paramList", map);
	}*/

	/**
	 * 功能：管理员——参数管理 查询出学院所对应的系部名称信息By丁乐晓20160115
	 * 
	 * @param org
	 * @return 列表页面
	 */
	/*@RequestMapping("schooladmin/xibuList.do")
	public ModelAndView paramList(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String Org_Name)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		response.setCharacterEncoding("utf-8");
		List<Org> xibuList = this.orgService.selectXiOrg_Name(Org_Name);// 查询出该学院对应的系部
		StringBuffer xb = new StringBuffer();
		xb.append("<option "+"请选择系部"+"</option>");
		for (Org x : xibuList) {
			xb.append("<option " + "value=" + x.getId() + ">" + x.getOrg_name()
					+ "</option>");
		}
		response.getWriter().println(xb.toString());
		return null;
	}*/

	/**
	 * 功能：管理员——参数管理 查询出不同学年不同学院的参数信息By丁乐晓20160115
	 * 
	 * @param org
	 * @return 列表页面
	 */
	/*@RequestMapping("schooladmin/findList.do")
	public String findList(HttpServletRequest request,
			HttpServletResponse response, String year, HttpSession session,
			String type, String org_id, String xibu) throws IOException {
		response.setCharacterEncoding("utf-8");
		String years = year.substring(0,4);
		Param p = new Param();
		p.setYear(years);
		if(xibu!=""){
			p.setDept_id(xibu);
		}else{
			p.setDept_id(org_id);
		}
		List<Param> s = this.paramService.selectList(p);
		StringBuffer f = new StringBuffer();
		int i = 0;
		for (Param l : s) {
			i++;
			String stateName = "有效";
			if (l.getState().equals("2")) {
				stateName = "无效";
			}
			String tearm="第一学期";
			if(l.getTearm().equals("2")){
				tearm="第二学期";
			}
			f.append("<tr id='nei'>");
			f.append("	<td align='center'>" + i + "</td>");
			f.append("	<td align='center'>" + l.getParam_code() + "</td>");
			f.append("	<td align='center'>" + l.getParam_name() + "</td>");
			f.append("	<td align='center'>" + l.getParam_value() + "</td>");
			f.append("	<td align='center'>"
					+ DictionaryService.findOrg(l.getDept_id()).getOrg_name()
					+ "</td>");
			f.append("	<td align='center'>" + tearm + "</td>");
			f.append("	<td align='center'>" + stateName + "</td>");
			f.append("	<td align='center'><input type='button' value='修改' onclick=doEdit('"
					+ l.getId() + "');></td>");
			f.append("<td align='center'> <input type='button' value='删除' onclick=doDel('"
					+ l.getId() + "');></td>");
			f.append("</tr>");

		}
		response.getWriter().println(f.toString());
		return null;
	}*/

	/**
	 * 功能：管理员——参数管理 删除参数By丁乐晓20160115
	 * 
	 * @param
	 * @return 列表页面
	 */
	/*@RequestMapping("schooladmin/deleteParam.do")
	public String deleteParam(HttpServletRequest request,
			HttpServletResponse response, String delete_id) throws IOException {
		
		功能不全面，删除一条数据之后页面发生了跳转，代码需要优化
		 * Param delete=(Param) paramService.selectByID(delete_id);
		String year=delete.getYear();
		String org_id=delete.getDept_id();
		String xibu=delete.getDept_id();
		paramService.delete(delete_id);
		return "redirect:paramList.do";
		return "redirect:findList.do?year="+year+"&org_id="+org_id;
	}*/

	/**
	 * 功能：管理员——添加管理 添加参数--学院信息By丁乐晓20160115
	 * 
	 * @param
	 * @return
	 */
/*	@RequestMapping("schooladmin/paramAdd.do")
	public ModelAndView paramAdd(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//动态获取学年
		Calendar calendar = Calendar.getInstance();  
        int add_year = calendar.get(Calendar.YEAR);
    	ArrayList add_years=new ArrayList();
        for(int i=2011;i<=add_year;i++){
        	add_years.add(i);
        }
		List<Org> collegeList = orgService.getAllColleges();
		map.put("add_years", add_years);
		map.put("collegeList", collegeList);
		return new ModelAndView("schooladmin/paramAdd", map);
	}*/

	/**
	 * 功能：管理员——添加管理 添加参数By丁乐晓20160309
	 * 
	 * @param
	 * @return 列表页面
	 */
	/*@RequestMapping("schooladmin/doAddParam.do")
	public String doAddParam(HttpServletRequest Request,
			HttpServletResponse response) throws IOException {
		Param pr = new Param();
		String xi_id = Request.getParameter("xi_id");
		String collegeList_name = Request.getParameter("collegeList_name");
		if(collegeList_name.equals("请选择学院")){
			JOptionPane.showMessageDialog(null, "请选择部门");
		}else{
        if(xi_id!=""&&!xi_id.equals("请选择系部")){
    		pr.setDept_id(xi_id);
		}else{
			String collegeList_id = Request.getParameter("collegeList_name");
			pr.setDept_id(collegeList_id);
		}
		}
        //获取参数值
		String param_name = Request.getParameter("param_name");
		String param_value = Request.getParameter("param_value");
		String state = Request.getParameter("state");
		String param_code = Request.getParameter("param_code");
		String year = Request.getParameter("year");
		String tearm = Request.getParameter("tearm");
		//将参数保存到pr中
		pr.setTearm(tearm);
		pr.setTask_id(null);
		pr.setYear(year);
		pr.setParam_name(param_name);
		pr.setParam_value(param_value);
		pr.setState(state);
		pr.setParam_code(param_code);
		pr.setId(Common.returnUUID());
		//添加到数据库
		paramService.insert(pr);
		return "redirect:paramList.do";
	}*/

	/**
	 * 功能：管理员——参数管理 修改参数--显示原始数据By丁乐晓20160309
	 * 
	 * @param
	 * @return 列表页面
	 */
	/*@RequestMapping("schooladmin/paramEdit.do")*/
	/*public ModelAndView paramEdit(HttpServletRequest request,
			HttpServletResponse response,String param_id) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Param edit=(Param) paramService.selectByID(param_id);
		//获取需要修改的数据
		String edit_code=edit.getParam_code();
		String edit_name=edit.getParam_name();
		String edit_value=edit.getParam_value();
		String id=edit.getId();
		
		map.put("id", id);
		map.put("edit_code", edit_code);
		map.put("edit_name", edit_name);
		map.put("edit_value", edit_value);
		return new ModelAndView ("schooladmin/paramEdit",map);

	}*/
	/**
	 * 功能：管理员——参数管理 修改参数By丁乐晓20160310
	 * 
	 * @param
	 * @return 列表页面
	 */
	/*@RequestMapping("schooladmin/doEdit.do")
	public String doEdit(HttpServletRequest request,HttpServletResponse response,String id) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Param ed=new Param();
		ed=(Param) paramService.selectByID(id);
		String edit_name = request.getParameter("edit_name");
		String edit_value = request.getParameter("edit_value");
		String edit_code = request.getParameter("edit_code");
		//保存修改的数据
		ed.setParam_code(edit_code);
		ed.setParam_name(edit_name);
		ed.setParam_value(edit_value);
		
		paramService.update(ed);
		
		return "redirect:paramList.do";

	}
	*/
	
	
	
	
	
}
