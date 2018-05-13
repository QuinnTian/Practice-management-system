<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>学生web首页</title>
    <link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
  </head>
  <body>
    <h2>班级通讯录</h2>
    <table border="1" width="1300" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width='70' align='center'>学号</th>
			<th width='80' align='center'>姓名</th>
			<th width='80' align='center'>手机号</th>
			<th width='80' align='center'>QQ号</th>
			<th width='100' align='center'>EMAIL</th>
		</tr>
		<c:forEach var="stulist" items="${stulist}" varStatus="stauts">
			<tr>
				<td>${stulist.stu_code}</td>
				<td>${stulist.true_name}</td>
				<td>${stulist.phone}</td>
				<td>${stulist.qqnum}</td>
				<td>${stulist.email}</td>
			</tr>
		</c:forEach>
	</table>
  </body>
</html>
