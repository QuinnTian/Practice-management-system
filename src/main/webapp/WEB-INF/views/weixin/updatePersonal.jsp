<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<script src="<%=path%>/js/jquery.validate.js"></script>
<script type="text/javascript">
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('hideOptionMenu');
		WeixinJSBridge.call('showToolbar');
	});

	function changeSelectName(id) {
		var name = document.getElementById(id + "_code").options[document
				.getElementById(id + "_code").selectedIndex].text;
		document.getElementById(id + "_name").value = name;
	}

	function is_weixin() {
		var ua = navigator.userAgent.toLowerCase();
		if (ua.match(/MicroMessenger/i) == "micromessenger") {

		} else {
			/* window.location.href = "http://www.baidu.com"; */
		}
	}
	function do_submit() {
		var qqnum = document.getElementById("qqnum").value;
		if (qqnum.search(/^[1-9]\d{5,11}$/) == -1) {
			alert("qq号格式错误");
			return null;
		}

		var phone = document.getElementById("phone").value;
		var vvv = /^(((13[0-9]{1})|(15[0-9]{1})|(170)|(178)|(18[0-9]{1}))+\d{8})$/;
		if (phone
				.search(vvv) == -1) {
			alert("手机号格式错误");
			return null;
		}
		var home_addr = document.getElementById("home_addr").value;
		if (home_addr.length == 0) {
			alert("家庭住址不能为空");
			return null;
		}
		var home_phone = document.getElementById("home_phone").value;
		if (home_phone.search(vvv) == -1) {
			alert("家庭手机格式错误");
			return null;
		}
		var login_pass = document.getElementById("login_pass").value;
		if (login_pass.length == 0) {
			alert("密码不能为空");
			return null;
		}
		var email = document.getElementById("email").value;
		if (email
				.search(/^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+\.(?:com|cn)$/) == -1) {
			alert("邮箱格式出错");
			return null;
		}
		document.form1.submit();

	}
</script>
<title>个人信息修改</title>
</head>
<body onload="is_weixin()">
	<div id="page1" data-role="page">
		<div data-role="content" data-theme="e">
			<form name="form1" id="myform" method="post" action="savePersonal.do">
				<div data-role="fieldcontain">
					<label for="fullname">学号 <span style="color:Red"></span>：</label> <input
						type="text" name="stu_code" id="stu_code" value="${stu.stu_code}"
						readonly="readonly"> <label for="fullname">q q号 ：</label>
					<input type="text" name="qqnum" id="qqnum" value="${stu.qqnum}">
					<label for="fullname">手机号 ：</label> <input type="text" name="phone"
						id="phone" value="${stu.phone}"> <label for="email">Email:
					</label> <input type="text" id="email" name="email" value="${stu.email}" />
					<label for="fullname">家庭住址: </label> <input type="text"
						id="home_addr" name="home_addr" value="${stu.home_addr}" /> <label
						for="fullname">家庭电话: </label> <input type="text" id="home_phone"
						name="home_phone" value="${stu.home_phone}" /> <label
						for="login_pass">登陆密码</label> <input type="text" id="login_pass"
						name="login_pass" value="${stu.login_pass}" /> <input
						type="button" data-inline="true" value="提交" onclick="do_submit();">
					<!-- <input
						type="submit" data-inline="true" value="提交" onclick="WeixinJSBridge.call();"> -->
					<input type="button" data-inline="true" value="关闭本窗口"
						onclick="WeixinJSBridge.call('closeWindow');" />
				</div>

			</form>
			<script>
				$('#page1').bind('pageinit', function(event) {
					$('form').validate({
						rules : {
							email : {
								email : true
							},
							phone : {
								number : true
							},
							qqnum : {
								number : true
							},
							home_phone : {
								number : true
							}
						}
					});
				});
			</script>
		</div>
	</div>
</body>
</html>

