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
<title>学生端</title>
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

</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
				<header>
					<div class="titlebar">
						<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
						<h1>早操记录管理</h1>
						<a id="add" onclick="location.href='morningExercisesDetailsAdd.do'"><i class="iconfont iconline-mark-plus"></i></a>
					</div>
				</header>
				<article data-role="article" id="guideRecord" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">
					<ul class="listitem">
					<li><small>检查人：${stu.true_name}</small></li>
					<li><small>现检查班级：${nowclass}</small></li>
					<li><small>应到人数：${i}</small></li>
					<c:forEach var="d" items="${dail}">
					<li onclick="location.href='morningExercisesDetails.do?id=${d.id}'">
					<i class="ricon iconfont iconline-arrow-right"></i>
					<div class="text" >
						${d.temp1}
						<small>时间 ${d.temp2}</small>
					</div>
					</li>
					</c:forEach>
					</ul>
					</div>
				</article>
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
