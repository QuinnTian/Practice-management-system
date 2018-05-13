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
<script src="<%=path%>/js/jquery.validate.js"></script>

<style>
label.error {
	color: red;
	font-size: 16px;
	font-weight: normal;
	line-height: 1.4;
	margin-top: 0.5em;
	width: 100%;
	height:100%;
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
	
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideOptionMenu');
		WeixinJSBridge.call('showToolbar');
	});

	function is_weixin() {
		var ua = navigator.userAgent.toLowerCase();
		if (ua.match(/MicroMessenger/i) == "micromessenger") {

		} else {
			/* window.location.href = "http://www.baidu.com"; */
		}
	}
</script>
<script type="text/javascript">
	/*验证 2015年6月9日 11:50:24*/
	function doAdd() {
		var evaluate = document.getElementById("evaluate");
		if (evaluate.value =="0") {
			alert("请选择评价！");
			return null;
		}
			$("#form").submit();
	}
</script>
</head>
<body onload="is_weixin()">
		<div data-role="content" data-theme="e">
		<form id="form" method="post" action="saveEvaluateQuiz.do" >
					<div data-role="fieldcontain">
					<%-- <c:set var="answerTeacher" value="${knowledge.answerer}" scope="request"></c:set>
					<%
						String tea_id = (String) request.getAttribute("answerTeacher");
					%>
					<label for="fullname">专家：
					<%out.println(DictionaryService.findTeacher(tea_id).getTrue_name()); %>
					</label>
					<br>  --%>
					<label for="fullname">问题：</label> <input type="text"
						name="expertise" id="expertise" value="${knowledge.question}">
				</div>
				<div data-role="fieldcontain">
					<label for="fullname">专家回复：</label>
					<textarea>${knowledge.answer}</textarea>
				</div>
				 评价回复： <select id="evaluate" name="evaluate">
				 	<option value="0">请选择</option>
					<option value="5">非常满意</option>
					<option value="4">满意</option>
					<option value="3">基本满意</option>
					<option value="2">不满意</option>
					<option value="1">差评</option>
				</select>
				<input type="button" data-inline="true" value="提交"
					onclick="doAdd()">  <input type="button"
					data-inline="true" value="关闭本窗口"
					onclick="WeixinJSBridge.call('closeWindow');" />
					<input type="hidden" id="qusertion_id" name="qusertion_id" value="${knowledge.id}">
			</form>
		</div>
</body>
</html>




