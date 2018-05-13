
<%--
 这个主装饰器应用于所有的页面.它包含标准的缓存, 样式表, 头部, 底部和版权声明.
 --%>
<%-- <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> --%>
<%--  <%@ include file="/includes/cache.jsp" %> --%>
<%@ page import="com.sict.service.DictionaryService" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>企业评价首页</title>
<link rel="stylesheet" href="/springmvc/css/style.css" type="text/css"
	media="all" />
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/sict.png">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc/js/common.js"></script>
<!-- 样式 -->

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
	<div class="form-group" align="right">
		<a href="/springmvc_mybatis/logout.do">退出系统</a>
	</div>
	<!--菜单栏  -->
	<div id="menu">
		<ul class="menu">
			<li>
				<!-- 一级菜单 --> <a title="首页" href="index.do"><span id="logo-menu">首页</span>
			</a>
			</li>
			<li>
				<!-- 一级菜单 --> <a href="<%=path%>/company/evalStuList.do"><span>评价实习学生</span>
			</a>

				<li><a href="../company/editmyInfo.do" title="个人信息维护"><span>个人信息维护</span>
				</a></li>
				<li><a href="../company/PasswordEdit.do" title="修改密码"><span>修改密码</span>
				</a></li>
		</ul>
	</div>
	<div id="menu1">
		<td width="16%" valign="top"
			nowrapbackground="<%=request.getContextPath()%>/images/left_bg.gif">欢迎您：&nbsp;${sessionScope.current_user.true_name}，当前角色：企业老师
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
	<%@ include file="/includes/copyright.jsp"%>
	<style type="text/css">
#conbgbtm {
	height: auto !important;
	height: 500px;
	min-height: 500px;
}
</style>
	<script type="text/javascript">
		window.status = "Done";
	</script>
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/menu.js"></script>
</body>
</html>
