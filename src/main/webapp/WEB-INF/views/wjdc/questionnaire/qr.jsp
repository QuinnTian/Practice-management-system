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

	<table>
		<tr>
			<td><h1>二维码</h1> <img alt="二维码"
				src="http://qr.liantu.com/api.php?&bg=ffffff&fg=000000&text=${qr}" /></td>
			<td>
				<h1>备用二维码</h1> <img alt="备用二维码"
				src="http://api.k780.com:88/?app=qr.get&data=${url}&level=L&size=10">
			</td>
		</tr>
	</table>

	<h1>短网址</h1>
	<small>注意：短网址区分大小写</small>
	<a href="${url}" target="_blank">${url}</a>
</body>
</html>
