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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">


</head>
<body>
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>请假申请表</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off" name="userLoginForm" id="userLoginForm"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common" method="post">
						<label class="label-left" for="sla_type">申请类型：</label> <select
							id="sla_type" name="sla_type" style="width: 50%">
							<option value = "1">事假</option>
							<option value = "2">病假</option>
							<option value = "3">探亲</option>
							<option value = "4">旅游</option>
							<option value = "5">其他</option>
						</select>
						<hr />
						<label class="label-left" for="sla_place">请假地点 ：</label> <label
							class="label-right"> <input type="text" value=""
							name="sla_place" id="sla_place" autocomplete="on" /> </label>
						<hr />

						<label class="label-left" name="is_level_school"
							id="is_level_school" style="height:40px;">是否离校</label> <label
							class="label-right" style="height:40px;">
							<div class="toggle" data-role="toggle" data-on="出校"
								data-on-value="1" data-off="不出校" data-off-value="2"
								style="margin-top:4px;">
								<input type="hidden" name = "is_level_school" data-com-refer="toggle" value="2"></div> </label>
						<hr />

						<label class="label-left" for="sla_rank">申请级别：</label> <select
							id="sla_rank" name="sla_rank" style="width: 50%">
							<option value = "1">比较着急</option>
							<option value = "2">不是很着急</option>
							<option value = "3">不着急</option>
						</select>
						<hr />
						<label class="label-left" for="sla_begin_time">请假开始日期</label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input name = "sla_begin_time" id = "sla_begin_time" type="hidden" />
						</div>
						<hr />

						<label class="label-left" for="date">请假开始时间</label>
						<div data-role="time" class="label-right">
							<label>请选择时间</label> <input name = "dateBegin" id = "dateBegin" type="hidden" />
						</div>
						<hr />


						<label class="label-left" for="sla_end_time">请假结束日期</label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input name = "sla_end_time" id = "sla_end_time" type="hidden" />
						</div>
						<hr />


						<label class="label-left" for="date">请假结束时间</label>
						<div data-role="time" class="label-right">
							<label>请选择时间</label> <input name = "dateEnd" id = "dateEnd" type="hidden" onchange = "DateDiff()"/>
						</div>
						<hr />
						
						
						
						<label class="label-left" for="sla_duration">请假时长 ：</label> <label
							class="label-right"> <input type="text" value=""
							name="sla_duration" id="sla_duration" autocomplete="on" /> </label>
						<hr />
						
						<label class="label-left" >审批人：</label> <select
							id="sla_approval_tea" name="sla_approval_tea" style="width: 50%">
							<option value = "${teaId}">${teacherName}</option>
							<option value = "${counselorId}">${conselorName}</option>
							
						</select>
						<hr />
						
						<div class="card">
							请假原因描述：
							<textarea rows="5" name = "sla_reason_desc"  id="sla_reason_desc" class="noborder"></textarea>
						</div>

					</form>
					<div class="card noborder" id="Preservation">
						<button class="submit block" id = "submit" name="submit">提交</button><!-- onclick="submit()" -->
						<!-- <button class="submit block" onclick="update()">保存</button> -->
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>



	<script type="text/javascript">
		/* function submit() { */
		$('#submit').on(A.options.clickEvent, function() {
				var sla_type = $("#sla_type").val();
				var sla_place = $("#sla_place").val();
				var sla_rank = $("#sla_rank").val();
				var sla_begin_time = $("#sla_begin_time").val();
				var sla_end_time = $("#sla_end_time").val();
				var sla_approval_tea = $("#sla_approval_tea").val();
				var sla_reason_desc = $("#sla_reason_desc").val();
				if (sla_type == "") {
					alert("请填写请假类型！");
					return;
				} 
				if (sla_place == "") {
					alert("请填写请假地点！");
					return;
				} 
				if (sla_rank == "") {
					alert("请填写请假级别！");
					return;
				} 
				if (sla_begin_time == "") {
					alert("请选择开始日期！");
					return;
				} 
				if (sla_end_time == "") {
					alert("请选择结束日期！");
					return;
				} 
				if (sla_approval_tea == "") {
					alert("请选择审批人！");
					return;
				} 
				if (sla_reason_desc == "") {
					alert("请填写请假原由！");
					return;
				} 
			window.document.userLoginForm.action = "addApplication.do";
			window.document.userLoginForm.submit();
		});
		/* } */
	</script>

</body>

</html>
