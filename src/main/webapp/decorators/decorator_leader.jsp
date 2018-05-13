<%--
 这个主装饰器应用于所有的页面.它包含标准的缓存, 样式表, 头部, 底部和版权声明.
 --%>
<%-- <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> --%>
<%--  <%@ include file="/includes/cache.jsp" %> --%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.sict.service.DictionaryService" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.sict.service.SysMenuService"%>
<%@ page import="com.sict.entity.SysMenu"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.web.context.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><sitemesh:write property='title' /></title>
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/sict.png">
<link rel="stylesheet" href="../css/style1.css" type="text/css" />
<script type="text/javascript"
	src="/springmvc_mybatis/js/changeRoles.js"></script>
<style type='text/css'>
.mainBody {
	padding: 10px;
	border: 1px solid #555555;
}

.disclaimer {
	text-align: center;
	border-top: 1px solid #cccccc;
	margin-top: 40px;
	color: #666666;
	font-size: smaller;
}

.head {
	float: left;
}
</style>
<sitemesh:write property='head' />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
</head>
<body bgcolor="#FFFFFF">
	<%@ include file="/includes/header.jsp"%>
	<%-- <div class="form-group" align="right">
		<label for="user_role">选择用户角色</label> <select name="roles" id="roles"
			style="width:10%;" onchange="toMainPage()">
			<c:forEach var="role" items="${user_role}" varStatus="stauts">
				<option value="${role}">
					<c:set var="ro" value="${role}" scope="request"></c:set>
					<%
						String id = (String) request.getAttribute("ro");
					%>
					<%
						out.println(DictionaryService.findRole(id).getRole_name());
					%>
				</option>
			</c:forEach>
		</select>
		<!-- <button type="button">切换</button> -->
		<a href="/springmvc_mybatis/logout.do">退出系统</a>

	</div> --%>
	<div class="form-group" align="right">
		<label for="user_role">选择用户角色</label> <select name="roles" id="roles"
			style="width:15%;" onchange="toMainPage()">
			<%
				String current_role_selected =  (String)session.getAttribute("current_role_selected");//用户角色列表
			%>
			<c:forEach var="role" items="${user_role}" varStatus="stauts">
				<option value="${role}"
					<c:if test="${role=='current_role_selected'}"> selected</c:if>>
					<c:set var="ro" value="${role}" scope="request"></c:set>
					<%
						String id = (String) request.getAttribute("ro");
					%>
					<%
						out.println(DictionaryService.findRole(id).getRole_name());
					%>
				</option>
			</c:forEach>
		</select> <a href="/springmvc_mybatis/logout.do">退出系统</a>
	</div>
	<%
		ArrayList userRoleList = (ArrayList) session.getAttribute("user_role");
	%>
	<%-- <%
		
		if (userRoleList.contains("ROLE_LEADER")) {
	%> --%>
	<!--菜单栏  (校领导菜单)-->

	<%-- <li>
				<!-- 一级菜单 --> <a href="#" class="parent"><span>校外实习</span> </a>
				<div>
					<ul>
						<!-- 二级菜单 -->
						<!-- 	<li><a href="teacherList.do"><span>查看学生信息</span>
						</a>
						</li> -->
						<!-- 	<li><a href="teacherList.do"><span>签到汇总报表</span>
						</a> -->

						<li><a href="<%=path%>/leader/BmapPie.do"><span>学生签到情况</span>
						</a>
						</li>
						<li><a href="<%=path%>/leader/doGetStateReport.do"><span>学生实习状态成绩折线</span>
						</a></li>
						</li>
						<li><a href="<%=path%>/leader/selectNotices.do"><span>查看通知</span>
						</a>
			</li>

			<!-- 	<li><a href="teacherList.do"><span>实习比例报表</span>
						</a>
						</li> -->
		</ul>
	</div>
	</li>
	<li><a href="#" class="parent"><span>整周实训</span> </a>
		<div>
			<ul>
				<li><a href="<%=path%>/leader/getTrainDetailReport.do"><span>实训安排报表</span>
				</a>
				</li>
			</ul>
		</div></li>

	<%
		
		} else if (userRoleList.contains("ROLE_LEADER_COLLEGE")) {
	%>
	<!--菜单栏  (学院院领导菜单)-->
	<div id="menu">
		<ul class="menu">
			<li>
				<!-- 一级菜单 --> <a title="首页" href="index.do"><span id="logo-menu">首页</span>
			</a>
			</li>
			<li>
				<!-- 一级菜单 --> <a href="#" class="parent"><span>校外实习</span> </a>
				<div>
					<ul>
						<!-- 二级菜单 -->
						<!-- 	<li><a href="teacherList.do"><span>查看学生信息</span>
						</a>
						</li> -->
						<!-- 	<li><a href="teacherList.do"><span>签到汇总报表</span>
						</a> -->

						<li><a href="<%=path%>/leader/BmapPie2.do"><span>学院签到统计</span>
						</a>
						</li>
						<li><a href="<%=path%>/leader/index2.do"><span>实习状态统计</span>
						</a></li>
						<li><a href="<%=path%>/leader/taskAccomplishAll.do"><span>任务完成统计</span>
						</a></li>
						<li><a href="<%=path%>/leader/diectRecordList.do"><span>教师指导记录</span>
						</a></li>
						<li><a href="<%=path%>/leader/teaSummaryList.do"><span>教师工作总结</span>
						</a></li>
						<li><a href="<%=path%>/leader/noticeList.do"><span>发布通知公告</span>
						</a></li>
						<li><a href="<%=path%>/leader/teacherMouthWorkload.do"><span>教师月工作量</span>
						</a></li>
						<li><a href="<%=path%>/leader/selectNotices.do"><span>查看通知</span>
						</a>
						<li><a href="<%=path%>/summary/user/home.htm"><span>学生月总结分析统计</span></a>
						</li>
						<li><a href="<%=path%>/leader/exOutStu.do"><span>导出学生信息</span></a>
						</li>
						<li><a href="<%=path%>/leader/getDepartmetStudentCityStatistics.do"><span>学生实习地点分布统计</span></a>
						</li>
						<!--<li><a href="teacherList.do"><span>实习比例报表</span>
						</a>
						</li> -->
				</ul>
	</div>
	</li>
	<li><a href="#" class="parent"><span>整周实训</span> </a>
		<div>
			<ul>
				<li><a href="<%=path%>/leader/getCollegeTrainDetailReport.do"><span>实训安排报表</span>
				</a>
				</li>
			</ul>
		</div></li>

<%
		}
	%> --%>

	<div id="menu">
		<ul class="menu">
			<li>
				<!-- 一级菜单 --> <a title="首页" href="index.do"><span id="logo-menu">首页</span>
			</a>
			</li>
			<%
				ServletContext servletContext = request.getSession()
							.getServletContext();
					WebApplicationContext wac = WebApplicationContextUtils
							.getWebApplicationContext(servletContext);
					SysMenuService sysMenuService = (SysMenuService) wac
							.getBean(SysMenuService.class);
					List<SysMenu> sysMenuList = sysMenuService
							.selectByRoleId(current_role_selected);
					for (SysMenu s : sysMenuList) {
						if (s.getSm_is_top().equals("1")) {
							/* out.println("<li><a href='" + s.getSm_page()
									+ "' class='parent'><span>" + s.getSm_name()
									+ "</span></a>"); */
							if(s.getSm_page().equals("#")){
								out.println("<li><a href='"+s.getSm_page()+"' class='parent'><span>"+s.getSm_name()+"</span></a>");
							}else{
								out.println("<li><a href='"+path+s.getSm_page()+"' class='parent'><span>"+s.getSm_name()+"</span></a>");
							}
							if (!s.isIsleaf()) {
								out.println("<div><ul>");
								List<SysMenu> twoList = s.getSysMenuList();
								for (int i = 0; i < twoList.size(); i++) {
									if (!twoList.get(i).isIsleaf()) {
										out.println("<li><a class='parent'><span>"
												+ twoList.get(i).getSm_name() + ">>"
												+ "&nbsp;&nbsp;</span></a>");
										out.println("<div><ul>");
										List<SysMenu> threeList = twoList.get(i)
												.getSysMenuList();
										for (int j = 0; j < threeList.size(); j++) {
											out.println("<li><a href='" + path
													+ threeList.get(j).getSm_page()
													+ "'class='parent'><span>"
													+ threeList.get(j).getSm_name()
													+ "</span></a>");
										}
										out.println("</ul></div>");
										out.println("</li>");
									} else {
										out.println("<li><a href='" + path
												+ twoList.get(i).getSm_page()
												+ "'class='parent'><span>"
												+ twoList.get(i).getSm_name()
												+ "&nbsp;&nbsp;</span></a>");
										out.println("</li>");
									}
								}
								out.println("</ul></div>");
							}
							out.println("</li>");
						}
					}
			%>
			<li><a href="editmyInfo.do" title="个人信息维护"><span>个人信息维护</span>
			</a></li>
			<li><a href="passwordEdit.do" title="修改密码"><span>修改密码</span>
			</a></li>
			<li><a href="#" class="parent" title="帮助"><span>帮助</span> </a>
				<div>
					<ul>
						<!-- 二级菜单 -->
						<li><a href="leaderUserdownload.do"><span>领导用户手册</span></a></li>
					</ul>
				</div></li>
		</ul>
	</div>
	<div id="menu1">
		<td width="16%" valign="top"
			nowrapbackground="<%=request.getContextPath()%>/images/left_bg.gif">欢迎您：${sessionScope.current_user.true_name}老师，当前角色：学院领导
		</td>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="20" nowrap></td>
		</tr>
		</td>
		<td width="3%" nowrap></td>
		<td valign="top"><br> <script type="text/javascript">
			window.status = "Loading: Document body...";
		</script>
			<div class="conbgbtm" id="conbgbtm">
				<sitemesh:write property='body'></sitemesh:write>
			</div></td>
		<td width="1%" nowrap></td>
		</tr>
	</table>
	<br>
	<%--  <%@ include file="/includes/footer.jsp" %> --%>
	<style type="text/css">
#conbgbtm {
	height: auto !important;
	height: 500px;
	min-height: 500px;
}
</style>
	<%@ include file="/includes/copyright.jsp"%>
	<script type="text/javascript">
		window.status = "Done";
	</script>
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/menu.js"></script>
</body>
</html>
