package com.sict.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.sict.common.CommonSession;
import com.sict.entity.Company;
import com.sict.entity.Duties;
import com.sict.entity.EvalsIndex;
import com.sict.entity.GroupMembers;
import com.sict.entity.Org;
import com.sict.entity.Param;
import com.sict.entity.Role;
import com.sict.entity.Student;
import com.sict.entity.SysMenu;
import com.sict.entity.TeaStu;
import com.sict.entity.Teacher;
import com.sict.entity.TrainDetail;
import com.sict.entity.UserRole;
import com.sict.service.CompanyService;
import com.sict.service.CourseService;
import com.sict.service.DictionaryService;
import com.sict.service.DirectRecordService;
import com.sict.service.DutiesService;
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
public class SysAdminController {
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
	 * 注入sysMenuService by吴敬国2015-12-21
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
	/**
	 * 注入DutiesService 
	 * 
	 * */
	@Resource(name = "dutiesService")
	private DutiesService dutiesService;

	// 定义返回类型
	String ret = "";

	private Object o;
	private int pageSizeConstant = Constants.pageSize; // 获取常量分页页面大小

	/**
	 * 管理员首页.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 3.0
	 */
	@RequestMapping("sysadmin/index.do")
	public String index(HttpSession session) {
		// 默认年份
		String grade = Common.getDefaultYear();
		// 获取负责的学院,通过组织表的联系人id找到负责的学院，限制一个教师只负责一个学院
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String college_id = tea.getDept_id();

		// 设置当前权限为管理员 by桑博
		CommonSession.setUserRole(session, CommonSession.roleAdmin);
		return "sysadmin/index";
	}

