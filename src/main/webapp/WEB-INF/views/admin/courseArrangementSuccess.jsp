<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>成功导入教师列表</title>
	<script type="text/javascript">
		function backList(){
			window.location.href="showTeaCourses.do";
		}
	</script>
</head>
<body>
  <h2 align='center'>成功导入教师列表</h2>
  <input type="button" value="返回首页" onclick="backList()">
  <table border="1" width="1300" id="teaTable" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="40">序号</th>
			<th width="150" align="center">课程编号</th>
			<th width="150" align="center">课程名称</th>
			<th width="150" align="center">教师名称</th>
			<th width="150" align="center">教工号</th>
		</tr>
			
		<c:forEach var="teaCourse" items="${teaCourseList}" varStatus="stauts">
			<tr>
				<td align="center">${stauts.index+1}</td>
				<<td align="center">${teaCourse.temp2}</td>
				<td align="center">${teaCourse.temp3}</td>
				<td align="center">${teaCourse.true_name}</td>
				<td align="center">${teaCourse.tea_code}</td>
		</c:forEach>
	</table>
</body>
</html>
