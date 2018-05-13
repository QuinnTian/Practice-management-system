<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="<%=basePath%>">

<title>My JSP 'showScore.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<head>
</head>

<body>
<form >
	<table border="1" width="900">
		<tr>
			<td width="80">学号</td>
			<td width="80">姓名</td>
			<td width="80">班级</td>
			<td width="80">月总结成绩</td>
			<td width="80">论文成绩</td>
			<td width="80">奖惩成绩</td>
			<td width="80">总成绩</td>

	

		</tr>

		<c:forEach var="s" items="${result}" varStatus="stauts">
		<tr>
		<td>${s.STU_CODE}</td>
		<TD>${s.TRUE_NAME}</TD>
		<TD>${s.ORG_NAME}</TD>
		<TD>${s.monthscore}</TD>
		<TD>${s.thesisscore}</TD>
		<TD>${s.evaluatescore}</TD>
		<td>${s.totalscore}</td>
		
		</tr>
			</c:forEach>

	</table>
	</form>
</body>
</html>
