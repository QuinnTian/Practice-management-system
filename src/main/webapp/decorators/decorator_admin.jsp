<%--
 这个主装饰器应用于所有的页面.它包含标准的缓存, 样式表, 头部, 底部和版权声明.
 --%>
<%-- <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> --%>
<%--  <%@ include file="/includes/cache.jsp" %> --%>
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
<title><sitemesh:write property='title' />
</title>

<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=path%>/css/style1.css" media="screen"
	type="text/css" />
<script type="text/javascript"
	src="/springmvc_mybatis/js/changeRoles.js"></script>

<!-- <style type='text/css'>
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
</style> -->
<sitemesh:write property='head' />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var sele = $("#roles option:selected").val();
		var mainPage = "";
		if (sele.indexOf("ROLE_TEACHER") != -1) {
			mainPage = "/springmvc_mybatis/teacher/index.do";
			window.location.href = mainPage + "?current_role_selected=" + sele;
		}
	};
</script>
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/sict.png">
</head>
<body bgcolor="#FFFFFF">
	<div><%@ include file="/includes/header.jsp"%>

		<div class="form-group" align="right">
			<label for="user_role">选择用户角色</label> <select name="roles" id="roles"
				style="width:15%;" onchange="toMainPage()">
				<%
					String current_role_selected = "";
					Cookie[] cookie = request.getCookies();
					for (int i = 0; i < cookie.length; i++) {
						Cookie cook = cookie[i];
						if (cook.getName().equalsIgnoreCase("ck")) { //获取键 
							current_role_selected = cook.getValue().toString(); //获取值 
						}
					}
					

					if (current_role_selected.equals("")) {
						current_role_selected = (String) session
								.getAttribute("current_role_selected");
					}

					System.out.println("current_role_selected---"
							+ current_role_selected);
				%>

				<c:forEach var="role" items="${user_role}" varStatus="stauts">
					<option value="${role}"
						<c:if test="${role==cookie.ck.value}"> selected</c:if>>
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
			<%
				ArrayList userRoleList = (ArrayList) session
						.getAttribute("user_role");//用户角色列表
			%>
			<!-- <button class="btn btn-lg btn-primary btn-block" type="button"
				onclick="toMainPage()">切换</button> -->
			<a href="/springmvc_mybatis/logout.do">退出系统 </a>
		</div>
	</div>
	<%-- <%
	
		if (userRoleList.contains("ROLE_ADMIN")) {
	%> --%>
	<!--菜单栏 (学院管理员菜单) -->
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
						if (s.getSm_page().equals("#")) {
							out.println("<li><a href='" + s.getSm_page()
									+ "' class='parent'><span>" + s.getSm_name()
									+ "</span></a>");
						} else {
							out.println("<li><a href='" + path + s.getSm_page()
									+ "' class='parent'><span>" + s.getSm_name()
									+ "</span></a>");
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

			<%--   <li><!-- 一级菜单 --> <a href="#" class="parent"><span>实习管理</span></a>
            <div><ul><!-- 二级菜单 --> 
				<li><a href="" class="parent"><span>通知招聘管理</span></a>
					<div><ul>
						<li><a href="<%=path%>/admin/noticeList.do"><span>通知管理</span></a></li>
						<li><a href="<%=path%>/admin/recruitInfoList.do"><span>招聘管理</span></a></li>
					</ul></div>
				</li>
				<li><a href="<%=path%>/admin/practicetaskList.do?type=shixi"><span>实习任务管理</span>
						</a>
						</li>
				<li><a href="<%=path%>/admin/groupsList.do"><span>实习分组管理</span>
						</a>
						</li>
                
				<li><a href="<%=path%>/admin/BmapPie.do"><span>实习签到查看</span></a></li>
				<li><a href="<%=path%>/admin/scoreSearch.do"><span>实习成绩查看</span></a></li>
				<li><!-- 二级菜单 --> <a href="#" class="parent"><span>实习总结管理</span></a>
				 	<div><ul>
						<li><a href="<%=path%>/summary/user/home.htm"><span>实习模版创建</span></a></li>
					</ul></div>
				</li>
			    <li><!-- 二级菜单 --> <a href="#" class="parent"><span>实习报表</span></a>
					<div><ul><!-- 三级菜单 -->
						<li><a href="<%=path%>/admin/getA_Graduationmaterials_0.do"><span>就业材料汇总报表</span></a></li>
						<li><a href="<%=path%>/admin/getAdminStateReport.do"><span>实习状态分数报表</span></a></li>
<!-- 						<li><a href=""><span>信息核对汇总报表（未做）</span></a></li>
						<li><a href=""><span>实习成绩汇总报表（未做）</span></a></li>
						<li><a href=""><span>就业率报表（未做）</span></a></li>
						<li><a href=""><span>实习违纪汇总报表（未做）</span></a></li> -->
					</ul></div>
				</li>
				<li><a href="<%=path%>/admin/diectRecordList.do"><span>指导记录查看</span></a></li>
			</ul></div>
		</li>
	        <li><!-- 一级菜单 --><a href="#" class="parent"><span>实训管理</span></a>
				<div><ul><!-- 二级菜单 -->
					<li><a href="<%=path%>/admin/practicetaskList.do?type=shixun"><span>实训任务管理</span></a></li>
					<li><a href="<%=path%>/admin/trainDetailList.do?type='1'"><span>实训安排管理</span>
						</a>
						</li>
					<li> <a href="#" class="parent"><span>实训报表</span></a>
						<div><ul><!-- 三级菜单 -->
							<li><a href="<%=path%>/admin/getTrainDetailReport.do"><span>实训安排报表</span>
						</a>
						</li>
						<!-- <li><a href="#"><span>实训成绩报表（未做）</span>
						</a>
						</li>
						<li><a href="#"><span>实训违纪汇总报表（未做）</span>
						</a>
						</li> -->
						</ul></div>
					</li>
				</ul></div>
			</li>
			<li><!-- 一级菜单 --><a href="#" class="parent"><span>基础设置</span></a>
				<div><ul><!-- 二级菜单 -->
					<li><a href="<%=path%>/admin/orgList.do"><span>组织管理</span></a></li>
					<li><a href="<%=path%>/admin/teacherList.do?type='1'"><span>教师管理</span></a></li>
					<li><a href="<%=path%>/admin/studentImportList.do?type='1'"><span>学生管理</span></a></li>
					<li><a href="<%=path%>/admin/courseList.do"><span>课程管理</span></a></li>
					<li><a href="<%=path%>/admin/companyList.do?type='1'"><span>企业管理</span></a></li>
					<li><a href="<%=path%>/admin/evaluateStandardList.do?type='1'"><span>评分标准管理</span></a></li>
					<li><a href="<%=path%>/admin/roleList.do"><span>角色管理</span></a></li>
					<li><a href="<%=path%>/admin/userRoleList.do"><span>权限管理</span></a></li>
					<li><a href="<%=path%>/admin/positionList.do"><span>岗位管理</span>
						</a>
						</li>
				</ul></div>
			</li>
	 <%
		
		} else if (userRoleList.contains("ROLE_ADMIN_EMPLOYMENT")) {
	%> --%>

			<%-- <!--菜单栏  （学院就业管理员）-->
	<div id="menu">
    <ul class="menu">
	    <li><!-- 一级菜单 --> <a title="首页" href="index.do"><span id="logo-menu">首页</span></a></li>
        <li><!-- 一级菜单 --> <a href="#" class="parent"><span>实习管理</span></a>
            <div><ul><!-- 二级菜单 --> 
				<li><a href="" class="parent"><span>通知招聘管理</span></a>
					<div><ul>
						<li><a href="<%=path%>/admin/noticeList.do"><span>通知管理</span></a></li>
						<li><a href="<%=path%>/admin/recruitInfoList.do"><span>招聘管理</span></a></li>
					</ul></div>
				</li>
				<li><a href="<%=path%>/admin/BmapPie.do"><span>实习签到查看</span></a></li>
				<li><a href="<%=path%>/admin/scoreSearch.do"><span>实习成绩查看</span></a></li>
				<li><!-- 二级菜单 --> <a href="#" class="parent"><span>实习总结管理</span></a>
				 	<div><ul>
						<li><a href="<%=path%>/summary/user/home.htm"><span>实习模版创建</span></a></li>
					</ul></div>
				</li>
			    <li><!-- 二级菜单 --> <a href="#" class="parent"><span>实习报表</span></a>
					<div><ul><!-- 三级菜单 -->
						<li><a href="<%=path%>/admin/getA_Graduationmaterials_0.do"><span>就业材料汇总报表</span></a></li>
						<li><a href="<%=path%>/admin/getAdminStateReport.do"><span>实习状态分数报表</span></a></li>
						<li><a href="<%=path%>/admin/getstuCompanyReport.do"><span>实习学生就业情况报表</span></a></li>
					</ul></div>
				</li>
				<li><a href="<%=path%>/admin/diectRecordList.do"><span>指导记录查看</span></a></li>
			</ul></div>
		</li>
	        <li><!-- 一级菜单 --><a href="#" class="parent"><span>实训管理</span></a>
				<div><ul><!-- 二级菜单 -->
					<li> <a href="#" class="parent"><span>实训报表</span></a>
						<div><ul><!-- 三级菜单 -->
							<li><a href="<%=path%>/admin/getTrainDetailReport.do"><span>实训安排报表</span>
						</a>
						</li>
						</ul></div>
					</li>
				</ul></div>
			</li> --%>
			<%-- <%
		}
	%> --%>
			<li>
				<!-- 一级菜单 --> <a href="#" class="parent"><span>个人信息</span> </a>
				<div>
					<ul>
						<!-- 二级菜单 -->
						<li><a href="editmyInfo.do" title="信息维护"><span>个人信息维护</span>
						</a>
						</li>
						<li><a href="passwordEdit.do" title="修改密码"><span>修改密码</span>
						</a>
						</li>
					</ul>
				</div></li>
			<li><a href="#" class="parent" title="帮助"><span>帮助</span> </a>
				<div>
					<ul>
						<!-- 二级菜单 -->
						<li><a href="Userdownload.do"><span>用户手册下载</span> </a>
						</li>
						<li><a href="templetdownload.do"><span>导入模板下载</span> </a>
						</li>
					</ul>
				</div></li>
			<!-- 在校生以后加着里面先 -->
			<!-- <li><a href="./showTeaCourses.do"><span>课程安排管理</span></a></li>
		<li><a href="associationList.do" ><span>社团</span> </a></li> -->
			<!-- 在校生以后加着里面先  -->
		</ul>
	</div>
	<div id="menu1" style="float:right;">
		<span>欢迎您&nbsp;:&nbsp;&nbsp;${sessionScope.current_user.true_name}老师，当前角色：学院管理员</span>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<!-- <tr>
			<td height="20" nowrap></td>
		</tr> -->
		<tr>
			<td valign="top">
				<div class="conbgbtm" id="conbgbtm">
					<sitemesh:write property='body'></sitemesh:write>
				</div> <!-- <td width="1%" nowrap></td> -->
		</tr>
	</table>

	<%--  <%@ include file="/includes/footer.jsp" %> --%>
	<%@ include file="/includes/copyright.jsp"%>
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/menu.js"></script>
	<style type="text/css">
#conbgbtm {
	height: auto !important;
	height: 500px;
	min-height: 500px;
}
</style>
</body>
</html>
