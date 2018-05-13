<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="com.sict.entity.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>学生会成员</title>
</head>

<body>
	<h1>学生会成员</h1>
	<br />
	<input id="addNumber" name="addNumber" type="button" value="添加成员"
		onclick="location.href='stuUnionMemberAdd.do?id=${id}'" />
	<input id="importNumber" name="importNumber" type="button" value="导入成员"
		onclick="location.href='importStuUnionMember.do?id=${id}'" />
	<br />
	<br />
	<table id="courseTab" border="1" width="850" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150">部门名称</th>
			<th width="150">学生姓名</th>
			<th width="150">入职时间</th>
			<th width="150">离职时间</th>
			<th width="150">职务</th>
			<th width="300">状态</th>
		</tr>
		<c:forEach var="associationMembers" items="${associationMembersList}" varStatus="status">
			<tr>
				<td width="150"><c:set var="sam_association_id" value="${associationMembers.sam_association_id}"
						scope="request" /> <%
 	String sam_association_id = (String) request.getAttribute("sam_association_id");
 		if (sam_association_id != null) {
 			Association association = DictionaryService.findAssociation(sam_association_id);
 			if (association != null)					
 				out.println(association.getSa_name());
 			else
 				out.println("无");

 		} else {
 			out.println("无");
 		}
 %></td>
				<c:set var="stu_id" scope="request" value="${associationMembers.sam_stu_id }" />

				<td width="150">
					<%
						String stu_id = (String) request.getAttribute("stu_id");
							out.println(DictionaryService.findStudent(stu_id).getTrue_name());
					%>
				</td>
				<td width="150"><fmt:parseDate var="begin_time" value="${associationMembers.begin_time }" /> <fmt:formatDate
						value="${begin_time }" pattern="yyyy-MM-dd" /></td>
				<td width="150"><c:if test="${!empty associationMembers.end_time}">
						<fmt:parseDate var="end_time" value="${associationMembers.end_time }" />
						<fmt:formatDate value="${end_time }" pattern="yyyy-MM-dd" />
					</c:if> <c:if test="${empty associationMembers.end_time}">暂无</c:if></td>
				<td width="150">
					<%
						Association association = DictionaryService.findAssociation(sam_association_id);
					%> <c:choose>
						<c:when test="${associationMembers.sam_duty==1}">学生会主席</c:when>
						<c:when test="${associationMembers.sam_duty==2}">学生会副主席</c:when>
						<c:when test="${associationMembers.sam_duty==3}"><%=association.getSa_name()%>部长</c:when>
						<c:when test="${associationMembers.sam_duty==4}"><%=association.getSa_name()%>副部长</c:when>
						<c:otherwise>
							普通干事
						</c:otherwise>
					</c:choose>
				</td>
				<td width="150"><c:if test="${associationMembers.state==1}">在职</c:if> <c:if
						test="${associationMembers.state!=1}">离职</c:if></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>