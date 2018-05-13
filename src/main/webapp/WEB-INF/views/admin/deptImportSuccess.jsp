<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入教师</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
		function backList(){
			window.location.href="orgList.do?type="+"1";
		}
	</script>
</head>

<body>
	  <h2 align='center'>成功导入班级列表</h2>
	<input type="button" value="返回首页" onclick="backList()">
	

	<table border="1" width="1300" id="table1">
		<tr>
			<td width="120" align="center"><b>组织编码</b></td>
			<td width="150" align="center"><b>组织名称</b></td>
			<td width="120" align="center"><b>辅导员</b></td>
			<td width="120" align="center"><b>班主任</b></td>
			<td width="180" align="center"><b>上级组织</b></td>
			<td width="180" align="center"><b>年级</b></td>
		
		</tr>
		<c:forEach var="s" items="${teaSuccessList}" varStatus="stauts">
			<tr>
				<td align="center">${s.org_code}</td>
				<td align="center">${s.org_name}</td>
				<td align="center">${s.counselorName}</td>
				<td align="center">${s.head_tea_Name}</td>
				<td align="center">${s.parentOngName}</td>
				<td align="center">${s.time}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>