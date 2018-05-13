package com.sict.service;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sict.biz.ChatService;
import com.sict.biz.Click;
import com.sict.biz.GetImage;
import com.sict.biz.MonthSummaryService;
import com.sict.biz.StuBind;
import com.sict.dao.EvaluateDao;
import com.sict.dao.FilesDao;
import com.sict.dao.GroupsDao;
import com.sict.dao.InfoCheckRecordDao;
import com.sict.dao.KnowledgeDao;
import com.sict.dao.LogDao;
import com.sict.dao.NoticeDao;
import com.sict.dao.OrgDao;
import com.sict.dao.PracticeRecordDao;
import com.sict.dao.PracticeTaskDao;
import com.sict.dao.RecruitInfoDao;
import com.sict.dao.RightRegionDao;
import com.sict.dao.SignDao;
import com.sict.dao.StudentDao;
import com.sict.dao.TeacherDao;
import com.sict.dao.TrainDetailDao;
import com.sict.entity.Evaluate;
import com.sict.entity.Files;
import com.sict.entity.Groups;
import com.sict.entity.InfoCheckRecord;
import com.sict.entity.Knowledge;
import com.sict.entity.Log;
import com.sict.entity.Notice;
import com.sict.entity.PracticeRecord;
import com.sict.entity.PracticeTask;
import com.sict.entity.RecruitInfo;
import com.sict.entity.RightRegion;
import com.sict.entity.Sign;
import com.sict.entity.StuGraState;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.entity.TrainDetail;
import com.sict.message.resp.Article;
import com.sict.message.resp.NewsMessage;
import com.sict.message.resp.TextMessage;
import com.sict.util.Common;
import com.sict.util.Constants;
import com.sict.util.MessageUtil;

/**
 * 核心服务类
 * 
 * @author mengfanzhen
 * @date 2014-07-02
 */
@Service
public class CoreService {
	@Resource
	StuBind stuBind;
	@Resource
	Click click;
	@Resource
	FilesService filesService;
	@Resource
	SignService signService;
	@Resource
	StudentService studentService;
	@Resource
	MonthSummaryService monthSummaryService;
	@Resource
	RightRegionService rightRegionService;
	@Resource
	ChatService chatService;
	@Resource@Qualifier("studentDao")
	StudentDao studentDao;
	@Resource
	PracticeRecordDao practiceRecordDao;
	@Resource
	SignDao signDao;
	@Resource
	OrgDao orgDao;
	@Resource
	FilesDao filesDao;
	@Resource
	InfoCheckRecordDao infoCheckRecordDao;
	@Resource
	RightRegionDao rightRegionDao;
	@Resource
	EvaluateDao evaluateDao;
	@Resource
	GroupsDao userGroupsDao;
	@Resource
	PracticeTaskDao practiceTaskDao;
	@Resource
	KnowledgeDao knwoledgeDao;
	@Resource
	PracticeRecordService practiceRecordService;
	@Resource
	LogDao logDao;
	@Resource
	RecruitInfoDao recruitInfoDao;
	@Resource
	NoticeDao noticeDao;
	@Resource
	TeacherService teacherService;
	@Resource
	TeacherDao teacherDao;
	@Resource
	TrainDetailDao trainDetailDao;
	public static String tempMsg = "";
	
