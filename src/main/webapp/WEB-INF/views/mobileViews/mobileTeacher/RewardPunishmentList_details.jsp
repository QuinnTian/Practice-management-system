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
<title>招聘信息列表</title>
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
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>奖惩信息详情</h1>

				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left">入学年份</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${Year}</output>
						</div>
						<hr>
						<label class="label-left">学号</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${stu.stu_code}</output>
						</div>
						<hr>
						<label class="label-left">姓名</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${stu.true_name}</output>

						</div>
						<hr>

						<label class="label-left">班级</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${class_name}</output>

						</div>
						<hr>
						<label class="label-left">任务名称</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${stu.group_id}</output>
						</div>
						<hr>
						<label class="label-left">指标名称</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${index_name}</output>

						</div>
						<hr>
						<label class="label-left">描述</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${e.description}</output>

						</div>
						<hr>
						<label class="label-left">分数</label>
						<div style="height:auto;" class="label-right">
							<output type="text">${e.score}</output>

						</div>
						<hr>
					</form>
					<div class="card noborder">
						<input type="hidden" id="p_id" value="${e.id}" />
						<button class="block" id="delete_mark">删除</button>
					</div>
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
		(function() {
			$('#delete_mark').on(A.options.clickEvent, function() {
				A.confirm('提示', '删除此任务？', function() {
					A.showToast('你选择了“确定”');
					var val = $("#p_id").val();
					var url = "deleteRewardPunishment.do?id=" + val;
					window.location.href = url;
				}, function() {
					A.alarmToast('你选择了“取消”');

				});
				return false;
			});

		})();
	</script>
</body>
</html>
