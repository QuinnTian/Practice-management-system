<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>指导回复</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

<style>
label.error {
	color: red;
	font-size: 16px;
	font-weight: normal;
	line-height: 1.4;
	margin-top: 0.5em;
	width: 100%;
	height: 100%;
	float: none;
}

@media screen and (orientation: portrait) {
	label.error {
		margin-left: 0;
		display: block;
	}
}

@media screen and (orientation: landscape) {
	label.error {
		display: inline-block;
		margin-left: 22%;
	}
}

em {
	color: red;
	font-weight: bold;
	padding-right: .25em;
}
</style>



</head>
<body onload="is_weixin()">
	<body onload="is_weixin()">
	<div data-role="page">
		<form method="post" action="demoform.asp">
			<fieldset data-role="fieldcontain">
				<h2>问题列表</h2>
				<table>
					<c:forEach var="knowledges" items="${knowledges}" varStatus="stauts">
					<tr>
					<td>
					${stauts.index+1}
					</td>
					<td>
					<a href="toOneAnswerQuersiton.do?knowledge_id=${knowledges.id}">${knowledges.question}</a>
					</td>
					</tr>
					</c:forEach>
				</table>

			</fieldset>
		</form>
	</div>
</body>
</body>
</html>