	public static final String URL = Constants.ServerURL;
	public static final String TechnicalSupportPhone = Constants.TechnicalSupportPhone;
	public static final String TechnicalSupportQQ = Constants.TechnicalSupportQQ;
	/**
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return xml
	 */
	public String processRequest(HttpServletRequest request) {
		
		// xml格式的消息数据

		String respXml = null;
		// 默认返回的文本消息内容
		String respContent = "";
		// 定义两个变量，判断整周实训的任务，不重复显示任务名称
		String lastTask = "last";
		String currentTask = "";
		int countFiles = 1;
		try {
			// 调用parseXml方法解析请求消息
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			// 发送方帐号
			// String accountId = request.getParameter("accountId");
			String fromUserName = requestMap.get("FromUserName");
			// 开发者微信号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			// 回复文本消息
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			// 文本消息
			List<Student> stu = new ArrayList<Student>();
			//判断是老师登录还是学生登录
			List<Teacher> tea = teacherDao.selectTeacherByWx(fromUserName);
			//声明变量用来判断用户状态和角色 教师ROLE_TEACHER，学生ROLE_STUDENT ，院长ROLE_LEADER_COLLEGE未绑定用户ROLE_NULL, 2015年6月25日 09:56:07 邢志武
			String loginState="ROLE_TEACHER";
			//String org_level=DictionaryService.findOrg(tea.get(0).getDept_id()).getOrg_level();
			List<String> tea_roles=new ArrayList<String>();
			if(tea.size()>0){
				tea_roles=this.teacherDao.getTea_role(tea.get(0).getId());
			}
			//判断老师身份（院级领导）
			if(tea_roles.contains("ROLE_LEADER")){
				if(tea_roles.contains("ROLE_LEADER_COLLEGE")){
					loginState="ROLE_LEADER_COLLEGE";
				}
			}
			if(tea.size()==0){
			 stu = studentDao.selectByWx(fromUserName);
			 loginState="ROLE_STUDENT";
			}
			//用户未绑定
			if(tea.size()==0&&stu.size()==0){
				 loginState="ROLE_NULL";
			}
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				String content = BCConvert.SBC2DBC(
						requestMap.get("Content").toUpperCase()).trim();
				String[] yewu = content.split("#"); // 业务
				// 将命令存入数组中，然后判断回复文本是否在文本中，若location大于0,则存在，小于0,则不存在
				String[] arrays = new String[] { "rwcx", "sxzt", "cxsq",
						"xxhd", "grzl", "zxcy", "xzqy", "wdjc", "sxjl", "wjdc","help","bd" };
				String[] array = new String[] { "tzgg", "zpxx", "yzp" };
				Arrays.sort(arrays);
				Arrays.sort(array);
				NewsMessage newsMessage = new NewsMessage();
				newsMessage.setToUserName(fromUserName);
				newsMessage.setFromUserName(toUserName);
				newsMessage.setCreateTime(new Date().getTime());
				newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
				List<Article> articleList = new ArrayList<Article>();
				//判断是否绑定过微信（格式是否正确）
				if((stu.size()==0&&tea.size()==0)&&!yewu[0].equalsIgnoreCase("bd")&&!yewu[0].equalsIgnoreCase("bdt")){
					 Article article = new Article(); 
					 article.setTitle("用户绑定");  
	                 article.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20160121/21/17832370120160121210433087.png?787x441_130");  
	                 Article article1 = new Article();
	                 articleList.add(article);  
	                 article1.setTitle("学生用户绑定");  
	                 article1.setDescription("绑定说明");  
	                 article1.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20160121/21/17832370120160121210433087.png?787x441_130");  
	                 article1.setUrl(URL+"/weixin/bd_student.do?wx_code="+fromUserName);
	                 articleList.add(article1);  
	                 Article article2 = new Article();  
	                 article2.setTitle("教师用户绑定");  
	                 article2.setDescription("绑定说明");  
	                 article2.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20160121/21/17832370120160121210433087.png?787x441_130");  
	                 article2.setUrl(URL+"/weixin/bd_teacher.do?wx_code="+fromUserName);
	                 articleList.add(article2);  
	                 // 设置图文消息个数
					newsMessage.setArticleCount(articleList.size());
					// 设置图文消息包含的图文集合
					newsMessage.setArticles(articleList);
					// 将图文消息对象转换成xml字符串
					respContent = MessageUtil.messageToXml(newsMessage);
				}
				else{  
					//location 是命令的集合返回的值，若location大于0,则存在，小于0,则不存在
					int location = Arrays.binarySearch(arrays,content.toLowerCase());
						if (yewu.length == 2) {
							//绑定学生
							if (yewu[0].equalsIgnoreCase("bd")) {
								// 通过微信号查找单个学生byWx 
								String s = stuBind.selectByWx(fromUserName);
								if (s.equals("true")) {
									respContent = "您已经成功绑定"
											+ stu.get(0).getStu_code()
											+ "学生信息，请不要重复绑定。";
								} else if (s.equals("false")) {
									//根据*分割
									String[] yewucon = yewu[1].split("\\*");
									if (yewucon.length == 4) {
										String result = stuBind.studentBind(
												fromUserName, yewucon[0],
												yewucon[1], yewucon[2], yewucon[3]);
										if (result.equals("true")) {
											respContent = "恭喜您已经成功绑定/微笑";
										} else if (result.equals("false")) {
											respContent = "";
											respContent = "对不起，您的信息有误，请核对后重新绑定。/撇嘴\n如有疑问请咨询加qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
										} else if (result.equals("no")) {
											respContent = "";
											respContent = "对不起，绑定失败，请稍后再试。/难过\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
										}
									} else {
										respContent = "请确认信息正确，“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
									}
								} else {
									respContent = "个人资料信息有误，请告知管理员";
								}
							}else{
								//绑定老师
								String s = stuBind.selectTeacherByWx(fromUserName);
								if (s.equals("true")) {
									respContent = "您已经成功绑定"
											+ tea.get(0).getTea_code()
											+ "教师信息，请不要重复绑定。";
								} else if (s.equals("false")) {
									String[] yewucon = yewu[1].split("\\*");
									if (yewucon.length == 3) {
										String result = stuBind.TeacherBind(
												fromUserName, yewucon[0],
												yewucon[1], yewucon[2]);

										if (result.equals("true")) {
											respContent = "恭喜您已经成功绑定/微笑";
										} else if (result.equals("false")) {
											respContent = "";
											respContent = "对不起，您的信息有误，请核对后重新绑定。/撇嘴\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
										} else if (result.equals("no")) {
											respContent = "";
											respContent = "对不起，绑定失败，请稍后再试。/难过\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
										}
									} else {
										respContent = "“bdt#教工号*姓名*实践教学系统登录密码”进行绑定";
									}
								} else {
									respContent = "个人资料信息有误，请告知管理员";
								}
							
							}
						} 
						if(loginState.equals("ROLE_STUDENT")){
							// 实习状态 by ccc 20150128
							if (content.equalsIgnoreCase("sxzt")) {
								if (stu.size() == 1) {
									Student student=DictionaryService.findStudent(stu.get(0).getId());
									String state = student.getPractice_state();
									/*if (state == null) {// 当前如果没有状态
										respContent = "您好，您还没有实习状态,请回复下列数字进行修改" + "\n";
										// 从字典表里按键值对取出实习状态
										TreeMap<String, StuGraState> mapState = new TreeMap<String, StuGraState>();
										mapState = DictionaryService.getStuGraStateName();
										for (String key : mapState.keySet()) {
											respContent = respContent.trim() + "\n" + key
													+ mapState.get(key).getStateDesc()
													+ "\n";
										}
									} else {// 如果有状态，要修改
										respContent = "/微笑"
												+ "您好，您的实习状态为：\n"
												+ "【"+state+"】"
												+ DictionaryService.findStuGraStateName(
														state).getStateDesc() + "\n"
												+ "可回复下列对应数字修改" + "\n";
										TreeMap<String, StuGraState> map = new TreeMap<String, StuGraState>();
										map = DictionaryService.getStuGraStateName();
										for (String key : map.keySet()) {
											respContent = respContent.trim() + "\n" + key
													+ map.get(key).getStateDesc() + "\n";
										}
									}*/
									Article article = new Article(); 
									article.setTitle("实习状态");  
					                article.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20160121/21/17832370120160121210433087.png?787x441_130");  
					                article.setUrl(URL+"/weixin/sxzt.do?wx_code="+fromUserName);
					                 articleList.add(article);  
					                 // 设置图文消息个数
									newsMessage.setArticleCount(articleList.size());
									// 设置图文消息包含的图文集合
									newsMessage.setArticles(articleList);
									// 将图文消息对象转换成xml字符串
									respContent = MessageUtil.messageToXml(newsMessage);
								}
							}
							//在校生预留口~
							else if (content.equalsIgnoreCase("zc")) {
								 Student student=DictionaryService.findStudent(stu.get(0).getId());
								 Article article = new Article();  
				                 article.setTitle("在校生尝鲜版~");  
				                 article.setDescription("实践教学管理---啦啦啦~德玛西亚~");  
				                 article.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20160121/21/17832370120160121210433087.png?787x441_130");  
				                 article.setUrl(URL+ "/weixin/sjjx_test.do?stu_id="+student.getId());  
				                 articleList.add(article);  
				                 // 设置图文消息个数
								newsMessage.setArticleCount(articleList.size());
								// 设置图文消息包含的图文集合
								newsMessage.setArticles(articleList);
								// 将图文消息对象转换成xml字符串
								respContent = MessageUtil.messageToXml(newsMessage);	
							}
							// 信息核对 by ccc20150128
							else if (content.equalsIgnoreCase("xxhd")) {	 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									List<InfoCheckRecord> infos = infoCheckRecordDao
											.selectByStu(student.getId());
									if (infos.size() == 0) {
										respContent = ("您还没有信息核对任务");
									} else {
										for (int i = 0; i < infos.size(); i++) {
											respContent = respContent.trim()
													+ "\n/微笑"+ DictionaryService.findPracticeTask(infos.get(i).getChecktask_id()).getTask_name()
													+ ",请仔细<a href='" + URL
													+ "/weixin/checkInformation.do?stu_id="
													+ student.getId() + "&infos="
													+ infos.get(i).getChecktask_id()
													+ "&infoid=" + infos.get(i).getId()
													+ "'>[核对]</a>\n";
										}
									}
								} else {
									respContent = "核对有误，请告知管理员";
								}
							}
							// 专家回复 by 邢志武 2015年6月10日 14:42:16
							else if (content.equalsIgnoreCase("zjhf")) {	
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									String stu_id = student.getId();
									// 获取当前学生未得到回复的问题
									List<Knowledge> Knowledges = this.knwoledgeDao
											.getUnAnswerQuestionForStu(stu_id);
									if (Knowledges.size() == 0) {
										respContent = "您还未有提问问题";
									} else {
										for (int i = 0; i < Knowledges.size(); i++) {
											String answerer_id=Knowledges.get(i).getAnswerer();
											if(!answerer_id.equals(null)&&!answerer_id.equals("选择专家")){
												String answerTeacher = DictionaryService
														.findTeacher(answerer_id)
														.getTrue_name();
												String answerState = "<a href='"
														+ URL+ "/weixin/toQueryExpertQuiz.do?question_id="
														+ Knowledges.get(i).getId() + "'>"
														+ answerTeacher + "老师已回复</a>";
												String question = Knowledges.get(i).getQuestion();
												if (Knowledges.get(i).getAnswer_time() == null) {
													answerState = answerTeacher + "老师尚未回复";
												}
												respContent += "问题" + (i + 1) + ":" + "\n"
														+ question + "\n(" + answerState + ")"
														+ "\n";
											
											}
										}
									}
								} else {
									respContent = "核对有误，请告知管理员";
								}
							}
							//help技术支持
							else if(content.equalsIgnoreCase("help")){
								respContent="问题反馈：\nQQ群:"+TechnicalSupportQQ+"\n手机:"+TechnicalSupportPhone;
							}
							// 企业老师维护 by 邢志武 2015年6月14日 10:47:25
							else if (content.equalsIgnoreCase("qylswh")) {	
								 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									PracticeRecord prd = practiceRecordDao.getPrecordUndimission_time(student.getId());
									if (prd != null) {
											if (prd.getCheck_state().equals("0")) {
												respContent = respContent.trim()
														+ "您的实习申请尚未通过，还不能进行企业老师维护！";
											} else if (prd.getCheck_state()
													.equals("2")) {
												respContent = respContent.trim()
														+ "您的实习申请失败，不能进行企业老师维护！";
											} else {
												respContent = respContent.trim()+ "请点击<a href='"+ URL+ "/weixin/toComTeacherMaintain.do?stu_id="
														+ student.getId() + "'>企业老师维护</a>";
											}
									} else {
										respContent = respContent.trim()
												+ "您还没有实习申请，不能进行企业老师维护！";
									}
								} else {
									respContent = "核对有误，请告知管理员";
								}
							}
							// 修改实习状态回复实习状态前的数字即可 by ccc20150128
							else if (content.length() == 3
									&& Common.isNumeric(content.substring(0, 2))) {	 
								if(stu.size()==0){
									respContent="请输入“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定";
								}else{
									Student student=DictionaryService.findStudent(stu.get(0).getId());
									String stu_id = stu.get(0).getId();
								TreeMap<String, StuGraState> map = new TreeMap<String, StuGraState>();
								map = DictionaryService.getStuGraStateName();
								StuGraState ss = DictionaryService.findStuGraStateName(content);
							
								
								
								if(ss==null){respContent="请正确回复实习状态编码";}else{
									//查询是否有有效的实习申请
									PracticeRecord pracRec=this.practiceRecordService.getValidPracticeTask(stu_id);
									//判断修改状态为正在实习时，是否有实习任务
									if(content.equals("130")&&pracRec==null){
										respContent="您还没有实习申请，请先进行实习申请";
									}else{
										for (String key : map.keySet()) {
											respContent = respContent.trim() + "\n" + key
													+ map.get(key).getStateDesc() + "\n";
										}
										// 邢志武修改 更新日志表 2015年6月17日 19:58:55
										String stu_trueName = DictionaryService.findStudent(stu_id).getTrue_name();
										student.setPractice_state(content);
										List<PracticeTask> practiceTask = this.practiceTaskDao.getTaskByStuIdAndType(stu_id, "1");
										String practiceTask_id = practiceTask.get(0).getId();
										int logCount = logDao.getStuLogCont(stu_id);
										Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时
										DateFormat format = new SimpleDateFormat(
												"yyyy/MM/dd HH:mm:ss");// 设置显示格式
										String nowTime = format.format(dt);
										Timestamp time = new Timestamp(System.currentTimeMillis());
										try {
											time = new Timestamp(format.parse

											(nowTime).getTime());
										} catch (ParseException e) {
											e.printStackTrace();
										}
										// 生成新的日志信息
										Log newLog = new Log();
										newLog.setStu_id(stu_id);
										newLog.setPractice_id(practiceTask_id);
										newLog.setLog_type("1");
										newLog.setPractice_state(content);
										newLog.setUser_id(stu_trueName);
										newLog.setOperate_time(time);
										if (logCount != 0) {
											// 存在以前的日志信息，现更新，后插入
											Log oldLog = this.logDao.getOldLog(stu_id);
											oldLog.setEnd_time(time);
											this.logDao.update(oldLog);
											this.logDao.insert(newLog);
										} else {
											// 不存在日志信息，直接插入新的数据
											this.logDao.insert(newLog);
										}
										int i = studentDao.updatePractice(student);
										if (i == 1) {
											student.setPractice_state(content);
											DictionaryService.updateStudent(student);
											DictionaryService.findStuGraStateName(content)
													.getStateDesc();
											respContent = "/微笑"
													+ "您好，您的实习状态已修改为"
													+ content
													+ DictionaryService
															.findStuGraStateName(content)
															.getStateDesc();
										} else {
											respContent = "请输入正确的数字序号";
										}
										}
									}
								
							}} // 查询实习申请 by ccc20150128
							else if (content.equalsIgnoreCase("cxsq")) {	 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									List<PracticeRecord> prd = practiceRecordDao
											.selectPrecord(student.getId());
									if (prd.size() != 0) {
										for (int i = 0; i < prd.size(); i++) {
											if (prd.get(i).getIs_netsign().equals("1")) {
												prd.get(i).setIs_netsign("可网签");
											} else if (prd.get(i).getIs_netsign()
													.equals("2")) {
												prd.get(i).setIs_netsign("不可网签");
											} else {
												prd.get(i).setIs_netsign("不确定是否可网签");
											}
											if (prd.get(i).getIs_contract().equals("1")) {
												prd.get(i).setIs_contract("可签合同");
											} else if (prd.get(i).getIs_contract()
													.equals("2")) {
												prd.get(i).setIs_contract("不可签合同");
											} else {
												prd.get(i).setIs_contract("不确定是否可签合同");
											}

											if (prd.get(i).getCheck_state().equals("0")) {
												respContent = respContent.trim()
														+ "\n"
														+ "未审核的申请/撇嘴"
														+ "\n"
														+ DictionaryService
																.findPracticeTask(
																		prd.get(i)
																				.getPractice_id())
																.getTask_name()
														+ "\n"
														+ "详细信息如下:"
														+ "\n"
														+ "申请公司:"
														+ DictionaryService.findCompany(
																prd.get(i).getCompany_id())
																.getCom_name() + "\n"
														+ prd.get(i).getIs_contract()
														+ "\n" + prd.get(i).getIs_netsign()
														+ "\n" + "企业指导教师:"
														+ prd.get(i).getCom_teacher()
														+ "\n" + "企业指导老师电话:"
														+ prd.get(i).getCom_phone() + "\n"
														+ "公司所在地:"
														+ prd.get(i).getCom_orgion() + "\n"
														+ "工作所在地:"
														+ prd.get(i).getWork_orgion()
														+ "\n" + "-------";
											} else if (prd.get(i).getCheck_state()
													.equals("1")) {
												respContent = respContent.trim()
														+ "\n"
														+ "已通过的申请/微笑"
														+ "\n"
														+ DictionaryService
																.findPracticeTask(
																		prd.get(i)
																				.getPractice_id())
																.getTask_name()
														+ "\n"
														+ "详细信息如下:"
														+ "\n"
														+ "申请公司:"
														+ DictionaryService.findCompany(
																prd.get(i).getCompany_id())
																.getCom_name() + "\n"
														+ prd.get(i).getIs_contract()
														+ "\n" + prd.get(i).getIs_netsign()
														+ "\n" + "企业指导教师:"
														+ prd.get(i).getCom_teacher()
														+ "\n" + "企业指导老师电话:"
														+ prd.get(i).getCom_phone() + "\n"
														+ "公司所在地:"
														+ prd.get(i).getCom_orgion() + "\n"
														+ "工作所在地:"
														+ prd.get(i).getWork_orgion()
														+ "\n" + "-------";
											} else if (prd.get(i).getCheck_state()
													.equals("2")) {
												respContent = respContent.trim()
														+ "\n"
														+ "未通过的申请/难过"
														+ "\n"
														+ DictionaryService
																.findPracticeTask(
																		prd.get(i)
																				.getPractice_id())
																.getTask_name()
														+ "\n"
														+ "详细信息如下:"
														+ "\n"
														+ "申请公司:"+ "\n"
														+ DictionaryService.findCompany(prd.get(i).getCompany_id())
																.getCom_name() + "\n"+ prd.get(i).getIs_contract()
														+ "\n" + prd.get(i).getIs_netsign()+ "\n" + "企业指导教师:"+ prd.get(i).getCom_teacher()
														+ "\n" + "企业指导老师电话:"+ prd.get(i).getCom_phone() + "\n"
														+ "公司所在地:"+ prd.get(i).getCom_orgion() + "\n"
														+ "工作所在地:"+ prd.get(i).getWork_orgion()+ "\n" + "未通过的原因:"+ prd.get(i).getNote() + "\n"
														+ "-------";
											}
										}
									} else {
										respContent = "您好，您还没有待审核的实习申请";
									}
								} else {
									respContent = "对不起身份错误";
								}
							}// 查询实习记录by ccc20150128
							else if (content.equalsIgnoreCase("sxjl")) {	 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									List<PracticeRecord> practiceRecord = practiceRecordService
											.selectByStu_idDisstime(student.getId());
									if (practiceRecord.size() == 0) {
										respContent = "您还未有实习申请记录";
									} else {
										for (int i = 0; i < practiceRecord.size(); i++) {
											respContent = respContent.trim()
													+ "请如实填写"
													+ DictionaryService.findPracticeTask(
															practiceRecord.get(i)
																	.getPractice_id())
															.getTask_name()
													+ "实习记录\n<a href='" + URL
													+ "/weixin/practiceState.do?stu_id="
													+ student.getId() + "&praid="
															+ practiceRecord.get(i)
															.getPractice_id()+ "&pd="
																	+ practiceRecord.get(i)
																	.getId()
													+ "'>【修改实习记录】</a>";
										}
									}
								} else {
									return "核对有误，请告知管理员";
								}
							}// 查询我的奖惩 by ccc20150128
							else if (content.equalsIgnoreCase("wdjc")) {	 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									respContent = respContent.trim()
											+ (String.valueOf(Character.toChars(0x1F31F)) + "我的奖惩:\n");
									List<Evaluate> evaluates = evaluateDao
											.selectEvaluate(stu.get(0).getId());
									if (!(evaluates.size() == 0)) {
										for (int i = 0; i < evaluates.size(); i++) {
											respContent = respContent
													+ "\n/微笑"
													+ "任务名称:"
													+ "\n"
													+ DictionaryService.findPracticeTask(
															evaluates.get(i)
																	.getPractice_id())
															.getTask_name()
													+ "\n"+ "【时       间】"+ formatTimestamp(evaluates.get(i)
															.getTime())
													+ "\n"+ "【地       点】"
													+ evaluates.get(i).getPlace()
													+ "\n"+ "【分       数】"
													+ evaluates.get(i).getScore()
													+ "\n"+ "【描       述】"
													+ evaluates.get(i).getDescription()
													+ "\n"+ "【创  建 人】"
													+ DictionaryService.findTeacher(
															evaluates.get(i).getTea_id())
															.getTrue_name() + "\n"
													+ "-----";
										}
									} else {
										respContent = "您还没有个人奖惩";
									}
								} else {
									respContent = "您的个人资料有错";
								}
							} else if (content.equalsIgnoreCase("rwcx")) {
								 
								if (stu.size() == 1) {
									String user_id = stu.get(0).getId();
									Student student=DictionaryService.findStudent(stu.get(0).getId());;
									List<Groups> practice_id = userGroupsDao
											.selectPractice_code(user_id);
									int k = 0;
									if (practice_id.size() != 0) {
										for (int i = 0; i < practice_id.size(); i++) {
											List<PracticeTask> pt = practiceTaskDao
													.selectTask_name(practice_id.get(i)
															.getPractice_id());
											if (pt.size() != 0) {
												for (int j = 0; j < pt.size(); j++) {
													if (pt.get(j).getTask_type().equals("1")) {
														pt.get(j).setTask_type("校外实习");
													} else if (pt.get(j).getTask_type().equals("2")) {
														pt.get(j).setTask_type("整周实训");
													} else if (pt.get(j).getTask_type().equals("3")) {
														pt.get(j).setTask_type("信息核对");
													} else if (pt.get(j).getTask_type().equals("4")) {
														pt.get(j).setTask_type("信息填报");
													}
													k++;
													respContent = respContent
															+ String.valueOf(Character
																	.toChars(0x1F31F))
															+ "任务 "
															+ k
															+ "：\n"+ "【任务名称】\n"
															+ "   "+ pt.get(j).getTask_name()
															+ "\n"+ "【任务描述】\n"
															+ "   "+ pt.get(j).getTask_desc()
															+ "\n"+ "【任务地点】\n"
															+ "   "+ pt.get(j).getTask_place()
															+ "\n"+ "【任务类型】\n"
															+ "   "+ pt.get(j).getTask_type()
															+ "\n"+ "【任务时间】\n"
															+ formatTimestamp(pt.get(j).getBegin_time())
															+ "至"+ formatTimestamp(pt.get(j)
																	.getEnd_time()) + "\n";
												}
											} else {
												respContent = "您还没有有效的实习任务";
											}
										}
									} else {
										respContent = "您所在的小组还未有实习任务";
									}
								}
							}// 绑定微信号与实践教学web端 by ccc20150128
							else if (content.equalsIgnoreCase("绑定")) {	 
								if (stu.size() == 1) {
									respContent = "对不起，您已绑定至学号" + stu.get(0).getStu_code()
											+ ",请勿重复绑定";
								}else if(tea.size()==1){
									respContent = "对不起，您已绑定至教工号" + tea.get(0).getTea_code()
											+ ",请勿重复绑定";
								}
								else {
									respContent = String
											.valueOf(Character.toChars(0x1F31F))
											+ "您好，请输入“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定";
								}
							}// 查询个人资料 并修改 by ccc20150128
							else if (content.equalsIgnoreCase("grzl")) {	 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									respContent = String
											.valueOf(Character.toChars(0x1F31F))
											+ student.getTrue_name()
											+ "的个人资料"+ ("\n")+ ("QQ：\n")
											+ student.getQqnum()
											+ "\n"+ "Email：\n"
											+ student.getEmail()
											+ "\n"+ "电话：\n"+ student.getPhone()
											+ "\n"+ "家庭住址：\n"+ student.getHome_addr()
											+ "\n"+ "家庭电话：\n"+ student.getHome_phone()
											+ "\n"+ "如QQ,Email信息有误,<a href='"
											+ URL+ "/weixin/updatePersonal.do?stu_id="
											+ student.getId() + "'>[点击此处进行修改]</a>";

								} else {
									respContent = "个人资料信息有误，请告知管理员";
								}
							} // 在线测验 by ccc20150128
							else if (content.equalsIgnoreCase("zxcy")) {	 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									respContent = "/微笑" + "您好" + student.getTrue_name()
											+ "同学,请根据实际情况完成您的\n<a href='" + URL
											+ "/zxcy/home.htm?name="
											+ student.getStu_code() + "&pwd="
											+ student.getLogin_pass() + "'>在线测验</a>";
								}
							}
							// 问卷调查 by ccc20150401
							else if (content.equalsIgnoreCase("wjdc")) {	 
								if (stu.size() == 1) {Student student=DictionaryService.findStudent(stu.get(0).getId());;
									respContent = "/微笑" + "您好" + student.getTrue_name()
											+ "同学,请根据实际情况完成您的\n<a href='" + URL
											+ "/wjdc/user/home.htm?name="
											+ student.getStu_code() + "&pwd="
											+ student.getLogin_pass() + "'>问卷调查</a>";
								}
							}
							// 添加企业信息 by ccc20150128
							else if (content.equalsIgnoreCase("xzqy")) {	 
								if (stu.size() == 1) { Student student=DictionaryService.findStudent(stu.get(0).getId());;
									respContent = "/微笑" + "请按要求真实的填写单位详情。\n<a href='" + URL
											+ "/weixin/addCompany.do?stu_id="
											+ student.getId() + "'>【新增】</a>";
								} else {
									respContent = "个人信息有误请确认已绑定";
								}
							} else // 绑定学生身份功能
								if (yewu.length == 2) {
									 
									if (yewu[0].equalsIgnoreCase("bd")) {
										String s = stuBind.selectByWx(fromUserName);
										if (s.equals("true")) {
											respContent = "您已经成功绑定"
													+ stu.get(0).getStu_code()
													+ "学生信息，请不要重复绑定。";
										} else if (s.equals("false")) {
											String[] yewucon = yewu[1].split("\\*");
											if (yewucon.length == 4) {
												String result = stuBind.studentBind(
														fromUserName, yewucon[0],
														yewucon[1], yewucon[2], yewucon[3]);

												if (result.equals("true")) {
													respContent = "恭喜您已经成功绑定到学号"
															+ yewucon[0] + "/微笑";
												} else if (result.equals("false")) {
													respContent = "";
													respContent = "对不起，您的信息有误，请核对后重新绑定。/撇嘴\n如有疑问请咨询qq:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
												} else if (result.equals("no")) {
													respContent = "";
													respContent = "对不起，绑定失败，请稍后再试。/难过\n如有疑问请咨询qq:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
												}
											} else {
												respContent = "“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定";
											}
										} else {
											respContent = "个人资料信息有误，请告知管理员";
										}
									}
								} else{
									String tempKey =DictionaryService.findStudent(stu.get(0).getId()).getTempKey();
									int locationtempkey = Arrays.binarySearch(array,
										tempKey.toLowerCase());
									if (tempKey.equalsIgnoreCase("yzp") && location < 0
										&& !content.equalsIgnoreCase("bd")) {	 
									if (stu.size() == 0) {
										respContent = "“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定";
									} else {
										if (content.length() <= 5
												&& content.substring(0, 3)
														.equalsIgnoreCase("YZP")) {
											if (content.length() == 4
													&& Common.isNumeric(content.substring(
															3, 4))) {
												if (Integer.parseInt(content
														.substring(3, 4)) <= 9
														&& Integer.parseInt(content
																.substring(3, 4)) >= 1) {
													tempMsg = "0" + content.substring(3, 4);
													respContent = "你选择了上传到" + tempMsg
															+ "月，请上传照片。";
												} else {
													respContent = "月份填写错误！";
												}
											} else if (content.length() == 5
													&& Common.isNumeric(content.substring(
															3, 5))) {
												if (Integer.parseInt(content
														.substring(3, 5)) <= 12
														&& Integer.parseInt(content
																.substring(3, 5)) >= 1) {
													tempMsg = content.substring(3, 5);
													respContent = "你选择了上传到" + tempMsg
															+ "月，请上传照片。";
												} else {
													respContent = "月份填写错误！";
												}
											} else {
												respContent = "格式错误！";
											}

										} else {
											respContent = "正确回复所要上传的月份";
										}
									}
								}
								else if ((tempKey.equalsIgnoreCase("tzgg") || tempKey.equalsIgnoreCase("zpxx"))	&& !content.equalsIgnoreCase("bd") && location < 0) {
									// 判断此学生是否存在
									if (stu.size() == 1) {
										Student student = DictionaryService.findStudent(stu.get(0).getId());
										if (tempKey.equalsIgnoreCase("tzgg")) {
											// 如果回复了上一页下一页取出页数，直接筛选
											if (content.equals("上一页")|| content.equals("下一页")|| Common.isNumeric((content.substring(
															1, content.length() - 1)))&& content.substring(0, 1).equals("第")
													&& content.substring(content.length() - 1,content.length()).equals("页")) {
												String stu_id = student.getId();
												Timestamp time = DictionaryService
														.findStudent(stu_id)
														.getCurrent_notice_read();// studentDao.ByID(student.getId()).getCurrent_notice_read();
												// 通过班级编号和组织级别选出系
												String department_id = orgDao
														.selectOrgByCocde(
																DictionaryService
																		.findOrg(
																				student.getClass_id())
																		.getOrg_code(), "5")
														.getParent_id();
												// 通过系和组织级别选出学院
												String college_id = orgDao.selectOrgByCocde(DictionaryService.findOrg(
																		department_id).getOrg_code(), "3").getParent_id();
												// 获得该学院的该同学的通知条数
												int countAllNotice = noticeDao
														.selectNoticecount(college_id,
																student.getId());
												int current_notice_page = DictionaryService
														.findStudent(stu_id)
														.getCurrent_notice_page();
												// 判断微信当前页码是否有效，并返回要显示的通知页码
												current_notice_page = Common
														.check_current_notice_page(
																current_notice_page,
																countAllNotice, content,
																student);
												if (current_notice_page == -5) {
													respContent = "请正确回复第*页查看，*为页码，如第1页";
												} else if (current_notice_page == -2) {
													respContent = "没有下一页了，请回复上一页或者第*页查看，*为页码，如第1页";
												} else if (current_notice_page == -3) {
													respContent = "没有上一页了，请回复下一页或者第*页查看，*为页码，如第1页";
												} else if (current_notice_page == -4) {
													respContent = "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
												} else {// 其他情况皆为有效页码，根据该用户的当前页码，显示通知

													List<Notice> noticeList = new ArrayList<Notice>();
													if (current_notice_page == -1) {
														respContent = "您已查看至首页";
													} else {
														// 获取通知
														noticeList = noticeDao.getNoticesByRangesALL(college_id,stu_id,current_notice_page);
														// noticeList.addAll(noticeColleges);
														String notice_type = "";
														if (noticeList.size() > 0) {
															for (int i = 0; i < noticeList
																	.size(); i++) {
																notice_type = noticeList
																		.get(i)
																		.getNotice_type();
																if (notice_type
																		.equalsIgnoreCase("1")) {// 院级通知
																	notice_type = "院级通知";
																}
																if (notice_type
																		.equalsIgnoreCase("2")) {
																	notice_type = "指导老师通知";
																}
																if (notice_type
																		.equalsIgnoreCase("3")) {
																	notice_type = "信息核对通知";
																}
																// 拼接显示字符串
																respContent = respContent
																		.trim()
																		+ (String
																				.valueOf(Character
																						.toChars(0x1F31F)))
																		+ "第"
																		+ (current_notice_page + 1)
																		+ "条通知:\n"
																		+ "【通知类型】"
																		+ notice_type
																		+ "\n"
																		+ "【通知时间】"
																		+ "\n"
																		+ formatTimestamp(noticeList
																				.get(i)
																				.getCreate_time())
																		+ "\n"
																		+ "【通知标题】 "
																		+ "\n"
																		+ noticeList.get(i)
																				.getTitle()
																		+ "\n"
																		+ "【通知内容】 "
																		+ "\n"
																		+ noticeList
																				.get(i)
																				.getContent();
																if (content
																		.equalsIgnoreCase("下一页")) {
																	student.setCurrent_notice_read(noticeList
																			.get(i)
																			.getCreate_time());
																	if (noticeList
																			.get(i)
																			.getCreate_time()
																			.compareTo(time) > 0) {// 注释
																		studentService
																				.update(student);
																		DictionaryService
																				.updateStudent(student);
																	}
																}
															}
														} else {
															respContent = respContent
																	+ "您没有可读的通知公告了，请回复上一页或第*页，如第1页";
														}
													}
												}
											} else {
												respContent = "请您正确回复上一页下一页或第*页例如第1页";
											}
										} else  if(tempKey.equalsIgnoreCase("zpxx")){// 当菜单key为zpxx时
										{
											Timestamp time = DictionaryService.findStudent(
													student.getId())
													.getCurrent_recruit_read();
											// 不等于上一页下一页的时候
											if (((RecruitInfo.newcontent
													.equalsIgnoreCase(RecruitInfo.oldcontent) || !RecruitInfo.newcontent
													.equalsIgnoreCase(RecruitInfo.oldcontent)))
													&& !content.equals("上一页")
													&& !content.equals("下一页")
													&& !content.substring(0, 1).equals("第")) {
												RecruitInfo.newcontent = content.toLowerCase();
												if (RecruitInfo.newcontent.equalsIgnoreCase("znts")) {
													// 已经读过的通知公告里的招聘信息
													int znts = noticeDao.selectCountTime(
															student.getId(), time);
													// 所有的读过的通知公告里的招聘信息
													int Allznts = noticeDao
															.selectALLZnts(student.getId());
													student.setCurrent_recruitInfo_page(znts);
													DictionaryService
															.updateStudent(student);
													int page = DictionaryService
															.findStudent(student.getId())
															.getCurrent_recruitInfo_page();
													List<Notice> notices = noticeDao
															.selectNoticeByType(
																	student.getId(), time,
																	page);
													if (notices.size() != 0) {
														for (int j = 0; j < notices.size(); j++) {
															respContent = respContent
																	.trim()
																	+ String.valueOf(Character
																			.toChars(0x1F31F))
																	+ "智能推送通知"
																	+ ":\n"
																	+ "【通知标题】"
																	+ "\n"
																	+ notices.get(j)
																			.getTitle()
																	+ "\n"
																	+ "【通知内容】 "
																	+ "\n"
																	+ notices.get(j)
																			.getContent()
																	+ "\n"
																	+ "您一共有"
																	+ Allznts
																	+ "条智能推送,已阅读"
																	+ znts
																	+ "条\n"
																	+ "分页提示：上一页,下一页或第n页例如第1页进行查看";
														}
													} else {
														respContent = String
																.valueOf(Character
																		.toChars(0x1F31F))
																+ "您一共有"
																+ Allznts
																+ "条智能推送,已读"
																+ znts
																+ "条\n"
																+ "分页提示：上一页,下一页或第n页例如第1页进行查看";
													}
												} else if (!RecruitInfo.newcontent
														.equalsIgnoreCase("znts")) {
													String org_id = orgDao.selectListByCode(RecruitInfo.newcontent.toLowerCase());
													if (org_id == null) {
														respContent = "请正确回复字母编码";
													} else {
														// 如果不是只能推送的话,将组织id传进来,
														List<RecruitInfo> recruits = recruitInfoDao
																.getAllRecruitInfosByCollegeAndPage(
																		org_id, 0);
														// 学院招聘信息条数
														int AllzpxxBycolleage = recruitInfoDao
																.selectAllzpxxBycolleage(org_id);
														student.setCurrent_zpxx_page(0);
														DictionaryService
																.updateStudent(student);
														if (recruits.size() == 0) {
															respContent = ("您还没有可查看的招聘信息");
														} else {
															for (int k = 0; k < recruits
																	.size(); k++) {
																respContent = respContent
																		.trim()
																		+ (String
																				.valueOf(Character
																						.toChars(0x1F31F))
																				+( k+1)+"\n"
																				+ "招聘信息通知"
																				+ ":\n"
																				+ "【企业名称】"
																				+ "\n"
																				+ DictionaryService
																						.findCompany(
																								recruits.get(
																										k)
																										.getCom_id())
																						.getCom_name()
																				+ "\n"
																				+ "【岗位名称】"
																				+ "\n"
																				+ recruits
																						.get(k)
																						.getPost_id()
																				+ "\n"
																				+ "【招聘发布时间】"
																				+ "\n"
																				+ formatTimestamp(recruits
																						.get(k)
																						.getCreate_time())
																				+ "\n"
																				+ "【招聘人数】"
																				+ "\n"
																				+ recruits
																						.get(k)
																						.getRecruit_num()
																				+ "\n"
																				+ "【招聘描述】"
																				+ "\n"
																				+ recruits
																						.get(k)
																						.getRecruit_desc()
																				+ "\n"
																				+ "【招聘专业】"
																				+ "\n"
																				+ recruits
																						.get(k)
																						.getRecruit_prof()
																				+ "\n"
																				+ "【开始时间】"
																				+ "\n"
																				+ CoreService
																						.formatTimestamp(recruits
																								.get(k)
																								.getEffect_time())
																				+ "\n"
																				+ "【截止时间】"
																				+ "\n" + CoreService
																					.formatTimestamp(recruits
																							.get(k)
																							.getEnd_time()))
																		+ "\n"
																		+ "一共有"
																		+ AllzpxxBycolleage
																		+ "页，请回复上一页下一页第N页进行查询（n为1,2,3）";

															}

														}
													}
													// 等于上一页下一页的时候
												}
											} else if ((RecruitInfo.newcontent
													.equalsIgnoreCase(RecruitInfo.oldcontent) || !RecruitInfo.newcontent
													.equalsIgnoreCase(RecruitInfo.oldcontent))
													&& (content.equalsIgnoreCase("下一页")
															|| content
																	.equalsIgnoreCase("上一页") || Common
															.isNumeric((content.substring(
																	1, content.length() - 1)))
															&& content.substring(0, 1)
																	.equals("第"))) {
												// 判断一下newcontent是不是znts ,如果是只能推送,页数不一样
												if (RecruitInfo.newcontent
														.equalsIgnoreCase("znts")) {
													// 所有的读过的通知公告里的招聘信息
													int Allznts = noticeDao.selectALLZnts(student.getId());
													int current_znts_page = DictionaryService.findStudent(student.getId()).getCurrent_recruitInfo_page();
													current_znts_page = Common.check_current_recruitInfo_page(current_znts_page,Allznts, content,student);
													if (current_znts_page == -2) {
														respContent = "没有下一页了，请回复上一页或者第*页查看，*为页码，如第1页";
													} else if (current_znts_page == -3) {
														respContent = "没有上一页了，请回复下一页或者第*页查看，*为页码，如第1页";
													} else if (current_znts_page == -4) {
														respContent = "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
													} else if (current_znts_page == -5) {
														respContent = "输入格式不正确，请回复上一页或者下一页，第*页查看，*为页码，如第1页";
													}else{
														if (current_znts_page == -1) {
															respContent = "您已查看至首页";
														} else {
															List<Notice> notices = noticeDao
																	.selectNoticeByTypeNotime(
																			student.getId(),
																			current_znts_page);
															if (notices.size() != 0) {
																for (int j = 0; j < notices
																		.size(); j++) {
																	respContent = respContent
																			.trim()
																			+ String.valueOf(Character
																					.toChars(0x1F31F))
																			+ "第"
																			+ (current_znts_page + 1)
																			+ "条智能推送通知"
																			+ ":\n"
																			+ "【通知标题】"
																			+ "\n"
																			+ notices
																					.get(j)
																					.getTitle()
																			+ "\n"
																			+ "【通知内容】 "
																			+ "\n"
																			+ notices
																					.get(j)
																					.getContent();
																	if (notices
																			.get(j)
																			.getCreate_time()
																			.compareTo(time) > 0) {
																		student.setCurrent_recruit_read(notices
																				.get(j)
																				.getCreate_time());
																		studentDao
																				.update(student);
																		DictionaryService
																				.updateStudent(student);
																	}
																}
															} else {
																respContent = "您已经没有可查看的智能推送，请回复上一页或者第*页例如第1页进行查看";
															}
														}
													}
												} else {
													if (!RecruitInfo.newcontent
															.equalsIgnoreCase("znts")) {
														String org_id = orgDao
																.selectListByCode(RecruitInfo.newcontent
																		.toLowerCase());
														int AllzpxxBycolleage = recruitInfoDao
																.selectAllzpxxBycolleage(org_id);
														int current_zpxx_page = DictionaryService
																.findStudent(
																		student.getId())
																.getCurrent_zpxx_page();
														current_zpxx_page = Common
																.check_current_zpxx_page(
																		current_zpxx_page,
																		AllzpxxBycolleage,
																		content, student);
														if (current_zpxx_page == -2) {
															respContent = "没有下一页了，请回复上一页或者第*页查看，*为页码，如第1页";
														} else if (current_zpxx_page == -3) {
															respContent = "没有上一页了，请回复下一页或者第*页查看，*为页码，如第1页";
														} else if (current_zpxx_page == -4) {
															respContent = "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
														} else if (current_zpxx_page == -1) {
															respContent = "该学院招聘信息已看至首页";
														} else {
															List<RecruitInfo> recruits = recruitInfoDao
																	.getAllRecruitInfosByCollegeAndPage(
																			org_id,
																			current_zpxx_page);
															if (recruits.size() == 0) {
																respContent = ("您已没有可看的招聘信息,请回复下一页上一页或者第N页（N为1,2,3...）查看");
															} else {
																for (int k = 0; k < recruits
																		.size(); k++) {
																	respContent = (String
																			.valueOf(Character
																					.toChars(0x1F31F))
																				+ "第"+( k+2)+ "条\n"
																			+ "招聘信息通知:"
																			+ "\n"
																			+ "【企业名称】"
																			+ "\n"
																			+ DictionaryService
																					.findCompany(
																							recruits.get(
																									k)
																									.getCom_id())
																					.getCom_name()
																			+ "\n"+ "【岗位名称】"
																			+ "\n"+ recruits.get(k).getPost_id()
																			+ "\n"+ "【招聘发布时间】"
																			+ "\n"+ formatTimestamp(recruits.get(k).getCreate_time())
																			+ "\n"+ "【招聘人数】"
																			+ "\n"+ recruits.get(k).getRecruit_num()
																			+ "\n"+ "【招聘描述】"
																			+ "\n"+ recruits.get(k).getRecruit_desc()
																			+ "\n"+ "【招聘专业】"
																			+ "\n"+ recruits.get(k).getRecruit_prof()
																			+ "\n"+ "【开始时间】"
																			+ "\n"+ CoreService.formatTimestamp(recruits.get(k).getEffect_time())
																			+ "\n"+ "【截止时间】"+ "\n" + CoreService
																			.formatTimestamp(recruits.get(k).getEnd_time()));

																}
															}
														}
													}
												}
											} else {
												respContent = "请正确回复第*页(*为1,2,3)";
											}
										}}
									}//我的实训 bY ccc2014年11月22日
								} else if (tempKey.equalsIgnoreCase("wdsx")
										&& Common.isNumeric(content) && location < 0) {
									// 判断学生是否存在
									 
									if (stu.size() == 1) {
										Student student=DictionaryService.findStudent(stu.get(0).getId());;;
										String t = content.substring(0, 2);
										String s = content.substring(2, 4);
										Timestamp ts = new Timestamp(
												System.currentTimeMillis());
										Timestamp times = new Timestamp(
												System.currentTimeMillis());
										String tsStr = (1900 + ts.getYear()) + "-" + t
												+ "-" + s + " " + "00:00:00";
										String time = (1900 + ts.getYear()) + "-" + t + "-"
												+ s + " " + "23:59:59";
										try {
											ts = Timestamp.valueOf(tsStr);
											times = Timestamp.valueOf(time);
										} catch (Exception e) {
											e.printStackTrace();
										}
										// 根据实践任务id选出实践任务是否有效
										List<PracticeTask> ptt = practiceTaskDao
												.selectPracticeTasksPd(stu.get(0).getId());
										if (ptt.size() != 0) {
											// 如果有实践任务，判断
											for (int n = 0; n < ptt.size(); n++) {
												List<TrainDetail> traindetail = trainDetailDao
														.searchTrain(ptt.get(n).getId(),
																ts, times);
												if (traindetail.size() != 0) {
													for (int m = 0; m < traindetail.size(); m++) {
														// 此处判断取出来的时间和系统时间比较
														currentTask = traindetail.get(m)
																.getTask_id();
														if (lastTask
																.equalsIgnoreCase("last")) {
															lastTask = traindetail.get(m)
																	.getTask_id();
															respContent = respContent
																	+ ("/微笑【任务】"
																			+ "\n"
																			+ DictionaryService
																					.findPracticeTask(
																							traindetail
																									.get(m)
																									.getTask_id())
																					.getTask_name() + "\n");
														}
														if (lastTask
																.equalsIgnoreCase(currentTask)) {
															respContent = respContent
																	+ ("【时间】"
																			+ CoreService
																					.formatTimestamp(traindetail
																							.get(m)
																							.getTrain_time())
																			+ "-"
																			+ traindetail
																					.get(m)
																					.getClass_num()
																			+ "\n"
																			+ "【地点】"
																			+ traindetail
																					.get(m)
																					.getTrain_place() + "\n");
														} else {
															lastTask = currentTask;
															respContent = respContent
																	+ "\n"
																	+ "/微笑【任务】"
																	+ "\n"
																	+ DictionaryService
																			.findPracticeTask(
																					traindetail
																							.get(m)
																							.getTask_id())
																			.getTask_name()
																	+ "\n"
																	+ ("【时间】"
																			+ CoreService
																					.formatTimestamp(traindetail
																							.get(m)
																							.getTrain_time())
																			+ "-"
																			+ traindetail
																					.get(m)
																					.getClass_num()
																			+ "\n"
																			+ "【地点】"
																			+ traindetail
																					.get(m)
																					.getTrain_place() + "\n");
														}

													}
												} else {
													respContent = respContent
															+ "\n"+ ("/微笑您的实训任务"+ DictionaryService
																			.findPracticeTask(ptt.get(n).getId())
																			.getTask_name()+ "此时间没有具体 安排\n"+ "------" + "\n");
												}

											}
										} else {
											respContent = respContent + ("您所在的小组未有实践任务\n");
										}

									}
								} else if (!yewu[0].equalsIgnoreCase("bd")
										&& locationtempkey < 0) {// 常见问题的 by ccc 20150128
									 
									if (stu.size() != 1) {
										respContent = "“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定";
									} else {
										Student student = DictionaryService.findStudent(stu.get(0).getId());
										File indexDir = new File(chatService.getIndexDir());
										// 如果索引目录不存在则创建索 引
										if (!indexDir.exists()) {
											int knowlegePage = 1;
											String KnowledgeContent = "";
											if (!content.equalsIgnoreCase("上一页")&& !content.equalsIgnoreCase("下一页")) {
												student.setStucontent(content);
												student.setCurrent_knowlege_page(1);
												DictionaryService.updateStudent(student);
												KnowledgeContent = DictionaryService.findStudent(student.getId()).getStucontent();
												knowlegePage = DictionaryService.findStudent(student.getId()).getCurrent_knowlege_page();
											}
											if (content.equalsIgnoreCase("上一页")
													|| content.equalsIgnoreCase("下一页")) {
												knowlegePage = knowlegePage + 1;
												student.setCurrent_knowlege_page(knowlegePage);
												DictionaryService.updateStudent(student);
											}
											if (stu.size() == 1) {
												if (knowlegePage > chatService.getknowsize(student.getId())) {
													respContent = "已查看至尾页";
												}
												chatService.createIndex(student.getId());
												respContent = chatService.chat("11", "11",
														KnowledgeContent, knowlegePage, 1,
														student.getId());
											}
										} else {
											String KnowledgeContent = DictionaryService.findStudent(student.getId()).getStucontent();
											int knowlegePage = DictionaryService.findStudent(student.getId()).getCurrent_knowlege_page();
											if (!content.equalsIgnoreCase("上一页")&& !content.equalsIgnoreCase("下一页")) {
												student.setStucontent(content);
												student.setCurrent_knowlege_page(1);
												DictionaryService.updateStudent(student);
												KnowledgeContent = DictionaryService.findStudent(student.getId()).getStucontent();
												knowlegePage = DictionaryService.findStudent(student.getId()).getCurrent_knowlege_page();
											}
											if (content.equalsIgnoreCase("上一页")|| content.equalsIgnoreCase("下一页")) {
												if (content.equalsIgnoreCase("上一页")) {
													if (knowlegePage < 0) {
														knowlegePage--;
													} else {
														knowlegePage--;
														student.setCurrent_knowlege_page(knowlegePage);
														DictionaryService
																.updateStudent(student);
													}
												} else {
													if (knowlegePage >= chatService.getknowsize(student.getId())) {
														knowlegePage++;
													} else {
														knowlegePage++;
														student.setCurrent_knowlege_page(knowlegePage);
														DictionaryService.updateStudent(student);
													}
												}
											}
											// 如果索引目录存在则更新索引
											if (stu.size() == 1) {
												if (knowlegePage <= -1) {
													respContent = "已查看至首页";
												} else {
													chatService.updateIndex(student.getId());
													respContent = chatService.chat("11","11", KnowledgeContent,knowlegePage, 1,student.getId());
												}
											}
										}
									}
								}
								}
							//教师菜单
							}else if(loginState.equals("ROLE_TEACHER")){
								// 实习状态 by ccc 20150128
								if (content.equalsIgnoreCase("test")) {
									 Teacher teacher=DictionaryService.findTeacher(tea.get(0).getId());
									 Article article = new Article();  
					                 article.setTitle("实践教学管理教师端尝鲜版~");  
					                 article.setDescription("实践教学管理教师端---啦啦啦~德玛西亚~");  
					                 article.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20160121/21/17832370120160121210433087.png?787x441_130");  
					                 article.setUrl(URL+ "/weixin/sjjx_test.do?teaId="+teacher.getId());  
					                 articleList.add(article);  
					                 // 设置图文消息个数
									newsMessage.setArticleCount(articleList.size());
									// 设置图文消息包含的图文集合
									newsMessage.setArticles(articleList);
									// 将图文消息对象转换成xml字符串
									respContent = MessageUtil.messageToXml(newsMessage);	
								}
								else {
									//教师回复任何内容都回复菜单！2015年6月25日 09:54:29 邢志武
									//教师点击任何按钮都回复菜单！2015年6月25日 09:54:29 邢志武
									Teacher	teacher = DictionaryService.findTeacher(tea.get(0).getId());
									respContent="对不起，您的权限是老师，不能操作学生的功能！ ";
								}
								
							}
							//院领导菜单
							else if(loginState.equals("ROLE_LEADER_COLLEGE")){
								Teacher	teacher = DictionaryService.findTeacher(tea.get(0).getId());
								respContent="对不起，您的权限是老师，不能操作学生的功能！ ";
							}else{
							
								if(respContent.equals("对不起，您的信息有误，请核对后重新绑定。/撇嘴\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone)){
									respContent="对不起，您的信息有误，请核对后重新绑定。/撇嘴\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
								}else if(respContent.equals("对不起，绑定失败，请稍后再试。/难过\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone)){
									respContent="对不起，绑定失败，请稍后再试。/难过\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
								}else if(respContent.equals("请确认信息正确，“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定\n如有疑问请咨询qq群:"
										+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone)){
									respContent="请确认信息正确，“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
								}else if(respContent.equals("恭喜您已经成功绑定/微笑")){
									respContent="恭喜您已经成功绑定/微笑";
								}else
								{//loginState为ROLE_NULL时，无法判断是那种用户，所以统一回复绑定成功！
									respContent="请确认信息正确，学生请输入“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定\n"+"教师请输入“bdt#教工号*姓名*实践教学系统登录密码”进行绑定\n如有疑问请咨询qq群:"
											+TechnicalSupportQQ+"或者直接拨打电话："+TechnicalSupportPhone;
								}
							}
					}
				}
				
			
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				String 		tempKey =DictionaryService.findStudent(stu.get(0).getId()).getTempKey();
				if (tempKey.equalsIgnoreCase("yzp")) {
					 
					if (stu.size() == 0) {
						respContent = "请输入“bd#学号*姓名*身份证号*实践教学系统登录密码”进行绑定";
					} else {
						if (Common.isNumeric(tempMsg)) {
							Calendar cal = Calendar.getInstance();
							int year = cal.get(Calendar.YEAR);
							Timestamp time = new Timestamp(
									System.currentTimeMillis());
							String picurl = requestMap.get("PicUrl");
							String project_path = request.getSession()
									.getServletContext().getRealPath("/");
							String fileurl = project_path
									+ "\\uploadedfiles\\Photos";
							String fileName = "\\" + year + "-" + tempMsg
									+ "001" + fromUserName + ".jpg";
							String postion = fileurl + fileName;
							byte[] btImg = GetImage
									.getImageFromNetByUrl(picurl);
							if (null != btImg && btImg.length > 0) {
								File file = new File(fileurl);
								if (!file.exists()) {// 判断文件目录的存在
									File file2 = new File(file.getParent());
									file2.mkdirs();
								}
								File file1 = new File(fileurl + fileName);
								List<Files> filess = filesDao.selectStuStu_id(
										stu.get(0).getId(), time);
								if (filess.size() != 0) {
									for (int i = 0; i < filess.size(); i++) {
										if (filess.get(i).getFile_name().substring(0, 7).equalsIgnoreCase((year + "-" + tempMsg))) {
											countFiles++;
										}
									}
									String fileNames = "\\" + year + "-"+ tempMsg + "00" + countFiles+ fromUserName + ".jpg";
									GetImage.writeImageToDisk(btImg, fileurl+ fileNames);
								} else {
									GetImage.writeImageToDisk(btImg, fileurl+ fileName);
								}
								String fileNames = year + "-" + tempMsg + "00"
										+ countFiles + fromUserName + ".jpg";
								if (file1.exists()) {
									// 判断文件目录的存在
									Files files = new Files();
									files.setFile_type("4");
									files.setFile_name(fileNames);
									files.setPosition(postion);
									files.setFile_size((float) btImg.length);
									files.setId(Common.returnUUID());
									files.setStu_id(stu.get(0).getId());
									filesService.insertFiles(files);
									respContent = "您已成功上传照片";
								} else {
									Files files = new Files();
									files.setFile_type("4");
									files.setFile_name(fileNames);
									files.setPosition(postion);
									files.setFile_size((float) btImg.length);
									files.setId(Common.returnUUID());
									files.setStu_id(stu.get(0).getId());
									filesService.insertFiles(files);
									respContent = "您已成功上传照片";
								}

							}
						}
					}
				}
			}
			// 语音消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				String format = requestMap.get("Format");
				String recognition = requestMap.get("Recognition");
				String msgID = requestMap.get("MsgID");
				String createTime = requestMap.get("CreateTime");
				respContent = "您发送的是语音消息！" + "时间是" + formatTime(createTime)
						+ "发送方账号=" + fromUserName + "开发者微信号=" + toUserName
						+ "语音格式" + format + "语音识别结果" + recognition + "消息id"
						+ msgID;
			}
			// 视频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)) {
				respContent = "请上传照片";
			}
			// 地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				String locationX = requestMap.get("Location_X");
				String locationY = requestMap.get("Location_Y");
				if(!locationX.equals(null)&&!locationX.equals(null)){
					String s = stuBind.selectByWx(fromUserName);
					if (s.equals("true")) {
						List<Student> stuss = studentDao.selectByWx(fromUserName);
						Student	student = DictionaryService.findStudent(stu.get(0).getId());
						student = stuss.get(0);
						List<Sign> stus = signDao.selectByStuID(student.getId());
						//暂时没用到，存1
						String Precision = "1";
						double Longitudes = Double.parseDouble(locationY);
						double Precisions = Double.parseDouble(Precision);
						double Latitudess = Double.parseDouble(locationX);
						Timestamp timeNow = new Timestamp(System.currentTimeMillis());
						// 对当前时间增加180天的处理 插入合理区域表
						Calendar ccNow = Calendar.getInstance();
						ccNow.setTime(timeNow);
						ccNow.add(Calendar.DAY_OF_MONTH, 180);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						String dateStr = sdf.format(ccNow.getTime());
						Timestamp timeAfter = Timestamp.valueOf(dateStr);
						// 每次进入会话更新一次学生表里的地理位置数据
						student.setLast_latitude(Latitudess);
						student.setLast_precs(Precisions);
						student.setLast_longitude(Longitudes);
						student.setLast_time(timeNow);
						student.setStu_code(student.getStu_code());
						studentService.updateLastPlace(student);
						DictionaryService.updateStudent(student);
						String stu_id = student.getId();
						List<RightRegion> rire = rightRegionDao.selectByRegion(stu_id);
						RightRegion rireg = new RightRegion();
						if (rire.size() == 0) {
							// 判断合理地区签到表里是否有或者结束时间已经过期
							rireg.setBegin_time(timeNow);
							rireg.setEnd_time(timeAfter);
							rireg.setId(Common.returnUUID());
							rireg.setLatitude_r(Latitudess);
							rireg.setLongitude_r(Longitudes);
							rireg.setPrecs_r(Precisions);
							rireg.setIs_right("是");
							rireg.setRegion_id("1");
							rireg.setStu_id(stu_id);
							rightRegionService.insertByRegion(rireg);
							DictionaryService.updateRightRegionBy(rireg);
						} else {
							respContent = "";
						}
						// 签到表里的地理位置信息，是点击签到前进入会话存的数据
						Sign sg = new Sign();
						sg.setLatitude(Latitudess);
						sg.setLongitude(Longitudes);
						//主动上报位置的备用字段存1
						sg.setTemp1("1");
						sg.setPrecs(Precisions);
						sg.setStu_id(student.getId());
						sg.setLogin_time(timeNow);
						// 如果没有签到时间就将地理位置插入到签到表里
						if (stus.size() == 0) {
							signService.insertSignPlace(sg);
							DictionaryService.updateSign(sg);
						}
						if (stus.size() != 0
								&& stus.get(0).getSign_time() == null) {
							signService.updateSignPlace(sg);
							DictionaryService.updateSign(sg);
						}
					}
					respContent = "上传位置成功，请点击每日签到，完成签到。";
				}else{
					respContent = "上传位置失败，检查是否打开网络，Gps,尝试重新上传位置";
				}
				
			}
			// 链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				respContent = "您发送的是链接消息！" + "发送方账号=" + fromUserName
						+ "开发者微信号=" + toUserName;
			}
			// 事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 上报地理位置
				if (eventType.equals(MessageUtil.EVENT_TYPE_LOCATION)) {
					String s = stuBind.selectByWx(fromUserName);
					if (s.equals("true")) {
						List<Student> stuss = studentDao.selectByWx(fromUserName);
						Student	student = DictionaryService.findStudent(stu.get(0).getId());
						student = stuss.get(0);
						List<Sign> stus = signDao.selectByStuID(student.getId());
						String Latitude = requestMap.get("Latitude");
						String Longitude = requestMap.get("Longitude");
						String Precision = requestMap.get("Precision");
						double Longitudes = Double.parseDouble(Longitude);
						double Precisions = Double.parseDouble(Precision);
						double Latitudess = Double.parseDouble(Latitude);
						Timestamp timeNow = new Timestamp(System.currentTimeMillis());
						// 对当前时间增加180天的处理 插入合理区域表
						Calendar ccNow = Calendar.getInstance();
						ccNow.setTime(timeNow);
						ccNow.add(Calendar.DAY_OF_MONTH, 180);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						String dateStr = sdf.format(ccNow.getTime());
						Timestamp timeAfter = Timestamp.valueOf(dateStr);
						// 每次进入会话更新一次学生表里的地理位置数据
						student.setLast_latitude(Latitudess);
						student.setLast_precs(Precisions);
						student.setLast_longitude(Longitudes);
						student.setLast_time(timeNow);
						student.setStu_code(student.getStu_code());
						studentService.updateLastPlace(student);
						DictionaryService.updateStudent(student);
						String stu_id = student.getId();
						List<RightRegion> rire = rightRegionDao.selectByRegion(stu_id);
						RightRegion rireg = new RightRegion();
						if (rire.size() == 0) {
							// 判断合理地区签到表里是否有或者结束时间已经过期
							rireg.setBegin_time(timeNow);
							rireg.setEnd_time(timeAfter);
							rireg.setId(Common.returnUUID());
							rireg.setLatitude_r(Latitudess);
							rireg.setLongitude_r(Longitudes);
							rireg.setPrecs_r(Precisions);
							rireg.setIs_right("是");
							rireg.setRegion_id("1");
							rireg.setStu_id(stu_id);
							rightRegionService.insertByRegion(rireg);
							DictionaryService.updateRightRegionBy(rireg);
						} else {
							respContent = "";
						}
						// 签到表里的地理位置信息，是点击签到前进入会话存的数据
						Sign sg = new Sign();
						sg.setLatitude(Latitudess);
						sg.setLongitude(Longitudes);
						sg.setPrecs(Precisions);
						sg.setStu_id(student.getId());
						sg.setLogin_time(timeNow);
						// 如果没有签到时间就将地理位置插入到签到表里
						if (stus.size() == 0) {
							signService.insertSignPlace(sg);
							DictionaryService.updateSign(sg);
						}
						if (stus.size() != 0
								&& stus.get(0).getSign_time() == null) {
							signService.updateSignPlace(sg);
							DictionaryService.updateSign(sg);
						}
					}
					respContent = "";
				}
				// 关注
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					respContent = "  欢迎使用山东商业职业技术学院实践教学系统!\n请回复“绑定”,依照提示绑定自己的身份。\n"
							+ "如有疑问请加入QQ群193303585 ，"
							+ "专业服务团队24小时恭候您。/抱拳";
				}
				// 取消关注
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 取消订阅后用户不会再收到公众账号发送的消息，因此不需要回复
				}
				// 自定义菜单
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					// TODO 处理菜单点击事件 key
					if(stu.size()==0&&tea.size()==0){
						respContent = "您还没有绑定信息。\n"
							+ "请回复“绑定”,依照提示绑定自己的身份。\n"
								+"如密码有误,<a href='"+ URL+ "/weixin/resetPwd.do'>[点击重置]</a>";
						}else{
							String 	tempKey="";
							if(tea.size()==0){
								tempKey =DictionaryService.findStudent(stu.get(0).getId()).getTempKey();
								String key = requestMap.get("EventKey");
								tempKey = requestMap.get("EventKey");
								System.out.println("你应该改过滤"+tempKey);
								Student	student = DictionaryService.findStudent(stu.get(0).getId());
								String s = stuBind.selectByWx(fromUserName);
								student.setTempKey(tempKey);
								DictionaryService.updateStudent(student);
								System.out.println("vwoyaokanda"+DictionaryService.findStudent(stu.get(0).getId()).getTempKey());
								if (s.equals("true")) {
									respContent = click.mesController(key, requestMap);
								} else if (s.equals("false")) {
									respContent = "您还没有绑定信息。\n"
											+ "请回复“绑定”,依照提示绑定自己的身份。\n"
											+"如密码有误,<a href='"+ URL+ "/weixin/resetPwd.do'>[点击重置]</a>";
								} else {
									respContent = "个人资料信息有误，请告知管理员";
								}	
								// 月照片相应的月份
								if (key.equals("yzp")) {
									Calendar cal = Calendar.getInstance();
									// 0对应的是一月份
									int month = cal.get(Calendar.MONTH) + 1;
									if(month>9){
										tempMsg=month+"";
									}else{
										tempMsg = "0" + month + "";
									}
									
								}
							
							}else{
								//教师菜单
								if(loginState.equals("ROLE_TEACHER")){
									//教师点击任何按钮都回复菜单！2015年6月25日 09:54:29 邢志武
									Teacher	teacher = DictionaryService.findTeacher(tea.get(0).getId());
									respContent="对不起，您的权限是老师，不能操作学生的功能！ ";
								}
								//院领导菜单
								else if(loginState.equals("ROLE_LEADER_COLLEGE")){
									Teacher	teacher = DictionaryService.findTeacher(tea.get(0).getId());
									respContent="对不起，您的权限是老师，不能操作学生的功能！ ";
								}
							}
				}
			}}
			// 判断是否是图文消息
			if (respContent.contains("</Articles>")) {
				return respContent;
			} else if (respContent != null) {
				textMessage.setContent(respContent);
			}
			// 将文本消息对象转换成xml
			respXml = MessageUtil.messageToXml(textMessage);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return respXml;
	}
	public static String formatTime(String createTime) {
		// 将微信传入的CreateTime转换成long类型，再乘以1000
		long msgCreateTime = Long.parseLong(createTime) * 1000L;
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(new Date(msgCreateTime));
	}
	public static String formatTimestamp(Timestamp times) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String time = df.format(times);
		return time;
	}

}