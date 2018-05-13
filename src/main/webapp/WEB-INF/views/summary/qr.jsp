<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<h1>二维码</h1>
	<img alt="二维码"
		src="http://qr.liantu.com/api.php?&bg=ffffff&fg=000000&text=${qr}" />
	<h1>短网址</h1>
	<a href="${url}" target="_blank">${url}</a>
</body>
</html>
