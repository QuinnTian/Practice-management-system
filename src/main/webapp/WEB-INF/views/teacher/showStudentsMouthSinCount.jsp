<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript"
	src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
</head>
<body>
	<h2 align="left">${stu_name }同学：${mouth }月签到情况</h2>
	&nbsp;
	<table border="1" width="980" id="praTable" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr>
			<th width="40">序号</th>
			<th width="130">学号</th>
			<th width="120">姓名</th>
			<th width="120">班级</th>
			<th width="120">签到时间</th>
			<th width="100">联系电话</th>
		</tr>
		<c:forEach var="s" items="${listStudent}" varStatus="hs">
			<tr>
				<td>${hs.index+1}</td>
				<td>${s.stu_code}</td>
				<td>${s.true_name}</td>
				<td>
				<c:set var="class_id" value="${s.class_id}" scope="request">
				</c:set>
					<%
				String class_id = (String) request.getAttribute("class_id");
				%> <%
				out.println(DictionaryService.findOrg(class_id).getOrg_name());
				%>
				</td>
				<td>${s.sign_time}</td>
				<td>${s.phone}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
