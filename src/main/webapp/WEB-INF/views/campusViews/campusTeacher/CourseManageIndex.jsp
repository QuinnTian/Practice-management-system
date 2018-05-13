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

label {
	color: black;
	font-size: 20px;
}

body {
	color: black;
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
					<h1>课堂管理</h1>
					<a id="add" data-toggle="html" href="CourseManageIndex.do"><i
						class="iconfont iconline-home"></i> </a>
				</div>
			</header>
			<article data-role="article" id="guideRecord" data-scroll="pull"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-square">
						<label class="label-left">开始时间</label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input id="begin_date" type="hidden"
								value="${date}" onchange="changeScope();"/>
						</div>
						<label class="label-left">结束时间</label>
						<div data-role="date" class="label-right">
							<label>请选择日期</label> <input id="end_date" type="hidden"
								value="${date}" onchange="changeScope();"/>
						</div>
						<label class="label-left">显示范围</label>
						<div data-role="select" class="label-right">
							<select name="sel" id="sel" onchange="changeScope();">
								<option value="all">最近10次记录</option>
								<c:forEach var="c" items="${tcs}" varStatus="status">
									<option value="${c.id}">${c.tc_name}</option>
								</c:forEach>
							</select>
						</div>
						<div id="aft"></div>
						<ul id="ini" class="listitem">
							<c:forEach var="t" items="${tls}" varStatus="status">
								<c:if test="${t.id=='1'}">
									<font class="fon"><a><li>${t.temp4}!</li> </a> </font>
								</c:if>
								<c:if test="${t.id!='1'}">
								<font class="fon"><a
									href="CourseDetailsView.do?id=${t.id}"><li>${t.temp4}
											${t.section_num}节 ${t.temp5}</li> </a> </font>
								</c:if>
							</c:forEach>
							<li style="display:none"><br>
							</li>
						</ul>
					</form>
				</div>
			</article>
			<footer>
				<nav class="menubar">
					<a class="menu active" href="CourseRollCall.do" data-toggle="html"
						id="add_mark"> <span
						class="menu-icon iconfont iconline-book-open"></span> <span
						class="menu-text">课堂点名</span> </a> <a class="menu active"
						href="CourseAssessment.do" id="delete_mark"> <span
						class="menu-icon iconfont iconline-pencil"></span> <span
						class="menu-text">课堂评价</span> </a>
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
		function changeScope() {
			var sel = $("#sel").val();
			var begin_date = $("#begin_date").val();
			var end_date = $("#end_date").val();
			if(begin_date > end_date){
				A.alert("开始日期晚于结束日期，请 重新选择 ！");
				return;
			}
			var dataSend = "sel="+sel+"&end_date="+end_date+"&begin_date="+begin_date;
			$.ajax({
				type : "get",
				url : "ajaxGetScope.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法	
					$("ul[id='ini']").remove();
					$("ul[id='inx']").remove();
					$("#aft").after(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					A.alert("err:"+status);
				}
			});
		}
	</script>
</body>
</html>
