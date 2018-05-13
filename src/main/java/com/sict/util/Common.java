package com.sict.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.sict.course.pojo.WeixinOauth2Token;
import com.sict.entity.ChartData;
import com.sict.entity.EchartSeries;
import com.sict.entity.Files;
import com.sict.entity.Org;
import com.sict.entity.Student;
import com.sict.entity.SummaryOption;
import com.sict.entity.Teacher;
import com.sict.entity.User;
import com.sict.service.DictionaryService;
import com.sict.service.FilesService;
import com.sict.service.OrgService;

public class Common {
	@Resource(name = "filesService")
	private static FilesService filesService;

	/**
	 * @param str
	 * @return
	 * @Date: 2013-9-6
	 * @Author: lulei
	 * @Description: 获取32位小写MD5 UUID
	 */
	public static String returnUUID() {
		return Common.parseStrToMd5L32(UUID.randomUUID().toString());
	}

	/**
	 * @param str
	 * @return
	 * @Date: 2013-9-6
	 * @Author: lulei
	 * @Description: 获取16位小写MD5 UUID
	 */
	public static String returnUUID16() {
		return Common.parseStrToMd5U16(UUID.randomUUID().toString());
	}

	/**
	 * @param str
	 * @return
	 * @Date: 2013-9-6
	 * @Author: lulei
	 * @Description: 16位小写MD5
	 */
	public static String parseStrToMd5U16(String str) {
		String reStr = parseStrToMd5L32(str);
		if (reStr != null) {
			reStr = reStr.toUpperCase().substring(8, 24);
		}
		return reStr;
	}

