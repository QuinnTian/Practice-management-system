<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0038)http://v3.bootcss.com/examples/signin/ -->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=path%>/images/sict.png">
<title>实践教学管理系统</title>
<style type="text/css">
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

div#div1 {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	z-index: -1;
}

div#div1>img {
	height: 100%;
	width: 100%;
	border: 0;
}

#logo>img {
	margin-top: 3%;
	width: 15%;
	height: 15%;
}

#texts {
	font-size: 36px;
	color: #FFFFFF;
	text-align: center;
}

#top {
	width: 100%;
	height: 40%;
	background: #3e8cca;
	margin-top: -50px;
	z-index: 1;
}

#wx {
	/* 	position: fixed;
	top: 70%;
	left: 85%; */
	width: 150px;
	height: 170px;
}
</style>
<!-- Bootstrap core CSS -->
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=path%>/css/signin.css" rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="./Signin Template for Bootstrap_files/ie-emulation-modes-warning.js"></script>
<style type="text/css">
object,embed {
	-webkit-animation-duration: .001s;
	-webkit-animation-name: playerInserted;
	-ms-animation-duration: .001s;
	-ms-animation-name: playerInserted;
	-o-animation-duration: .001s;
	-o-animation-name: playerInserted;
	animation-duration: .001s;
	animation-name: playerInserted;
}

@
-webkit-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-ms-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-o-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}
}
</style>
<style id="style-1-cropbar-clipper">
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255, 255, 255, .38) solid !important;
	border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	function check() {
		var code = $("#code").val();
		var name = $("#name").val();
		var id_card = $("#id_card").val();
		var isCode = /\b\d{12}\b/;
		var isIDCard = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		if (code.search(isCode) == -1) {
			alert("请输入正确的学号");
			return null;
		}
		if (name = "") {
			alert("请输入姓名");
			return null;
		}
		if (id_card.search(isIDCard) == -1) {
			alert("请输入正确的身份证号");
			return null;
		}
		if (window.confirm("密码将重置为学号")) {
			$("#loginForm").submit();
		}
	}
</script>
</head>
<body onload="nameAndpsd()">
	<div id="div1">
		<img src="<%=path%>/images/loginback.jpg" />
	</div>
	<div id="top">
		<div id="logo" align="center">
			<img src="<%=path%>/images/logo.png" />
		</div>
		<div id="texts">学生重置密码</div>
	</div>
	<div class="container" id="container">
		<form class="form-signin" action="doResetPwd.do" method="post"
			id="loginForm">
			<c:if test="${error}">
				<div class="error">
					重置失败：您输入的信息错误，<br>如果用户存在无法重置密码，请联系管理员。
				</div>
			</c:if>
			<label for="code" class="sr-only">学号</label> <input type="text"
				id="code" name="code" class="form-control" placeholder="请输入学号"
				required="" autofocus="" /> <br /> <label for="name"
				class="sr-only">姓名</label> <input type="text" id="name" name="name"
				class="form-control" placeholder="请输入姓名" required="" autofocus=""
				value="" /> <br /> <label for="id_card" class="sr-only">身份证号</label>
			<input type="text" id="id_card" name="id_card" class="form-control"
				placeholder="请输入身份证号" required="" autofocus="" /> <br /> <input
				type=" button" class="btn btn-lg btn-primary btn-block"
				onclick="check();" value="重置密码" />
		</form>
		<font color="#C0C0C0">
			<div class='conbgbtm' id="footCon" align="center"
				background="<%=request.getContextPath()%>/images/left_bg.gif">©
				2015-2016 sjjxgl.com 版权所有 鲁ICP备16025213号-1</div>
		</font>
		<script
			src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
