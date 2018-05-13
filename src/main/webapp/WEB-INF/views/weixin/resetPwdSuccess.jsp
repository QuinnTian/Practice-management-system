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
</head>
<body onload="nameAndpsd()">
	<div data-role="footer" data-theme="e"
		onclick="WeixinJSBridge.call('closeWindow');">
		<script>
			document.onclick = Hanlder;
			function Hanlder(e) {
			}
		</script>
		<div id="div1">
			<img src="<%=path%>/images/loginback.jpg" />
		</div>
		<div id="top">
			<div id="logo" align="center">
				<img src="<%=path%>/images/logo.png" />
			</div>
			<div id="texts">重置密码成功</div>
		</div>
		<div>

			<div>
				<form class="form-signin">
					<button class="btn btn-lg btn-primary btn-block">关闭页面</button>
				</form>
			</div>
			<font color="#C0C0C0">
				<div class='conbgbtm' id="footCon" align="center"
					background="<%=request.getContextPath()%>/images/left_bg.gif">©
					2015-2016 sjjxgl.com 版权所有 鲁ICP备16025213号-1</div>
			</font>
			<script
				src="./Signin Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
		</div>
</body>
</html>

