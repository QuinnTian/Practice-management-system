<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生核对情况</title>
 <link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
</head>
<body>
	<form name="form1" method="post" action="" class="sjjx-table" cellspacing="0" cellpadding="0">
		<h2 align="left">学生核对情况</h2>
		<table border="1" width="1300">
			<tr>
				<td width="200">核对任务标题</td>
				<td width="150">学生学号</td>
				<td width="150">学生姓名</td>
				<td width="150">学生电话</td>
				<td width="150">核对时间</td>
				<td width="150">核对情况</td>
				<td width="150">备注</td>
			</tr>
			<c:forEach var="d" items="${result}" varStatus="stauts">
				<tr>
					
				<td><c:set var="sc" value="${d.checktask_id}" scope="request"></c:set>
						<%
							String practice_id = (String) request.getAttribute("sc");
						%> <%
 	out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
 %>
					</td>
					<td><c:set var="sc" value="${d.stu_id}" scope="request"></c:set>
						<%
							String stu_id = (String) request.getAttribute("sc");
						%> <%
 					out.println(DictionaryService.findStudent(stu_id).getStu_code());
 						%>
					</td>
					<td><c:set var="sc" value="${d.stu_id}" scope="request"></c:set>
						<%
							String stu_ids = (String) request.getAttribute("sc");
						%> <%
 	out.println(DictionaryService.findStudent(stu_ids).getTrue_name());
 %>
					</td>
					<td><c:set var="sc" value="${d.stu_id}" scope="request"></c:set>
						<%
							String stu_idss = (String) request.getAttribute("sc");
						%> <%
 	out.println(DictionaryService.findStudent(stu_idss).getPhone());
 %>
					</td>
					<td><fmt:parseDate value="${d.check_time}" var="check_time" />
						<fmt:formatDate value="${check_time}" pattern="yyyy/MM/dd" />
					</td>
					<td>${d.check_result}</td>
					<td>${d.note}</td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" onclick="window.location='./backcheckInfoList.do'">返回</button>
	</form>
</body>
</html>
