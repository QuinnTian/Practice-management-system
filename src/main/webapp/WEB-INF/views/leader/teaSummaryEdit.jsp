<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教师工作总结</title>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	function download() {
		var fileid = $("#file_id").val();
		console.log(fileid);
		if (fileid == "") {
			alert("此任务还没有文件，如果需要请点击浏览上传文件");
		} else {
			window.location.href = "downloadFile.do?file_id=" + fileid;
		}
	}
</script>
<script type="text/javascript">
	function back() {
		/* history.back();  */
		window.location.href = "backSummaryList.do";
		/* javascript:history.go(-1); */
	}
</script>

</head>
<body>
	<h2 align="left">教师工作总结</h2>
	<button onclick="download()">下载工作总结</button>
	<form name="form1" method="post" action="doEditTeaSummary.do">
		<input type="hidden" id="id" name="id" value="${directrecord.id}">
		<input type="hidden" id="file_id" name="file_id"
			value="${directrecord.file_id}">
		<table border="0" width="1000">
			<tr>
				<c:set var="p_id" value="${directrecord.practice_id}"
					scope="request"></c:set>
				<%
					String practice_id = (String) request.getAttribute("p_id");
				%>
				<td width="50">实习任务名称：</td>
				<td width="300">
					<%
						out.println(DictionaryService.findPracticeTask(practice_id)
								.getTask_name());
					%>
				</td>
			</tr>
			<tr>
				<td width="50">标题：</td>
				<td width="300">${directrecord.title}</td>
			</tr>
			<tr>
				<td width="50">开始时间：</td>
				<td width="300"><fmt:parseDate
						value="${directrecord.direct_time}" var="direct_time" /> <fmt:formatDate
						value="${direct_time}" pattern="yyyy/MM/dd" /></td>
			</tr>
			<tr>
				<td width="50">结束时间：</td>
				<td width="300"><fmt:parseDate value="${directrecord.temp2}"
						var="temp2" /> <fmt:formatDate value="${temp2}"
						pattern="yyyy/MM/dd" /></td>
			</tr>
			<tr>
				<td width="50">指导地点：</td>
				<td width="300">${directrecord.direct_place}</td>
			</tr>
			<tr>
				<td width="50">描述：</td>
				<td width="300">${directrecord.direct_desc}</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<button type="button" onclick="back()">返回</button>
		</div>
	</form>
</body>
</html>





















