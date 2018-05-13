<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script>
//返回
	function doBack() {
		window.history.go(-1);
	}
</script>
</head>
<body>
	<h2>学生列表</h2>
	<br>
	<table border="1" width="1300" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150">学号</th>
			<th width="150">学生姓名</th>
			<th width="150">学生性别</th>
			<th width="150">班级</th>
			<th width="150">学生QQ</th>
			<th width="150">联系电话</th>
			<th width="150">学生邮箱</th>
		</tr>
		<c:forEach var="student" items="${studentList}" varStatus="stauts">
			<tr>
				<td>${student.stu_code}</td>
				<td>${student.true_name}</td>
				<td>${student.sex}</td>
				<c:set var="class_id" value="${student.class_id}" scope="request"></c:set>
					<%
						String class_id = (String) request.getAttribute("class_id");
					%> 
				<td><% out.println(DictionaryService.findOrg(class_id).getOrg_name());%></td>
				<td>${student.qqnum}</td>
				<td>${student.phone}</td>
				<td>${student.email}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-top:20px;">
			<button type="button" onclick="doBack();">返回</button>
	</div>
</body>
</html>
