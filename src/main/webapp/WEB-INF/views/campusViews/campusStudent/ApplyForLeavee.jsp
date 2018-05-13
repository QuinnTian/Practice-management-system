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
					<a data-toggle="back" href="MyApplication.do"> <i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>请假申请表</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">


						<label class="label-left">申请类型 ：</label>
						<div style="height:auto;" class="label-right">
							<output> ${a.sla_type} </output>
						</div>
						<hr />

						<label class="label-left">请假地点 ：</label>
						<div style="height:auto;" class="label-right">
							<output> ${a.sla_place} </output>
						</div>
						<hr />

						<label class="label-left">申请级别 ：</label>
						<div style="height:auto;" class="label-right">
							<output> ${a.sla_rank} </output>
						</div>
						<hr />

						<label class="label-left">请假开始时间 ：</label>
						<div style="height:auto;" class="label-right">
							<output> ${a.sla_begin_time} </output>
						</div>
						<hr />

						<label class="label-left">请假结束时间 ：</label>
						<div style="height:auto;" class="label-right">
							<output> ${a.sla_end_time} </output>
						</div>
						<hr />

						<label class="label-left" for="user">审批人：</label> <label
							class="label-right">${teaName}</label>
						<hr />

						<label class="label-left">请假原因描述</label>
						<div style="height:auto;" class="label-right">
							<output> ${a.sla_reason_desc} </output>
						</div>
						<hr>

						<div class="card">
							审批人意见：
							<textarea rows="5" class="noborder" readonly>${approval_opinion}</textarea>
							<c:if test="${empty approval_opinion}">
								<div>
									<small>您暂时还没有审批人意见!</small>
								</div>
							</c:if>
						</div>

					</form>
					<span>
						<div class="card noborder">
							<input type="hidden" id="p_id" value="${a.id}" />
							<button class="block" id="delete_mark" name = "delete_mark">删除</button>
						</div> </span>
				</div>
			</article>

		</section>
	</div>
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
		//撤销按钮  by syj 20160117
		/* (function() { */
			$('#delete_mark').on(A.options.clickEvent, function() {
				 A.confirm('提示', '修改此任务？', function() {
					A.showToast('你选择了“确定”');
					var val = $("#p_id").val();
					var url = "deleteApplication.do?id=" + val;
					window.location.href = url;
				}, function() {
					A.alarmToast('你选择了“取消”');
				});
				return false; 
			});
		/* })(); */
	</script>


</body>

</html>
