<%@page import="java.util.Calendar"%>
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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<script>
	var month = myDate.getMonth() + 1;
	var day = myDate.getDate();

	$(function() {
		var b = getMouth();
		$("#span").text(b);
	});
	//获取当前可查看的月份
	function getMouth() {
		if (day > 5) {
			month = month;
		} else {
			month = month - 1;
		}
		return month;
	}
</script>
</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>${tea.true_name}老师${month1}月工作量统计</h1>

				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-square">
						<label class="label-left">姓名</label>
						<div class="label-right">
							<output>${tea.true_name}</output>
						</div>

						<input type="hidden" value="${lastPractice_id}"
							id="lastPractice_id" /> <label class="label-left">实习任务</label>
						<div data-role="select" class="label-right">

							<select name="practice_id" id="practice_id"
								onchange="getPracticeTask()" placeholder="选择实习任务">
								<option value="">请选择实习任务</option>
								<c:forEach var="group" items="${groupList}" varStatus="stauts">
									<option value="${group.practice_id}">${group.group_name}</option>
								</c:forEach>
							</select>
						</div>
						<div id="ajaxShowPage"></div>

					</form>

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
		/**
			老师的实习任务查看
			by syj 20160120
		 */

		function getPracticeTask() { // 向服务器发送搜索请求
			var practice_id = $("#practice_id").val();//取出select的选项的val
			var dataSend = "practice_id=" + practice_id;
			$.ajax({
				type : "post",
				url : "ajaxSerchTea.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					$("#ajaxShowPage").html(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
					}
				}
			});
		}
		$(function() {
			var lastPractice_id = $("#lastPractice_id").val();
			$("#practice_id").val(lastPractice_id);
			getPracticeTask();
		});
	</script>
</body>
</html>
