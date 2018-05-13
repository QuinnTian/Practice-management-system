<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
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

<title>学生公司报表</title>

<script>
	function exportExcel() {
		window.document.stuCompanyForm.action = "getstuCompanyReportExcel.do";
		window.document.stuCompanyForm.submit();
	}
	function generationPdf() {
		window.document.stuCompanyForm.action = "getstuCompanyReportPdf.do";
		window.document.stuCompanyForm.submit();
	} 
</script>

</head>

<body>
	<h2>实习学生就业情况报表</h2>
	<form method="post" id="stuCompanyForm" name="stuCompanyForm"
		target=_blank>
		选择年级：<select name="entry_year" id="entry_year">
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
		</select>
		<input type="button" value="生成报表" onclick="generationPdf()">
		<input type="button" value="导出excel" onclick="exportExcel()">
	</form>
</body>
</html>
