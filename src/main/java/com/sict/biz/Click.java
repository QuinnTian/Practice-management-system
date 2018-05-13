package com.sict.biz;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.swing.plaf.DesktopIconUI;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.sict.dao.EvaluateDao;
import com.sict.dao.GroupMembersDao;
import com.sict.dao.GroupsDao;
import com.sict.dao.InfoCheckRecordDao;
import com.sict.dao.NoticeDao;
import com.sict.dao.OrgDao;
import com.sict.dao.PracticeRecordDao;
import com.sict.dao.PracticeTaskDao;
import com.sict.dao.RecruitInfoDao;
import com.sict.dao.ScoreDao;
import com.sict.dao.SignDao;
import com.sict.dao.StudentDao;
import com.sict.dao.TeacherDao;
import com.sict.dao.TrainDetailDao;
import com.sict.entity.Evaluate;
import com.sict.entity.GroupMembers;
import com.sict.entity.Groups;
import com.sict.entity.InfoCheckRecord;
import com.sict.entity.Notice;
import com.sict.entity.Org;
import com.sict.entity.PracticeRecord;
import com.sict.entity.PracticeTask;
import com.sict.entity.RecruitInfo;
import com.sict.entity.Score;
import com.sict.entity.Sign;
import com.sict.entity.Student;
import com.sict.entity.Teacher;
import com.sict.entity.TrainDetail;
import com.sict.message.resp.Article;
import com.sict.message.resp.NewsMessage;
import com.sict.service.CoreService;
import com.sict.service.DictionaryService;
import com.sict.service.OrgService;
import com.sict.service.ScoreService;
import com.sict.service.StudentService;
import com.sict.util.Constants;
import com.sict.util.MessageUtil;

@Service
public class Click {
	@Resource @Qualifier("studentDao")
	StudentDao studentDao;
	@Resource
	TeacherDao teacherDao;
	@Resource
	SignDao signDao;
	@Resource
	GroupsDao groupsDao;
	@Resource
	EvaluateDao evaluateDao;
	@Resource
	ScoreDao scoreDao;
	@Resource
	OrgDao orgDao;
	@Resource
	NoticeDao noticeDao;
	@Resource
	PracticeTaskDao practiceTaskDao;
	@Resource
	GroupsDao userGroupsDao;
	@Resource
	TrainDetailDao trainDetailDao;
	@Resource
	InfoCheckRecordDao infoCheckRecordDao;
	@Resource
	RecruitInfoDao recruitInfoDao;
	@Resource
	PracticeRecordDao practiceRecordDao;
	@Resource
	GroupMembersDao groupMembersDao;
	@Resource
	ScoreService scoreService;
	@Resource
	StudentService studentService;
	public static final String URL = Constants.ServerURL;

