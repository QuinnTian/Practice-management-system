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
<title>学生状态成绩折线图</title>
<script>
	function studentStateReportPdf() {
		window.document.studentStateReportForm.action = "doGetstudentStateReport.do";
		window.document.studentStateReportForm.submit();
	}
	
</script>
</head>
<body>
	<h2>实习状态报表</h2>
	<form method="post" id="studentStateReportForm" name="studentStateReportForm" target=_blank>
		选择部门： <select name="dept_id" id="dept_id">
					<option value="全院">全院</option>
					<c:forEach var="departmentlist" items="${departmentlist}" varStatus="stauts">
					<option value="${departmentlist.id}">${departmentlist.org_name}</option>
					</c:forEach>
				</select> 
		<!-- 选择年级： <select name="year" id="year">
			 		<option value="2013">2013</option>
				</select> -->
		<input type="button" value="生成报表" onclick="studentStateReportPdf()">
	</form>
</body>
</html>