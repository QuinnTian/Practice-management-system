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
<script type="text/javascript">
	window.onload = function() {
		var val = $("#val").val();
		if (val == "1-2") {
			$("#section_num option[value='1-2']").attr("selected", "selected");
		} else if (val == "3-4") {
			$("#section_num option[value='3-4']").attr("selected", "selected");
		} else if (val == "5-6") {
			$("#section_num option[value='5-6']").attr("selected", "selected");
		} else if (val == "7-8") {
			$("#section_num option[value='7-8']").attr("selected", "selected");
		} else if (val == "9-10") {
			$("#section_num option[value='9-10']").attr("selected", "selected");
		}
	}
</script>
<style type="text/css">
.select {
	width: 50%;
	background-color: white;
	border: none;
	font-size: 20px;
}

.fon {
	color: black;
	font-size: 20px;
}

.fon1 {
	color: green;
	font-size: 20px;
}
</style>

</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>${year} 第${semester}学期</h1>
					<a id="add" data-toggle="html" href="CourseManageIndex.do"><i
						class="iconfont iconline-home"></i> </a>
				</div>
			</header>
			<article data-role="article" id="guideRecord" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form class="form-square" action="goRollCall.do" name="form"
						id="form" method="post">
						<input type="hidden" id="a" name="a" value=""> <input
							type="hidden" id="b" name="b" value=""> <input
							type="hidden" id="c" name="c" value=""> <input
							type="hidden" id="d" name="d" value=""> <input
							type="hidden" id="val" name="val" value="${section_num}"><label
							class="label-left"><font class="fon">时间:</font> </label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input id="date" type="hidden"
								value="${date}" />
						</div>
						<label class="label-left"><font class="fon">节次:</font> </label>
						<div data-role="select" class="label-right">
							<select id="section_num" class="fon">
								<option value="1-2">1-2节</option>
								<option value="3-4">3-4节</option>
								<option value="5-6">5-6节</option>
								<option value="7-8">7-8节</option>
								<option value="9-10">9-10节</option>
							</select>
						</div>
						<label class="label-left"><font class="fon">教室</font>
						</label>
						<div class="label-right">
							<select class="select" id="l" onchange="getCRSelect()">
								<option value="" selected="selected">请选择</option>
								<option value="A">A楼</option>
								<!-- <option value="B">B楼</option> -->
								<option value="C">C楼</option>
								<option value="D">D楼</option>
								<option value="E">E楼</option>
								<option value="F">F楼</option>
								<!-- <option value="S">实训楼</option>暂无数据 --> 
							</select>
						</div>
						<hr>
						<label class="label-left"><font class="fon">教学班:</font> </label>
						<div data-role="select" class="label-right"
							style="position: relative">
							<select id="tc_id">
								<option value="">请选择教学班</option>
								<c:forEach var="t" items="${tcss}">
									<option value="${t.id}">${t.tc_name}</option>
								</c:forEach>
							</select>
						</div>
						<nav class="menubar" id="submit">
							<a class="menu active"> <span
								class="menu-icon iconfont iconline-rdo-tick"></span> <span
								class="menu-text">确定</span> </a>
						</nav>
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>

	<script type="text/javascript">
		$('#submit').on(A.options.clickEvent, function() {
			var date = $("#date").val();
			var section_num = $("#section_num").val();
			var classroom = $("#classroom").val();
			var tc_id = $("#tc_id").val();
			var l = $("#l").val();
			if (date == "") {
				A.alert("请选择日期！");
				return;
			} else if (classroom == "") {
				A.alert("请选择教室！");
				return;
			}else if (tc_id == "") {
				A.alert("请选择教学班！");
				return;
			} else {
				$('#a').attr("value", date);
				$('#b').attr("value", section_num);
				$('#c').attr("value", classroom);
				$('#d').attr("value", tc_id);
				$('#form').submit();
			}
			return false;
		});

		function getCRSelect() {
			var msg = $("#l").val();
			var dataSend = "msg=" + msg;
			$.ajax({
				type : "get",
				url : "ajaxGetCRSelect.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法	
					$("label[id='cla']").remove();
					$("select[id='classroom']").remove();
					$("#l").after(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     

				}
			});
		}
	</script>
</body>
</html>
