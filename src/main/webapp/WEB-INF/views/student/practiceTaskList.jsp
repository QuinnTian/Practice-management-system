<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
h2 {
	text-align: left;
}
</style>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	// 下载
	function downloadPracticeTask(file_id) {
		if(file_id == ""){
		alert("该任务没有资料下载！");}
		else{
			window.location.href = "downloadFile.do?file_id="+file_id;
		}
		}
</script>
</head>
<body>
	<h2>实习任务下载</h2>
	<table border="1" width="1300" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<td width="40" align="center">序号</td>
			<td width="300" align="center">任务标题</td>
		    <td width="500" align="center">任务描述</td>
			<td width="90" align="center">任务负责人</td>
			<td width="90" align="center">开始时间</td>
			<td width="90" align="center">结束时间</td>
			<td width="50" align="center">操作</td>
		</tr>
		<c:forEach var="d" items="${result}" varStatus="stauts">
			<tr>
				<td align="center">${stauts.index+1} </td>
				<td>${d.task_name}</td>
				<td>${d.task_desc}</td>
				<td><c:set var="ss" value="${d.tea_id}" scope="request"></c:set>
					<%
						String true_name = (String) request.getAttribute("ss");
					%> <%
					 	out.println(DictionaryService.findTeacher(true_name)
					 				.getTrue_name());
					 %>
				</td>
				<td><fmt:parseDate value="${d.begin_time}" var="begin_time" />
					<fmt:formatDate value="${begin_time}" pattern="yyyy/MM/dd" /></td>
				<td><fmt:parseDate value="${d.end_time}" var="end_time" /> <fmt:formatDate
						value="${end_time}" pattern="yyyy/MM/dd" /></td>
						<td><input type="button" value="下载" onclick="downloadPracticeTask('${d.file_id}');"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
