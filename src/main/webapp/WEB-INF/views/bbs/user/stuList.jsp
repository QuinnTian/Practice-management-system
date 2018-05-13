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
					<h1>学生列表</h1>
				</div>
			</header>
			<article data-role="article" id="normal_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:30px;">
				<div class="scroller">
					<div>
						<ul class="listitem">
							<li class="sliver">${pk.task_name}</li>
							<c:forEach items="${stulist}" var="stu">
								<li onclick="toPersonTheme('${stu.id }')"><i
									class="icon iconfont iconline-fav"></i>
									<div class="text">${stu.true_name }</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</article>
			<footer>
				<nav class="menubar"
					style=" width: 100%;background-color: #FFFFFF ;text-align:center">
					<span>版权所有：山东商业职业技术学院</span> <br /> <span> 通讯地址：济南市旅游路4516号
						邮编:250103</span>
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
	<script type="text/javascript">
		function toPersonTheme(id) {
			window.location.href = "<%=path%>/weixin/toPersonTheme.do?stu_id="+id;
		}
	</script>
</body>
</html>