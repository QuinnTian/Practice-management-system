<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员实训安排报表</title>
<script>
	function exportExcel() {
		window.document.trainReportForm.action = "doGetTrainDetailExcel.do";
		window.document.trainReportForm.submit();
	}
	function generationPdf() {
		window.document.trainReportForm.action = "doGetTrainDetail.do";
		window.document.trainReportForm.submit();
	}
</script>
</head>
<body>
	<h2>实训安排报表</h2>
	<form method="post" id="trainReportForm" name="trainReportForm" target=_blank>
		选择实训年份： <select name="year" id="year">
			<option value="2014-2015">2014-2015</option>
			<option value="2015-2016">2015-2016</option>
		</select>
		 选择学期： <select name="term" id="term">
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
		选择院系： <select name="org_id" id="org_id">
			<c:forEach var="departmentlist" items="${departmentlist}" varStatus="stauts">
				<option value="${departmentlist.id}">${departmentlist.org_name}</option>
			</c:forEach>
		</select> 
		<input type="button" value="生成报表" onclick="generationPdf()">
		<input type="button" value="导出excel" onclick="exportExcel()">
	</form>
</body>
</html>