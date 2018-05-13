<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入学生信息列表</title>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//返回到学生界面
	function backList() {
		window.location.href = "seeStuUnionMemberDetail.do?id=${id}";
	}
</script>
</head>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<body>
	<h2 align="center">成功导入学生列表</h2>
	<input type="button" value="返回首页" onclick="backList()"/>
	<table border="1" width="1300" id="table1" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table"
		cellspacing="0" cellpadding="0">
	<tr>
			<td width="30">序号</td>
			<td width="100" align="center"><b>学号</b></td>
			<td width="60" align="center"><b>姓名</b></td>
			<td width="40" align="center"><b>性别</b></td>
			<td width="100" align="center"><b>职务</b></td>
			<td width="100" align="center"><b>是否具有管理权限</b></td>
		
		</tr>
		<c:forEach var="stu" items="${s}" varStatus="stauts">
			<tr>
				<td align="center">${stauts.index+1}</td>
				<td align="center">${stu.stu_code}</td>
				<td align="center">${stu.true_name}</td>
				<td align="center">${stu.sex}</td>
				<td align="center">${stu.temp2}</td>
				<td align="center">${stu.temp3}</td>
		</c:forEach>
	</table>
</body>
</html>
