<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">

</head>
<body>
	<div id="section_container">
		<section id="TaskDetails_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>教师工作总结详情</h1>


				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">

				<form autocomplete="off" class="form-square" id="form1" name="form1"
					method="post" action="doEditTeacehrSummary.do">
					<input type="hidden" id="id" name="id" value="${directRecord.id}">
					<input type="hidden" id="file_id" name="file_id"
						value="${directRecord.file_id}">
					<div class="scroller">
						<label class="label-left">实习任务</label> <label class="label-right">

							<c:set var="p_id" value="${directRecord.practice_id}"
								scope="request"></c:set> <%
 	String practice_id = (String) request.getAttribute("p_id");
 	String group_name = DictionaryService.findPracticeTask(practice_id)
 			.getTask_name();
 %> <output><%=group_name%>

							</output>
						</label> <label class="label-left">标题</label> <label class="label-right">
							<input type="text" style="width: 100%" name="title"
							value="${directRecord.title}" />
						</label> <label class="label-left">指导地点</label> <label class="label-right">
							<input type="text" style="width: 100%" name="direct_place"
							value="${directRecord.direct_place}" />
						</label> </label> <label class="label-left">开始时间</label> <label
							class="label-right"> <c:set var="d_time"
								value="${directRecord.direct_time}" scope="request"></c:set> <%
 	Date Direct_time = (Date) request.getAttribute("d_time");
 	String direct_time = new SimpleDateFormat("yyyy-MM-dd")
 			.format(Direct_time);
 %> <output><%=direct_time%>

							</output>
						</label> </label> <label class="label-left">结束时间</label> <label
							class="label-right"> <output>${directRecord.temp2}
							</output>
						</label>
						<div class="listitem">
							<label class="sliver">描述:</label>
						</div>
						<div class="card">
							<textarea rows="8" class="noborder" name="direct_desc"
								maxlength="500">${directRecord.direct_desc}</textarea>
						</div>
				</form>
	</div>
	</article>
	<footer id="edit_footer" style="bottom: 0px;">
		<nav class="menubar">
			<a class="menu active" id="edit_mark"> <span
				class="menu-icon iconfont iconline-write"></span> <span
				class="menu-text">修改任务</span>
			</a> <a class="menu active" id="delete_mark"> <span
				class="menu-icon iconfont iconline-trash"></span> <span
				class="menu-text">删除任务</span>
			</a> <input type="hidden" id="p_id" value="${directRecord.id}" />
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script type="text/javascript">
		(function() {
			$('#delete_mark').on(A.options.clickEvent, function() {
				A.confirm('提示', '删除此任务？', function() {
					A.showToast('你选择了“确定”');
					var val = $("#p_id").val();
					var url = "deleteTeacherSummary.do?id=" + val;
					window.location.href = url;
				}, function() {
					A.alarmToast('你选择了“取消”');

				});
				return false;
			});

		})();

		(function() {
			$('#edit_mark').on(A.options.clickEvent, function() {
				A.confirm('提示', '修改此任务？', function() {
					A.showToast('你选择了“确定”');

					$("#form1").submit();

				}, function() {
					A.alarmToast('你选择了“取消”');

				});
				return false;
			});

		})();
	</script>
</body>
</html>
