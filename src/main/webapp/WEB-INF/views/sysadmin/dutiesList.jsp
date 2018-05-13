<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>职务管理</title>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addDuties.do";
	}
</script>

</head>
<body>
	&nbsp;&nbsp;&nbsp;
	<input type="button" onclick="javascript:add();" value="添加职务" />
	<table border="1"  id="dutiesList" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th>职务号</th>
			<th>职务名称</th>
			<th>职务类型</th>
			<th>职务描述</th>
			<th>操作</th>
		</tr>
		<c:forEach var="g" items="${dutiesList}" varStatus="stauts">
			<tr>
				<td>${g.id}</td>
				<td>${g.name}</td>
				<td>${g.type}</td>
				<td>${g.duties_desc}</td>
				<td>删除</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
