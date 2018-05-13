<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>社团维护</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen"
		type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script> 	
	
</head>
<body>
		<h1>学生会 社团信息</h1>
		<br/><br/><br/><br/>
	<table id="courseTab" border="1" width="850" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150">部门编码</th>
			<th width="150">部门名称</th>
			<th width="150">本门级别</th>
			<th width="150">所属学院</th>
			<th width="150">负责老师</th>
			<th width="300">负责学生</th>
			<th width="150">本门描述</th>
			<th width="150">创建人</th>
			<th width="50">上级部门</th>
			<th width="50">最后修改人</th>
			<th width="50">最后修改时间</th	>
			<th width="50">操作</th>
		</tr>
		<c:forEach var="association" items="${associationList}" varStatus="status">
			<tr>
				<td>${association.sa_code}</td>
				<td>${association.sa_name}</td>
				<td>${association.sa_level}</td>
				<td>${association.sa_college_id}</td>
				<td>${association.sa_tea_id}</td>
				<td>${association.sa_stu_id}</td>
				<td>${association.sa_describe}</td>
				<td>${association.sa_create_user}</td>
				<td>${association.sa_parent_id}</td>
				<td>${association.sa_last_edit_user}</td>
				<td>${association.sa_last_edit_time}</td>
				<td><a onclick="window.location='./seeStuUnionOrAssNumberdetail.do?id=${association.id}'">查看部门成员</a></td>
			</tr>
		</c:forEach>	
		
	</table>
	
</body>
</html>
