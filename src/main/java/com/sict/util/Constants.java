
package com.sict.util;

import java.util.Calendar;
/**
 * @author vannly
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Constants
{

	/**
	 * 文件上传的基础路径
	 * 吴敬国
	 * 2015-5-5
	 */
	//public static final String FILE_ROUTE = "D:"+"\\"+"uploadedfiles\\";//学生签到地点与合理地点坐标的距离10公里内正常。
	public static final String FILE_ROUTE = "uploadedfiles/";
	//微信用的服务器地址
	//public static  String ServerURL =  "http://wugee513.xicp.net/springmvc_mybatis";//测试号专用
	//public static String ServerURL =  "http://222.194.124.10:8080/springmvc_mybatis";//
	//public static final String ServerURL =  "http://wugee513.wicp.net/springmvc_mybatis";
	//public static final String ServerURL =  "http://dszweb001.jsp.fjjsp01.com/springmvc_mybatis";//jsp
	//正式地址   
	public static String ServerURL =  "http://sjjxgl.top/springmvc_mybatis";
	public static final String PRACTICT_START_MORTH = "09";
	public static final String PRACTICT_END_MORTH ="07";
	//地区分布所用人数常量  大于常量的地区显示在饼图
	public static final Integer PERSON_COUNT = 6;
	public static final String TechnicalSupportPhone=  "15725964841";//技术支持手机号
	public static final String TechnicalSupportQQ=  "193303585";//技术支持qq号群
	
	
	//微信公众平台appID
	public static final String appid = "wxcdfd3841ece59e26";
	//微信公众平台AppSecret(秘钥)
	public static final String AppSecret = "f75b1e057935c95a58d2051d8335f600";
	
	//测试号
	//public static final String appid = "wx0404f620d84f4b0d";
	//public static final String AppSecret = "2938f3cc4774f94e8f20263255a6c619";
	public static  String  access_token = "";
	//用于判断 access_token 是否有效
	static Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
	public static int tokenTime = c.get(Calendar.HOUR_OF_DAY);
	
	/**
	 * web端分页的页大小
	 * 王磊
	 * 2015-6-11
	 */
	public static final int pageSize = 15;
	
	
	/**
	 * 学期起始时间和结束时间定义
	 * 吴敬国
	 * 2015-6-10
	 */
	public static final String TERM1_BEGIN = "-08-01";
	
	public static final String TERM1_END = "-01-31";
	
	public static final String TERM2_BEGIN = "-02-01";
	
	public static final String TERM2_END = "-07-31";
	
	/**
	 * 系统
	 */
	public static final String CURRENT_USER_TYPE_TEA = "teacher";
	
	public static final String CURRENT_USER_TYPE_STU = "student";
	
	public static final String CURRENT_USER_TYPE_SYS = "";
	
	//public static final String TERM2_END = "-07-31";
	
	public static final String PLEASE_CHECK_DEPT = "请选择部门";
	
	public static final String PLEASE_CHECK_GRADE = "请选择年级";
	
	
	/**
	 * 角色级别常量
	 */
	public static final String ROLE_LEVEL_ONE = "1";//基本角色 ROLE_ADMIN
	
	public static final String ROLE_LEVEL_TWO = "2";//角色模板 ROLE_ADMIN_COLLEGE 学院管理员
	
	public static final String ROLE_LEVEL_THREE = "3";//各学院实际使用角色  ROLE_ADMIN_COLLEGE_SZDZXXXY 电子信息学院管理员
	
	public static final String ROLE_LEVEL_FOUT = "4";
	/**
	 * 组织表
	 */
	public static final String TOP_ORG_ID = "sjjxxt";
	
	public static final String ORG_LEVEL_SYSTEM = "0";//系统
	
	public static final String ORG_LEVEL_SCHOOL = "1";//学校
	
	public static final String ORG_LEVEL_COLLEGE = "2";//学院
	
	public static final String ORG_LEVEL_DEPT = "3";//系部
	
	public static final String ORG_LEVEL_PROFESSIONAL = "4";//专业
	
	public static final String ORG_LEVEL_CLASS = "5";//班级
	
	
	
	/**
	 * 状态可用、不可用
	 */
	public static final String STATE_USERD = "1";
	
	public static final String STATE_NOT_USERD = "2";
	
	/**
	 * 教师表
	 * 学校教师类型：1        公司教师类型：2
	 */
	public static final String TEA_TYPE_SCHOOL = "1";
	
	public static final String TEA_TYPE_COMPANY = "2";
	
	/**
	 * 菜单表使用
	 */
	public static final String SYSMENU_USERD = "1";//菜单可用
	
	public static final String SYSMENU_NOT_USERD = "2";
	
	public static final String SYSMENU_LEVEL_ONE = "1";//一级菜单
	
	public static final String SYSMENU_LEVEL_TWO = "2";
	
	public static final String SYSMENU_LEVEL_THREE = "3";
	
	public static final String SYSMENU_LEVEL_FOUR = "4";
	
	/**
	 * 角色使用  系统定义，不能轻易修改或删除
	 */
	public static final String ROLE_ADMIN = "ROLE_ADMIN";//–对应基础菜单，想首页、修改个人信息、密码
	public static final String ROLE_TEACHER = "ROLE_TEACHER";//教师
    public static final String ROLE_LEADER = "ROLE_LEADER";//领导
	public static final String ROLE_STUDENT = "ROLE_STUDENT";//学生
	public static final String ROLE_COMPANY = "ROLE_COMPANY";//公司
	
	public static final String ROLE_SYS_ADMIN = "ROLE_SYS_ADMIN";//超级管理员
	public static final String ROLE_ADMIN_SCHOOL = "ROLE_ADMIN_SCHOOL";//学校管理员
    public static final String ROLE_ADMIN_COLLEGE = "ROLE_ADMIN_COLLEGE";//学院管理员
	public static final String ROLE_ADMIN_DEPT = "ROLE_ADMIN_DEPT";//系部管理员
	public static final String ROLE_ADMIN_EMPLOYMENT = "ROLE_ADMIN_EMPLOYMENT";//学院就业管理员
	
	public static final String ROLE_COMPANY_TEACHER = "ROLE_COMPANY_TEACHER";//企业教师
	
	public static final String ROLE_LEADER_DEPT = "ROLE_LEADER_DEPT";//系级领导
	public static final String ROLE_LEADER_COLLEGE = "ROLE_LEADER_COLLEGE";//院级领导     
	public static final String ROLE_LEADER_SCHOOL = "ROLE_LEADER_SCHOOL";//校级领导
	
	public static final String ROLE_TEACHER_COUNSELLOR = "ROLE_TEACHER_COUNSELLOR";//辅导员
	public static final String ROLE_TEACHER_HEADTEA = "ROLE_TEACHER_HEADTEA";//班主任     
	public static final String ROLE_TEACHER_LESSON = "ROLE_TEACHER_LESSON";//任课教师
	public static final String ROLE_TEACHER_CONTEST = "ROLE_TEACHER_CONTEST";//大赛指导教师	  
	public static final String ROLE_TEACHER_ASSOCIATION = "ROLE_TEACHER_ASSOCIATION";//学生社团指导教师     
	public static final String ROLE_TEACHER_PRACTICE = "ROLE_TEACHER_PRACTICE";//实习指导教师
	
	public static final String ROLE_STUDENT_PRACTICE = "ROLE_STUDENT_PRACTICE";//校外实习学生	 	
	public static final String ROLE_STUDENT_SCHOOL = "ROLE_STUDENT_SCHOOL";//普通在校生	  
	public static final String ROLE_STUDENT_CLASS_MANAGER = "ROLE_STUDENT_CLASS_MANAGER";//班级管理角色
	public static final String ROLE_STUDENT_ASSOCIATION_MANAGER = "ROLE_STUDENT_ASSOCIATION_MANAGER";//学生社团管理  	
	
	public static final String ROLE_STUDENT_UNION_MANAGER = "ROLE_STUDENT_UNION_MANAGER";//学生会管理	
	public static final String ROLE_STUDENT_PE_MANAGER = "ROLE_STUDENT_PE_MANAGER";//学生会体育部部长
	public static final String ROLE_STUDENT_PE_MEMBER = "ROLE_STUDENT_PE_MEMBER";//学生会体育部成员	
		   
		   
	
	/**
	 * 签到合理范围
	 * 
	 * 2014-11-25
	 */
	public static final int REGION_DISTANCE = 30000;//学生签到地点与合理地点坐标的距离30公里内正常。

	/**
	 * The request scope attribute that holds the user list
	 */
	public static final String USER_LIST = "userList";
	
	
	
	/** ResourceBundle关键名称 */
	public static final String BUNDLE_KEY = "ApplicationResources";
	/**
	 * 暂时没用.
	 * <p>
	 * The encryption algorithm key to be used for passwords
	 */
	public static final String ENC_ALGORITHM = "algorithm";
	/** 判断密码是否要被加密的标志位 */
	public static final String ENCRYPT_PASSWORD = "encryptPassword";
	/**
	 * 文件分割符.
	 * <p>
	 * 来自于本系统
	 */
	public static final String FILE_SEP = System.getProperty( "file.separator" );
	/** 系统熟悉文件(System properties)中的User home熟悉 */
	public static final String USER_HOME = System.getProperty( "user.home" )
			+ FILE_SEP;
	/** 存在application scope中的configuration hashmap 的名字 */
	public static final String CONFIG = "appConfig";
	/**
	 * Session scope attribute that holds the locale set by the user. By setting
	 * this key to the same one that Struts uses, we get synchronization in
	 * Struts w/o having to do extra work or have two session-level variables.
	 */
	public static final String PREFERRED_LOCALE_KEY = "org.apache.struts.action.LOCALE";
	/**
	 * The request scope attribute under which an editable user form is stored
	 */
	public static final String USER_KEY = "userForm";
	/**
	 * The request scope attribute for indicating a newly-registered user
	 */
	public static final String REGISTERED = "registered";
	/**
	 * The name of the Administrator role, as specified in web.xml
	 */
	public static final String ADMIN_ROLE = "admin";
	/**
	 * The name of the User role, as specified in web.xml
	 */
	public static final String STREAM ="clickstreams";
	public static final String USER_ROLE = "user";
	/**
	 * The name of the user's role list, a request-scoped attribute when
	 * adding/editing a user.
	 */
	public static final String USER_ROLES = "userRoles";
	/**
	 * The name of the available roles list, a request-scoped attribute when
	 * adding/editing a user.
	 */
	public static final String AVAILABLE_ROLES = "availableRoles";
	
	public static final String AVAILABLE_ROLESUBLIST = "availableSubRoles";
	/**
	 * 存储在application中的商品类别 KEY
	 */
	public static final String AVAILABLE_ITEMSORTS = "availableItemSorts";
	/**
	 * 用户菜单资源信息
	 */
	public static final String USER_MENUREPOSITORY = "userMenuRepository";
	/**
	 * 用户页面资源信息
	 */
	public static final String USER_RESOURCE = "userResource";
	/**
	 * 菜单页面显示资源对象
	 */
	public static final String MENU_OBJECTS = "menuObjects";
	
	/**
	 * 组织机构列表对象
	 */
	public static final String ORGLIST_MAP = "orgListMap";
	
	/**
	 * 组织机构MAP对象
	 */
	public static final String ORGORG_MAP = "orgOrgMap";
	
	/**
	 * 物品类别列表对象
	 */
	public static final String ITEMSORTLIST_MAP = "itemSortListMap";
	
	/**
	 * 物品类别MAP对象
	 */
	public static final String BASITEMSORT_MAP = "basItemSortMap";
	
	/**
	 * 供应商MAP对象
	 */
	public static final String BASSUPPLY_MAP = "basSupplyMap";
	
	/**
	 * 仓库MAP对象
	 */
	public static final String BASSTORE_MAP = "basStoreMap";
	
	/**
	 * 物品MAP对象
	 */
	public static final String BASITEM_MAP = "basItemMap";
	/**
	 * 企业物品MAP对象
	 */
	public static final String BASENTITEM_MAP="basEntItemMap";
	/**
	 * 采购员MAP对象
	 */
	public static final String BASBUYER_MAP = "basBuyerMap";
	
	/**
	 * 流程模板MAP对象
	 */
	public static final String PMTEMPLATE_MAP = "pmTemplateMap";
	
	/**
	 * 会计期间MAP对象
	 */
	public static final String BASACCOUNTTIME_MAP = "basAccountTimeMap";
	
	/**
	 * 人员的MAP对象
	 */
	public static final String BASREQMAN_MAP = "basReqManMap";
	
	/**
	 * 科目的MAP对象
	 */
	public static final String BASSBJ_MAP = "basSbjMap";
	
	/**
	 * 付款方式的MAP对象
	 */
	public static final String BASPAYTYPE_MAP = "basPayTypeMap";
	
	/** 
	 * 采购员修改订单权限
	 */
	public static final String PURVIEW_BUYER_MODIFY_ORDER = "/vpmweb/vpm/po/poOrderLBuyer.html";
	
	/**
	 * 一级审批订单权限
	 */
	public static final String PURVIEW_FIRST_AUDIT_ORDER = "/vpmweb/vpm/po/poOrderLAudit1st.html";
	
	/**
	 * 二级审批订单权限
	 */
	public static final String PURVIEW_SECOND_AUDIT_ORDER = "/vpmweb/vpm/po/poOrderLAudit2nd.html";
	
	/** 
	 * 采购员修改变价单权限
	 */
	public static final String PURVIEW_BUYER_MODIFY_ADJUST = "/vpmweb/vpm/po/poAdjustLOneForm.html";
	
	/**
	 * 一级审批变价单权限
	 */
	public static final String PURVIEW_FIRST_AUDIT_ADJUST = "/vpmweb/vpm/po/poAdjustLFirstForm.html";
	
	/**
	 * 二级审批变价单权限
	 */
	public static final String PURVIEW_SECOND_AUDIT_ADJUST = "/vpmweb/vpm/po/poAdjustLSecondForm.html";
	
	/**
	 * 无权限跳转页面
	 */
	public static final String ERROR_PERMISSION = "/vpmweb/loginFail.jsp";
	
	/**
	 * XML文件存放路径
	 */
	public static final String FILE_XML_RESOURCE = "xmlresource";
	/**
	 * 凭证文件存放路径
	 */
	public static final String FILE_PZ_RESOURCE = "pzResource";
	/*--------------------------流程操作oper---------------------------*/
	/*------------非流程操作--------------*/
	/**
	 * 新增单据
	 */
	public final static String OPERATION_NEW = "NEW";
	public final static String OPERATION_NEWCN = "新增";
	/**
	 * 修改未提交的表单
	 */
	public final static String OPERATION_EDIT_UNCOMMIT = "EDITUNCOMMIT";
	public final static String OPERATION_EDIT_UNCOMMITCN = "提交前修改";
	/**
	 * 非流程审批
	 */
	public final static String OPERATION_AUDIT_MANUAL = "AUDIT_MANUAL";
	public final static String OPERATION_AUDITCN_MANUAL = "审批";	
	/**
	 * 非流程提交
	 */
	public final static String OPERATION_COMMIT_MANUAL = "COMMIT_MANUAL";
	public final static String OPERATION_COMMITCN_MANUAL = "提交";
	/**
	 * 非流程终止
	 */
	public final static String OPERATION_STOP_MANUAL = "END_MANUAL";
	public final static String OPERATION_STOPCN_MANUAL = "终止";
	
	
	
	/**
	 * 非流程保存
	 */
	public final static String OPERATION_SAVE_MANUAL = "SAVE_MANUAL";
	public final static String OPERATION_SAVECN_MANUAL = "保存";
	
	
