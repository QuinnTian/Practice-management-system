<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title>实践教学管理</title>
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<!--- third --->
<script
	src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
<script
	src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
<script
	src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
<!-- agile -->
<%-- <script type="text/javascript"
	src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script> --%>
<script type="text/javascript"
	src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
<!-- app -->
<script type="text/javascript"
	src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
<style type="text/css">
.error {
	color: Red;
	font-size: 13px;
	margin-left: 5px;
	padding-left: 16px;
}
</style>
</head>
<body>
	<div id="section_container">
		<section id="person_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:100px;bottom:0px;">
				<div class="scroller" style="text-align:center">
					<label class="label-center">您已经属于有效实习状态，不需重复提交</label><br />
					<br />
					<br /> <a href="<%=path%>/MobileStudent/index.do"><button>返回主页</button></a>
				</div>
			</article>

		</section>

	</div>

</body>
</html>
