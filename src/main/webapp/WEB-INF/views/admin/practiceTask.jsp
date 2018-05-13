<%@ page import="com.sict.service.DictionaryService" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
</head>
<body>	
    <h1>查看实训任务列表</h1>
	<table border="1" width="1200">
		<tr>
			<td width="100" align="center">任务编号</td>
			<td width="50" align="center">任务名称</td>
			<td width="100" align="center">负责人ID</td>
			<td width="100" align="center">开始时间</td>
			<td width="100" align="center">结束时间</td>
			<td width="200" align="center">任务描述</td>
			<td width="100" align="center">任务地点</td>
			<td width="100" align="center">文件ID</td>
			<td width="100" align="center">任务类型</td>
			<td width="100" align="center">父亲ID</td>
			<td width="100" align="center">状态</td>
			<td width="100" align="center">年级</td>
			<td width="100" align="center">范围</td>
		</tr>	
		<c:forEach var="t" items="${lists}" varStatus="stauts">
			<tr>
				<td>${t.practice_code}</td>
				<td>${t.task_name}</td>
				<td><c:set var="te" value="${t.tea_id}" scope="request"></c:set>
					<%String tea_id=(String)request.getAttribute("te"); %>
					<%out.println(DictionaryService.findTeacher(tea_id).getTrue_name()); %>
				</td>			
                <td><fmt:parseDate value="${t.begin_time}" 
                var="begin_time"/><fmt:formatDate value="${begin_time}" pattern="yyyy/MM/dd"/></td>
                <td><fmt:parseDate value="${t.end_time}" 
                var="end_time"/><fmt:formatDate value="${end_time}" pattern="yyyy/MM/dd"/></td>
				<td>${t.task_desc}</td>
				<td>${t.task_place}</td>
				<td>${t.file_id}</td>
				<td>${t.task_type}</td>
				<td>${t.parent_id}</td>
				<td>${t.state}</td>
				<td>${t.grade}</td>
				<td>${t.scope}</td>
					
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>