	/**
	 * 菜单列表.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/menuList.do")
	public ModelAndView menuList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SysMenu sm = new SysMenu();
		// sm.setSm_used("1");
		List<SysMenu> sysMenuList = sysMenuService.selectList(sm);
		map.put("sysMenuList", sysMenuList);
		return new ModelAndView("sysadmin/sysMenuList", map);
	}

	/**
	 * 菜单列表.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/seeZtree.do")
	public String seeZtree(HttpSession session) {
		/*
		 * Map<String, Object> map = new HashMap<String, Object>(); SysMenu
		 * sm=new SysMenu(); List<SysMenu>
		 * sysMenuList=sysMenuService.selectList(sm); map.put("sysMenuList",
		 * sysMenuList); return new ModelAndView("sysadmin/seeMenuZtree", map);
		 */
		return "sysadmin/seeMenuZtree";
	}

	/**
	 * 添加菜单.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/addSysMenu.do")
	public ModelAndView MenuaddSys(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SysMenu sm = new SysMenu();
		sm.setTemp1("1");
		sm.setSm_used(Constants.SYSMENU_USERD);
		List<SysMenu> sysMenuList = sysMenuService.selectList(sm);
		map.put("sysMenuList", sysMenuList);
		return new ModelAndView("sysadmin/sysMenuAdd", map);
	}
	/**
	 * 根据菜单类别查询所有可用的菜单
	 * @Description
	 * @author 
	 * @return
	 */
	@RequestMapping("sysadmin/ajaxGetParentMenu.do")
	public String ajaxGetParentMenu(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");// 角色类别
		SysMenu sysmenu = new SysMenu();
		sysmenu.setTemp1(type);
		sysmenu.setSm_used(Constants.SYSMENU_USERD);
		List<SysMenu> sysMenuList = sysMenuService.selectList(sysmenu);
		StringBuffer sb = sysMenuService.ajaxGetParentMenu(sysMenuList);
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 添加菜单.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/doAddSysMenu.do")
	public String MenudoAddSys(HttpSession session,HttpServletRequest request) {
		String sm_OneNum = request.getParameter("sm_OneNum");
		String sm_TwoNum = request.getParameter("sm_TwoNum");
		String sm_ThreeNum = request.getParameter("sm_ThreeNum");
		String sm_name = request.getParameter("sm_name");
		String sm_title = request.getParameter("sm_title");
		String temp1 = request.getParameter("temp1");//类别
		String sm_is_top = request.getParameter("sm_is_top");
		String sm_parent = request.getParameter("sm_parent");
		String sm_page = request.getParameter("sm_page");
		String sm_page_phone = request.getParameter("sm_page_phone");
		String sm_description = request.getParameter("sm_description");
		String code=sysMenuService.installSmCode(temp1, sm_OneNum, sm_TwoNum, sm_ThreeNum);
		SysMenu sysMenu=new SysMenu();
		sysMenu.setSm_code(code);
		sysMenu.setSm_name(sm_name);
		sysMenu.setSm_title(sm_title);
		sysMenu.setSm_parent(sm_parent);
		sysMenu.setSm_page(sm_page);
		sysMenu.setSm_page_phone(sm_page_phone);
		sysMenu.setSm_description(sm_description);
		sysMenu.setSm_is_top(sm_is_top);
		sysMenu.setSm_used("1");
		sysMenu.setTemp1(temp1);
		sysMenuService.insert(sysMenu);
		return "redirect:menuList.do";
	}

	/**
	 * 删除菜单
	 * 
	 * @author 周睿
	 * @createDate 2015-12-26
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/deleteSysMenu.do")
	public String MenudeleteSys(HttpSession sessio, HttpServletRequest request) {
		String sysMenu_ID = request.getParameter("menuID");
		SysMenu sm = (SysMenu) sysMenuService.selectByID(sysMenu_ID);
		sm.setSm_used("2");
		sysMenuService.update(sm);
		return "redirect:menuList.do";
	}

	/**
	 * 修改菜单
	 * 
	 * @author 周睿
	 * @createDate 2015-12-26
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/sysMenuEdit.do")
	public ModelAndView MenuEdit(HttpSession sessio, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String sysMenu_ID = request.getParameter("menuID");
		SysMenu sm = (SysMenu) sysMenuService.selectByID(sysMenu_ID);
		map.put("sysmenu", sm);

		SysMenu sm1 = new SysMenu();
		sm1.setSm_used("1");
		List<SysMenu> sysMenuList = sysMenuService.selectList(sm1);
		map.put("sysMenuList", sysMenuList);
		return new ModelAndView("sysadmin/sysMenuEdit", map);
	}

	/**
	 * 修改菜单
	 * 
	 * @author 周睿
	 * @createDate 2015-12-26
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/dosysMenuEdit.do")
	public String MenudoEdit(HttpSession sessio, HttpServletRequest request,
			@ModelAttribute("sysMenu") SysMenu sysMenu) {
		sysMenuService.update(sysMenu);
		return "redirect:menuList.do";
	}

	/**
	 * 顶级组织列表.
	 * 
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/schoolList.do")
	public ModelAndView schoolList(HttpSession session) {
		List<Map<String, String>> schoolList = orgService
				.getTopOrgListAndContacts();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schoolList", schoolList);
		return new ModelAndView("sysadmin/schoolList", map);
	}

	/**
	 * 初始化学校.
	 * 
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/initSchool.do")
	public ModelAndView initSchool(HttpSession session) {
		Role role = new Role();
		role.setTemp1("2");
		role.setRole_type("1");
		List<Role> roleList = roleService.selectList(role);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleList", roleList);
		return new ModelAndView("sysadmin/initSchool", map);
	}

	/**
	 * 初始化学校.
	 * 
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/doinitSchool.do")
	public String initSchoolSave(HttpSession session, HttpServletRequest request) {
		String school_name = request.getParameter("school_name");
		String school_code = request.getParameter("school_code");
		String tea_name = request.getParameter("tea_name");
		String tea_code = request.getParameter("tea_code");
		String tea_sex = request.getParameter("tea_sex");
		String tea_phone = request.getParameter("tea_phone");
		String schoolAdmin = request.getParameter("schoolAdmin");

		String teaId = Common.returnUUID16();// 学校管理员教师的id
		// 添加组织
		Org o = new Org();
		o.setOrg_level(Constants.ORG_LEVEL_SCHOOL);
		o.setId(school_code);
		o.setBegin_time(DateService.getNowTimeTimestamp());
		o.setContacts(teaId);
		o.setOrg_code(school_code);
		o.setOrg_name(school_name);
		o.setDirector("无");
		o.setPhone(tea_phone);
		o.setParent_id(Constants.TOP_ORG_ID);// 学校级别的组织上级组织为顶级组织-系统
		orgService.insert(o);
		// 添加管理员信息
		Teacher tea = new Teacher();
		tea.setId(teaId);
		tea.setTea_code(tea_code);
		tea.setTrue_name(tea_name);
		tea.setLogin_pass(tea_code);
		tea.setSex(tea_sex);
		tea.setPhone(tea_phone);
		tea.setDept_id(school_code);
		tea.setTea_type(Constants.TEA_TYPE_SCHOOL);
		tea.setState(Constants.STATE_USERD);
		teacherService.insert(tea);
		// 添加学校管理员角色
		String schoolAdminRole = schoolAdmin + "_" + school_code;// 学校管理员模板_学校编码
		Role role = new Role();
		role.setId(schoolAdminRole);
		role.setRole_code(schoolAdminRole);
		role.setRole_name(school_name + "管理员");
		role.setRole_desc(school_name + "管理员");
		role.setRole_type("1");// 管理员类型
		role.setCreate_time(DateService.getNowTimeTimestamp());
		Teacher teacher = (Teacher) session.getAttribute("current_user");
		role.setCreate_tea(teacher.getId());
		role.setSchool_id(school_code);
		role.setTemp1(Constants.ROLE_LEVEL_THREE);
		role.setTemp2(Constants.ROLE_ADMIN_SCHOOL);
		roleService.insert(role);
		// 添加管理员权限
		UserRole userroleadmin = new UserRole();
		userroleadmin.setRole_id(schoolAdminRole);
		userroleadmin.setUser_id(teaId);
		userRoleService.insert(userroleadmin);
		// 添加管理员权限和教师基本角色
		userRoleService.saveBasicUserRole(teaId, "ROLE_ADMIN", "ROLE_TEACHER",
				null, null, null);
		return "redirect:index.do";
	}

	/**
	 * 角色模板列表.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/roleTemplateList.do")
	public ModelAndView roleTemplateList(HttpSession session) {
		// 得到角色模板的列表
		List<Role> roleTemplateList = roleService.getRoleByRoleLevel(
				Constants.ROLE_LEVEL_ONE, Constants.ROLE_LEVEL_TWO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleTemplateList", roleTemplateList);
		return new ModelAndView("sysadmin/roleTemplateList", map);
	}

	/**
	 * 添加角色模板.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/addRoleTemplate.do")
	public String roleTemplateadd(HttpSession session) {
		return "sysadmin/roleTemplateAdd";
	}

	/**
	 * 根据角色类型得到这个类别对应下的菜单ajax
	 * 
	 * @Description
	 * @author 吴敬国 2015-12-23
	 * @return
	 */
	@RequestMapping("sysadmin/getSysMenuByRoletype.do")
	public String roleAjaxGetSysMenuByRoletype(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		String role_type = request.getParameter("role_type");// 角色类别
		SysMenu sysmenu = new SysMenu();
		sysmenu.setTemp1(role_type);
		sysmenu.setSm_is_top(Constants.SYSMENU_LEVEL_ONE);
		sysmenu.setSm_used(Constants.SYSMENU_USERD);
		List<SysMenu> sysMenuList = sysMenuService
				.selectTopMenuListByRoleType(sysmenu);
		StringBuffer sb = sysMenuService.StringBufferWithSysMenu(sysMenuList);
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 保存角色模板.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/doAddRoleTemplate.do")
	public String roleTemplateSave(HttpServletRequest request,
			HttpSession session) throws IOException {
		String role_type = request.getParameter("role_type");
		String role_code = request.getParameter("role_code");
		String role_name = request.getParameter("role_name");
		String role_desc = request.getParameter("role_desc");
		String state = request.getParameter("state");

		Role role = new Role();
		role.setId(role_code);
		role.setRole_code(role_code);
		role.setRole_type(role_type);
		role.setRole_name(role_name);
		role.setRole_desc(role_desc);
		role.setSchool_id(Constants.TOP_ORG_ID);
		Teacher tea = (Teacher) session.getAttribute("current_user");
		role.setCreate_tea(tea.getId());
		role.setCollege_id(Constants.TOP_ORG_ID);
		role.setCreate_time(DateService.getNowTimeTimestamp());
		role.setState(state);
		role.setTemp1(Constants.ROLE_LEVEL_TWO);
		roleService.insert(role);

		String[] sysMenu = request.getParameterValues("roleMenu");
		// 根据角色id和这个角色对应的菜单数组保存到角色菜单对应表
		sysRoleMenuService.insertSysRoleMenuBySrmRoleId(role_code, sysMenu);
		return "redirect:roleTemplateList.do";
	}

	/**
	 * 角色模板管理-修改角色
	 * 
	 * @Description
	 * @author
	 * @return
	 */
	@RequestMapping("sysadmin/editRoleTemplate.do")
	public String roleTemplateEdit(ModelMap modelMap, String role_id) {
		List<SysMenu> sysMenuLists = sysMenuService.getSysMenuByRoleId(role_id);
		List<Role> roleListByRoleTemplate = roleService
				.getRoleListbyRoleTemplateid(role_id);
		Role RoleTemplate = (Role) roleService.selectByID(role_id);
		modelMap.put("role", RoleTemplate);
		modelMap.put("roleListByRoleTemplate", roleListByRoleTemplate);
		modelMap.put("sysMenuLists", sysMenuLists);
		return "sysadmin/roleTemplateEdit";
	}

	/**
	 * 角色模板管理-修改保存角色
	 * 
	 * @Description
	 * @author
	 * @return
	 */
	@RequestMapping("sysadmin/doEditTemplateRole.do")
	public String roleTemplateDoEdit(HttpServletRequest request)
			throws IOException {
		String role_id = request.getParameter("role_id");// 获取该角色ID
		String role_name = request.getParameter("role_name");// 获取该角色ID
		String role_desc = request.getParameter("role_desc");// 获取该角色ID
		Role role = (Role) roleService.selectById(role_id);
		role.setRole_desc(role_desc);
		role.setRole_name(role_name);
		String[] sysMenu = request.getParameterValues("sysMenu");
		String[] rolelist = request.getParameterValues("rolelist");// 要同步的角色编码的数组列表
		roleService.update(role);
		sysRoleMenuService.updateSysRoleMenuBySrmRoleId(role_id, sysMenu);
		if (rolelist != null && rolelist.length > 0) {
			sysRoleMenuService.synchronousRole(rolelist, sysMenu);
		}
		return "redirect:roleTemplateList.do";
	}

	/**
	 * 角色列表.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/roleList.do")
	public ModelAndView roleList(HttpSession session) {
		List<Role> roleList = roleService.getRoleByRoleLevel(
				Constants.ROLE_LEVEL_THREE, Constants.ROLE_LEVEL_FOUT);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleList", roleList);
		return new ModelAndView("sysadmin/roleList", map);
	}

	/**
	 * 添加角色.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/addRole.do")
	public ModelAndView roleAdd(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Org> collegeList = orgService.getAllColleges();
		List<Org> schoolList = orgService.getAllSchool();
		map.put("collegeList", collegeList);
		map.put("schoolList", schoolList);
		return new ModelAndView("sysadmin/roleAdd", map);
	}

	/**
	 * 添加角色通过角色模板.
	 * 
	 * @author 吴敬国
	 * @createDate
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/addRoleByRoleTemplate.do")
	public ModelAndView roleAddByRoleTemplate(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Role role = new Role();
		role.setTemp1(Constants.ROLE_LEVEL_TWO);
		List<Role> roleTemplateList = roleService.selectList(role);
		List<Org> collegeList = orgService.getAllColleges();
		List<Org> schoolList = orgService.getAllSchool();
		map.put("collegeList", collegeList);
		map.put("schoolList", schoolList);
		map.put("roleTemplateList", roleTemplateList);
		return new ModelAndView("sysadmin/roleAddByRoleTemplate", map);
	}

	/**
	 * 通过角色模板保存角色.
	 * 
	 * @author 吴敬国
	 * @createDate
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/doAddRoleByRoleTemplate.do")
	public String roleSaveByRoleTemplate(HttpSession session,
			HttpServletRequest request) {
		String roleTemplate_id = request.getParameter("roleTemplate_id");
		String roleType = request.getParameter("roleType");
		String school_id = request.getParameter("school_id");
		// String college_id=request.getParameter("college_id");
		String[] collegeList = request.getParameterValues("college_id");// 要同步的角色编码的数组列表
		// 根据角色模板建立一个的角色及菜单
		if (roleType.equalsIgnoreCase("学校角色")) {
			roleService.saveSchoolRoleByRoleTemplate(roleTemplate_id,
					school_id, session);
		} else {
			if (collegeList != null) {
				for (int i = 0; i < collegeList.length; i++) {
					roleService.saveRoleByRoleTemplate(roleTemplate_id,
							school_id, collegeList[i], session);
				}
			}
		}
		// 系统问题：前台没有考虑如果用户不选的情况。保存成功的结果没有返回，页面提示和异常处理机制不全
		return "redirect:roleList.do";
	}

	/**
	 * 保存角色.
	 * 
	 * @author 吴敬国
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/doAddRole.do")
	public String roledoSave(HttpServletRequest request, HttpSession session) {
		String role_type = request.getParameter("role_type");
		String school_id = request.getParameter("school_id");
		String college_id = request.getParameter("college_id");
		String role_code = request.getParameter("role_code");
		String role_name = request.getParameter("role_name");
		String role_desc = request.getParameter("role_desc");
		String state = request.getParameter("state");

		Role role = new Role();
		role.setId(role_code);
		role.setRole_code(role_code);
		role.setRole_type(role_type);
		role.setRole_name(role_name);
		role.setRole_desc(role_desc);
		role.setSchool_id(school_id);
		role.setCreate_tea(Common.getOneTeaId(session));
		role.setCollege_id(college_id);
		role.setCreate_time(DateService.getNowTimeTimestamp());
		role.setState(state);
		role.setTemp1(Constants.ROLE_LEVEL_THREE);
		roleService.insert(role);

		String[] sysMenu = request.getParameterValues("roleMenu");
		sysRoleMenuService.insertSysRoleMenuBySrmRoleId(role_code, sysMenu);

		return "redirect:roleList.do";
	}

	/**
	 * 角色管理-修改角色
	 * 
	 * @Description
	 * @author
	 * @return
	 */
	@RequestMapping("sysadmin/editRole.do")
	public String roleEdit(ModelMap modelMap, String role_id) {
		List<SysMenu> sysMenuLists = sysMenuService.getSysMenuByRoleId(role_id);
		Role role = (Role) roleService.selectByID(role_id);
		modelMap.put("role", role);
		modelMap.put("sysMenuLists", sysMenuLists);
		return "sysadmin/roleEdit";
	}

	/**
	 * 角色管理-修改保存角色
	 * 
	 * @Description
	 * @author
	 * @return
	 */
	@RequestMapping("sysadmin/doEditRole.do")
	public String roleDoEdit(@ModelAttribute("role") Role role,
			HttpServletRequest request) throws IOException {
		String role_id = request.getParameter("id");// 获取该角色ID
		roleService.update(role);
		String[] sysMenu = request.getParameterValues("sysMenu");
		sysRoleMenuService.updateSysRoleMenuBySrmRoleId(role_id, sysMenu);
		return "redirect:roleList.do";
	}

	// ---------------------------------以下方法没有整理
	/**
	 * 组织管理列表 by吴敬国
	 */
	@RequestMapping("sysadmin/orgList.do")
	public ModelAndView orgList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Org> orgList = orgService.selectOrderByOrgLevel();
		map.put("orgList", orgList);
		return new ModelAndView("sysadmin/allOrgList", map);
	}

	/**
	 * 教师用户列表.
	 * 
	 * @author 吴敬国
	 * @createDate 2016-3-11
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/teacherList.do")
	public ModelAndView teacherList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Org o = new Org();
		o.setOrg_level("2");
		List<Org> orgs = orgService.selectList(o);
		Teacher tea=new Teacher();
		tea.setState("1");
		List<Teacher> teaList=teacherService.selectList(tea);
		List<Teacher> teas=new ArrayList<Teacher>();
		for(Teacher t:teaList){
			String org_name=new String();
			try {
				org_name=orgService.selectByID(t.getDept_id()).getOrg_name();
			} catch (Exception e) {
				// TODO: handle exception
			}
			t.setTemp1(org_name);
			teas.add(t);
			
		}
		
		map.put("teaList", teas);
		map.put("orgs", orgs);
		return new ModelAndView("sysadmin/teacherList", map);
	}

	/**
	 * 功能：重置教师密码
	 * 
	 */
	@RequestMapping("sysadmin/resetPassword.do")
	public String resetPassword(HttpServletRequest request, HttpSession session)
			throws IOException {
		String tea_id = request.getParameter("tea_id");
		teacherService.resetPassword(tea_id);
		return "redirect:teacherList.do";
	}


	/**
	 * 功能：添加教师
	 * 周睿
	 * 20160524
	 */
	@RequestMapping("sysadmin/addTeacher.do")
	public ModelAndView teacherAdd(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();	
		List<Org> result = orgService.getAllOrg3();
		map.put("teachers", result);
		
		return new ModelAndView("sysadmin/teacherAdd", map);
	}

	/**
	 * 组织管理列表by宋浩20160315
	 */
	@RequestMapping("sysadmin/schOrgList.do")
	public ModelAndView orgManager(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String dept_id = tea.getDept_id();
		Org org = orgService.selectByID(dept_id);
		List<Org> orgList = orgService.getOrgSon();
		map.put("orgList", orgList);
		map.put("org", org);
		return new ModelAndView("sysadmin/schOrgList", map);
	}

	/**
	 * 校级组织管理添加by宋浩20160319
	 */
	@RequestMapping("sysadmin/schOrgAdd.do")
	public ModelAndView orgAdd(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String teaDept = tea.getDept_id();
		Org org = orgService.selectByID(teaDept);
		List<Org> orgList = orgService.getOrgSon();

		map.put("org", org);
		map.put("orgList", orgList);
		return new ModelAndView("sysadmin/schOrgAdd", map);
	}

	/**
	 * ajax查询学院老师 宋浩 20160324
	 */
	@RequestMapping("sysadmin/ajaxXY_teacher.do")
	public String ajaxXY_teacher(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String c = request.getParameter("contactsDept");
		StringBuffer s = new StringBuffer();
		s.append("<option  selected='selected'>请选择</option>");
		if (c != null) {
			List<Teacher> t = teacherService.getTeachersByDeptId(c);
			for (Teacher teacher : t) {
				s.append("<option " + "value=" + teacher.getId() + ">"
						+ teacher.getTrue_name() + "</option>");
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
	 * 保存组织管理by宋浩20160321
	 */
	@RequestMapping("sysadmin/dosysOrgAdd.do")
	public String schOrgdoAdd(HttpServletRequest request, HttpSession session) {
		String org_code = request.getParameter("org_code");
		String org_name = request.getParameter("org_name");
		String contacts = request.getParameter("contacts");
		String org_level = "1";
		String phone = request.getParameter("phone");
		String parent_id = request.getParameter("par_dept");// 上级组织id
		if (contacts == null) {
			contacts = "无";
		}
		String begin_time = request.getParameter("begin_Time");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		try {
			ts = new Timestamp(format.parse(begin_time).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Org org = new Org();
		org.setId(Common.returnUUID());
		org.setBegin_time(ts);
		org.setOrg_code(org_code);
		org.setOrg_name(org_name);
		org.setContacts(contacts);
		org.setOrg_level("1");
		org.setDirector("");
		org.setVice_director("");
		org.setPhone(phone);
		org.setParent_id(parent_id);
		org.setState("1");
		orgService.insert(org);
		return "redirect:schOrgList.do";
	}

	/**
	 * 添加校级领导 by 师杰 20160321
	 */
	@RequestMapping("sysadmin/schoolLeadersAdd.do")
	public ModelAndView schoolLeadersAdd(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Org> org = orgService.selectSchoolOrg();// 获取所有校级部门

		map.put("collegeList", org);
		return new ModelAndView("sysadmin/schoolLeadersAdd", map);
	}

	/**
	 * 保存校级领导信息 by 师杰 20160321
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("sysadmin/doSchoolLeadersAdd.do")
	public String doSchoolLeadersAdd(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String tea_code = request.getParameter("tea_code");
		String tea_name1 = request.getParameter("tea_name");
		String tea_name = new String(tea_name1.getBytes("ISO-8859-1"), "UTF-8");
		String sex1 = request.getParameter("sex");
		String sex = new String(sex1.getBytes("ISO-8859-1"), "UTF-8");
		String phone = request.getParameter("phone");
		String dept_id = request.getParameter("dept_id");
		String duties1 = request.getParameter("duties");
		String duties = new String(duties1.getBytes("ISO-8859-1"), "UTF-8");

		Teacher tea = new Teacher();
		tea.setId(Common.returnUUID());
		tea.setTea_code(tea_code);
		tea.setLogin_pass(tea_code);
		tea.setTrue_name(tea_name);
		tea.setSex(sex);
		tea.setPhone(phone);
		tea.setDept_id(dept_id);
		tea.setCourse_id("");
		tea.setExpertise("");
		tea.setState("1");
		tea.setTea_type("1");
		tea.setDuties(duties);
		teacherService.insert(tea);

		return "redirect:schoolLeadersList.do";
	}

	/**
	 * 显示校级领导 by 师杰 20160321
	 */
	@RequestMapping("sysadmin/schoolLeadersList.do")
	public ModelAndView schoolLeadersList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Org> org = orgService.selectSchoolOrg();
		List<Teacher> li = new ArrayList<Teacher>();
		for (Org o : org) {
			List<Teacher> tea = teacherService.getTeachersByDeptId(o.getId());
			for (Teacher t : tea) {
				Org i = orgService.selectByID(t.getDept_id());
				String org_name = i.getOrg_name();
				t.setTemp1(org_name);
			}
			li.addAll(tea);
		}
		map.put("org", org);
		map.put("teaList", li);
		return new ModelAndView("sysadmin/schoolLeadersList", map);
	}

	/**
	 * ajax传递 师杰 2016-03-24 ajaxGetSchoolLeaders.do
	 */
	@RequestMapping("sysadmin/ajaxGetSchoolLeaders.do")
	public String schoolLeadersAjaxGet(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {

		response.setCharacterEncoding("UTF-8");// 设置编码格式为utf-8
		String dept = request.getParameter("dept");
		List<Teacher> tea = teacherService.getTeachersByDeptId(dept);

		StringBuffer sb = new StringBuffer();// 数据缓冲池

		for (Teacher t : tea) {
			int i = tea.indexOf(t) + 1;
			sb.append("<tr id='tbody'>");
			sb.append("<td>" + i + "</td>");
			sb.append("<td>" + t.getTea_code() + "</td>");
			sb.append("<td>" + t.getTrue_name() + "</td>");
			sb.append("<td>" + t.getSex() + "</td>");
			sb.append("<td>" + t.getPhone() + "</td>");
			sb.append("<td>"
					+ DictionaryService.findOrg(t.getDept_id()).getOrg_name()
					+ "</td>");
			sb.append("<td>" + t.getDuties() + "</td>");
			if (t.getState().equalsIgnoreCase("1")) {
				sb.append("	<td>" + "有效" + "</td>");
			} else if (t.getState().equalsIgnoreCase("2")) {
				sb.append("	<td>" + "无效" + "</td>");
			} else {
				sb.append("	<td>" + "待审核" + "</td>");
			}
			sb.append("<td><input id='"
					+ t.getId()
					+ "' type='button' onclick='doEdit(id)' value='修改'/><button>删除</button></td>");
		}

		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 修改校级领导 by 师杰 20160321
	 */
	@RequestMapping("sysadmin/schoolLeadersEdit.do")
	public ModelAndView schoolLeadersEdit(HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		String teaId = request.getParameter("teaId");
		Teacher tea = (Teacher) teacherService.selectByID(teaId);
		List<Org> org = orgService.selectSchoolOrg();// 获取所有校级部门
		String se = tea.getSex();

		map.put("collegeList", org);
		map.put("tea", tea);
		map.put("teaId", teaId);
		map.put("se", se);
		return new ModelAndView("sysadmin/schoolLeadersEdit", map);
	}

	/**
	 * 保存修改后校级领导信息 by 师杰 20160321
	 * 
	 * @throws UnsupportedEncodingException
	 */

	@RequestMapping("sysadmin/doSchoolLeadersEdit.do")
	public String doSchoolLeadersEdit(HttpSession session,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String teaId = request.getParameter("teaId");
		String tea_code = request.getParameter("tea_code");
		String tea_name1 = request.getParameter("tea_name");
		String tea_name = new String(tea_name1.getBytes("ISO-8859-1"), "UTF-8");
		String sex1 = request.getParameter("sex");
		String sex = new String(sex1.getBytes("ISO-8859-1"), "UTF-8");
		String phone = request.getParameter("phone");
		String dept_id = request.getParameter("dept_id");
		String duties1 = request.getParameter("duties");
		String duties = new String(duties1.getBytes("ISO-8859-1"), "UTF-8");

		Teacher tea = (Teacher) teacherService.selectByID(teaId);
		String s = tea.getSex();
		tea.setTea_code(tea_code);
		tea.setTrue_name(tea_name);
		tea.setSex(sex);
		tea.setPhone(phone);
		tea.setDept_id(dept_id);
		tea.setDuties(duties);
		teacherService.update(tea);

		return "redirect:schoolLeadersList.do";
	}

	/**
	 * 初始化学院角色及角色菜单.
	 * 
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	/*
	 * @RequestMapping("sysadmin/initCollegeRole.do") public ModelAndView
	 * initCollegeRole(HttpSession session){ Map<String, Object> map = new
	 * HashMap<String, Object>(); Org o = new Org(); o.setOrg_level("2");
	 * List<Org> orgList = orgService.selectList(o); map.put("orgList",
	 * orgList); return new ModelAndView("sysadmin/initCollegeRole", map); }
	 */

	/**
	 * 初始化学院角色及角色菜单.
	 * 
	 * @author 吴敬国
	 * @createDate 2016-1-5
	 * @since 1.0
	 */
	/*
	 * @RequestMapping("sysadmin/doinitCollegeRole.do") public String
	 * initCollegeRoleSave(HttpSession session,HttpServletRequest request){
	 * String college_id = request.getParameter("college_id");
	 * roleService.saveBasicRoleByCollegeId(college_id); return
	 * "redirect:index.do"; }
	 */

	/**
	 * 功能：系统管理员——参数管理by丁乐晓2016o115
	 * 
	 * @param
	 * @return 列表页面
	 */
	@RequestMapping("sysadmin/paramList.do")
	public ModelAndView paramList(HttpServletRequest request,
			HttpServletResponse response, String xi_id, HttpSession session,
			String type) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String student_grade = (String) session.getAttribute("student_grade");
		String student_dept_id = (String) session
				.getAttribute("student_dept_id");

		// 动态获取学年范围
		List<String> grade = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
		int find_year = calendar.get(Calendar.YEAR);
		for (int i = 2011; i <= find_year; i++) {
			String b = i + "-" + (i + 1);
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
		return new ModelAndView("sysadmin/paramList", map);
	}

	/**
	 * 功能：管理员——参数管理 查询出学院所对应的系部名称信息By丁乐晓20160115
	 * 
	 * @param org
	 * @return 列表页面
	 */
	@RequestMapping("sysadmin/xibuList.do")
	public ModelAndView paramList(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, String Org_Name)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		response.setCharacterEncoding("utf-8");
		List<Org> xibuList = this.orgService.getAllDeptByParentId(Org_Name);// 查询出该学院对应的系部
		StringBuffer xb = new StringBuffer();
		xb.append("<option " + "请选择系部" + "</option>");
		for (Org x : xibuList) {
			xb.append("<option " + "value=" + x.getId() + ">" + x.getOrg_name()
					+ "</option>");
		}
		response.getWriter().println(xb.toString());
		return null;
	}

	/**
	 * 功能：管理员——参数管理 查询出不同学年不同学院的参数信息By丁乐晓20160115
	 * 
	 * @param org
	 * @return 列表页面
	 */
	@RequestMapping("sysadmin/findList.do")
	public String findList(HttpServletRequest request,
			HttpServletResponse response, String year, HttpSession session,
			String type, String org_id, String xibu) throws IOException {
		response.setCharacterEncoding("utf-8");
		String years = year.substring(0, 4);
		Param p = new Param();
		p.setYear(years);
		if (xibu != "") {
			p.setDept_id(xibu);
		} else {
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
			String tearm = "第一学期";
			if (l.getTerm().equals("2")) {
				tearm = "第二学期";
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
	}

	/**
	 * 功能：管理员——参数管理 删除参数By丁乐晓20160115
	 * 
	 * @param
	 * @return 列表页面
	 */
	@RequestMapping("sysadmin/deleteParam.do")
	public String deleteParam(HttpServletRequest request,
			HttpServletResponse response, String delete_id) throws IOException {

		/*
		 * 功能不全面，删除一条数据之后页面发生了跳转，代码需要优化 Param delete=(Param)
		 * paramService.selectByID(delete_id); String year=delete.getYear();
		 * String org_id=delete.getDept_id(); String xibu=delete.getDept_id();
		 */
		paramService.delete(delete_id);
		return "redirect:paramList.do";
		/* return "redirect:findList.do?year="+year+"&org_id="+org_id; */
	}

	/**
	 * 功能：管理员——添加管理 添加参数--学院信息By丁乐晓20160115
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping("sysadmin/paramAdd.do")
	public ModelAndView paramAdd(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 动态获取学年
		Calendar calendar = Calendar.getInstance();
		int add_year = calendar.get(Calendar.YEAR);
		ArrayList add_years = new ArrayList();
		for (int i = 2011; i <= add_year; i++) {
			add_years.add(i);
		}
		List<Org> collegeList = orgService.getAllColleges();
		map.put("add_years", add_years);
		map.put("collegeList", collegeList);
		return new ModelAndView("sysadmin/paramAdd", map);
	}

	/**
	 * 功能：管理员——添加管理 添加参数By丁乐晓20160309
	 * 
	 * @param
	 * @return 列表页面
	 */
	@RequestMapping("sysadmin/doAddParam.do")
	public String doAddParam(HttpServletRequest Request,
			HttpServletResponse response) throws IOException {
		Param pr = new Param();
		String xi_id = Request.getParameter("xi_id");
		String collegeList_name = Request.getParameter("collegeList_name");
		if (collegeList_name.equals("请选择学院")) {
			JOptionPane.showMessageDialog(null, "请选择部门");
		} else {
			if (xi_id != "" && !xi_id.equals("请选择系部")) {
				pr.setDept_id(xi_id);
			} else {
				String collegeList_id = Request
						.getParameter("collegeList_name");
				pr.setDept_id(collegeList_id);
			}
		}
		// 获取参数值
		String param_name = Request.getParameter("param_name");
		String param_value = Request.getParameter("param_value");
		String state = Request.getParameter("state");
		String param_code = Request.getParameter("param_code");
		String year = Request.getParameter("year");
		String tearm = Request.getParameter("tearm");
		// 将参数保存到pr中
		pr.setTerm(tearm);
		pr.setTask_id(null);
		pr.setYear(year);
		pr.setParam_name(param_name);
		pr.setParam_value(param_value);
		pr.setState(state);
		pr.setParam_code(param_code);
		pr.setId(Common.returnUUID());
		// 添加到数据库
		paramService.insert(pr);
		return "redirect:paramList.do";
	}

	/**
	 * 功能：管理员——参数管理 修改参数--显示原始数据By丁乐晓20160309
	 * 
	 * @param
	 * @return 列表页面
	 */
	@RequestMapping("sysadmin/paramEdit.do")
	public ModelAndView paramEdit(HttpServletRequest request,
			HttpServletResponse response, String param_id) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Param edit = (Param) paramService.selectByID(param_id);
		// 获取需要修改的数据
		String edit_code = edit.getParam_code();
		String edit_name = edit.getParam_name();
		String edit_value = edit.getParam_value();
		String id = edit.getId();

		map.put("id", id);
		map.put("edit_code", edit_code);
		map.put("edit_name", edit_name);
		map.put("edit_value", edit_value);
		return new ModelAndView("sysadmin/paramEdit", map);

	}

	/**
	 * 功能：管理员——参数管理 修改参数By丁乐晓20160310
	 * 
	 * @param
	 * @return 列表页面
	 */
	@RequestMapping("sysadmin/doEdit.do")
	public String doEdit(HttpServletRequest request,
			HttpServletResponse response, String id) throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();

		Param ed = new Param();
		ed = (Param) paramService.selectByID(id);
		String edit_name = request.getParameter("edit_name");
		String edit_value = request.getParameter("edit_value");
		String edit_code = request.getParameter("edit_code");
		// 保存修改的数据
		ed.setParam_code(edit_code);
		ed.setParam_name(edit_name);
		ed.setParam_value(edit_value);

		paramService.update(ed);

		return "redirect:paramList.do";

	}

	/**
	 * 功能：设置二级学院是否需交工作总结 周睿20160415
	 * */

	@RequestMapping("sysadmin/setWorkload.do")
	public ModelAndView setWorkload(HttpServletRequest request,
			HttpSession session) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Org> orgs = orgService.getAllColleges();
		List<Org> orgList = new ArrayList<Org>();
		for (Org o : orgs) {
			Param p1 = new Param();
			p1.setParam_name("教师总结");
			p1.setDept_id(o.getOrg_code());
			Param param = new Param();
			param = paramService.selectParambyIdAndParam_name(p1);// 取出学院是否有总结参数
			if (param != null) {
				o.setHead_tea_id(param.getParam_code());
			}
			orgList.add(o);
		}
		map.put("orgList", orgList);
		return new ModelAndView("sysadmin/setWorkload", map);
	}

	/**
	 * 功能：管理员设置参数 周睿20160415
	 * */
	@RequestMapping("sysadmin/doSetWorkload.do")
	public String doSetWorkload(HttpServletRequest request, HttpSession session)
			throws IOException {
		String orgId = request.getParameter("org_code");
		Param p1 = new Param();
		p1.setParam_name("教师总结");
		p1.setDept_id(orgId);
		Param param = new Param();
		param = paramService.selectParambyIdAndParam_name(p1);// 取出学院是否有总结参数
		if (param != null) {
			if (param.getParam_code().equals("true")) {
				param.setParam_code("false");
				paramService.update(param);
			} else {
				param.setParam_code("true");
				paramService.update(param);
			}
		} else {// 若无设置总结参数设置总结参数
			Param newParam = new Param();
			String id = Common.returnUUID();
			newParam.setId(id);
			newParam.setDept_id(orgId);
			newParam.setParam_name("教师总结");
			newParam.setParam_code("false");
			newParam.setParam_value("01");
			newParam.setState("1");
			newParam.setYear("0000");
			newParam.setTerm("长期有效");
			paramService.insert(newParam);

		}
		return "redirect:setWorkload.do";

	}

	/**
	 * 功能：管理员通过学院id查看教师信息   周睿20160415
	 * */
	@RequestMapping("sysadmin/ajaxSearchTeacher.do")
	public String ajaxSearchTeacher(HttpServletRequest request,
			HttpSession session, HttpServletResponse response)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		String college_id = request.getParameter("college_id");
		List<Teacher> teas=teacherService.selectListByXuId(college_id);
		StringBuffer sb = new StringBuffer();
		sb.append("<tr id='biaotou'><th width='150' align='center'>教工号</th>");
		sb.append("<th width='150' align='center'>姓名</th><th width='150' align='center'>性别</th>");
		sb.append("<th width='150' align='center'>电话</th>");
		sb.append("<th width='150' align='center'>部门名称</th><th width='100' align='center'>重置密码</th>");
		sb.append("<th width='50' align='center'>修改</th><th width='50' align='center'>操作</th></tr>");
		if(teas.size()==0){
			sb.append("");
		}
		else{
			for(Teacher t:teas){
				sb.append("<tr><td align='center'>"+t.getTea_code()+"</td>");
				sb.append("<td align='center'>"+t.getTrue_name()+"</td>");
				sb.append("<td align='center'>"+t.getSex()+"</td>");
				String phone=new String();
				if(t.getPhone()!=null){
					phone=t.getPhone();
				}
				else{
					phone="";
				}
				sb.append("<td align='center'>"+phone+"</td>");
				sb.append("<td align='center'>"+orgService.selectByID(t.getDept_id()).getOrg_name()+"</td>");
				sb.append("<td align='center'><input type='button' value='重置密码' onclick=rePass('"
						+ t.getId() + "');></td>");
				sb.append("	<td align='center'><input type='button' value='修改' onclick=doEdit('"
						+ t.getId() + "');></td>");
				sb.append("<td align='center'> <input type='button' value='删除' onclick=doDel('"
						+ t.getId() + "');></td>");
				sb.append("</tr>");	
			}
		}
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}
	/**
	 * 功能：教师管理-删除教师 周睿20160521
	 * */
	@RequestMapping("sysadmin/deleteTeacher.do")
	public String teacherDelete(String id) {
		Teacher tea = DictionaryService.findTeacher(id);
		tea.setState("0");
		teacherService.delete(tea);
		return "redirect:teacherList.do";
	}
	/**
	 * 功能：教师管理-验证添加的教师编号是否与数据库重复 
	 * 周睿
	 * 20160524
	 * */
	@RequestMapping("sysadmin/checkTeaCode.do")
	public String teaCodecheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String tea_code = request.getParameter("tea_code");
		int b;
		String infor = "";
		b = this.teacherService.selectByTeaCode(tea_code);
		if (b != 0) {
			infor = "此编号已用";
		}
		try {
			response.getWriter().println(infor);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 功能：教师管理-添加教师
	 * 周睿
	 * 20160524
	 * */
	@RequestMapping("sysadmin/doAddTeacher.do")
	public String teacherSave(HttpServletRequest request) throws IOException {
		String tea_id = Common.returnUUID16();
		/*
		 * UserRole ur = new UserRole(); ur.setRole_id("ROLE_TEACHER");
		 * ur.setState("1"); ur.setUser_id(tea_id);
		 * this.userRoleService.insert(ur);// 添加教师角色
		 */userRoleService.saveBasicUserRole(tea_id, null, "ROLE_TEACHER", null, null, null);
		String tea_code = request.getParameter("tea_code");
		String true_name = request.getParameter("true_name");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String dept_id = request.getParameter("dept_id");
		String duties = request.getParameter("duties");
		String expertise = request.getParameter("expertise");
		String state = request.getParameter("state");
		Teacher teacher = new Teacher();
		teacher.setLogin_name(tea_code.trim());
		teacher.setLogin_pass(tea_code.trim());
		teacher.setTea_code(tea_code.trim());
		teacher.setTrue_name(true_name.trim());
		teacher.setSex(sex.trim());
		teacher.setPhone(phone.trim());
		teacher.setDept_id(dept_id.trim());
		teacher.setDuties(duties);
		teacher.setExpertise(expertise);
		teacher.setState(state);
		teacher.setId(tea_id.trim());
		teacherService.insert(teacher);
		return "redirect:teacherList.do"; // 添加成功后重定向到列表页面
	}

	/**
	 * 功能：教师管理-修改教师信息 周睿20160526
	 * */
	@RequestMapping("sysadmin/editTeacher.do")
	public ModelAndView teacherEdit(String id, HttpSession session) {
		Teacher teacher = (Teacher) teacherService.selectByID(id);
		Teacher tea = (Teacher) session.getAttribute("current_user");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Org> o = orgService.getAllOrg3();
		List<String> state = new ArrayList<String>();
		state.add(0, "无效");
		state.add(1, "有效");
		if (teacher.getState().equals("1")) {
			state.remove(1);
			state.add(0, "有效");
		}
		List<String> sex = new ArrayList<String>();
		sex.add(0, "男");
		sex.add(1, "女");
		if (teacher.getSex().equals("女")) {
			sex.remove(1);
			sex.add(0, "女");
		}
		String duties = teacher.getDuties();
		map.put("teacher", teacher);
		map.put("orgs", o);
		map.put("state", state);
		map.put("sex", sex);
		map.put("duties", duties);
		return new ModelAndView("sysadmin/teacherEdit", map);
	}
	
	/**
	 * 功能：管理员根据姓名或教工号搜索教师 周睿 20160526
	 * 
	 * */
	@RequestMapping("sysadmin/ajaxGetPerson.do")
	public String ajaxSearch(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		name = new String(name.getBytes("iso-8859-1"), "utf-8");
		List<Teacher>teas=teacherService.sysAdminGetTeachersByNameOrCode(name);
		
		StringBuffer sb = new StringBuffer();
		sb.append("<tr id='biaotou'><th width='150' align='center'>教工号</th>");
		sb.append("<th width='150' align='center'>姓名</th><th width='150' align='center'>性别</th>");
		sb.append("<th width='150' align='center'>电话</th>");
		sb.append("<th width='150' align='center'>部门名称</th><th width='100' align='center'>重置密码</th>");
		sb.append("<th width='50' align='center'>修改</th><th width='50' align='center'>操作</th></tr>");
		if(teas.size()==0){
			sb.append("");
		}
		else{
			for(Teacher t:teas){
				sb.append("<tr><td align='center'>"+t.getTea_code()+"</td>");
				sb.append("<td align='center'>"+t.getTrue_name()+"</td>");
				sb.append("<td align='center'>"+t.getSex()+"</td>");
				String phone=new String();
				if(t.getPhone()!=null){
					phone=t.getPhone();
				}
				else{
					phone="";
				}
				sb.append("<td align='center'>"+phone+"</td>");
				String org_name="";;
				try {
					org_name=orgService.selectByID(t.getDept_id()).getOrg_name();
				} catch (Exception e) {
					// TODO: handle exception
				}
				sb.append("<td align='center'>"+org_name+"</td>");
				sb.append("<td align='center'><input type='button' value='重置密码' onclick=rePass('"
						+ t.getId() + "');></td>");
				sb.append("	<td align='center'><input type='button' value='修改' onclick=doEdit('"
						+ t.getId() + "');></td>");
				sb.append("<td align='center'> <input type='button' value='删除' onclick=doDel('"
						+ t.getId() + "');></td>");
				sb.append("</tr>");	
			}
		}
			try {
				response.getWriter().println(sb.toString());
			} catch (IOException e) {

				e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 职务管理列表.
	 * 
	 * @author 
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/dutiesList.do")
	public ModelAndView dutiesList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Duties duties=new Duties();
		List<Duties> dutiesList=dutiesService.selectList(duties);
		map.put("dutiesList", dutiesList);
		return new ModelAndView("sysadmin/dutiesList", map);
	}
	/**
	 * 添加职务.
	 * 
	 * @author 
	 * @createDate 
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/addDuties.do")
	public String addDuties(HttpSession session) {
		return "sysadmin/dutiesAdd";
	}
	
	/**
	 * 添加职务.
	 * 
	 * @author 
	 * @createDate 2015-12-21
	 * @since 1.0
	 */
	@RequestMapping("sysadmin/doAddDuties.do")
	public String doAddDuties(HttpSession session,HttpServletRequest request) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String duties_desc = request.getParameter("desc");
		String type = request.getParameter("type");
		Duties duties=new Duties();
		duties.setId(id);
		duties.setName(name);
		duties.setState(Constants.STATE_USERD);
		duties.setDuties_desc(duties_desc);
		duties.setType(type);
		duties.setCreator(Common.getOneTeaId(session));
		duties.setCreate_time(DateService.getNowTimeTimestamp());
		dutiesService.insert(duties);
		return "redirect:dutiesList.do";
	}
	/**
	 * 功能：学生管理-查询+显示联机链表 张文琪
	 * 
	 */
	@RequestMapping("sysadmin/studentImportList.do")
	public ModelAndView studentList(HttpSession session, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		String student_grade = (String) session.getAttribute("student_grade");
		String student_dept_id = (String) session
				.getAttribute("student_dept_id");
		String student_class_id = (String) session
				.getAttribute("student_class_id");
		String xueyuan_id = (String) session.getAttribute("xueyuan_grade");
		List<Org> o_class = this.orgService.getAllClassByGradeAndDeptId(
				student_dept_id, student_grade);
		// 通过系部查出班级

		if (type != null) {
			session.setAttribute("student_grade", null);
			session.setAttribute("student_dept_id", null);
			session.setAttribute("student_class_id", null);
			student_grade = null;
			student_dept_id = null;
			student_class_id = null;
			xueyuan_id = null;
		}
		List<String> Grade = this.orgService.getYears();
		// 查出所有年级
		List<Org> o = this.orgService.getAllColleges();
		// 查出所有学院
		List<Org> o_xibu = this.orgService.getAllDeptByCollegeId(xueyuan_id);
		// 通过学院id查出班级
		map.put("o", o);
		map.put("o_class", o_class);
		map.put("o_xibu", o_xibu);
		map.put("grade", Grade);
		map.put("student_grade", student_grade);
		map.put("student_dept_id", student_dept_id);
		map.put("student_class_id", student_class_id);
		return new ModelAndView("sysadmin/studentImportList", map);

	}

	/**
	 * 功能：查出系部所对应的班级信息 by:张文琪 20150525
	 * 
	 * */
	@RequestMapping("sysadmin/gradeList.do")
	public String gradeList(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("utf-8");
		String xueyuan_grade = request.getParameter("tiaojian");
		session.setAttribute("xueyuan_grade", xueyuan_grade);
		List<Org> o = this.orgService.getAllDeptByCollegeId(xueyuan_grade);// 通过系部查出班级
		StringBuffer sb = new StringBuffer();
		sb.append("<select id='xibu' name='xibu' style='width:150px' onChange='changeSai()'>");
		sb.append("<option>请选择系部 </option>");
		if (o.size() != 0) {

			for (Org c : o) {
				sb.append("<option " + "value=" + c.getId() + ">"
						+ c.getOrg_name() + "</option>");
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
	 * 功能：查出系部所对应的班级信息 by:张文琪 20150525
	 * 
	 * */
	@RequestMapping("sysadmin/classList.do")
	public String classList(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		response.setCharacterEncoding("utf-8");
		String tj = request.getParameter("tiaojian");
		int a = tj.indexOf(",");
		String student_grade = tj.substring(0, a);
		String student_dept_id = tj.substring(a + 1, tj.length());
		session.setAttribute("student_grade", student_grade);
		session.setAttribute("student_dept_id", student_dept_id);
		String student_class_id = (String) session
				.getAttribute("student_class_id");
		boolean b = false;
		Org org = new Org();
		if (DictionaryService.findOrg(student_class_id) != null) {
			b = student_class_id.equals(DictionaryService.findOrg(
					student_class_id).getId());
		}
		List<Org> o = this.orgService.getAllClassByGradeAndDeptId(
				student_dept_id, student_grade);// 通过系部查出班级
		StringBuffer sb = new StringBuffer();
		sb.append("<select id='classId' name='classId' style='width:150px' onChange='changeSai()'>");
		if (b == false || o.size() == 0) {
			sb.append("<option>请选择班级 </option>");
			for (Org c : o) {
				sb.append("<option " + "value=" + c.getId() + ">"
						+ c.getOrg_name() + "</option>");
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
				sb.append("<option " + "value=" + c.getId() + ">"
						+ c.getOrg_name() + "</option>");
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
	 * 功能：根据班级编号查出给班级的学生ajax 张文琪 2016-5-26
	 * */

	@RequestMapping("sysadmin/studentList.do")
	public String studentListAjax(HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String student_class_id = request.getParameter("ClassId");
		session.setAttribute("student_class_id", student_class_id);
		List<Student> s = this.studentService
				.getStudentsByClassId(student_class_id);
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='1' width='1300'>");
		// 来这里
		sb.append("<tr> <th width='60'>序号</th><th width='150'>学号</th> <th width='100'>姓名</th><th width='60'>性别</th><th width='100'>身份证号</th><th width='150'>手机号</th><th width='170'>班级名称</th><th width='100'>家庭电话</th><th width='300'>籍贯</th><th width='300'>空间主页</th><th width='50' align='center'>状态</th><th width='160' colspan='2'>操作</th></tr>");
		for (int i = 0; i < s.size(); i++) {
			String stateName = "有效";
			if (s.get(i).getState().equals("0"))
				stateName = "无效";
			sb.append("<tr><td align='center'>"
					+ (i + 1)
					+ "</td>"
					+ "<td align='center'>"
					+ s.get(i).getStu_code()
					+ "</td>"
					+ "<td align='center'>"
					+ "<a href='editStudent.do?id="
					+ s.get(i).getId()
					+ "'>"
					+ s.get(i).getTrue_name()
					+ "</a>"
					+ "</td>"
					+ "<td align='center'>"
					+ s.get(i).getSex()
					+ "</td>"
					+ "<td align='center'>"
					+ s.get(i).getId_card()
					+ "</td>"
					+ "<td align='center'>"
					+ s.get(i).getPhone()
					+ "</td>"
					+ "<td align='center'>"
					+ DictionaryService.findOrg(s.get(i).getClass_id())
							.getOrg_name() + "</td>" + "<td align='center'>"
					+ s.get(i).getHome_phone() + "</td>"
					+ "<td align='center'>" + s.get(i).getBirthplace()
					+ "</td>" + "<td align='center'>" + s.get(i).getHomepage()
					+ "</td>" + "<td align='center'>" + stateName + "</td>"
					+ "<td align='center' width='80'>"
					+ "<a href='deleteStudentImport.do?id=" + s.get(i).getId()
					+ "' >" + " 删 除 " + "</a>" + "</td>"
					+ "<td align='center' width='80'>"
					+ "<a href='resetPassword_stu.do?id=" + s.get(i).getId()
					+ "'>" + " 重置 " + "</a>" + "</td>" + "</tr>");
		}
		sb.append("</table>");
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 功能：根据字段模糊查询 张文琪 2016-5-26
	 * */
	@RequestMapping("sysadmin/searchPerson.do")
	public String searchPerson(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		String college_id = (String) session.getAttribute("xueyuan_grade");// 得到负责的学院
		List<Student> stus = new ArrayList();
		System.out.println("keyword==" + keyword + ",college" + college_id);
		stus = studentService.getStudentByNameOrCode(keyword, college_id);
		StringBuffer sb = new StringBuffer();
		int row = 1;
		// 回这里
		sb.append("<table border='1' width='1300'>");
		sb.append("<tr> <th width='60'>序号</th><th width='150'>学号</th> <th width='100'>姓名</th><th width='60'>性别</th><th width='100'>身份证号</th><th width='150'>手机号</th><th width='170'>班级名称</th><th width='100'>家庭电话</th><th width='300'>籍贯</th><th width='300'>空间主页</th><th width='50' align='center'>状态</th><th width='160' colspan='2'>操作</th> </tr>");
		if (stus.size() < 20) {
			for (Student s : stus) {
				String stateName = "有效";
				if (s.getState().equals("0"))
					stateName = "无效";
				sb.append("<tr><td align='center'>"
						+ (row++)
						+ "</td>"
						+ "<td align='center'>"
						+ s.getStu_code()
						+ "</td>"
						+ "<td align='center'>"
						+ s.getTrue_name()
						+ "</td>"
						+ "<td align='center'>"
						+ s.getSex()
						+ "</td>"
						+ "<td align='center'>"
						+ s.getId_card()
						+ "</td>"
						+ "<td align='center'>"
						+ s.getPhone()
						+ "</td>"
						+ "<td align='center'>"
						+ DictionaryService.findOrg(s.getClass_id())
								.getOrg_name() + "</td>"
						+ "<td align='center'>" + s.getHome_phone() + "</td>"
						+ "<td align='center'>" + s.getBirthplace() + "</td>"
						+ "<td align='center'>" + s.getHomepage() + "</td>"
						+ "<td align='center'>" + stateName + "</td>"
						+ "<td align='center' width='80'>"
						+ "<a href='deleteStudentImport.do?id=" + s.getId()
						+ "'>" + " 删 除 " + "</a>" + "</td>"
						+ "<td align='center' width='80'>"
						+ "<a href='resetPassword_stu.do?id=" + s.getId()
						+ "'>" + " 重置 " + "</a>" + "</td>" + "</tr>");

				sb.append("</table>");
			}
		} else {
			sb.append("<div  style='color:red'>信息超过20条，请输入详细信息</div>");
		}
		try {
			response.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 功能：学生管理-导入学生 张文琪
	 * 
	 * */
	@RequestMapping("sysadmin/studentImport.do")
	public ModelAndView studentImport(String class_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("class_id", class_id);
		return new ModelAndView("sysadmin/studentImport", map);
	}

	/**
	 * 功能：提交导入 指导教师分配表/学生表/教师表 /企业表 解析表格 张文琪
	 */
	@RequestMapping(value = "sysadmin/doGuidenceTeacherImport.do", method = RequestMethod.POST)
	public String teacherImport(MultipartHttpServletRequest request,
			ModelMap modelMap, HttpSession se) throws Exception {
		// 获取学院id为了验证部门编号和班级编号
		// 获取学院id为了验证部门编号和班级编号
		Teacher tea = (Teacher) se.getAttribute("current_user");
		String college_id = se.getAttribute("xueyuan_grade").toString();
		// 导入类型
		String type = Common.NulltoBlank(request.getParameter("type"));
		System.out.println("type=" + type);
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multiRequest = request;
			Iterator iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());

				if (file != null) {
					String file_type = "";
					if (type.equals("excelStudent")) {
						file_type = "excelStudent";
					}

					String project_path = request.getSession()
							.getServletContext().getRealPath("/");
					String fileName = file.getOriginalFilename();
					/*
					 * String filePosition = "WEB-INF/uploadedfiles/Import/" +
					 * fileName;
					 */
					String filepos = "Import" + "/" + file_type + "_";
					String filePosition = "Import" + "/" + file_type + "_"
							+ fileName;
					String real_path = Constants.FILE_ROUTE;
					String file_path = project_path + real_path + filePosition;
					/*
					 * String file_pa = real_path +
					 * "WEB-INF/uploadedfiles/Import/";
					 */
					String file_pa = project_path + real_path + filepos;
					// float filesize = file.getSize();//
					// 使用getSize()方法获得文件长度，以此决定允许上传的文件大小。
					file.transferTo(new File(file_path));// 使用transferTo（dest）方法将上传文件写到服务器上指定的文件
					// 文件的属性
					/*
					 * String file_id = Common.returnUUID(); Files fil = new
					 * Files(); fil.setFile_size(filesize); Timestamp d = new
					 * Timestamp(System.currentTimeMillis());
					 * fil.setUpload_time(d); fil.setId(file_id);
					 * fil.setFile_type(file_type); fil.setFile_name(fileName);
					 * fil.setPosition(filePosition); filesService.insert(fil);
					 */
					File f = new File(file_pa + fileName);
					// 判断导入数据表类型
					if (type.equals("excelStudent")) {
						HttpSession session = request.getSession();
						String class_id = request.getParameter("class_id");
						System.out.println("class_id" + class_id);
						session.setAttribute("class_id", class_id);
						List<Student> s = null;
						if (f.getName().split("[.]")[1].equals("xlsx")) {
							s = ExcelService.readXlsx(f);
						} else {
							s = ExcelService.AnalysisStudent(f);
						}

						System.out.println("s==" + s.toString());
						for (Student sts : s) {
							sts.setClass_id(class_id);
						}
						session.setAttribute("students", s);
						// 对学生表的数据验证编号是否重复
						List<String> codeList = new ArrayList();// 声明集合，存储学生编号，为了验证表格中的学生编号是否重复。
						List<String> idcardList = new ArrayList();// 声明集合，存储学生身份证号，为了验证表格中的学生身份证号是否重复。
						List<String> classidList = new ArrayList();// 声明集合，存储表格中班级编号，为得到每个班级的人数。
						String infor = "";// 声明变量，存储表格中未按要求的信息存储。
						String information = "";// 声明information，得到各班级个数。
						/*
						 * String email=
						 * "\\p{Alpha}\\w{2,15}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}"
						 * ;可以以后验证邮箱 if (email.matches(format)){return true;//
						 * 邮箱名合法，返回true }else{ return false;// 邮箱名不合法，返回fals }}
						 */int b;
						int c;
						// int d;
						// int cc;
						// 表格的数据验证
						for (Student student : s) {
							String stuCode = student.getStu_code();
							String id_card = student.getId_card();
							// 验证学号 12位的数字
							Pattern p_stu_code = Pattern.compile("[0-9]{12}");
							Matcher m_stu_code = p_stu_code.matcher(student
									.getStu_code());
							// 验证邮箱
							Pattern p_stu_email = Pattern
									.compile("([0-9]|[a-z]|[A-Z]){1,}@([0-9]|[a-z]|[A-Z]){1,}.com");
							Matcher m_stu_email = p_stu_email.matcher(student
									.getEmail());
							b = this.studentService.selectByStuCode(stuCode);
							c = this.studentService.selectByStuCard(id_card);
							if (!m_stu_code.matches()) {
								infor = infor + "学号出错,";
							} else if (b != 0) {
								infor = "学号在数据库有重复,";
							} else if (student.getStu_code().substring(0, 4)
									.equals(student.getEntry_year())) {
							} else {
								infor = infor + "入学年份和学号不对应,";
							}
							;

							if (!m_stu_email.matches()) {
								infor = infor + "邮箱出错,";
							}
							if (student.getTrue_name() == null) {
								infor = infor + "姓名不能为空";
							}
							if (student.getSex() == null) {
								infor = infor + "性别不能为空,";
							} else if (student.getSex().equals("男")
									|| student.getSex().equals("女")) {

							} else {
								infor = infor + "亲，人只有男女之分奥！,";
							}
							;
							if (student.getId_card() == null) {
								infor = infor + "身份证号不能为空,";
							} else if (student.getId_card().length() != 18) {
								infor = infor + "身份证号应为18位,";
							} else if (student
									.getId_card()
									.substring(
											student.getId_card().length() - 3,
											student.getId_card().length())
									.equals("000")) {
								infor = infor + "此身份证号有误,最后三位不能同时为'0'";
							} else if (c != 0) {
								infor = infor + "身份证号在数据库有重复,";
							}
							;
							if (student.getPhone() == null) {// boolean isNum =
																// str.matches("[0-9]+");
								infor = infor + "手机号不能为空,";
							} else if (student.getPhone().length() == 11
									&& student.getPhone().matches("[0-9]+")) {

							} else {
								infor = infor + "手机号只能为数字（长度为11位）！,";
							}
							if (codeList.size() != 0) {
								infor = infor
										+ isCodeExist(student.getStu_code(),
												codeList, "学生编号");
							}
							;
							if (idcardList.size() != 0) {
								infor = infor
										+ isCodeExist(student.getId_card(),
												idcardList, "学生身份证编号");
							}
							;
							if (infor.trim().equals("")) {
								infor = "无";
							}
							student.setTemp1(infor.trim());
							infor = "";
							classidList.add(class_id);
							if (student.getStu_code() != null) {
								codeList.add(student.getStu_code());
							}
							;
							if (student.getId_card() != null) {
								idcardList.add(student.getId_card());
							}
							;
							// 判断学生编号是否在excel中重复
							String[] co = new String[codeList.size()];
							for (int a = 0; a < codeList.size(); a++) {
								co[a] = codeList.get(a);
							}
							// 判断身份证号是否在excel中重复
							String[] ic = new String[idcardList.size()];
							for (int e = 0; e < idcardList.size(); e++) {
								ic[e] = idcardList.get(e);
							}

						}
						// 声明数组，存储班级id
						String[] ci = new String[classidList.size()];
						for (int g = 0; g < classidList.size(); g++) {
							ci[g] = classidList.get(g);
						}
						information = countArrary(ci);
						modelMap.put("information", information);
						modelMap.put("ss", s);
						modelMap.put("type", type);
						modelMap.put("fileName", fileName);
					}
				}
			}
		}
		if (type.equals("excelStudent")) {
			ret = "sysadmin/studentImport";
		}
		System.out.println("ret==" + ret);
		return ret;
	}

	/*
	 * 功能：检验编号是否在表格中是否重复 by张文琪 2016/5/26
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
	 * 功能：得到excel表格中每个班级的人数信息 by张文琪20160526
	 * 
	 * @param excel中班级id数组
	 */
	public String countArrary(String a[]) {
		String classInformation = "";
		Map<String, Integer> m = new TreeMap<String, Integer>();
		for (int i = 0; i < a.length; i++) {
			Integer c = m.get(a[i]);
			if (c == null) {
				m.put(a[i], new Integer(1));
			} else {
				c = new Integer(c.intValue() + 1);
				m.put(a[i], new Integer(c));
			}
		}
		Set<String> s = m.keySet();
		for (String e : s) {
			Org o = DictionaryService.findOrg(e);
			String name = "错误班级(id:e)";
			if (o != null) {
				classInformation = classInformation + o.getOrg_name()
						+ "， 导入班级人数为：" + m.get(e) + " ";// .getOrg_name()
			} else {
				classInformation = classInformation + name + "， 导入班级人数为："
						+ m.get(e) + " ";
			}
		}
		return classInformation;
	}
	/**
	 * 功能：导入excel表格，保存到数据库 教师、学生、小组成员、企业 王磊，敬国2015-12-29 功能：导入excel表格，保存到数据库 班级
	 * 杨梦肖 2016 3 24
	 */
	@RequestMapping("sysadmin/doSaveTeachers.do")
	public String teachersImportsave(MultipartHttpServletRequest request,
			ModelMap modelMap, String fileName, String type) {
		String project_path = request.getSession().getServletContext()
				.getRealPath("/");
		String real_path = Constants.FILE_ROUTE;
		String filepos = "Import" + "/" + type + "_";
		// 所要保存至数据库的excel的名称
		/*
		 * String file_pa = real_path + "WEB-INF/uploadedfiles/Import/" +
		 * fileName;
		 */
		String file_pa = project_path + real_path + filepos + fileName;
		System.out.println("file_pa==" + file_pa);
		File f = new File(file_pa);
		Teacher t = new Teacher();
		HttpSession session = request.getSession();
		List<Org> or = (List<Org>) session.getAttribute("tc");
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String tea_id = tea.getId();
		List<TrainDetail> td = (List<TrainDetail>) session.getAttribute("td");
		// 表格里的教师集合
		List<Teacher> tc = (List<Teacher>) session.getAttribute("tc");
		List<TeaStu> lists = (List<TeaStu>) session.getAttribute("lists");
		List<Student> s = (List<Student>) session.getAttribute("students");
		List<Company> c = (List<Company>) session.getAttribute("companys");
		List<EvalsIndex> ei = (List<EvalsIndex>) session
				.getAttribute("evalsIndexs");
		List<GroupMembers> gms = (List<GroupMembers>) session
				.getAttribute("groupMembers");
		String groupId = (String) session.getAttribute("groupId");
		String standard_id = (String) session.getAttribute("standard_id");
		String class_id = (String) session.getAttribute("class_id");
		if (type.equals("excelTeacher")) {
			UserRole ur = new UserRole();
			for (Teacher teacher : tc) {
				String teaId;
				teaId = Common.returnUUID16();
				ur.setRole_id("ROLE_TEACHER");
				ur.setUser_id(teaId);
				ur.setState("1");
				userRoleService.insert(ur);// 添加基础教师角色
				if (teacher.getCourse_id() != null) {
					if (teacher.getCourse_id().length() > 0) {
						String code[] = teacher.getCourse_id().split(",");
						String coures_id = "";
						for (int i = 0; i < code.length; i++) {
							coures_id = coures_id
									+ DictionaryService.findCoursesByCode(
											code[i]).getId() + ",";
						}
						teacher.setCourse_id(coures_id);
					}
				}
				teacher.setId(teaId);
				teacher.setState("1");
				teacher.setTemp1(null);
				teacher.setTea_type("1");
				teacher.setLogin_name(teacher.getTea_code());
				teacher.setLogin_pass(teacher.getTea_code());
				teacherService.insert(teacher);
				teacherService.selectList(t);
				modelMap.put("tc", tc);
			}
			ret = "redirect:teacherImportSuccess.do";
		}
		// 杨梦肖
		else if (type.equals("excelDept")) {

			Timestamp ts = new Timestamp(System.currentTimeMillis());
			for (Org org : or) {
				String contacts = org.getContacts();
				String head_code = org.getHead_code();

				String head_id = ((Teacher) teacherService
						.selectByCode(head_code)).getId();
				String cou_code = org.getCounselor_code();
				String cou_id = ((Teacher) teacherService
						.selectByCode(cou_code)).getId();
				String con_code = org.getContacts_code();
				String con_id = ((Teacher) teacherService
						.selectByCode(con_code)).getId();
				if (contacts == null) {
					contacts = "无";
				}

				org.setId(Common.returnUUID());
				org.setHead_tea_id(head_id);
				org.setContacts(con_id);
				org.setCounselor_id(cou_id);
				org.setBegin_time(ts);
				org.setDirector("");
				org.setVice_director("");
				org.setState("1");
				org.setOrg_level("5");// 班级对应的上级组织为5
				orgService.insert(org);
				modelMap.put("tc", or);// 保存到数据库
				// orgService.insert(org);

			}
			ret = "redirect:deptImportSuccess.do";
		} else if (type.equals("excelStudent")) {
			Student ss = new Student();
			String college_id = (String) session.getAttribute("college_id");
			Role role = roleService.getRoleByColegeIdAndRoleTemplateId(
					college_id, "ROLE_STUDENT_SCHOOL");
			for (Student student : s) {
				String stuId = Common.returnUUID();
				/*
				 * ur.setRole_id("ROLE_STUDENT"); ur.setState("1");
				 * ur.setUser_id(stuId); this.userRoleService.insert(ur);//
				 * 添加学生角色
				 */userRoleService.saveBasicUserRole(stuId, null, null,
						"ROLE_STUDENT", null, null);
				userRoleService.saveUserRole(stuId, role.getId());

				student.setId(stuId);
				String year = student.getStu_code().substring(0, 4);
				String Current_notice_read = year + "-09-01 00:00:00";
				Timestamp ts = new Timestamp(System.currentTimeMillis());
				String tsStr = Current_notice_read;
				ts = Timestamp.valueOf(tsStr);
				student.setCurrent_notice_read(ts);
				student.setCurrent_recruit_read(ts);
				student.setGroup_id("无");//
				student.setPractice_state("000");// 初始状态 add by zcg 2015-3-14
				student.setLogin_pass(student.getId_card().substring(
						student.getId_card().length() - 6,
						student.getId_card().length()));
				student.setTemp1(null);
				student.setClass_id(class_id);
				System.out.println("student==" + student.toString());
				studentService.insert(student);
				modelMap.put("s", s);
			}
			studentService.selectList(ss);
			ret = "redirect:studentImportSuccess.do";// 跳到导入学生成功界面

		} else if (type.equals("excelGuidenceTeacher")) {
			TeaStu tst = new TeaStu();
			for (TeaStu teaStu : lists) {
				teaStu.setId(Common.returnUUID());
				teaStu.setState("1");
				teaStuService.insert(teaStu);
				teaStuService.selectList(tst);
				modelMap.put("lists", lists);
			}
			ret = "redirect:guidenceTeacherImportList.do";

		} else if (type.equals("excelTrain")) {
			TrainDetail trd = new TrainDetail();
			for (TrainDetail trainDetail : td) {
				trainDetail.setId(Common.returnUUID());
				trainDetail.setTemp1(null);
				trainDetailService.insert(trainDetail);
				trainDetailService.selectList(trd);
				modelMap.put("td", td);
			}
			ret = "redirect:trainImportSuccess.do";

		} else if (type.equals("excelCompany")) {
			Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时
			DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 设置显示格式
			String nowTime = format.format(dt);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			try {
				time = new Timestamp(format.parse

				(nowTime).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			for (Company company : c) {
				String[] coll_id = company.getApplicable_scope().split(",");
				String dept_id = "";
				for (int i = 0; i < coll_id.length; i++) {
					dept_id = dept_id
							+ DictionaryService.findOrgName(coll_id[i]).getId()
							+ ",";
				}
				company.setApplicable_scope(dept_id);
				company.setCheck_state("1");
				company.setCreate_time(time);
				company.setCheck_man(tea_id);
				company.setCheck_note("管理员添加");
				company.setTemp1(null);
				companyService.insert(company);

			}
			ret = "redirect:companyImportSuccess.do";
		} else if (type.equals("excelEvalsIndex")) {
			Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时
			DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 设置显示格式
			String nowTime = format.format(dt);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			try {
				time = new Timestamp(format.parse

				(nowTime).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			for (EvalsIndex evalsIndex : ei) {
				evalsIndex.setStandard_id(standard_id);
				evalsIndex.setCreate_time(time);
				evalsIndex.setId(Common.returnUUID());
				evalsIndex.setTemp2(null);
				evalsIndex.setTemp1(null);
				evalsIndexService.insert(evalsIndex);
			}
			ret = "redirect:evaluateStandardList.do";
		} else if (type.equals("excelGroupMemberStuId")) {// 导入小组成员
			String group_name = DictionaryService.findGroups(groupId)
					.getGroup_name();
			Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时
			DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 设置显示格式
			String nowTime = format.format(dt);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			try {
				time = new Timestamp(format.parse

				(nowTime).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			UserRole ur = new UserRole();
			String college_id = (String) session.getAttribute("college_id");
			List<Role> roleList = roleService.selectByCollegeId(college_id,
					"ROLE_STUDENT_PRACTICE");
			String role_id = "";
			if (roleList.size() > 0) {
				Role role = roleList.get(0);
				role_id = role.getId();
			}
			for (GroupMembers groupmebers : gms) {
				Student st = DictionaryService.findStudent(groupmebers
						.getUser_id());
				st.setGroup_id(group_name);// 学生表小组id先存名称
				groupmebers.setDuty("学生");
				groupmebers.setState("1");
				groupmebers.setBegin_time(time);
				groupmebers.setGroup_id(groupId);
				groupmebers.setTemp2(null);
				groupmebers.setTemp1(null);
				groupmebers.setId(Common.returnUUID16());
				this.studentService.update(st);
				this.groupMembersService.insert(groupmebers);

				ur.setUser_id(st.getId());
				ur.setRole_id(role_id);
				ur.setTemp1("无");
				userRoleService.insert(ur);// 导入小组成员添加实习学生角色

			}
			ret = "redirect:editGroups.do?id=" + groupId;
		}

		return ret;
	}

	/**
	 * 功能：导入学生成功列表 by 张文琪 2016-5-27
	 * */
	@RequestMapping("sysadmin/studentImportSuccess.do")
	public ModelAndView studentImportSuccess(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Student> studentImportList = (List<Student>) session
				.getAttribute("students");// 导入时存的session
		map.put("studentImportList", studentImportList);
		return new ModelAndView("sysadmin/studentImportSuccess", map);// return
																		// new
	}

	/**
	 * 功能：学生管理-删除学生
	 * */
	@RequestMapping("sysadmin/deleteStudentImport.do")
	public String studentDelete(String id) {
		Student stu = DictionaryService.findStudent(id);
		// stu.setState("1");
		studentService.delete(stu);
		return "redirect:studentImportList.do"; // 删除成功后重定向到列表页面
	}

	/*
	 * 
	 * 功能：修改学生信息 张文琪 2016-5-27
	 */
	@RequestMapping("sysadmin/editStudent.do")
	public ModelAndView studentEdit(String id, HttpSession session) {
		Student stu = studentService.selectByID(id);
		Map<String, Object> map = new HashMap<String, Object>();

		List<String> sex = new ArrayList<String>();
		sex.add(0, "男");
		sex.add(1, "女");
		if (stu.getSex().equals("女")) {
			sex.remove(1);
			sex.add(0, "女");
		}

		String xueyuan_id = (String) session.getAttribute("xueyuan_grade");
		// System.out.println("学生ID=" + id);
		session.setAttribute("xuesheng_id", id);
		// System.out.println("学院ID=" + xueyuan_id);
		List<Role> roles = roleService.selectStuList(xueyuan_id);
		List<UserRole> userRoles = userRoleService.selectNowRoleByStu_Id(id);
		// System.out
		// .println("size()==" + userRoles.size() + "---" + roles.size());
		String class_name = DictionaryService.findOrg(stu.getClass_id())
				.getOrg_name();
		// 判断当前学生有哪些角色
		for (int i = 0; i < roles.size(); i++) {
			for (int j = 0; j < userRoles.size(); j++) {
				if (i == 5) {
					System.out.println("roles_all="
							+ roles.get(i).getRole_code());
					System.out.println("roles_now="
							+ userRoles.get(j).getRole_id());
				}
				if (roles.get(i).getRole_code()
						.equals(userRoles.get(j).getRole_id())) {
					roles.get(i).setIsBeOccupied(true);
					break;
				} else {
					roles.get(i).setIsBeOccupied(false);
				}
			}
		}

		map.put("roles", roles);
		map.put("stu", stu);
		map.put("sex", sex);
		map.put("class_name", class_name);
		return new ModelAndView("sysadmin/studentEdit", map);

	}

	/*
	 * 
	 * 功能：执行修改学生 张文琪 2016-5-27
	 */
	@RequestMapping("sysadmin/doEditStudent.do")
	public String dostudentEdit(HttpServletRequest request, String id) {
		Student student = studentService.selectByID(id);
		String stu_code = request.getParameter("stu_code");
		String true_name = request.getParameter("true_name");
		String sex = request.getParameter("sex");
		String id_card = request.getParameter("id_card");
		String phone = request.getParameter("phone");
		String home_phone = request.getParameter("home_phone");
		String birthplace = request.getParameter("birthplace");
		String homepage = request.getParameter("homepage");

		student.setStu_code(stu_code);
		student.setTrue_name(true_name);
		student.setSex(sex);
		student.setId_card(id_card);
		student.setPhone(phone);
		student.setHome_phone(home_phone);
		student.setBirthplace(birthplace);
		student.setHomepage(homepage);
		studentService.update(student);

		// 添加学生角色
		String stu_id = (String) request.getSession().getAttribute(
				"xuesheng_id");
		List<UserRole> roles = userRoleService.selectNowRoleByStu_Id(stu_id);
		for (int i = 0; i < roles.size(); i++) {
			userRoleService.delete(roles.get(i));
		}

		// 保存学生角色信息
		String role = request.getParameter("roles");
		// System.out.println("roles==" + role);
		String[] ss = role.split("[,]");
		UserRole role_now = null;
		for (int i = 0; i < ss.length; i++) {
			role_now = new UserRole();
			role_now.setUser_id(stu_id);
			role_now.setRole_id(ss[i]);
			userRoleService.insert(role_now);
		}

		return "redirect:studentImportList.do";
	}

	/**
	 * 功能：重置学生密码 张文琪 2016-5-28
	 * 
	 */
	@RequestMapping("sysadmin/resetPassword_stu.do")
	public String resetPassword_stu(HttpServletRequest request,
			HttpSession session) throws IOException {
		String id = request.getParameter("id");
		studentService.resetPassword(id);
		return "redirect:studentImportList.do";
	}

	/**
	 * 功能：学生管理 -添加学生 张文琪 2016-5-30
	 * 
	 * */
	@RequestMapping("sysadmin/addStudent.do")
	public ModelAndView StudentAdd(HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String class_id = request.getParameter("class_id");
		String class_name = DictionaryService.findOrg(class_id).getOrg_name();
		List<String> sex = new ArrayList<String>();
		sex.add(0, "男");
		sex.add(1, "女");
		map.put("sex", sex);
		map.put("class_id", class_id);
		map.put("class_name", class_name);
		return new ModelAndView("sysadmin/studentAdd", map);
	}

	/**
	 * 
	 * 功能：学生管理 -执行添加学生 张文琪 2016-5-30
	 * 
	 * 
	 */
	@RequestMapping("sysadmin/doAddStudent.do")
	public String doStudentAdd(HttpServletRequest request) {
		Student student = new Student();
		String class_id = request.getParameter("class_id");
		String stu_code = request.getParameter("stu_code");
		String true_name = request.getParameter("true_name");
		String sex = request.getParameter("sex");
		String id_card = request.getParameter("id_card");
		String phone = request.getParameter("phone");
		String home_phone = request.getParameter("home_phone");
		String birthplace = request.getParameter("birthplace");
		String homepage = request.getParameter("homepage");

		student.setEntry_year(stu_code.substring(0, 4));

		student.setId(Common.returnUUID());
		student.setClass_id(class_id);
		student.setStu_code(stu_code);
		student.setTrue_name(true_name);
		student.setSex(sex);
		student.setId_card(id_card);
		student.setPhone(phone);
		student.setHome_phone(home_phone);
		student.setBirthplace(birthplace);
		student.setHomepage(homepage);

		studentService.insert(student);
		return "redirect:studentImportList.do";
	}

	/*
	 * 
	 * 功能：基础管理——角色管理——查看所有用户
	 */
	@RequestMapping("sysadmin/searchUsersByRole.do")
	public ModelAndView searchUsersByRole(String role_name, String role_id,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (role_name == null && role_id == null) {
			role_name = (String) session.getAttribute("role_name");
			role_id = (String) session.getAttribute("role_id");
		}
		session.setAttribute("role_name", role_name);
		session.setAttribute("role_id", role_id);
		List<String> user_ids = userRoleService.selectUsersByStu_Id(role_id);
		List<String> stu_ids = new ArrayList<String>();
		List<String> tea_ids = new ArrayList<String>();
		List<Student> stus = new ArrayList<Student>();
		List<Teacher> teas = new ArrayList<Teacher>();
		Student stu = null;
		Teacher tea = null;
		for (int i = 0; i < user_ids.size(); i++) {
			if (user_ids.get(i).length() == 32) {
				stu_ids.add(user_ids.get(i));
			} else {
				tea_ids.add(user_ids.get(i));
			}
		}
		if (stu_ids.size() > 0) {
			for (int i = 0; i < stu_ids.size(); i++) {
				stu = DictionaryService.findStudent(stu_ids.get(i));
				stus.add(stu);
			}
		}
		if (tea_ids.size() > 0) {
			for (int i = 0; i < tea_ids.size(); i++) {
				tea = DictionaryService.findTeacher(tea_ids.get(i));
				teas.add(tea);
			}
		}
		map.put("role_id", role_id);
		map.put("stus", stus);
		map.put("teas", teas);
		map.put("role_name", role_name);
		return new ModelAndView("sysadmin/searchUsers", map);
	}

	/*
	 * 
	 * 功能：基础管理——角色管理——查看所有用户——删除 , 删除角色中的用户 张文琪 2016-6-1 注意代码重定向时尽量不要用
	 * request传参数
	 */
	@RequestMapping("sysadmin/deleteUserInRole.do")
	public String deleteUserInRole(HttpServletRequest request) {
		String role_id = request.getParameter("role_id");
		String user_id = request.getParameter("user_id");
		Map<String, Object> map = new HashMap<String, Object>();
		userRoleService.deleteByUser_idAndStu_Id(user_id, role_id);

		return "redirect:searchUsersByRole.do";

	}
	
}
