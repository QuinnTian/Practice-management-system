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

</head>
<body>
	<div id="section_container">

		<section id="list_section" data-role="section" data-scroll="verticle"
			class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>实习成绩查看</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="pull"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">

					实习任务： <select name="practice_id" id="practice_id"
						onchange="getWeight();">
						<option value="0">请选择</option>
						<c:forEach var="s" items="${result}" varStatus="stauts">
							<option value="${s.id}">${s.task_name}</option>
						</c:forEach>
					</select> <br>
					<hr>
					<font size="+1">设置权重:</font> <br>
					<hr>
					月总结: <select id="month" name="month">
						<option value="0">0%</option>
						<option value="0.1">10%</option>
						<option value="0.2">20%</option>
						<option value="0.3">30%</option>
						<option value="0.4">40%</option>
						<option value="0.5">50%</option>
						<option value="0.6">60%</option>
						<option value="0.7">70%</option>
						<option value="0.8">80%</option>
						<option value="0.9">90%</option>
						<option value="1">100%</option>
					</select> 论文 : <select id="thesis" name="thesis">
						<option value="0">0%</option>
						<option value="0.1">10%</option>
						<option value="0.2">20%</option>
						<option value="0.3">30%</option>
						<option value="0.4">40%</option>
						<option value="0.5">50%</option>
						<option value="0.6">60%</option>
						<option value="0.7">70%</option>
						<option value="0.8">80%</option>
					</select> 奖惩 : <select id="evaluate" name="evaluate">
						<option value="0">0%</option>
						<option value="0.1">10%</option>
						<option value="0.2">20%</option>
						<option value="0.3">30%</option>
						<option value="0.4">40%</option>
						<option value="0.5">50%</option>
						<option value="0.6">60%</option>
						<option value="0.7">70%</option>
						<option value="0.8">80%</option>
					</select><br>
					<hr>
					<button class="block outline" onclick="doSerch()">生成总成绩</button>
					<hr>
					<ul class="listitem">
						<li class="sliver" id="stu_info">学生信息</li>
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
	<script
		src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-infinite.js"></script>
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
		
	</script>
	<script type="text/javascript">
		function getWeight() {
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxGetWeight.do?",
				data : getWeightData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "json", //返回的类型为json                
				success : function(data) { //成功时执行的方法
					console.log("ajax返回成功");
					showWeight(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function getWeightData() {
			var practice_id = $("#practice_id").val();
			var dataSend = "practice_id=" + practice_id;
			return dataSend;
		}
		function showWeight(ajaxData) {
			var p = eval(ajaxData);
			$("#month").val(p.weight_summary);
			$("#thesis").val(p.weight_thesis);
			$("#evaluate").val(p.weight_evaluate);
		}
	</script>
	<script type="text/javascript">
		function jump01() {
			A.Controller.section('#studentDetails_section');
		}
		$('#main_article').on('refreshInit', function() {
			var refresh = A.Refresh('#main_article');
			refresh.refresh();
		});
		function doSerch() {
			var practice_id = $("#practice_id").val();
			var a = $("#month").val();
			var b = $("#thesis").val();
			var c = $("#evaluate").val();
			var d = parseInt(a * 100);
			var f = parseInt(b * 100);
			var g = parseInt(c * 100);
			var sum = (d + f + g);
			console.log("==" + sum);
			if (sum == 100) {
				$.ajax({
					type : "get",
					contentType : "application/json",
					url : "ajaxSerchStus.do?",
					data : "practice_id=" + practice_id + "&month=" + a
							+ "&thesis=" + b + "&evaluate=" + c,
					dataType : "text",
					success : function(data) {
						console.log("ajax返回成功");
						showStus(data);
					},
					error : function(result, status) {
						if (status == 'error') {
							A.alert(status);
						}
					}
				});
			} else {
				A.alert("权重之和要求100%，请重新选择权重");
			}
		}
		function showStus(ajaxData) {
			$("li[id!='stu_info']").remove();
			$("#stu_info").after(ajaxData);
		}
	</script>
</body>
</html>
