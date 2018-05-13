<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
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


</head>
<body>
	<div id="section_container">
		<section id="Noticelist_section" data-role="section" class="active">
			<header>


				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>信息核对列表</h1>

					<a id="detail_modal_edit" href="checkInfoAdd.do"><i
						class="iconfont iconline-mark-plus"></i> </a>
			</header>
			<article data-role="article" id="College_notice"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div data-role="select" class="card">
					<select placeholder=" 请选择实习任务" id="praTask" name="praTask">
						<c:forEach var="praTask" items="${checkinfo_pulltaskList}"
							varStatus="status">
							<option value="${praTask.id }">${praTask.task_name }</option>
						</c:forEach>
						<select>
				</div>
				<ul class="listitem">
					<li class="sliver">学生实习管理</li>
					<c:forEach var="checkTask" items="${checkInfo_taskList}"
						varStatus="stauts">
						<li
							onclick="location.href='checkDetailInfoList.do?id=${checkTask.id}'"><i
							class="ricon iconfont iconline-arrow-right"></i>
							<div class="text">
								${checkTask.task_name}<small> 时间<fmt:parseDate
										value="${checkTask.begin_time}" var="begin_time" /> <fmt:formatDate
										value="${begin_time}" pattern="yyyy/MM/dd" />-<fmt:parseDate
										value="${checkTask.end_time}" var="end_time" /> <fmt:formatDate
										value="${end_time}" pattern="yyyy/MM/dd" /></small>
							</div></li>

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
	<script type="text/javascript">
		function toActive01() {
			A.Controller.section('#info_section');
		}

		function error() {
			A.alert("此功能正在建设中，请使用电脑端进行操作。")
		}
	</script>
</body>

</html>

