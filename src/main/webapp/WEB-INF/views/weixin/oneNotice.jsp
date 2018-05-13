<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>查看通知公告</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta name="viewport" content="width=device-width">
<script src="http://code.jquery.com/jquery.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
	<div data-role="page">
				<div style="width: 100%;" align="center">
				<h2>通知公告查看</h2>
				</div>
				<table class="table table-bordered">
					<tr>
						<td style="width: 25%">通知标题：</td>
						<td style="width: 65%">${notice.title}</td>
					</tr>
					<tr>
						<td style="width: 25%">通知内容：</td>
						<td style="width: 65%">${notice.content}</td>
					</tr>
					<tr>
						<td style="width: 25%">发布时间：</td>
						<td style="width: 65%">${notice.create_time}</td>
					</tr>
				</table>
	</div>
</body>
</html>




