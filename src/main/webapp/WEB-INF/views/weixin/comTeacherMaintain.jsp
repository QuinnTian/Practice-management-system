
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE>

<html>
<head>
<title>企业老师维护</title>
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
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/comTeacherMaintain.css">
<script type="text/javascript" src="<%=path%>/js/jquery.reveal.js"></script>
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
		var comTeaherName = document.getElementById("comTeaherName");
		var comTeaherPhone = document.getElementById("comTeaherPhone");
		var comTeacher = document.getElementById("comTeacher");
		if (comTeaherName.value == "") {
			alert("企业老师姓名不允许为空！");
			return;
		}
		if (comTeaherPhone.value == "") {
			alert("电话不允许为空！");
			return;
		}
		$("#form").submit();
	}

	function changeTeacher() {
		var comTeacher = document.getElementById("comTeacher");
		
		if (comTeacher.value != "1") {
			alert("您已经选择企业老师！新增企业老师禁用！");
			$("#abcd").attr({
				disabled : 'disabled'
			});
			return;
		}else{
		alert("您已经恢复选择企业老师，现在可以新增老师！");
		$("#abcd").removeAttr("disabled");
		}
	}
	
</script>
</head>
<body onload="is_weixin()">
	<form id="form" method="post" action="saveComTeaccher.do">
		<div data-role="content" data-theme="e">
			<label for="fullname"><font size="4"> 学生姓名：${stuName}</font>
			</label> <br> <label for="fullname"><font size="4">
					所在公司：${comName}</font> </label>
			<div data-role="fieldcontain">
				<label for="fullname"><font size="4"> 选择企业老师 *：</font> </label> <select
					id="comTeacher" name="comTeacher" onchange="changeTeacher()">
					<option value="1">选择老师</option>
					<c:forEach var="comTeacher" items="${comTeachers}"
						varStatus="stauts">
						<option value="${comTeacher.id}">${comTeacher.true_name}</option>
					</c:forEach>
				</select> <label for="fullname"><font color="red" size="1">*若未查询到自己的老师，恢复选择老师，再点击新增企业教师*：</font>
				</label>
				<button id="abcd" data-reveal-id="myModal" onclick="addTeacher()">新增企业教师</button>

			</div>
			<input type="submit" data-inline="true" value="提交"> <input
				type="button" data-inline="true" value="关闭本窗口"
				onclick="WeixinJSBridge.call('closeWindow');" /> <input
				type="hidden" id="stu_id" name="stu_id" value="${stu_id}"> <input
				type="hidden" id="com_id" name="com_id" value="${com_id}">

		</div>
		<!--弹窗 -->
		<div id="myModal" class="reveal-modal">
			<h2 align="center">新增企业老师</h2>
			教师姓名*:<input type="text" name="comTeaherName" id="comTeaherName">
			教师性别*:<select id="comTeacherSex" name="comTeacherSex">
				<option value="男">男</option>
				<option value="女">女</option>
			</select> 联系电话*:<input type="text" name="comTeaherPhone" id="comTeaherPhone">
			<input type="button" value="提交" onclick="doAdd()"> <a
				class="close-reveal-modal">&#215;</a>
		</div>
	</form>
</body>
</html>




