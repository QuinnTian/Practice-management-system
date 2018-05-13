<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


</head>
<body>
	<div id="section_container">
		<section id="TaskDetails_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>任务详情</h1>

				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">

						<label class="label-left">任务名称</label>
						<div style="height:auto;" class="label-right">
							<output> ${p.task_name} </output>
						</div>
						<hr>
						<label class="label-left">任务时间</label>
						<div style="height:auto;" class="label-right">
							<output>
								<small> <fmt:parseDate value="${p.begin_time}"
										var="begin_time" /> <fmt:formatDate value="${begin_time}"
										pattern="yyyy/MM/dd" /> 至<fmt:parseDate value="${p.end_time}"
										var="end_time" /> <fmt:formatDate value="${end_time}"
										pattern="yyyy/MM/dd" />
							</output>
						</div>
						<hr>
						<label class="label-left">任务地点</label>
						<div style="height:auto;" class="label-right">
							<output> ${p.task_place} </output>
						</div>
						<hr>
						<label class="label-left">任务类型</label>
						<div style="height:auto;" class="label-right">
							<output> ${taskType} </output>
						</div>
						<hr>

						<label class="label-left">描述</label>
						<div style="height:auto;" class="label-right">
							<output> ${p.task_desc} </output>
						</div>
						<hr>
						<label class="label-left">创建人</label>
						<div style="height:auto;" class="label-right">
							<output> ${teaName} </output>
						</div>
						<hr>
					</form>
				</div>
			</article>
		</section>

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