	// public static final String URL =
	// "http://www.dszweb.tk/springmvc_mybatis";
	public String mesController(String Key, Map<String, String> requestMap)
			throws ParseException {
		String fromUserName = requestMap.get("FromUserName");
		String createTime = requestMap.get("CreateTime");
		// 开发者微信号
		String toUserName = requestMap.get("ToUserName");
		StringBuffer buffer = new StringBuffer();
		String lastTask = "last";
		String currentTask = "";
		String t = "";
		NewsMessage newsMessage = new NewsMessage();
		newsMessage.setToUserName(fromUserName);
		newsMessage.setFromUserName(toUserName);
		newsMessage.setCreateTime(new Date().getTime());
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
		List<Article> articleList = new ArrayList<Article>();
		/**
		 * 功能：签到 by mfz 修改：虚拟签到 by ccc 20150117
		 * 
		 * 
		 * */
		if (Key.equals("mrqd")) {
			List<Student> stu = studentDao.selectByWx(fromUserName);
			if (stu.size() == 1) {
				Student s = DictionaryService.findStudent(stu.get(0).getId());
				List<Sign> stus = signDao.selectByStuID(s.getId());
				// 有无当天签到信息（无时间）
				if (stus.size() == 1) {
					if (stus.get(0).getSign_time() != null) {
						return "今天已经签到，请勿重复签到。";
					} else {

						Sign sign = new Sign();
						sign.setStu_id(s.getId());
						sign.setSign_time(formatTime(createTime));
						signDao.updateSign_time(sign);
						DictionaryService.updateSign(sign);
						List<Sign> stuSign = signDao.isQd(
								formatTime(createTime), s.getId());
						if (stuSign.size() == 1) {
							return "今日签到成功";
						} else if (stuSign.size() == 0) {
							return "签到失败，请稍后再试！";
						}
					}
				} else {
					return "签到失败，可能原因如下：\n"
							+ "①未打开GPS。请打开GPS之后，重新进入实践教学管理，再签到。\n"
							+ "②未允许获取位置信息，允许获取位置信息，重新进入实践教学管理，再签到。\n"
							+ "③网络原因，退出实践教学，稍后再试。\n" + "②详情咨询请输入help联系技术支持。\n"
							+ "若以上操作仍不能签到，请通过微信发送地理位置，然后再次签到，即可签到成功\n";
				}
			} else {
				return "个人资料信息有误，请告知管理员，错误代码：10001";
			}
		}
		/**
		 * 
		 * 功能： 月总结 by ccc 20150117
		 * 
		 * */
		else if (Key.equals("sxzj")) {
			List<Student> stu = studentDao.selectByWx(fromUserName);
			if (stu.size() == 1) {
				Student student = DictionaryService.findStudent(stu.get(0)
						.getId());
				List<Org> orgList = orgDao.selectCollegeByclassId(student
						.getClass_id());
				String college_id = orgList.get(0).getId();
				// http://jngczx.jsp.jspee.cn
				String str = "/微笑您好" + student.getTrue_name()
						+ "同学,请根据实际情况填写\n<a href='" + URL
						+ "/summary/user/home.htm?name="
						+ student.getStu_code() + "&pwd="
						+ student.getLogin_pass() + "&college_id=" + college_id
						+ "&type=student'>实习总结</a>";

				return str;
			} else {
				return "个人资料信息有误，请告知管理员，错误代码：10001";
			}
		}

		/**
		 * 
		 * 功能： 月总结 by ccc 20150117
		 * 
		 * */
		else if (Key.equals("lscd")) {
			List<Teacher> tea = teacherDao.selectTeacherByWx(fromUserName);
			if (tea.size() == 1) {
				Teacher teacher = DictionaryService.findTeacher(tea.get(0)
						.getId());

				return "教师菜单！";
			} else {
				return "个人资料信息有误，请告知管理员，错误代码：10001";
			}
			/**
			 * 功能：实习申请 by ccc
			 * 
			 * */
		} else if (Key.equals("sxsq")) {
			List<Student> stu = studentDao.selectByWx(fromUserName);
			// 判断是否有这个学生
			if (stu.size() == 1) {
				Student student = DictionaryService.findStudent(stu.get(0)
						.getId());
				// 根据学号选出实践任务
				String stu_id = student.getId();
				List<PracticeTask> pt = practiceTaskDao
						.selectPracticeTasksBypt(student.getId());
				if (pt.size() != 0) {
					// 如果有实践任务，判断
					for (PracticeTask pr : pt) {
						List<PracticeRecord> practice_ids = practiceRecordDao
								.selectPrecordByCheck_time(student.getId(),
										pr.getId());
						// 如果这些实践任务id已经提交过申请
						if (practice_ids.size() != 0) {
							for (int j = 0; j < practice_ids.size(); j++) {
								// 审核未通过,重新实习申请
								if (practice_ids.get(j).getCheck_state()
										.equals("2")) {
									buffer.append("/难过 "
											+ "您的任务:"
											+ "\n"
											+ DictionaryService
													.findPracticeTask(
															practice_ids
																	.get(j)
																	.getPractice_id())
													.getTask_name()
											+ "\n"
											+ "审核未通过，原因是："
											+ "\n"
											+ practice_ids.get(j).getNote()
											+ "\n"
											+ "请重新<a href='"
											+ URL
											+ "/weixin/addPracticeApply.do?id="
											+ stu_id
											+ "&praid="
											+ practice_ids.get(j)
													.getPractice_id()
											+ "'>【申请】</a>" + "\n" + "-------");
									System.out.println("ghhrf"
											+ practice_ids.get(j).getId());
								} // 已提交申请，未审核
								else if (practice_ids.get(j).getCheck_state()
										.equals("0")) {
									buffer.append("/微笑您的任务:"
											+ "\n"
											+ DictionaryService
													.findPracticeTask(
															practice_ids
																	.get(j)
																	.getPractice_id())
													.getTask_name()
											+ "已提交申请，请静待审核" + "\n" + "-------");
								}// 已审核通过
								else if (practice_ids.get(j).getCheck_state()
										.equals("1")) {
									buffer.append("/微笑您的任务:"
											+ "\n"
											+ DictionaryService
													.findPracticeTask(
															practice_ids
																	.get(j)
																	.getPractice_id())
													.getTask_name() + "申请已审核通过"
											+ "\n" + "-------");
								}
							}
						} else {
							buffer.append(String.valueOf(Character
									.toChars(0x1F31F)) + "\n"

							+ "当前未提交实习申请的任务:" + "\n");
							buffer.append(DictionaryService.findPracticeTask(
									pr.getId()).getTask_name()
									+ "<a href='"
									+ URL
									+ "/weixin/addPracticeApply.do?id="
									+ stu_id
									+ "&praid="
									+ pr.getId()
									+ "'>【申请】</a>" + "\n" + "-------");
						}
					}

				} else {
					buffer.append("您还未有实习任务");
				}

				return buffer.toString();
			} else {
				return "个人资料信息有误，请告知管理员，错误代码：10001";
			}
		}
		/**
		 * 功能：月照片 by mfz
		 * 
		 * */
		else if (Key.equals("yzp")) {
			String yzp = " 使用微信上传,默认上传当月照片,回复 yzp*可上传*月照片，如 yzp5";
			return yzp;
		}/**
		 * 功能：招聘信息 by ccc 20150317
		 * 
		 * */
		else if (Key.equals("zpxx")) {
			// 招聘信息
			List<Student> stu = studentDao.selectByWx(fromUserName);
			Student student = DictionaryService.findStudent(stu.get(0).getId());
			Timestamp time = studentDao.ByID(student.getId())
					.getCurrent_recruit_read();
			int znts = noticeDao.selectCountTime(student.getId(), time);
			int Allznts = noticeDao.selectALLZnts(student.getId());
			if (Allznts == 0) {
				List<Org> s = orgDao.selectOrg_Code();
				buffer.append("您还未有任何的智能推送信息");
				buffer.append("还请回复相应学院的字母编码查看招聘信息" + "\n");
				for (int i = 0; i < s.size(); i++) {
					buffer.append("\n"
							+ "【"
							+ DictionaryService.findOrg(s.get(i).getId())
									.getOrg_code().substring(0, 2)
							+ "】"
							+ "\n"
							+ DictionaryService.findOrg(s.get(i).getId())
									.getOrg_name() + "\n");
				}
			} else {
				buffer.append("请回复相应学院的字母编码查看招聘信息" + "\n" + "智能推送" + "\n"
						+ "【znts】");
				// buffer.append("您已读" + znts + "条信息,一共" + Allznts + "条消息");
				List<Org> s = orgDao.selectOrg_Code();
				for (int i = 0; i < s.size(); i++) {
					buffer.append("\n"
							+ "【"
							+ DictionaryService.findOrg(s.get(i).getId())
									.getOrg_code().substring(0, 2)
							+ "】"
							+ "\n"
							+ DictionaryService.findOrg(s.get(i).getId())
									.getOrg_name() + "\n");
				}
			}
			return buffer.toString();
		}
		/**
		 * 功能：更多作业 by ccc
		 * 
		 * */
		else if (Key.equals("gdyz")) {
			buffer.append("直接回复编码操作" + "\n");
			buffer.append("信息核对【xxhd】" + "\n" + "个人资料【grzl】" + "\n"
					+ "新增企业【xzqy】" + "\n" + "企业老师维护【qylswh】");
			return buffer.toString();
		}
		/**
		 * 
		 * 功能：常见问题 by ccc
		 * 
		 * */
		else if (Key.equals("cjwt")) {
			String cjwt = "请回复要查询的问题,可回复上一页下一页查看更多答案";
			return cjwt;
		}
		/**
		 * 
		 * 功能：专家提问by 邢志武 2015年6月8日 14:03:49
		 * 
		 * */
		else if (Key.equals("zjzd")) {
			List<Student> stu = studentDao.selectByWx(fromUserName);
			if (stu.size() == 1) {
				Student student = DictionaryService.findStudent(stu.get(0)
						.getId());
				String str = "/微笑您好" + student.getTrue_name()
						+ "同学,如有问题请单击<a href='" + URL
						+ "/weixin/expertQuiz.do?stu_id=" + student.getId()
						+ "'>专家指导</a>" + "获取指导";
				return str;
			} else {
				return "个人资料信息有误，请告知管理员，错误代码：10001";
			}
		}
		/**
		 * 
		 * 功能：在线课堂 by ccc 小例子 通知公告
		 * 
		 * */
		else if (Key.equals("zxkt")) {
			Article article2 = new Article();
			article2.setTitle("教师优秀云空间实例");
			article2.setDescription("山东威海人，电子信息学院专职教师，正在带精英班同学开发软件。");
			article2.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20151010/10/17832370120151010103046010.jpg");
			article2.setUrl("http://www.worlduc.com/SpaceShow/index.aspx?uid=782563");
			Article article1 = new Article();
			article1.setTitle("海上生明月，天涯共此时");
			article1.setDescription("海上生明月，天涯共此时。");
			article1.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20151010/09/17832370120151010095744091.jpg");
			article1.setUrl("http://u.eqxiu.com/s/4Kw8hqiV");
			Article article3 = new Article();
			article3.setTitle("安全常识");
			article3.setDescription("大学生安全常识");
			article3.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20151012/08/17832370120151012084553099.jpg");
			article3.setUrl("http://u.eqxiu.com/s/8ds0xATL");
			Article article4 = new Article();
			article4.setTitle("职场常识");
			article4.setDescription("职场常识");
			article4.setPicUrl("http://image17-c.poco.cn/mypoco/myphoto/20151012/08/17832370120151012084716066.jpg");
			article4.setUrl("http://i.eqxiu.com/s/3ZiyNbno");
			articleList.add(article3);
			articleList.add(article4);
			articleList.add(article2);
			articleList.add(article1);
			// 设置图文消息个数
			newsMessage.setArticleCount(articleList.size());
			// 设置图文消息包含的图文集合
			newsMessage.setArticles(articleList);
			// 将图文消息对象转换成xml字符串
			String cjwt = MessageUtil.messageToXml(newsMessage);
			return cjwt;
		}
		/**
		 * 
		 * 功能：模拟测试 by ccc
		 * 
		 * */
		else if (Key.equals("mncs")) {
			String cjwt = "模拟测试";
			return cjwt;
		}
		/**
		 * 功能：更多资源 by ccc
		 * */
		else if (Key.equals("zxcy")) {
			List<Student> stu = studentDao.selectByWx(fromUserName);
			if (stu.size() == 1) {
				Student student = DictionaryService.findStudent(stu.get(0)
						.getId());
				String str = "/微笑" + "您好" + student.getTrue_name()
						+ "同学,请根据实际情况完成您的\n<a href='" + URL
						+ "/zxcy/home.htm?name=" + student.getStu_code()
						+ "&pwd=" + student.getLogin_pass() + "'>在线测验</a>";
				return str;
			} else {
				return "个人资料信息有误，请告知管理员，错误代码：10001";
			}
			/**
			 * 功能：更多服务 by ccc
			 * 
			 * */
		} else if (Key.equals("gdfw")) {
			buffer.append("直接回复编码\n" + "实习状态【sxzt】" + "\n" + "查询申请【cxsq】"
					+ "\n" + "我的奖惩【wdjc】" + "\n" + "实习记录【sxjl】" + "\n"
					+ "任务查询【rwcx】" + "\n" + "专家回复【zjhf】" + "\n" + "问题反馈【help】"
					+ "\n" + "招聘信息【zpxx】");
			return buffer.toString();
		}
		/**
		 * 功能：通知公告 by ccc
		 * 
		 * */

		else if (Key.equals("tzgg")) {
			// 判断此学生是否存在
			List<Student> stu = studentDao.selectByWx(fromUserName);
			if (stu.size() == 1) {
				Student student = DictionaryService.findStudent(stu.get(0)
						.getId());
				System.out.println("zheli de shi na " + student.getTempKey());
				Timestamp time = DictionaryService.findStudent(student.getId())
						.getCurrent_notice_read();
				// 通过班级编号和组织级别选出系
				String department_id = orgDao.selectOrgByCocde(
						DictionaryService.findOrg(student.getClass_id())
								.getOrg_code(), "5").getParent_id();
				// 通过系和组织级别选出学院
				String college_id = orgDao.selectOrgByCocde(
						DictionaryService.findOrg(department_id).getOrg_code(),
						"3").getParent_id();
				int countNotice = noticeDao.selectNoticeorg_idcount(college_id,
						student.getId(), time);
				int countAllNotice = noticeDao.selectNoticecount(college_id,
						student.getId());
				// 针对信息核对的通知模型对象
				List<Notice> noticestype = new ArrayList<Notice>();
				// 针对学院的通知
				student.setCurrent_notice_page(countNotice);
				DictionaryService.updateStudent(student);
				int page = DictionaryService.findStudent(student.getId())
						.getCurrent_notice_page();
				if (page < -1) {
					buffer.append("您还没有通知公告" + "\n");
				} else {
					List<Notice> noticeCollege = noticeDao
							.getNoticesByRangesALL(college_id, student.getId(),
									(countNotice));
					noticestype.addAll(noticeCollege);
					if (noticestype.size() != 0) {
						for (int i = 0; i < noticestype.size(); i++) {
							if (noticestype.get(i).getNotice_type()
									.equalsIgnoreCase("1")) {
								noticestype.get(i).setNotice_type("院级通知");
							}
							if (noticestype.get(i).getNotice_type()
									.equalsIgnoreCase("2")) {
								noticestype.get(i).setNotice_type("指导教师通知");
							}
							if (noticestype.get(i).getNotice_type()
									.equalsIgnoreCase("3")) {
								noticestype.get(i).setNotice_type("信息核对通知");
							}
							buffer.append(String.valueOf(Character
									.toChars(0x1F31F))
									+ "第"
									+ (countNotice + 1) + "条通知" + ":\n");
							buffer.append("【通知时间】 "
									+ "\n"
									+ CoreService.formatTimestamp(noticestype
											.get(i).getCreate_time()) + "\n");
							buffer.append("【通知类型】" + "\n"
									+ noticestype.get(i).getNotice_type()
									+ "\n");
							buffer.append("【通知标题】 " + "\n"
									+ noticestype.get(i).getTitle() + "\n");
							buffer.append("【通知内容】 " + "\n"
									+ noticestype.get(i).getContent() + "\n");

						}
					} else {
						buffer.append("您已经没有未读的通知\n");
					}
				}
				if (countAllNotice - countNotice != 0) {

					buffer.append("/微笑分页提示:共" + countAllNotice + "条,未读"
							+ ((((countAllNotice - countNotice) - 1))) + "条"
							+ "可回复上一页,下一页或第n页(n为1,2,3...)" + "\n");
				} else {
					buffer.append("/微笑分页提示:共" + countAllNotice + "条,未读" + 0
							+ "条" + "可回复上一页,下一页或第n页(n为1,2,3...)" + "\n");
				}
			} else {
				buffer.append("您未绑定" + "回复‘绑定’即可绑定个人资料" + "\n");
			}
			return buffer.toString();
		}
		/**
		 * 功能：成绩查询 by ccc
		 * 
		 * 方法暂时无法使用，getStuScore方法后两个null参数（学年和学期）暂时没有获取 张文琪 20160907
		 * */
		else if (Key.equals("cjcx")) {
			List<Student> stu = studentDao.selectByWx(fromUserName);
			buffer.append("您好/微笑" + stu.get(0).getTrue_name() + "同学" + "\n");
			if (stu.size() == 1) {
				// 通过学生id选出实习任务
				List<PracticeTask> pracTask = practiceTaskDao
						.selectPracticeTasksBypt(stu.get(0).getId());
				if (pracTask.size() != 0) {
					for (int i = 0; i < pracTask.size(); i++) {
						String group_id = userGroupsDao
								.getGroupByPracIdAndStuId(
										pracTask.get(i).getId(),
										stu.get(0).getId()).getId();
						// 取得组员
						List<String> gm = groupMembersDao
								.selectGroupMembersStuIdByGroupId(group_id);
						int groupsmember = gm.size();// 分组人数
						// 本人成绩
						// 方法暂时无法使用，getStuScore方面的后两个空字符串参数（学年和学期）暂时无法获取 张文琪
						// 20160907
						Score myScore = scoreService
								.getStuScore(pracTask.get(i).getId(), stu
										.get(0).getId(), null, null);
						double myAllscore = myScore.getScore();// 学生自己本身的
						Score otherStuScore;
						DecimalFormat df = new DecimalFormat("###.##");
						// 比较，得到名次
						int sort = 0;
						for (int g = 0; g < gm.size(); g++) {
							// 小组成员成绩，包含本人
							// 方法暂时无法使用，getStuScore方面的后两个空字符串参数（学年和学期）暂时无法获取 张文琪
							// 20160907
							otherStuScore = scoreService.getStuScore(pracTask
									.get(i).getId(), gm.get(g), null, null);
							double otherAllscores = otherStuScore.getScore();// 其他学生的成绩
							if (myAllscore <= otherAllscores) {// 判断
								sort++;
							}
						}
						String ev = df.format(myScore.getEvaScore());
						String theis = df.format(myScore.getTheScore());
						String month = df.format(myScore.getMouthScore());
						String allScore = df.format(myAllscore);
						if (ev.equals(".0")) {
							ev = "0分";
						}
						if (theis.equals(".0")) {
							theis = "0分";
						}
						if (month.equals(".0")) {
							month = "0分";
						}
						if (allScore.equals(".0")) {
							allScore = "0";
						}
						if (df.format(pracTask.get(i).getWeight_evaluate())
								.equals(".0")) {
							ev = "奖惩权重未生成";
						} else if (df.format(
								pracTask.get(i).getWeight_summary()).equals(
								".0")) {
							theis = "总结权重未生成";
						} else if (df
								.format(pracTask.get(i).getWeight_thesis())
								.equals(".0")) {
							month = "论文权重未生成";
						}
						buffer.append("实践任务：\n"
								+ DictionaryService.findPracticeTask(
										pracTask.get(i).getId()).getTask_name()
								+ "\n");
						buffer.append(
								"月总结得分" + "("
										+ (pracTask.get(i).getWeight_summary())
										* 100 + "%" + "):" + month + "\n")
								.append("奖惩得分"
										+ "("
										+ (pracTask.get(i).getWeight_evaluate())
										* 100 + "%" + "):" + ev + "\n")
								.append("论文得分" + "("
										+ (pracTask.get(i).getWeight_thesis())
										* 100 + "%" + "):" + theis + "\n");
						if (month.equals(".0") || ev.equals(".0")
								|| theis.equals(".0")) {
							buffer.append("总得分：" + 0 + "\n");
							buffer.append("您所在的小组有" + groupsmember + "人，排名第"
									+ groupsmember + "名\n");
						} else {
							buffer.append("总得分：" + allScore + "\n");
							buffer.append("您所在的小组有" + groupsmember + "人，排名第"
									+ (sort) + "名\n");
						}
					}

					/*
					 * } else { buffer.append("您的小组实践任务已无效\n"); }
					 */
				}

			}
			return buffer.toString();
		}
		/**
		 * 功能：整周实训 by ccc
		 * 
		 * */
		else if (Key.equals("wdsx")) {
			// 我的实训
			// 判断学生是否存在
			List<Student> stu = studentDao.selectByWx(fromUserName);
			if (stu.size() == 1) {
				// 根据实践任务id选出实践任务是否有效
				List<PracticeTask> pt = practiceTaskDao
						.selectPracticeTasksPd(stu.get(0).getId());
				if (pt.size() != 0) {
					// 如果有实践任务，判断
					for (int n = 0; n < pt.size(); n++) {
						List<TrainDetail> traindetail = trainDetailDao
								.searchTrainNoTime(pt.get(n).getId());
						if (traindetail.size() != 0) {
							for (int m = 0; m < traindetail.size(); m++) {
								// 此处判断取出来的时间和系统时间比较
								String tsStr = "";
								DateFormat sdf = new SimpleDateFormat(
										"yyyy-MM-dd HH:mm:ss");
								try {
									// 方法一
									tsStr = sdf.format(traindetail.get(m)
											.getTrain_time());

								} catch (Exception e) {
									e.printStackTrace();
								}
								currentTask = traindetail.get(m).getTask_id();
								if (lastTask.equalsIgnoreCase("last")) {
									lastTask = traindetail.get(m).getTask_id();
									buffer.append("/微笑【任务】"
											+ "\n"
											+ DictionaryService
													.findPracticeTask(
															traindetail
																	.get(m)
																	.getTask_id())
													.getTask_name() + "\n"
											+ "【时间】\n");

								}

								if (lastTask.equalsIgnoreCase(currentTask)) {
									if (!t.equalsIgnoreCase(CoreService
											.formatTimestamp(traindetail.get(m)
													.getTrain_time()))) {
										buffer.append(CoreService
												.formatTimestamp(traindetail
														.get(m).getTrain_time())
												+ "\n");
									}

									t = CoreService.formatTimestamp(traindetail
											.get(m).getTrain_time());
								} else {
									lastTask = currentTask;
									buffer.append("/微笑"
											+ "【任务】"
											+ "\n"
											+ DictionaryService
													.findPracticeTask(
															traindetail
																	.get(m)
																	.getTask_id())
													.getTask_name() + "\n"
											+ ("【时间】\n"));
								}
							}

							buffer.append(String.valueOf(Character
									.toChars(0x1F31F))
									+ "如有实训安排可以回复对应日期查询，如2015-09-19，可回复0919");
						} else {
							buffer.append("\n"
									+ ("/微笑您的实训任务"
											+ DictionaryService
													.findPracticeTask(
															pt.get(n).getId())
													.getTask_name()
											+ "还没有具体 安排\n" + "------" + "\n"));
						}
					}
				} else {
					buffer.append("您还未有实习分组或您的实训任务已无效\n");
				}
			}
			return buffer.toString();
		} else {
		}
		return Key;
	}

	// 处理时间
	public static Timestamp formatTime(String createTime) {
		// 将微信传入的CreateTime转换成long类型，再乘以1000
		long msgCreateTime = Long.parseLong(createTime) * 1000L;
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp ts = new Timestamp(new Date(msgCreateTime).getTime());
		return ts;
	}
}
