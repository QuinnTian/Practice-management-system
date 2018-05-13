<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<style>
.photo {
	margin-top: 20px;
	border-radius: 30px;
	width: 80px;
	height: 80px;
	overflow: hidden;
	background: url(<%=path%>/AgileLite/assets/app/img/aside/photo.png)
		center center;
	background-size: cover;
	display: inline-block;
	vertical-align: middle;
}
</style>
</head>

<body>
	<div id="section_container">
		<section id="slider_section" data-role="section" class="active"
			data-aside-left="#left_reveal_aside">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>个人资料</h1>
				</div>
			</header>
			<article data-role="article" id="normal_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left" for="user">用户名</label> <label
							class="label-right"> <input type="text"
							readonly="readonly" value="${user.true_name }"> </label>
						<hr />
						<label class="label-left" for="user">性别</label> <label
							class="label-right"> <input type="text"
							readonly="readonly" value="${user.sex }"> </label>
						<hr />
						<label class="label-left" for="user">班级</label> <label
							class="label-right"> <input type="text"
							readonly="readonly" value="${user.class_name }"> </label>
						<hr />
						<label class="label-left" for="user">QQ</label> <label
							class="label-right"> <input type="text"
							readonly="readonly" value="${user. qqnum}"> </label>
						<hr />
						<label class="label-left" for="user">邮箱</label> <label
							class="label-right"> <input type="text"
							readonly="readonly" value="${user.email }"> </label>
						<hr />
						<label class="label-left" for="user">手机号</label> <label
							class="label-right"> <input type="text"
							readonly="readonly" value="${user.phone }"> </label>
						<hr />
					</form>
				</div>
			</article>
			<footer>
				<nav class="menubar"
					style=" width: 100%;background-color: #FFFFFF ;text-align:center">
					<span>版权所有：山东商业职业技术学院</span> <br /> <span> 通讯地址：济南市旅游路4516号
						邮编：250103</span>
				</nav>
			</footer>
		</section>
	</div>


	<!--- third --->
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
	<!-- agile -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
	<!--- bridge --->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>

</body>
</html>