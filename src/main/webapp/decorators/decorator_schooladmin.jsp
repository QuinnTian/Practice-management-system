<%--
 这个主装饰器应用于所有的页面.它包含标准的缓存, 样式表, 头部, 底部和版权声明.
 --%>
<%-- <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> --%>
<%--  <%@ include file="/includes/cache.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><sitemesh:write property='title' /></title>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
	<link rel="shortcut icon" type="image/x-icon" href="<%=path%>/images/sict.png">

<link rel="stylesheet" href="../css/style1.css" media="screen"
	type="text/css" />
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
</head>
<body bgcolor="#FFFFFF">
	<%@ include file="/includes/header.jsp"%>
	<div class="form-group" align="right">
		
		<a href="/springmvc_mybatis/logout.do">退出系统</a>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<!-- <tr>
			<td height="20" nowrap></td>
		</tr> -->

		<!--菜单栏  -->
		<div id="menu">
			<ul class="menu">
				<li>
					<!-- 一级菜单 --> <a title="首页" href="index.do"><span
						id="logo-menu">首页</span> </a></li>
				<li>
					<!-- 一级菜单 --> <a href="#" class="parent"><span>基础管理</span> </a>
					<div>
						<ul>
							<!-- 二级菜单 -->
							<li><a href="roleList.do"><span>角色管理</span></a></li>
							<!-- <li><a href="schoolOrganization.do"><span>组织管理</span></a></li> -->
							<li><a href="paramList.do"><span>参数管理</span></a></li>
							<li><a href="classroomManage.do"><span>教室管理</span></a></li>
						</ul>
					</div>
				</li>
				<li>
					<!-- 一级菜单 --> <a href="#" class="parent"><span>学校管理</span> </a>
					<div>
						<ul>
							<!-- 二级菜单 -->
							<li><a href="initCollege.do"><span>初始化学院（重要）</span></a></li>
							<li><a href="initCollegeRole.do"><span>初始化学院角色（重要）</span></a></li>
							<!-- <li><a href="orgList.do"><span>创建学院</span></a></li>
							<li><a href="adminList.do"><span>创建学院管理员</span></a></li> -->
							<!-- <li><a href="schoolLeader.do"><span>教师用户管理</span></a></li>
							<li><a href="schoolLeader.do"><span>学生用户管理</span></a></li>
							<li><a href=""><span>教室管理（未做完）</span></a></li> -->
							
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div id="menu1" style="float:right; text-align:right;">
			<span>欢迎您&nbsp;:&nbsp;&nbsp;${sessionScope.current_user.true_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
		<!-- <td width="2%" nowrap></td> -->
		<tr>
		<td valign="top"> 
		<script type="text/javascript">
			window.status = "Loading: Document body...";
		</script>
			<div class="conbgbtm">
				<sitemesh:write property='body'></sitemesh:write>
			</div></td>
		<!-- <td width="1%" nowrap></td> -->
		</tr>
	</table>
	<%--  <%@ include file="/includes/footer.jsp" %> --%>
	<%@ include file="/includes/copyright.jsp"%>
	<script type="text/javascript">
		window.status = "Done";
	</script>
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/menu.js"></script>
</body>
</html>
