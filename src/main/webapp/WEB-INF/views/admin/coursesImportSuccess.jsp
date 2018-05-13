<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
<title>成功导入课程列表</title>
	<script type="text/javascript">
		function backList(){
			window.location.href="courseList.do";
		}
	</script>
</head>
<body>
  <h2 align='center'>成功导入课程列表</h2>
  <input type="button" value="返回首页" onclick="backList()">
  <table border="1" width="1300" id="teaTable" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="40">序号</th>
			<th width="150" align="center">课程编码</th>
			<th width="150" align="center">课程名称</th>
			<th width="150" align="center">所属院系</th>
			<th width="150" align="center">授课对象</th>
		</tr>
			
		<c:forEach var="t" items="${coursesList}" varStatus="stauts">
			<tr>
				<td align="center">${stauts.index+1}</td>
				<td align="center">${t.course_code}</td>
				<td align="center">${t.course_name}</td>
				<c:set var="org_id" value="${t.org_id}" scope="request"></c:set>
					<%
						String org_id = (String) request.getAttribute("org_id");
					%>
				<td align="center">
					<%
						out.println(DictionaryService.findOrg(org_id).getOrg_name());
					%></td>
				<td align="center">${t.class_object}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
