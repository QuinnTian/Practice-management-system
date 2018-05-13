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
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">

</head>
<body>
	<div id="section_container">

		<section id="NewAward_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>实习记录</h1>
				</div>
			</header>
			<article data-role="article" class="active" id="border_article"
				data-scroll="verticle" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-square" action="savePracticeState.do" method="post"
						id="form">
						<input type="hidden" value="${PracticeRecord.id}"
							name="practicerecord" /> <input type="hidden" value="${stu.id}"
							name="stu_id" /> <label class="label-left" for="user">学号</label>
						<label class="label-right"> <output type="text"
								value="${stu.stu_code}" na>${stu.stu_code}</output>
						</label> <label class="label-left">实习任务</label> <label class="label-right">
							<output id="user" type="text" value="${stu.group_id}">${stu.group_id}</output>
						</label> <label class="label-left">到岗时间 </label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input name="work_time" id="work_time"
								type="hidden" />
						</div>
						<label class="label-left">实习协议时间 </label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input name="prct_contract_time"
								id="prct_contract_time" type="hidden" />
						</div>
						<label class="label-left">网签时间 </label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input name="netsign_time" id="netsign_time"
								type="hidden" />
						</div>
						<label class="label-left">合同时间 </label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input name="contract_time"
								id="contract_time" type="hidden" />
						</div>
						<label class="label-left">离职时间 </label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input name="dimission_time"
								id="dimission_time" type="hidden" />
						</div>
					</form>
					<button class="submit width-full" id="save">提交</button>

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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script type="text/javascript">
		(function() {
			$('#save').on(A.options.clickEvent, function() {
				var work_time = $("#work_time").val();
				var prct_contract_time = $("#prct_contract_time").val();
				var netsign_time = $("#netsign_time").val();
				var contract_time = $("#contract_time").val();
				var dimission_time = $("#dimission_time").val();

				if (work_time == "") {
					A.alert("请选择到岗时间 ！");
					return;
				}
				if (prct_contract_time == "") {
					A.alert("请选择实习协议时间 ！");
					return;
				}
				if (netsign_time == "") {
					A.alert("请选择网签时间 ！");
					return;
				}

				if (contract_time == "") {
					A.alert("请选择合同时间 ！");
					return;
				}
				if (dimission_time == "") {
					A.alert("请填写离职时间！");
					return;
				} else {
					A.alert("提示", "提交成功");
					$("#form").submit();
				}

			});

		})();
	</script>
</body>
</html>
