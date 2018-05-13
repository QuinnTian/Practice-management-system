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
<style type="text/css">
.fon {
	color: black;
	font-size: 20px;
}

.fon1 {
	color: green;
	font-size: 20px;
}

label {
	color: black;
	font-size: 20px;
}

body {
	color: black;
	font-size: 22px;
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
				<form action="doSubmitAmClass.do" name="form" id="form"
					method="post">
					 <input type="hidden" id="date" name="date" value="${date}"> 
					 <input type="hidden" id="classroom" name="classroom" value="${classroom}">
					 <input type="hidden" id="section_num" name="section_num" value="${section_num}"> 
					 <input type="hidden" id="tc_id" name="tc_id" value="${tc_id}"> 
					 <input type="hidden" id="tx" name="tx" value=""> 
					 <input type="hidden" id="desc" name="desc" value="${desc}">
					 <output>${date} &nbsp;${section_num}节 &nbsp;${cs_name} </output><br>
					 <label class="label-left">教学班：</label>
					<div class="label-right">
						<output> ${tc_name}</output>
					</div><hr>
					<label class="label-left">评价内容: </label> <br>
					<textarea id="tx1" rows="5"  placeholder="请填写您的评价"></textarea>
					<br>
					<button class="block submit" id="kpm" name="kpm">
						<i class="iconfont iconline-rdo-tick"></i> <span>确定</span>
					</button>
					<br>
				</form>

			</article>
	</div>
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
	$(document).ready(function() {
		var desc = $("#desc").val(); 
	    tx1.value = desc;
	});
	
		$('#kpm').on(A.options.clickEvent, function() {
			var tx1 = $("#tx1").val();
			$('#tx').attr("value", tx1);
			var tx = $("#tx").val();
			if (tx == "") {
				A.alert("请添加评价信息");
				return false;
			}
			$('#form').submit();
			return false;
		});
	</script>
</body>
</html>
