<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>专家回复</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

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

<script type="text/javascript">
/*验证 2015年6月9日 11:50:24*/
function doAdd() {
		var answer = document.getElementById("answer");
		if (answer.value == "") {
			alert("问题答案不允许为空！");
			return null;
		}
		
			document.forms[0].submit();
	}
</script>
</head>
<body onload="is_weixin()">
	<div data-role="page">
		 <form  name="form"  id="form" method="post" action="doSavaShortQuestion.do">
			<fieldset data-role="fieldcontain">
				<div style="width: 100%;" align="center">
				<h2>专家回复</h2>
				</div>
				<table  border="1"   style="width: 100% ;">
					<tr>
					
						<td style="width: 25%">问题：</td>
						<td style="width: 65%">${knowledge.question}</td>
					</tr>
					<tr>
						<td style="width: 25%">
						<input type="hidden" id="question_id" name="question_id" value="${knowledge.id}">
						<input type="hidden" id="tea_id" name="tea_id" value="${knowledge.answerer}">
						回复：</td>
						<td style="width: 65%"><textarea id="answer" name="answer" style="width:100%; height: 100%;  border: 0;">${knowledge.answer}</textarea></td>
					</tr>
				</table>
				<input type="submit" value="确认回复" />
			</fieldset>
	</form>
	</div>
</body>
</html>