	/**
	 * @param str
	 * @return
	 * @Date: 2013-9-6
	 * @Author: lulei
	 * @Description: 32位小写MD5
	 */
	public static String parseStrToMd5L32(String str) {
		String reStr = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] bytes = md5.digest(str.getBytes());
			StringBuffer stringBuffer = new StringBuffer();
			for (byte b : bytes) {
				int bt = b & 0xff;
				if (bt < 16) {
					stringBuffer.append(0);
				}
				stringBuffer.append(Integer.toHexString(bt));
			}
			reStr = stringBuffer.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return reStr;
	}

	/**
	 * 如果字符串为null,返回空字符串
	 * 
	 */
	public static String NulltoBlank(String tmpstr) {
		String temp_return = "";
		if (tmpstr == null) {
			return temp_return;
		} else {
			return tmpstr;
		}
	}

	public static Object NulltoBlank(Object tmp) {
		String temp_return = "";
		if (tmp == null) {
			return temp_return;
		} else {
			return tmp;
		}
	}

	/**
	 * 获取管理员负责的学院，管理员只管理到学院级别 改为从组织联系人得到负责的学院 editby zcg 2015-3-3
	 * 
	 * @param String
	 *            tea_dept_id
	 * @return String college_id 2015-2-9
	 * @author 郑春光
	 */
	public static String getCollegeId(String tea_dept_id) {
		String college_id = "";
		String dept_level = DictionaryService.findOrg(tea_dept_id)
				.getOrg_level();// 得到该管理员是的组织id在系级别还是学院级别
		if (dept_level.equals("2")) {// 如果组织的等级为2，说明是学院级别，直接把改id传给xy_id
			college_id = tea_dept_id;
		} else if (dept_level.equals("3")) {// 如果级别为3，说明是系级别，查询该系的parent_id得到学院id
			college_id = DictionaryService.findOrg(tea_dept_id).getParent_id();
		} else {// 其他情况不合理，暂时按所在部门处理
			college_id = tea_dept_id;
		}
		return college_id;
	}

	/**
	 * Bean转换成map对象输出
	 * 
	 * @param Object
	 *            thisObj
	 * @return Map 2015-2-9
	 * @author 郑春光
	 */
	public static Map<String, Object> getValue(Object thisObj) {
		Map<String, Object> map = new HashMap<String, Object>();
		Class c;
		try {
			c = Class.forName(thisObj.getClass().getName());
			Method[] m = c.getMethods();
			for (int i = 0; i < m.length; i++) {
				String method = m[i].getName();
				if (method.startsWith("get")) {
					try {
						Object value = m[i].invoke(thisObj);
						if (value != null) {
							String key = method.substring(3);
							key = key.substring(0, 1).toUpperCase()
									+ key.substring(1);
							map.put(method, value);
						}
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println("error:" + method);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 判断当前组织是否属于给定的上级组织,如果属于则返回true
	 * 
	 * @param user_org_id
	 *            当前组织Id
	 * @param org_id
	 *            给定的上级组织Id
	 * @return
	 * @author SangBigYe 桑博
	 * @return
	 */
	public static boolean isOrgTure(OrgService orgService, String user_org_id,
			String org_id) {
		// Org org = (Org) orgService.selectByID(user_org_id);
		// // 取得上级组织的级别
		// String org_level = "";
		// Org temp = ((Org) orgService.selectByID(org_id));
		// if (org == null)// 如果要判断的组织不存在，即不在组织中。
		// {
		// return false;
		// } else if (temp != null) {
		// org_level = temp.getOrg_level();
		// } else {
		// return false;
		// }
		// // 循环遍历，直到上级组织与同级别的给定的组织id不相等，结束循环
		// while (org_level.equals(org.getOrg_level()) == false) {
		// // 如果跟上级组织级别不等，循环找本组织的上级组织
		// org = (Org) orgService.selectByID(org.getParent_id());
		// // 如果当前父组织id等于提供的上级组织，条件成立，否则，继续循环，直到
		// if (org_id.equals(org.getId())) {
		// return true;
		// }
		// }
		// return false;

		List<String> orgs = getOrgsByUser_org_id(orgService, user_org_id);
		if (orgs.contains(org_id)) {
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 返回当前组织以及上级组织的ID
	 * 
	 * @param user_org_id
	 *            当前组织Id
	 * @param org_id
	 *            给定的上级组织Id
	 * @return
	 * @author SangBigYe 桑博
	 * @return
	 */
	public static List<String> getOrgsByUser_org_id(OrgService orgService,
			String user_org_id) {

		List<String> list = new ArrayList<String>();

		Org org = (Org) orgService.selectByID(user_org_id);
		list.add(user_org_id);
		// 取得上级组织的级别
		if (org.getOrg_level().equals("1")) {
			return list;
		}

		while (true) {
			// 如果跟上级组织级别不等，循环找本组织的上级组织
			org = (Org) orgService.selectByID(org.getParent_id());
			// 如果当前父组织id等于提供的上级组织，条件成立，否则，继续循环，直到
			list.add(org.getId());
			if (org.getOrg_level().equals("1")) {
				break;
			}
		}
		return list;
	}

	/**
	 * 根据url获取一个二维码
	 * 
	 * @param url
	 * @param modelMap
	 * @author SangBigYe 桑博
	 * @return
	 */
	public static ModelMap get_qr(String url, ModelMap modelMap) {

		String logo = "http://sangxiaobo.52529028eb020.d01.nanoyun.com/wjdc/qr/qr.png";
		String shorUrl = "http://api.t.sina.com.cn/short_url/shorten.json";
		String text = HttpRequest.sendGet(shorUrl,
				"source=2690149793&url_long=" + url);
		JSONArray ja = new JSONArray(text);
		JSONObject object = ja.getJSONObject(0);
		url = object.get("url_short").toString();
		modelMap.put("url", url);
		String qr = url + "&logo=" + logo;
		modelMap.put("qr", qr);
		return modelMap;
	}

	public static Timestamp getNowTime() {
		return new Timestamp(System.currentTimeMillis());
	}

	public static String getNowTimeYearMonthDay() {

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(new Timestamp(System.currentTimeMillis()));

	}

	/**
	 * 将字符串转换为url编码
	 * 
	 * @param s
	 * @return
	 * @author SangBigYe 桑博 2015-3-11
	 */
	public static String toUtf8String(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = String.valueOf(c).getBytes("utf-8");
				} catch (Exception ex) {
					System.out.println(ex);
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}

	/**
	 * 文件上传
	 * 
	 */
	public static MultipartFile getUpliadFile(HttpServletRequest request)
			throws IllegalStateException, IOException {

		long startTime = System.currentTimeMillis();
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
			// 将request变成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 获取multiRequest 中所有的文件名
			Iterator iter = multiRequest.getFileNames();

			while (iter.hasNext()) {
				// 一次遍历所有文件
				MultipartFile file = multiRequest.getFile(iter.next()
						.toString());
				if (file != null) {
					// 上传
					return file;
				}

			}

		}
		long endTime = System.currentTimeMillis();
		System.out.println("上传文件耗时：" + String.valueOf(endTime - startTime)
				+ "ms");
		return null;
	}

	/**
	 * 从字典表过滤出部门老师
	 * 
	 * @param String
	 *            departId
	 * @return List<Teacher>
	 * @author 王磊 2015年6月8日
	 */
	public static List<Teacher> getDeptTeaListByDictionary(String departId) {

		List<Teacher> deptTeaList = new ArrayList<Teacher>();
		HashMap<String, Teacher> allTeaMap = DictionaryService.getMapTeachers();
		for (Map.Entry<String, Teacher> entry : allTeaMap.entrySet()) {
			Teacher tea = entry.getValue();
			if (tea.getDept_id().equals(departId)) {
				deptTeaList.add(tea);
			}

		}
		return deptTeaList;
	}

	/**
	 * 判断字符串是不是数字
	 * 
	 * @param String
	 *            str
	 * @return boolean
	 * @author 楚晨晨 2015年6月8日
	 */
	public static boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	/**
	 * 判断微信当前页码是否有效，并返回要显示的通知页码
	 * 
	 * @param String
	 *            str
	 * @return boolean
	 * @author 楚晨晨 2015年6月8日
	 */
	public static int check_current_notice_page(int current_notice_page,
			int countAllNotice, String content, Student student) {
		System.out.println("CCCccccc"
				+ content.substring(content.length() - 1, content.length()));
		if (content.equalsIgnoreCase("下一页")) {
			if (current_notice_page >= -1
					&& current_notice_page <= countAllNotice - 1) {// 正常页码
				current_notice_page++;// 当前页码自增,该字段默认-1，加1后取得第一条
				// 更新字典表
				student.setCurrent_notice_page(current_notice_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				current_notice_page = -2; // 表示respContent =
											// "没有下一页了，请回复上一页或者第*页查看，*为页码，如第1页";
			}
		} else if (content.equalsIgnoreCase("上一页")) {
			if (current_notice_page > 0
					&& current_notice_page <= countAllNotice) {
				current_notice_page--;
				// 更新字典表
				student.setCurrent_notice_page(current_notice_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				current_notice_page = -3; // 表示respContent =
											// "没有上一页了，请回复下一页或者第*页查看，*为页码，如第1页";
			}
		} else if (Common
				.isNumeric((content.substring(1, content.length() - 1)))
				&& content.substring(0, 1).equals("第")) {
			int toPage = Integer.parseInt(content.substring(1,
					content.length() - 1)) - 1;// 减一变成要显示的页
			if (!content.substring(content.length() - 1, content.length())
					.equals("页")) {
				current_notice_page = -5; // 表示respContent =
				// "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
			} else if (toPage >= -1 && toPage <= countAllNotice - 1) {// 正常页码
				current_notice_page = toPage;
				// 更新字典表
				student.setCurrent_notice_page(current_notice_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				current_notice_page = -4; // 表示respContent =
											// "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
			}
		}
		return current_notice_page;
	}

	public static int check_current_zpxx_page(int current_zpxx_page,
			int AllzpxxBycolleage, String content, Student student) {
		// TODO Auto-generated method stub
		if (content.equalsIgnoreCase("下一页")) {
			if (current_zpxx_page >= -1
					&& current_zpxx_page <= AllzpxxBycolleage - 1) {// 正常页码
				System.out.println("这是更新前字典表的zhaopxx" + current_zpxx_page);
				current_zpxx_page++;// 当前页码自增,该字段默认-1，加1后取得第一条
				// 更新字典表
				student.setCurrent_zpxx_page(current_zpxx_page);
				DictionaryService.updateStudent(student);
				System.out.println("这是更新好字典表的zhaopxx" + current_zpxx_page);
			} else {// 其他
				current_zpxx_page = -2;
				// respContent = "没有下一页了，请回复上一页或者第*页查看，*为页码，如第1页";
			}
		} else if (content.equalsIgnoreCase("上一页")) {
			if (current_zpxx_page > 0 && current_zpxx_page <= AllzpxxBycolleage) {
				System.out.println("这是更新前字典表的zpxx" + current_zpxx_page);
				current_zpxx_page--;
				// 更新字典表
				student.setCurrent_zpxx_page(current_zpxx_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				// respContent = "没有上一页了，请回复下一页或者第*页查看，*为页码，如第1页";
				current_zpxx_page = -3;
			}
		} else if (Common
				.isNumeric((content.substring(1, content.length() - 1)))
				&& content.substring(0, 1).equals("第")
				&& content.substring(content.length() - 1, content.length())
						.equals("页")) {
			int toPage = Integer.parseInt(content.substring(1,
					content.length() - 1)) - 1;// 减一变成要显示的页
			if (toPage >= -1 && toPage <= AllzpxxBycolleage - 1) {// 正常页码
				current_zpxx_page = toPage;
				// 更新字典表
				student.setCurrent_zpxx_page(current_zpxx_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				// respContent = "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
				current_zpxx_page = -4;
			}
		} else {
			current_zpxx_page = -5;
		}
		return current_zpxx_page;
	}

	/**
	 * 判断微信当前页码是否有效，并返回要显示的通知页码
	 * 
	 * @param String
	 *            str
	 * @return boolean
	 * @author 楚晨晨 2015年6月8日
	 */
	public static int check_current_recruitInfo_page(int current_znts_page,
			int countAllZnts, String content, Student student) {
		if (content.equalsIgnoreCase("下一页")) {
			if (current_znts_page >= -1
					&& current_znts_page <= countAllZnts - 1) {// 正常页码
				current_znts_page++;// 当前页码自增,该字段默认-1，加1后取得第一条
				// 更新字典表
				student.setCurrent_recruitInfo_page(current_znts_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				current_znts_page = -2; // 表示respContent =
										// "没有下一页了，请回复上一页或者第*页查看，*为页码，如第1页";
			}
		} else if (content.equalsIgnoreCase("上一页")) {
			if (current_znts_page > 0 && current_znts_page <= countAllZnts) {
				current_znts_page--;
				// 更新字典表
				student.setCurrent_recruitInfo_page(current_znts_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				current_znts_page = -3; // 表示respContent =
										// "没有上一页了，请回复下一页或者第*页查看，*为页码，如第1页";
			}
		} else if (Common
				.isNumeric((content.substring(1, content.length() - 1)))
				&& content.substring(0, 1).equals("第")) {
			int toPage = Integer.parseInt(content.substring(1,
					content.length() - 1)) - 1;// 减一变成要显示的页
			if (!content.substring(content.length() - 1, content.length())
					.equals("页")) {
				current_znts_page = -5; // 表示respContent =
				// "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
			} else if (toPage >= -1 && toPage <= countAllZnts - 1) {// 正常页码
				current_znts_page = toPage;
				// 更新字典表
				student.setCurrent_recruitInfo_page(current_znts_page);
				DictionaryService.updateStudent(student);
			} else {// 其他
				current_znts_page = -4; // 表示respContent =
										// "页数超过范围或输入格式不正确，请回复第*页查看，*为页码，如第1页";
			}
		}
		return current_znts_page;
	}

	/**
	 * 功能：获得当前页的集合
	 * 
	 * @param list
	 *            要分页的集合
	 * @param pageSize
	 *            ，每页显示的记录数
	 * @param currentPage
	 *            ，当前页 by：王磊 2015年4月4日
	 * @return 当前页的集合
	 */
	public static List getListCurrentPage(List list, int pageSize,
			int currentPage) {
		List first = null;
		int pageCount = 0;// 总页数
		if (list.size() == 0) {
			pageCount = 0;
		} else if (list.size() % pageSize == 0) {
			pageCount = list.size() / pageSize;
		} else {// 不是整除，总页数加1
			pageCount = list.size() / pageSize + 1;
		}
		;
		/**
		 * 验证并进行修改得到此参数 1,2,3,4,5 6,7,8,9,10 11,12,13,14 meiye 5; zong 3;
		 * (0,5)1,2,3,4,5 (5,10)6,7,8,9,10 (10.14)11,12,13,14 得出此方法
		 */
		if (list.size() == 0) {
			first = null;
		} else if (currentPage != pageCount) {
			first = list.subList(pageSize * (currentPage - 1), pageSize
					* currentPage);
		} else if (currentPage == pageCount) {
			first = list.subList(pageSize * (currentPage - 1), list.size());
		}
		return first;

	}

	/**
	 * 功能：获取总页数
	 * 
	 * @param list
	 *            要分页的集合
	 * @param pageSize
	 *            ，每页显示的记录数
	 * @param currentPage
	 *            ，当前页 by：王磊 2015年4月4日
	 * @return 总页数
	 */
	public static int getPageCount(List list, int pageSize, int currentPage) {
		int pageCount = 0;// 总页数
		if (list.size() == 0) {
			pageCount = 0;
		} else if (list.size() % pageSize == 0) {
			pageCount = list.size() / pageSize;
		} else {// 不是整除，总页数加1
			pageCount = list.size() / pageSize + 1;
		}
		;
		return pageCount;
	}

	/**
	 * 根据当前月份判断得到默认指导学生的年份，年级数 2015年8月-2015年12月 2015-2=2013级 2016年1月-2016年7月
	 * 2016-3=2013级 by吴敬国2015-6-10
	 * 
	 * */
	public static String getDefaultYear() {
		String defaultYear = "2012";
		//动态获得年份  杨梦肖
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		if (month >= 1 && month <= 7) {
			year = year - 3;
		} else {
			year = year - 2;
		}
		defaultYear= String.valueOf(year);
		return  defaultYear;
	}

	/**
	 * 根据传递的年份判断年级任务
	 * 2016-5-6杨梦肖
	 * 
	 * */
	public static String getDefaultYear1(String  year,String  month) {
		//	String defaultYear = "2012";
			//动态获得年份  杨梦肖
			/*Calendar now = Calendar.getInstance();*/
			int year1 =Integer.parseInt(year) ;
			int month1 =Integer.parseInt(month);
			if (month1 >= 1 && month1 <= 7) {
				year1 = year1 - 3;
			} else {
				year1 = year1 - 2;
			}
			year = String.valueOf(year1);
			return year;
		}

	/**
	 * 获取当前年份
	 * 
	 * */
	public static String getNowYear() {
		String defaultYear = "2012";
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		defaultYear = String.valueOf(year);
		return defaultYear;
	}

	/**
	 * 得到当前教师的id 此方法在较多地方用到 by吴敬国2015-6-10
	 * 
	 * */
	public static String getOneTeaId(HttpSession session) {
		Teacher tea = (Teacher) session.getAttribute("current_user");
		String tea_id = tea.getId();
		return tea_id;
	}

	/**
	 * 根据年份和学期得到对应的开始时间和结束时间 报表 2014-2015学年 第一学期 开始时间：2014-08-01 结束时间：2015-01-31
	 * 第二学期 开始时间：2015-02-01 结束时间：2015-07-31 bywjg 2015-6-12
	 * */
	public static Map<String, String> getBeginTimeAndEndTime(String year,
			String term) {
		String[] years = year.split("-");
		String begin_time = "";
		String end_time = "";
		Map<String, String> map = new HashMap<String, String>();
		if (term.equals("1")) {
			begin_time = years[0] + "-08-01";
			Integer i = Integer.parseInt(years[0]);
			Integer j = i + 1;
			end_time = j + "-01-31";
		} else if (term.equals("2")) {
			begin_time = years[1] + "-02-01";
			Integer i = Integer.parseInt(years[1]);
			end_time = i + "-07-31";
		}
		map.put("begin_time", begin_time);
		map.put("end_time", end_time);
		return map;
	}

	/**
	 * 根据学生的实习状态得到应该对应的题的类型
	 * */
	public static String getQuestionState(String stuState) {
		String questionState;
		if ("000".equalsIgnoreCase(stuState)
				|| "100".equalsIgnoreCase(stuState)
				|| "110".equalsIgnoreCase(stuState)
				|| "120".equalsIgnoreCase(stuState)) {
			questionState = "1";
		} else if ("130".equalsIgnoreCase(stuState)
				|| "140".equalsIgnoreCase(stuState)
				|| "150".equalsIgnoreCase(stuState)
				|| "210".equalsIgnoreCase(stuState)
				|| "220".equalsIgnoreCase(stuState)) {
			questionState = "2";
		} else if ("160".equalsIgnoreCase(stuState)
				|| "170".equalsIgnoreCase(stuState)
				|| "173".equalsIgnoreCase(stuState)
				|| "176".equalsIgnoreCase(stuState)) {
			questionState = "3";
		} else {
			questionState = "4";
		}
		return questionState;
	}

	/**
	 * 根据学生的实习状态得到应该对应的题的类型
	 * */
	public static String getABCD(String stuState,
			List<SummaryOption> optinonList) {
		String optionID;
		if ("000".equalsIgnoreCase(stuState)
				|| "100".equalsIgnoreCase(stuState)
				|| "110".equalsIgnoreCase(stuState)
				|| "120".equalsIgnoreCase(stuState)) {
			optionID = optinonList.get(0).getId();
		} else if ("130".equalsIgnoreCase(stuState)
				|| "140".equalsIgnoreCase(stuState)
				|| "150".equalsIgnoreCase(stuState)
				|| "210".equalsIgnoreCase(stuState)
				|| "220".equalsIgnoreCase(stuState)) {
			optionID = optinonList.get(1).getId();
		} else if ("160".equalsIgnoreCase(stuState)
				|| "170".equalsIgnoreCase(stuState)
				|| "173".equalsIgnoreCase(stuState)
				|| "176".equalsIgnoreCase(stuState)) {
			optionID = optinonList.get(2).getId();
		} else {
			optionID = optinonList.get(3).getId();
		}
		return optionID;
	}

	/**
	 * 根据学生的实习状态得到应该对应的题的类型
	 * */
	public static String getCollegeByStuID(String stu_id) {
		String deptId = DictionaryService.findOrg(
				DictionaryService.findStudent(stu_id).getClass_id())
				.getParent_id();
		String collageId = DictionaryService.findOrg(deptId).getParent_id();
		return collageId;
	}

	/**
	 * 用于审核老师工作量 返回时间 前一个月的二十号到下一个月的五号
	 * 
	 * @author WuGee
	 * @return
	 */
	public static Map<String, String> getTimeForTeacherAplic() {
		Map<String, String> time = new HashMap<String, String>();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String t = df.format(new Timestamp(System.currentTimeMillis()));
		String year = t.substring(0, 4);
		String day = t.substring(8, 10);
		int dayInt = Integer.parseInt(day);
		String mouth = t.substring(5, 7);
		String endMouth = "";
		String startMouth = "";
		// 月5-5号查看
		if (dayInt >= 5) {
			int mouthInt = Integer.parseInt(mouth);
			startMouth = String.valueOf(mouthInt);
			if (mouthInt < 10) {
				mouth = "0" + mouthInt;
			}
			endMouth = String.valueOf(mouthInt + 1);
			// 月1-4
		} else {
			int mouthInt = Integer.parseInt(mouth) - 1;
			if (mouthInt < 10) {
				mouth = "0" + mouthInt;
			}
			startMouth = String.valueOf(mouthInt);
			endMouth = String.valueOf(mouthInt + 1);
		}
		String nowTime = year + "-" + startMouth;
		String start = year + "-" + startMouth + "-" + "19";
		String end = year + "-" + endMouth + "-" + "6";
		time.put("startTime", start);
		time.put("endTime", end);
		time.put("nowTime", nowTime);
		return time;
	}

	/**
	 * 用于审核老师工作量 动态获取 时间
	 * 
	 * @author WuGee
	 * @return
	 */
	public static Map<String, String> getTimeForTeacherAplic2(String mouth,
			String year) {
		Map<String, String> time = new HashMap<String, String>();
		String startTime = "";
		String endTime = "";
		String nowTime = "";
		if (mouth.equals("12")) {
			int yearInt = Integer.parseInt(year) + 1;
			startTime = year + "-" + "12-19";
			endTime = yearInt + "-" + "01-06";
			nowTime = year + "-" + "12";

		} else {
			int mouthInt = Integer.parseInt(mouth);
			startTime = year + "-" + mouthInt + "-19";
			endTime = year + "-" + (mouthInt + 1) + "-6";
			if (mouthInt < 10) {
				nowTime = year + "-0" + mouthInt;
			} else {
				nowTime = year + "-" + mouthInt;
			}
		}
		time.put("startTime", startTime);
		time.put("endTime", endTime);
		time.put("nowTime", nowTime);
		return time;
	}

	/**
	 * @param figure
	 *            小数点处理 保留两位小数 转换成String类型
	 * @author WuGee
	 * @return
	 */
	public static String getDoubetoString(Double figure) {

		String scoreString = new java.text.DecimalFormat("#.00").format(figure);
		if (figure == 0.0) {
			scoreString = "0";
		}
		// 处理截取错误问题如0.1 截取会成 .1
		String c = scoreString.substring(0, 1);
		if (c.equals(".")) {
			scoreString = "0" + scoreString;
		}
		// 处理xx.00的情况
		int b = scoreString.indexOf(".");
		if (b != -1) {
			String d = scoreString.substring(b + 1, b + 3);
			if (d.equals("00")) {
				scoreString = scoreString.substring(0, b);
			}
		}

		return scoreString;
	}

	/**
	 * 
	 * @param map
	 * @return 格式化map数据 只显示人数大于规定数字的地区
	 * @author WuGee
	 * @throws Exception
	 */
	public static Map<String, Integer> mapSort(Map<String, Integer> map)
			throws Exception {
		Map<String, Integer> collegeMap = new HashMap<String, Integer>();
		Integer count = 0;
		for (Entry<String, Integer> entry : map.entrySet()) {
			String city = entry.getKey();
			Integer a = entry.getValue();
			// 常量，规定人数
			Integer personCount = Constants.PERSON_COUNT;
			if (a >= personCount) {
				collegeMap.put(city, a);
			} else {
				count = count + a;
				collegeMap.put("其他", count);
			}
		}
		return collegeMap;
	}

	/**
	 * 根据当前月份判断得到默认指导学生的年份，年级数 2015年8月-2015年12月 2015-2=2013级 2016年1月-2016年7月
	 * 2016-3=2013级 by吴敬国2015-6-10
	 * 
	 * */
	public static String getNewYear() {
		String defaultYear = "2012";
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		if (month >= 1 && month <= 7) {
			year = year - 1;
		}
		defaultYear = String.valueOf(year);
		return defaultYear;
	}

	/**
	 * 返回一个timeStamp类型的时间 wugee
	 * 
	 * @param time
	 * @return
	 */

	public static Timestamp getTimeStampTime(String time) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp ts = null;
		String str_test = time;
		try {
			ts = new Timestamp(df.parse(str_test).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ts;
	}

	/**
	 * 返回用户（教师或者学生）
	 * 
	 * @param
	 * @return
	 */
	public static User getUser(HttpSession session) {
		User user = new User();
		String type = (String) session.getAttribute("type");
		if (type.equals("tea")) {
			Teacher tea = (Teacher) session.getAttribute("current_user");
			user.setTrue_name(tea.getTrue_name());
			user.setId(tea.getId());
			user.setSex(tea.getSex());
			user.setClass_name(DictionaryService.findOrg(tea.getDept_id())
					.getOrg_name());
			user.setQqnum(tea.getQqnum());
			user.setEmail(tea.getEmail());
			user.setPhone(tea.getPhone());
			user.setType("tea");
			user.setPhoneUrl((String) session.getAttribute("phoneUrl"));
		} else if (type.equals("stu")) {
			Student stu = (Student) session.getAttribute("current_user");
			user.setTrue_name(stu.getTrue_name());
			user.setId(stu.getId());
			user.setSex(stu.getSex());
			user.setClass_name(DictionaryService.findOrg(stu.getClass_id())
					.getOrg_name());
			user.setQqnum(stu.getQqnum());
			user.setEmail(stu.getEmail());
			user.setPhone(stu.getPhone());
			user.setType("stu");
			user.setPhoneUrl((String) session.getAttribute("phoneUrl"));
		} else {
			user.setTrue_name("无");
			user.setType("游客");
		}

		return user;
	}

	/**
	 * 返回用户（教师或者学生）
	 * 
	 * @param
	 * @return
	 */
	public static User getUser(String id) {
		User user = new User();
		if (id.length() < 17) {
			Teacher tea = DictionaryService.findTeacher(id);
			user.setTrue_name(tea.getTrue_name());
			user.setId(tea.getId());
			user.setSex(tea.getSex());
			user.setClass_name(DictionaryService.findOrg(tea.getDept_id())
					.getOrg_name());
			user.setQqnum(tea.getQqnum());
			user.setEmail(tea.getEmail());
			user.setPhone(tea.getPhone());
			user.setType("tea");
		} else {
			Student stu = DictionaryService.findStudent(id);
			user.setTrue_name(stu.getTrue_name());
			user.setId(stu.getId());
			user.setSex(stu.getSex());
			user.setClass_name(DictionaryService.findOrg(stu.getClass_id())
					.getOrg_name());
			user.setQqnum(stu.getQqnum());
			user.setEmail(stu.getEmail());
			user.setPhone(stu.getPhone());
			user.setType("stu");
		}
		return user;
	}

	/**
	 * 根据id返回用户头像
	 * 
	 * @param id
	 * @return
	 */
	public static String getUserPhotoUrl(String id) {
		String url=null;
		// 学生
		if (id.length() ==32) {
			try {
				url = DictionaryService.findStudent(id).getPhoto_id();
			} catch (Exception e) {
				url="erroy";
			}
			if (url == null) {
				url = "http://image17-c.poco.cn/mypoco/myphoto/20151215/14/17832370120151215145301018.jpg?200x200_120";
			}
		} else {
			url = "http://image17-c.poco.cn/mypoco/myphoto/20151215/14/17832370120151215145301018.jpg?200x200_120";
		}
		return url;
	}

	/**
	 * 返回分页区间
	 * 
	 * @param startPage
	 * @param endPage
	 * @return
	 */
	public static Map<String, Integer> getPage(int startPage, int endPage,
			HttpSession session) {
		startPage = endPage;
		endPage = endPage + 10;// 10每次刷新出来的数量
		session.setAttribute("bbs_endPage", endPage);
		session.setAttribute("bbs_startPage", startPage);
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("startPage", startPage);
		pageMap.put("endPage", endPage);
		return pageMap;
	}

	// 通过url返回json数据
	public static String getJsonForUrl(String URL) throws IOException {
		String getURL = URL;
		URL getUrl = new URL(getURL);
		HttpURLConnection connection = (HttpURLConnection) getUrl
				.openConnection();
		connection.connect();
		// 取得输入流，并使用Reader读取
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				connection.getInputStream(), "utf-8"));
		StringBuffer sb = new StringBuffer();
		String line = "";
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}
		reader.close();

		String jsonString = sb.toString();
		// 截取json字符串
		connection.disconnect();
		return jsonString;
	}

	// 获取令牌
	public static String getToken() throws IOException {
		String access_token = Constants.access_token;
		Calendar c = Calendar.getInstance();
		int tokenTime = Constants.tokenTime;
		int nowTime = c.get(Calendar.HOUR_OF_DAY);
		int timeDiffer = nowTime - tokenTime;
		if (access_token.equals("") || timeDiffer > 1) {
			String appid = Constants.appid;
			String secret = Constants.AppSecret;
			String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
					+ appid + "&secret=" + secret;
			String acctokenJson = getJsonForUrl(url);
			int b = acctokenJson.indexOf("\",\"");
			access_token = acctokenJson.substring(17, b);
			// 更新token
			Constants.access_token = access_token;
			// 更新时间
			Constants.tokenTime = nowTime;
		}
		return access_token;

	}

	/**
	 * 获取微信token所需要的url
	 * 
	 * @return
	 */
	/*
	 * public static String getWXAccess_TokenURL() { String appId =
	 * Constants.appid; String AppSecret = Constants.AppSecret; return
	 * "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
	 * + appId + "&secret=" + AppSecret; }
	 */
	// 获取ticket
	public static String getTicket() throws IOException {
		String ticket = null;
		String access_token = getToken();
		String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="
				+ access_token + "&type=jsapi";

		try {
			URL urlGet = new URL(url);
			HttpURLConnection http = (HttpURLConnection) urlGet
					.openConnection();
			http.setRequestMethod("GET"); // 必须是get方式请求
			http.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
			http.connect();
			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");
			JSONObject demoJson = new JSONObject(message);
			ticket = demoJson.getString("ticket");
			System.out.println(ticket);
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ticket;
	}

	// 获得js signature
	public static String getSignature(String jsapi_ticket, String timestamp,
			String nonce, String jsurl) throws IOException {
		String[] paramArr = new String[] { "jsapi_ticket=" + jsapi_ticket,
				"timestamp=" + timestamp, "noncestr=" + nonce, "url=" + jsurl };
		Arrays.sort(paramArr);
		// 将排序后的结果拼接成一个字符串
		String content = paramArr[0].concat("&" + paramArr[1])
				.concat("&" + paramArr[2]).concat("&" + paramArr[3]);
		System.out.println("拼接之后的content为:" + content);
		String gensignature = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			// 对拼接后的字符串进行 sha1 加密
			byte[] digest = md.digest(content.toString().getBytes());
			gensignature = byteToStr(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// 将 sha1 加密后的字符串与 signature 进行对比
		if (gensignature != null) {
			return gensignature;// 返回signature
		} else {
			return "false";
		}
		// return (String) (ciphertext != null ? ciphertext: false);
	}

	/**
	 * 将字节数组转换为十六进制字符串
	 * 
	 * @param byteArray
	 * @return
	 */

	private static String byteToStr(byte[] byteArray) {
		String strDigest = "";
		for (int i = 0; i < byteArray.length; i++) {
			strDigest += byteToHexStr(byteArray[i]);
		}
		return strDigest;
	}

	/**
	 * 将字节转换为十六进制字符串
	 * 
	 * @param mByte
	 * @return
	 */
	private static String byteToHexStr(byte mByte) {
		char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F' };
		char[] tempArr = new char[2];
		tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
		tempArr[1] = Digit[mByte & 0X0F];
		String s = new String(tempArr);
		return s;
	}

	// 得到wx数据
	public static Map<String, String> getWxMap(String url) throws IOException {
		Map<String, String> ret = new HashMap<String, String>();
		String nonce_str = create_nonce_str();
		String timestamp = create_timestamp();
		String jsapi_ticket = getTicket();
		String signature = getSignature(jsapi_ticket, timestamp, nonce_str, url);
		ret.put("url", url);
		ret.put("jsapi_ticket", jsapi_ticket);
		ret.put("nonceStr", nonce_str);
		ret.put("timestamp", timestamp);
		ret.put("signature", signature);

		return ret;
	}

	private static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash) {
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}

	private static String create_nonce_str() {
		return UUID.randomUUID().toString();
	}

	private static String create_timestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	// 返回下载链接
	public static List<String> getImgUrlList(String[] media_ids)
			throws IOException {
		List<String> urllist = new ArrayList<String>();
		for (int i = 0; i < media_ids.length; i++) {
			String media_id = media_ids[i];
			String url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token="
					+ getToken() + "&media_id=" + media_id;
			urllist.add(url);
		}
		return urllist;
	}

	/**
	 * 获取媒体文件
	 * 
	 * @param accessToken
	 *            接口访问凭证
	 * @param media_id
	 *            媒体文件id
	 * @param savePath
	 *            文件在服务器上的存储路径
	 * @throws IOException
	 * */
	public static String downloadMedia(String mediaId, String savePath)
			throws IOException {
		String filePath = null;
		// 拼接请求地址
		String requestUrl = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", getToken()).replace(
				"MEDIA_ID", mediaId);
		System.out.println(requestUrl);
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setRequestMethod("GET");
			File  file=new  File(savePath);
			if(!file.exists())    
			{    
			    file.mkdir();    
			}    
			if (!savePath.endsWith("/")) {
				savePath += "/";
			}
			// 根据内容类型获取扩展名
			String fileExt = getFileEndWitsh(conn
					.getHeaderField("Content-Type"));
			// 将mediaId作为文件名
			filePath = savePath + mediaId + "." + fileExt;

			BufferedInputStream bis = new BufferedInputStream(
					conn.getInputStream());
			FileOutputStream fos = new FileOutputStream(new File(filePath));
			byte[] buf = new byte[8096];
			int size = 0;
			while ((size = bis.read(buf)) != -1)
				fos.write(buf, 0, size);
			fos.close();
			bis.close();
			conn.disconnect();
			String info = String.format("下载媒体文件成功，filePath=" + filePath);
			System.out.println(info);
		} catch (Exception e) {
			filePath = null;
			String error = String.format("下载媒体文件失败：%s", e);
			System.out.println(error);
		}
		int a = filePath.indexOf("BBSPhotos");
		filePath = filePath.substring(a, filePath.length());
		return filePath;
	}

	/**
	 * 根据内容类型获取扩展名
	 * 
	 * @param ContentType
	 * @return
	 */
	public static String getFileEndWitsh(String ContentType) {
		String type = "";
		String[] types = ContentType.split("/");
		type = types[1];
		return type;

	}

	/**
	 * 得到当前学生的ID by苏衍静20160115
	 **/
	public static String getOneStuId(HttpSession session) {
		Student stu = (Student) session.getAttribute("current_user");
		String stu_id = stu.getId();
		return stu_id;
	}
	
	/**
	 * 乱码转码
	 * @throws UnsupportedEncodingException 
	 **/
	public static String xxToUTF_8(String str) throws UnsupportedEncodingException {
		String result = new String(str.getBytes("iso-8859-1"),"utf-8");
		return result;
	}
	
	/**
	 * 微信授权(获取openId)
	 */
	public static String getOpenId(String code){
		String openId =null;
		if (!"authdeny".equals(code)) {
			// 获取网页授权access_token
			WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(Constants.appid, Constants.AppSecret, code);
			// 用户标识
			openId = weixinOauth2Token.getOpenId();
		}
		return openId;
	}

	public static String getJsonSeries(List<EchartSeries> es){
		StringBuffer sb=new StringBuffer();
		if(es.size()>0){
			sb.append("[");
			for(EchartSeries e:es){
				sb.append("{");
				sb.append("name:'"+e.getName()+"',");
				sb.append("type:'"+e.getType()+"',");
				sb.append("data:"+e.getData()+"},");
			}
			sb.append("]");
		}
		return sb.toString();
	}
	
	public static String getXzhou(List<String> list){
		StringBuffer sb=new StringBuffer();
		if(list.size()>0){
			sb.append("[");
			for(String e:list){
				sb.append("'");
				sb.append(e);
				sb.append("',");
			}
			sb.substring(0,sb.length());
			sb.append("]");
		}
		return sb.toString();
	}
	
	/**
	 * 功能：检验编号是否在表格中是否重复 
	 * by王磊 2014/1/6
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
	 * @Date: 2016-5-31
	 * @Author: 李达
	 * @Description: 获取当前节次
	 * @return 1-2 3-4 5-6 7-8 9-10
	 */
	public static String getSectionNum(){
		 String section_num;
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd,HHmmss");
		 java.util.Date nowDate = new java.util.Date();
		 String s = sdf.format(nowDate);
	     String[] a =  s.split(",");
	     String tim = a[1].toString();
	     int ti = Integer.parseInt(tim);
	     if(ti >= 83000 && ti <= 100500){
	    	 section_num = "1-2";
	     }else if(ti > 103000 && ti<=120100){
	    	 section_num = "3-4";
	     }else if(ti >= 133000 && ti <= 150100){
	    	 section_num = "5-6";
	     }else if(ti >= 152000 && ti <= 170100){
	    	 section_num = "7-8";
	     }else if(ti >= 173000 && ti <= 190100){
	    	 section_num = "9-10";
	     }else{
	    	 section_num = "1-2";
	     }
		return section_num;
		
	}
	/**
	 * @Date: 2016-5-31
	 * @Author: 李达
	 * @Description: 获取当前学年
	 * @return xxxx-xxxx
	 */
	public static String getSchoolYear(){
		String schoolYear;
		Calendar ca = Calendar.getInstance();
		int y = ca.get(Calendar.YEAR);// 获取当前年份
		int m = ca.get(Calendar.MONTH) + 1;// 获取当前月份
		if (m > 8) {
			schoolYear = y + "-" + (y + 1);
		} else {
			schoolYear = (y - 1) + "-" + y;
		}
		return schoolYear;
	}
	/**
	 * @Date: 2016-5-31
	 * @Author: 李达
	 * @Description: 获取当前学期 
	 * @return 1 2
	 */
	public static String getSemester(){
		String semester;
		Calendar ca = Calendar.getInstance();
		int y = ca.get(Calendar.YEAR);// 获取当前年份
		int m = ca.get(Calendar.MONTH) + 1;// 获取当前月份
		if (m > 2 && m < 8) {
			semester = "2";
		} else {
			semester = "1";
		}
		return semester;
	}
	
	/**
	 * 
	 * 返回汉字的首字母
	 * 
	 * @param strChinese 字符串
	 * 
	 * @param bUpCase
	 * 
	 * @return
	 * @since 2016-6-4 
	 */

	public static String getPYIndexStr(String strChinese, boolean bUpCase) {
		try {
			StringBuffer buffer = new StringBuffer();
			byte b[] = strChinese.getBytes("GBK");// 把中文转化成byte数组
			for (int i = 0; i < b.length; i++) {
				if ((b[i] & 255) > 128) {
					int char1 = b[i++] & 255;
					char1 <<= 8;// 左移运算符用“<<”表示，是将运算符左边的对象，向左移动运算符右边指定的位数，并且在低位补零。其实，向左移n位，就相当于乘上2的n次方
					int chart = char1 + (b[i] & 255);
					buffer.append(getPYIndexChar((char) chart, bUpCase));
					continue;
				}
				char c = (char) b[i];
				if (!Character.isJavaIdentifierPart(c))// 确定指定字符是否可以是 Java
														// 标识符中首字符以外的部分。
					c = 'A';
				buffer.append(c);

			}

			return buffer.toString();

		} catch (Exception e) {
			System.out.println((new StringBuilder())
					.append("\u53D6\u4E2D\u6587\u62FC\u97F3\u6709\u9519")
					.append(e.getMessage()).toString());
		}
		return null;
	}

	/**
	 * 
	 * 得到首字母
	 * 
	 * @param strChinese
	 * 
	 * @param bUpCase
	 * 
	 * @return
	 */

	private static char getPYIndexChar(char strChinese, boolean bUpCase) {
		int charGBK = strChinese;
		char result;
		if (charGBK >= 45217 && charGBK <= 45252)
			result = 'A';
		else if (charGBK >= 45253 && charGBK <= 45760)
			result = 'B';
		else if (charGBK >= 45761 && charGBK <= 46317)
			result = 'C';
		else if (charGBK >= 46318 && charGBK <= 46825)
			result = 'D';
		else if (charGBK >= 46826 && charGBK <= 47009)
			result = 'E';
		else if (charGBK >= 47010 && charGBK <= 47296)
			result = 'F';
		else if (charGBK >= 47297 && charGBK <= 47613)
			result = 'G';
		else if (charGBK >= 47614 && charGBK <= 48118)
			result = 'H';
		else if (charGBK >= 48119 && charGBK <= 49061)
			result = 'J';
		else if (charGBK >= 49062 && charGBK <= 49323)
			result = 'K';
		else if (charGBK >= 49324 && charGBK <= 49895)
			result = 'L';
		else if (charGBK >= 49896 && charGBK <= 50370)
			result = 'M';
		else if (charGBK >= 50371 && charGBK <= 50613)
			result = 'N';
		else if (charGBK >= 50614 && charGBK <= 50621)
			result = 'O';
		else if (charGBK >= 50622 && charGBK <= 50905)
			result = 'P';
		else if (charGBK >= 50906 && charGBK <= 51386)
			result = 'Q';
		else if (charGBK >= 51387 && charGBK <= 51445)
			result = 'R';
		else if (charGBK >= 51446 && charGBK <= 52217)
			result = 'S';
		else if (charGBK >= 52218 && charGBK <= 52697)
			result = 'T';
		else if (charGBK >= 52698 && charGBK <= 52979)
			result = 'W';
		else if (charGBK >= 52980 && charGBK <= 53688)
			result = 'X';
		else if (charGBK >= 53689 && charGBK <= 54480)
			result = 'Y';
		else if (charGBK >= 54481 && charGBK <= 55289)
			result = 'Z';
		else
			result = (char) (65 + (new Random()).nextInt(25));
		if (!bUpCase)
			result = Character.toLowerCase(result);
		return result;

	}
	
	
	
}
