<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>Insert title here</title>
</head>

<body>
	<h1>学生会 社团成员</h1>
	<br />
	<br />
	<input id="addNumber" name="addNumber" type="button" value="添加成员"
		onclick="location.href='stuUnionOrAssAdd.do?id=${id}'" />
	<input id="importNumber" name="importNumber" type="button" value="导入成员"
		onclick="location.href='importStuUnionOrAssNumber.do?id=${id}'" />
	<br />
	<br />
	<table id="courseTab" border="1" width="850" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150">部门名称</th>
			<th width="150">学生姓名</th>
			<th width="150">入职时间</th>
			<th width="150">离职时间</th>
			<th width="150">职责</th>
			<th width="300">状态</th>
		</tr>
		<c:forEach var="associationMembers" items="${associationMembersList }" varStatus="status">
			<tr>
				<td width="150">${associationMembers.sam_association_id }</td>
				<c:set var="stu_id" scope="request" value="${associationMembers.sam_stu_id }" />

				<td width="150">
					<%
						String stu_id = (String) request.getAttribute("stu_id");
							out.println(DictionaryService.findStudent(stu_id).getTrue_name());
					%>
				</td>
				<td width="150">
					${associationMembers.begin_time }
				
				</td>
				<td width="150">${associationMembers.end_time }</td>
				<td width="150">${associationMembers.sam_duty }</td>
				<td width="150">
					<c:if test="${associationMembers.state==1}">
						有效
					</c:if>
					<c:if test="${associationMembers.state!=1}">
						无效
					</c:if>
				
				</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>