/*-----------------流程相关操作--------------*/	
	/**
	 * 提交表单,进行流程
	 */
	public final static String OPERATION_COMMIT = "COMMIT";
	public final static String OPERATION_COMMITCN = "提交";
	/**
	 * 审批
	 */
	public final static String OPERATION_AUDIT = "AUDIT";
	public final static String OPERATION_AUDITCN = "审批";
	/**
	 * 修改并审批
	 */
	public final static String OPERATION_EDIT_AUDIT = "EDITAUDIT";
	public final static String OPERATION_EDIT_AUDITCN = "审批";
	/**
	 * 触发子流程
	 */
	public final static String OPERATION_TRIG_SUB_PROCESS = "trigSubProcess";
	public final static String OPERATION_TRIG_SUB_PROCESSCN = "触发子流程";
	/**
	 * 终止流程
	 */
	public final static String OPERATION_STOP = "END";
	public final static String OPERATION_STOPCN = "终止流程";
	/**
	 * 删除流程
	 */
	public final static String OPERATION_DELETE = "DELETE";
	public final static String OPERATION_DELETECN = "删除流程";
	/**
	 * 修改表单
	 */
	public static final String OPERATION_EDIT = "EDIT";
	public static final String OPERATION_EDITCN = "修改";
	/*--------------------------单据审批结果---------------------------*/
	/**
	 * 通过审批
	 */
	public static final String OPERATION_PASS_AUDIT = "PASS";
	public static final String OPERATION_PASS_AUDITCN = "通过审批";
	/**
	 * 驳回审批
	 */
	public static final String OPERATION_BACK_AUDIT = "RETURN";
	public static final String OPERATION_BACK_AUDITCN = "驳回审批";
	public static final String REFUSE= "驳回";
	
	/**
	 * 修改并返回
	 */
	public static final String OPERATION_BACK_EDIT = "RETURN_EDIT";
	public static final String OPERATION_BACK_EDITCN = "修改并返回";
	/**
	 * 修改并通过
	 */
	public static final String OPERATION_PASS_EDIT = "PASS_EDIT";
	public static final String OPERATION_PASS_EDITCN = "修改并通过";
	/*-----------------------------定义流程状态-----------------------*/
	/**
	 * 正在运行
	 */
	public static final String PRO_RUN = "RUN";
	public static final String PRO_RUN_CN= "运行";
	/**
	 * 流程结束
	 */
	public static final String PRO_FINISH = "FINISH";
	public static final String PRO_FINISH_CN = "完成";
	/**
	 * 流程终止
	 */
	public static final String PRO_PAUSE = "PAUSE";
	public static final String PRO_PAUSE_CN = "终止";
	/**
	 * 未知
	 */
	public static final String NO_KNOW = "NO_KNOW";
	public static final String NO_KNOW_CN = "未知";
	/*-----------------------------定义活动状态-----------------------*/
	/**
	 * 就绪
	 */
	public static final String ACT_READY = "READY";
	/**
	 * 完成
	 */
	public static final String ACT_FINISH = "FINISH";
	/*-----------------------------流程活动执行类型-----------------------*/	
	/**
	 * 就绪
	 */
	public static final String Receiver_Type_PERSON = "PERSON";
	
	/**
	 * 就绪
	 */
	public static final String Receiver_Type_ROLE = "ROLE";
	
	/*-----------------------------流程节点类型-----------------------*/
	/**
	 * 业务员修改
	 */
	public static final String ACT_BUYER_MODIFY = "BuyerModif";
	
	/**
	 * 财务总监确认
	 */
	public static final String ACT_FINANCE_CONFIRM = "FinanceMajordomoConfirm";
	
	/**
	 * 总会计师确认
	 */
	public static final String ACT_ACCOUNTANT_CONFIRM = "AccountantConfirm";
	
	/**
	 * 验收入库
	 */
	public static final String ACT_RECEIVE_GOODS = "ReceiveGoods";
	
	/**
	 * 审批完成操作
	 */
	public static final String OPT_AUDIT = "audit";
	/**
	 * 流程完成操作
	 */
	public static final String OPT_COMPLETE = "complete";
	
	
	
	public static final String YES = "1";
	public static final String NO = "0";
	public static final int ORG_RELATION_LENGTH = 3;
	public static final int BIS_RELATION_LENGTH = 2;
	public static final String ORG_ROOT_SUPPERC = "00000000";
	
	/**
	 * 草稿状态编码
	 */
	public static final String DRAFT = "draft";
	public static final String DRAFT_CN = "草稿";
	public static final String DRAFT_EN = "draft";
	
	/**
	 * 已提交状态编码
	 */
	public static final String COMMITTED = "committed";
	public static final String COMMITTED_CN = "已提交";
	public static final String COMMITTED_EN = "committed";	
	
	/**
	 * 审批通过状态编码
	 */
	public static final String AUDITED = "auditted";
	public static final String AUDITED_CN = "审批通过";
	public static final String AUDITED_EN = "auditted";
	
	/**
	 * 审批通过状态编码
	 */
	public static final String SENDED = "sended";
	public static final String SENDED_CN = "已发送";
	public static final String SENDED_EN = "sended";
	
	/**
	 * 审批不通过状态编码
	 */
	public static final String UNAUDITED = "unauditted";
	public static final String UNAUDITED_CN = "审批不通过";
	public static final String UNAUDITED_EN = "unauditted";
	
	/**
	 * 已验收状态编码
	 */
	public static final String CHECKED = "checked";
	public static final String CHECKED_CN = "已验收";
	public static final String CHECKED_EN = "checked";
	
	/**
	 * 作废状态编码
	 */
	public static final String CANCEL = "cancel";
	public static final String CANCEL_CN = "作废";
	public static final String CANCEL_EN = "cancel";
	
	/**
	 * 已关闭状态编码
	 */
	public static final String CLOSED = "closed";
	public static final String CLOSED_CN = "已关闭";
	public static final String CLOSED_EN = "closed";
	
	/**
	 * 财务总监已审批
	 */
	public static final String FINANCE_AUDITED = "FinanceAudited";
	public static final String FINANCE_AUDITED_CN = "完成一级审批";
	public static final String FINANCE_AUDITED_EN = "FinanceAudited";
	
	/**
	 * 财务总监审批通过
	 */
	public static final String FINANCE_PASSED = "FinancePassed";
	public static final String FINANCE_PASSED_CN = "一级审批通过";
	public static final String FINANCE_PASSED_EN = "FinancePassed";
	
	/**
	 * 财务总监审批通过(订单)
	 */
	public static final String FINANCE_PASSED_ORDER = "FinancePassedWithOrder";
	public static final String FINANCE_PASSED_ORDER_CN = "一级审批通过(订单)";
	public static final String FINANCE_PASSED_ORDER_EN = "FinancePassedWithOrder";
	
	/**
	 * 财务总监审批通过(变价单)
	 */
	public static final String FINANCE_PASSED_ADJUST = "FinancePassedWithAdjust";
	public static final String FINANCE_PASSED_ADJUST_CN = "一级审批通过(变价单)";
	public static final String FINANCE_PASSED_ADJUST_EN = "FinancePassedWithAdjust";
	
	/**
	 * 财务总监审批不通过
	 */
	public static final String FINANCE_UNAUDITED = "FinanceUnaudited";
	public static final String FINANCE_UNAUDITED_CN = "一级审批不通过";
	public static final String FINANCE_UNAUDITED_EN = "FinanceUnaudited";
	
	/**
	 * 财务总监审批不通过(订单)
	 */
	public static final String FINANCE_UNAUDITED_ORDER = "FinanceUnauditedWithOrder";
	public static final String FINANCE_UNAUDITED_ORDER_CN = "一级审批不通过(订单)";
	public static final String FINANCE_UNAUDITED_ORDER_EN = "FinanceUnauditedWithOrder";
	
	/**
	 * 财务总监审批不通过(变价单)
	 */
	public static final String FINANCE_UNAUDITED_ADJUST = "FinanceUnauditedWithAdjust";
	public static final String FINANCE_UNAUDITED_ADJUST_CN = "一级监审批不通过(变价单)";
	public static final String FINANCE_UNAUDITED_ADJUST_EN = "FinanceUnauditedWithAdjust";
	
	/**
	 * 财务总监审批滞留
	 */
	public static final String FINANCE_WAIT = "FinanceWait";
	public static final String FINANCE_WAIT_CN = "一级审批滞留";
	public static final String FINANCE_WAIT_EN = "FinanceWait";
	
	/**
	 * 财务总监审批滞留(订单)
	 */
	public static final String FINANCE_WAIT_ORDER = "FinanceWaitWithOrder";
	public static final String FINANCE_WAIT_ORDER_CN = "一级审批滞留(订单)";
	public static final String FINANCE_WAIT_ORDER_EN = "FinanceWaitWithOrder";
	
	/**
	 * 财务总监审批滞留(变价单)
	 */
	public static final String FINANCE_WAIT_ADJUST = "FinanceWaitWithAdjust";
	public static final String FINANCE_WAIT_ADJUST_CN = "一级审批滞留(变价单)";
	public static final String FINANCE_WAIT_ADJUST_EN = "FinanceWaitWithAdjust";
	
	/**
	 * 财务总监审批作废
	 */
	public static final String FINANCE_CANCEL = "FinanceCancel";
	public static final String FINANCE_CANCEL_CN = "一级审批作废";
	public static final String FINANCE_CANCEL_EN = "FinanceCancel";
	
	/**
	 * 财务总监审批作废(订单)
	 */
	public static final String FINANCE_CANCEL_ORDER = "FinanceCancelWithOrder";
	public static final String FINANCE_CANCEL_ORDER_CN = "一级审批作废(订单)";
	public static final String FINANCE_CANCEL_ORDER_EN = "FinanceCancelWithOrder";
	
	/**
	 * 财务总监审批作废(变价单)
	 */
	public static final String FINANCE_CANCEL_ADJUST = "FinanceCancelWithAdjust";
	public static final String FINANCE_CANCEL_ADJUST_CN = "一级审批作废(变价单)";
	public static final String FINANCE_CANCEL_ADJUST_EN = "FinanceCancelWithAdjust";
	
	/**
	 * 总会计师已审批
	 */
	public static final String ACCOUNTANT_AUDITED = "AccountantAudited";
	public static final String ACCOUNTANT_AUDITED_CN = "完成二级审批";
	public static final String ACCOUNTANT_AUDITED_EN = "AccountantAudited";
	
	/**
	 * 总会计师审批通过
	 */
	public static final String ACCOUNTANT_PASSED = "AccountantPassed";
	public static final String ACCOUNTANT_PASSED_CN = "二级审批通过";
	public static final String ACCOUNTANT_PASSED_EN = "AccountantPassed";
	
	/**
	 * 总会计师审批通过(订单)
	 */
	public static final String ACCOUNTANT_PASSED_ORDER = "AccountantPassedWithOrder";
	public static final String ACCOUNTANT_PASSED_ORDER_CN = "二级审批通过(订单)";
	public static final String ACCOUNTANT_PASSED_ORDER_EN = "AccountantPassedWithOrder";
	
	/**
	 * 总会计师审批通过(变价单)
	 */
	public static final String ACCOUNTANT_PASSED_ADJUST = "AccountantPassedWithAdjust";
	public static final String ACCOUNTANT_PASSED_ADJUST_CN = "二级审批通过(变价单)";
	public static final String ACCOUNTANT_PASSED_ADJUST_EN = "AccountantPassedWithAdjust";
	
	/**
	 * 总会计师审批不通过
	 */
	public static final String ACCOUNTANT_UNAUDITED = "AccountantUnaudited";
	public static final String ACCOUNTANT_UNAUDITED_CN = "二级审批不通过";
	public static final String ACCOUNTANT_UNAUDITED_EN = "AccountantUnaudited";
	
	/**
	 * 总会计师审批不通过(订单)
	 */
	public static final String ACCOUNTANT_UNAUDITED_ORDER = "AccountantUnauditedWithOrder";
	public static final String ACCOUNTANT_UNAUDITED_ORDER_CN = "二级审批不通过(订单)";
	public static final String ACCOUNTANT_UNAUDITED_ORDER_EN = "AccountantUnauditedWithOrder";
	
	/**
	 * 总会计师审批不通过(变价单)
	 */
	public static final String ACCOUNTANT_UNAUDITED_ADJUST = "AccountantUnauditedWithAdjust";
	public static final String ACCOUNTANT_UNAUDITED_ADJUST_CN = "二级审批不通过(变价单)";
	public static final String ACCOUNTANT_UNAUDITED_ADJUST_EN = "AccountantUnauditedWithAdjust";
	
	/**
	 * 总会计师审批滞留
	 */
	public static final String ACCOUNTANT_WAIT = "AccountantWait";
	public static final String ACCOUNTANT_WAIT_CN = "二级审批滞留";
	public static final String ACCOUNTANT_WAIT_EN = "AccountantWait";
	
	/**
	 * 总会计师审批滞留(订单)
	 */
	public static final String ACCOUNTANT_WAIT_ORDER = "AccountantWaitWithOrder";
	public static final String ACCOUNTANT_WAIT_ORDER_CN = "二级审批滞留(订单)";
	public static final String ACCOUNTANT_WAIT_ORDER_EN = "AccountantWaitWithOrder";
	
	/**
	 * 总会计师审批滞留(变价单)
	 */
	public static final String ACCOUNTANT_WAIT_ADJUST = "AccountantWaitWithAdjust";
	public static final String ACCOUNTANT_WAIT_ADJUST_CN = "二级审批滞留(变价单)";
	public static final String ACCOUNTANT_WAIT_ADJUST_EN = "AccountantWaitWithAdjust";
	
	/**
	 * 总会计师审批作废
	 */
	public static final String ACCOUNTANT_CANCEL = "AccountantCancel";
	public static final String ACCOUNTANT_CANCEL_CN = "二级审批作废";
	public static final String ACCOUNTANT_CANCEL_EN = "AccountantCancel";
		
	/**
	 * 总会计师审批作废(订单)
	 */
	public static final String ACCOUNTANT_CANCEL_ORDER = "AccountantCancelWithOrder";
	public static final String ACCOUNTANT_CANCEL_ORDER_CN = "二级审批作废(订单)";
	public static final String ACCOUNTANT_CANCEL_ORDER_EN = "AccountantCancelWithOrder";
	
	/**
	 * 总会计师审批作废(变价单)
	 */
	public static final String ACCOUNTANT_CANCEL_ADJUST = "AccountantCancelWithAdjust";
	public static final String ACCOUNTANT_CANCEL_ADJUST_CN = "二级审批作废(变价单)";
	public static final String ACCOUNTANT_CANCEL_ADJUST_EN = "AccountantCancelWithAdjust";
	
	/**
	 * 采购员已修改
	 */
	public static final String BUYER_MODIFIED = "BuyerModified";
	public static final String BUYER_MODIFIED_CN = "采购员已修改";
	public static final String BUYER_MODIFIED_EN = "BuyerModified";	
	
	/**
	 * 采购员修改通过(订单)
	 */
	public static final String BUYER_MODIFIED_ORDER = "BuyerModifiedWithOrder";
	public static final String BUYER_MODIFIED_ORDER_CN = "采购员已修改(订单)";
	public static final String BUYER_MODIFIED_ORDER_EN = "BuyerModifiedWithOrder";
	
	/**
	 * 采购员修改通过(变价单)
	 */
	public static final String BUYER_MODIFIED_ADJUST = "BuyerModifiedWithAdjust";
	public static final String BUYER_MODIFIED_ADJUST_CN = "采购员已修改(变价单)";
	public static final String BUYER_MODIFIED_ADJUST_EN = "BuyerModifiedWithAdjust";
	
	/**
	 * 采购员修改滞留
	 */
	public static final String BUYER_WAIT = "BuyerWait";
	public static final String BUYER_WAIT_CN = "采购员滞留";
	public static final String BUYER_WAIT_EN = "BuyerWait";
	
	/**
	 * 采购员修改滞留(订单)
	 */
	public static final String BUYER_WAIT_ORDER = "BuyerWaitWithOrder";
	public static final String BUYER_WAIT_ORDER_CN = "采购员滞留(订单)";
	public static final String BUYER_WAIT_ORDER_EN = "BuyerWaitWithOrder";
	
	/**
	 * 采购员修改滞留(变价单)
	 */
	public static final String BUYER_WAIT_ADJUST = "BuyerWaitWithAdjust";
	public static final String BUYER_WAIT_ADJUST_CN = "采购员滞留(变价单)";
	public static final String BUYER_WAIT_ADJUST_EN = "BuyerWaitWithAdjust";
	
	/**
	 * 采购员修改作废
	 */
	public static final String BUYER_CANCEL = "BuyerCancel";
	public static final String BUYER_CANCEL_CN = "采购员作废";
	public static final String BUYER_CANCEL_EN = "BuyerCancel";
	
	/**
	 * 采购员修改作废(订单)
	 */
	public static final String BUYER_CANCEL_ORDER = "BuyerCancelWithOrder";
	public static final String BUYER_CANCEL_ORDER_CN = "采购员作废(订单)";
	public static final String BUYER_CANCEL_ORDER_EN = "BuyerCancelWithOrder";
	
	/**
	 * 采购员修改作废(变价单)
	 */
	public static final String BUYER_CANCEL_ADJUST = "BuyerCancelWithAdjust";
	public static final String BUYER_CANCEL_ADJUST_CN = "采购员作废(变价单)";
	public static final String BUYER_CANCEL_ADJUST_EN = "BuyerCancelWithAdjust";
	
	/**
	 * 采购员修改不通过
	 */
	public static final String BUYER_UNAUDIT = "BuyerUnaudit";
	public static final String BUYER_UNAUDIT_CN = "采购员不通过";
	public static final String BUYER_UNAUDIT_EN = "BuyerUnaudit";
	
	/**
	 * 采购员修改不通过(订单)
	 */
	public static final String BUYER_UNAUDIT_ORDER = "BuyerUnauditWithOrder";
	public static final String BUYER_UNAUDIT_ORDER_CN = "采购员不通过(订单)";
	public static final String BUYER_UNAUDIT_ORDER_EN = "BuyerUnauditWithOrder";
	
	/**
	 * 采购员修改不通过(变价单)
	 */
	public static final String BUYER_UNAUDIT_ADJUST = "BuyerUnauditWithAdjust";
	public static final String BUYER_UNAUDIT_ADJUST_CN = "采购员不通过(变价单)";
	public static final String BUYER_UNAUDIT_ADJUST_EN = "BuyerUnauditWithAdjust";
	
	/**
	 * 订单到期
	 */	
	public static final String ORDER_OVERDUE = "orderOverdue";
	public static final String ORDER_OVERDUE_CN = "订单到期";
	public static final String ORDER_OVERDUE_EN = "orderOverdue";
	
	
	/**
	 * 流程完成状态编码
	 */
	public static final String COMPLETED = "completed";
	public static final String COMPLETED_CN = "流程完成";
	public static final String COMPLETED_EN = "completed";
	
	/**
	 * 已生成订单状态编码
	 */
	public static final String SETUP = "setuporder";
	public static final String SETUP_CN = "已生成订单";
	public static final String SETUP_EN = "setuporder";
	
	/**
	 * 已入库状态编码
	 */
	public static final String INSTORE = "instore";
	public static final String INSTORE_CN = "已入库";
	public static final String INSTORE_EN = "instore";
		
	/**
	 * 已结算状态编码
	 */
	public static final String BALANCED = "balanced";
	public static final String BALANCED_CN = "已结算";
	public static final String BALANCED_EN = "balanced";
	
	/**
	 * 供应商已确认状态编码
	 */
	public static final String AFFIRMED = "affirmed";
	public static final String AFFIRMED_CN = "已确认";
	public static final String AFFIRMED_EN = "affirmed";
	
	/**
	 * 已生成变价单状态编码
	 */
	public static final String SETUPADJUST = "setupadjust";
	public static final String SETUPADJUST_CN = "已生成变价单";
	public static final String SETUPADJUST_EN = "setupadjust";
	
	/**
	 * 变价通过状态编码
	 */
	public static final String ADJUSTPASS = "adjustpass";
	public static final String ADJUSTPASS_CN = "变价通过";
	public static final String ADJUSTPASS_EN = "adjustpass";
	
	/**
	 * 物品正式状态编码
	 */
	public static final String OFFICIAL = "official";
	public static final String OFFICIAL_CN = "正式";
	public static final String OFFICIAL_EN = "official";
	
	/**
	 * 申购单单据类型
	 */
	public static final String SGDJ = "SGDJ";
	public static final String SGDJ_CN = "申购单";
	public static final String SGDJ_EN = "";

	public static final String SGMB = "SGMB";
	public static final String SGMB_CN = "申购单模板";
	public static final String SGMB_EN = "";

	/**
	 * 申购交易类型
	 */
	public static final String JYSGDJ_KF = "JYSGDJ_KF";
	public static final String JYSGDJ_KF_CN = "库房申购单";
	public static final String JYSGDJ_KF_EN = "";
	public static final String JYSGDH_BM = "JYSGDH_BM";
	public static final String JYSGDH_BM_CN = "部门申购单";
	public static final String JYSGDH_BM_EN = "";
	
	/**
	 * 订单单据类型
	 */
	public static final String DDDJ = "DDDJ";
	public static final String DDDJ_CN = "订单";
	public static final String DDDJ_EN = "";
	
	/**
	 * 订单交易类型
	 */
	public static final String JYDDDJ = "JYDDDJ";
	public static final String JYDDDJ_CN = "订单";
	public static final String JYDDDJ_EN = "";
	
	/**
	 * 调拨单单据类型
	 */
	public static final String DBDJ= "DBDJ";
	public static final String DBDJ_CN = "调拨单";
	public static final String DBDJ_EN = "";
	
	/**
	 * 调拨单交易类型
	 */
	public static final String JYDBDJ = "JYDBDJ";
	public static final String JYDBDJ_CN = "调拨单";
	public static final String JYDBDJ_EN = "";
	
	/**
	 * 变价单单据类型
	 */
	public static final String BJDJ="BJDJ";
	public static final String BJDJ_CN="变价单";
	public static final String BJDJ_EN="";
	
	/**
	 * 变价单交易类型
	 */
	public static final String JYBJDJ = "JYBJDJ";
	public static final String JYBJDJ_CN = "变价单";
	public static final String JYBJDJ_EN = "";
	
	/**
	 * 领用单单据类型
	 */
	public static final String LYDJ = "LYDJ";
	public static final String LYDJ_CN = "领用单";
	public static final String LYDJ_EN = "LYDJ";
	
	/**
	 * 部门领用单单据类型
	 */
	public static final String BMLYDJ = "BMLYDJ";
	public static final String BMLYDJ_CN = "部门领用单";
	public static final String BMLYDJ_EN = "BMLYDJ";
	
	/**
	 * 领用单交易类型
	 */
	public static final String JYLYDJ = "JYLYDJ";
	public static final String JYLYDJ_CN = "领用单";
	public static final String JYLYDJ_EN = "JYLYDJ";
	
	/**
	 * 部门领用单交易类型
	 */
	public static final String JYBMLYDJ = "JYBMLYDJ";
	public static final String JYBMLYDJ_CN = "部门领用单";
	public static final String JYBMLYDJ_EN = "JYBMLYDJ";
	
	/**
	 * 退仓单单据类型
	 */
	public static final String TCDJ = "TCDJ";
	public static final String TCDJ_CN = "退库单";
	public static final String TCDJ_EN = "TCDJ";
	/**
	 * 退仓单交易类型
	 */
	public static final String JYTCDJ = "JYTCDJ";
	public static final String JYTCDJ_CN = "退库单";
	public static final String JYTCDJ_EN = "JYTCDJ";
	
	/**
	 * 结算单单据类型
	 */
	public static final String JSDJ = "JSDJ";
	public static final String JSDJ_CN = "结算单";
	public static final String JSDJ_EN = "JSDJ";
	/**
	 * 结算单交易类型
	 */
	public static final String JYJSDJ = "JYJSDJ";
	public static final String JYJSDJ_CN = "结算单";
	public static final String JYJSDJ_EN = "JYJSDJ";
	
	/**
	 * 盘点单单据类型
	 */
	public static final String PDDJ = "PDDJ";
	public static final String PDDJ_CN = "盘点单";
	public static final String PDDJ_EN = "";
	/**
	 * 库房盘点单交易类型
	 */
	public static final String JYPDDJ_KF = "JYPDDJ_KF";
	public static final String JYPDDJ_KF_CN = "库房盘点单";
	public static final String JYPDDJ_KF_EN = "";
	/**
	 * 厨房盘点单交易类型
	 */
	public static final String JYPDDJ_CF = "JYPDDJ_CF";
	public static final String JYPDDJ_CF_CN = "厨房盘点单";
	public static final String JYPDDJ_CF_EN = "";
	
	/**
	 * 入库单单据类型
	 */
	public static final String RKDJ = "RKDJ";
	public static final String RKDJ_CN = "入库单";
	public static final String RKDJ_EN = "";
	/**
	 * 入库单单据交易类型,按订单入库单--库房入库
	 */
	public static final String JYRKDJ_YDD_KF = "JYRKDJ_YDD_KF";
	public static final String JYRKDJ_YDD_KF_CN = "库房入库单";
	public static final String JYRKDJ_YDD_KF_EN = "";
	/**
	 * 入库单单据交易类型,初始化入库单--初始化入库
	 */
	public static final String JYRKD_CSH = "JYRKD_CSH";
	public static final String JYRKD_CSH_CN = "初始化入库单";
	public static final String JYRKD_CSH_EN = "JYRKD_CSH";
	/**
	 * 入库单单据交易类型,按订单入库单--一次性采购
	 */
	public static final String JYRKDJ_YDD_YC = "JYRKDJ_YDD_KF";
	public static final String JYRKDJ_YDD_YC_CN = "一次性采购入库单";
	public static final String JYRKDJ_YDD_YC_EN = "";
	/**
	 * 入库单单据交易类型,无订单入库单--库房入库
	 */
	public static final String JYRKDJ_WDD_KF = "JYRKDJ_YDD_KF";
	public static final String JYRKDJ_WDD_KF_CN = "库房入库单";
	public static final String JYRKDJ_WDD_KF_EN = "";
	/**
	 * 入库单单据交易类型,无订单入库单--一次性入库
	 */
	public static final String JYRKDJ_WDD_YC = "JYRKDJ_YDD_KF";
	public static final String JYRKDJ_WDD_YC_CN = "一次性入库单";
	public static final String JYRKDJ_WDD_YC_EN = "";
	/**
	 * 入库单单据交易类型,无订单入库单--直入直出
	 */
	public static final String JYRKDJ_WDD_ZR = "JYRKDJ_YDD_KF";
	public static final String JYRKDJ_WDD_ZR_CN = "直入直出";
	public static final String JYRKDJ_WDD_ZR_EN = "";
	/**
	 * 入库单单据交易类型－－结算余额入库单
	 */
	public static final String JYRKD_JSYE = "JYRKD_JSYE";
	public static final String JYRKD_JSYE_CN = "结算余额入库单";
	public static final String JYRKD_JSYE_EN = "JYRKD_JSYE";
	/**
	 * 入库单单据交易类型
	 */
	public static final String JYRKDJ = "JYRKDJ";
	public static final String JYRKDJ_CN = "入库单";
	public static final String JYRKDJ_EN = "";
	/**
	 * 退货单单据类型
	 */
	public static final String THDJ = "THDJ";
	public static final String THDJ_CN = "退货单";
	public static final String THDJ_EN = "";
	/**
	 * 退货单单据交易类型
	 */
	public static final String JYTHDJ = "JYTHDJ";
	public static final String JYTHDJ_CN = "退货单";
	public static final String JYTHDJ_EN = "";
	/**
	 * 物品单据类型
	 */
	public static final String WPDJ = "WPDJ";
	public static final String WPDJ_CN = "物品单据";
	public static final String WPDJ_EN = "";
	
	/**
	 * 申购单单据类型
	 */
	public static final String HT = "HT";
	public static final String HT_CN = "合同";
	public static final String HT_EN = "";
	
	public static final String LOG_ADD = "添加";
	public static final String LOG_UPDATE = "修改";
	public static final String LOG_DELETE = "删除";
	public static final String LOG_JZ = "结转";
	public static final String LOG_CONFIRM = "审核";
	
	
}
