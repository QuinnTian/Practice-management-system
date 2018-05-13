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
<%-- <base href="<%=basePath%>"> --%>

<title>My JSP 'report.jsp' starting page</title>

<script>
	function exportExcel() {
		window.document.trainReportForm.action = "getA_GraduationmaterialsExcel.do";
		window.document.trainReportForm.submit();
	}
	function generationPdf() {
		window.document.trainReportForm.action = "getA_Graduationmaterials.do";
		window.document.trainReportForm.submit();
	}
</script>

</head>

<body>
	<h2>就业材料汇总报表</h2>
	<form method="post" id="trainReportForm" name="trainReportForm"
		target=_blank>
		选择年级：<select name="entry_year" id="entry_year">
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
		</select>
		选择院系：
		<select name="dept_id" id="dept_id">
			<c:forEach var="departmentlist" items="${departmentlist}"
				varStatus="stauts">
				<option value="${departmentlist.id}">${departmentlist.org_name}</option>
			</c:forEach>
		</select>  <input type="button" value="生成报表" onclick="generationPdf()">
		<input type="button" value="导出excel" onclick="exportExcel()">
	</form>
</body>
</html>
