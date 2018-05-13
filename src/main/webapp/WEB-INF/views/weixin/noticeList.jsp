<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE html>
<html>
<head>
<title>查看通知公告</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<script src="http://code.jquery.com/jquery.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
	<div style="width: 100%;" align="center">
		<h2>通知公告查看</h2>
	</div>
	<table class="table table-striped">
		<c:forEach var="noticeList" items="${noticeList}" varStatus="stauts">
			<tr>
				<td>${stauts.index+1}</td>
				<td><font size="4"><a href="toOneNotice.do?notice_id=${noticeList.id}">${noticeList.title}</a></font>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
