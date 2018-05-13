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
<title>教师端</title>
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
	$(document).ready(function() {
		var del1 = $("#del1").val();
		var del2 = $("#del2").val();
		var del3 = $("#del3").val();
		if (del1 == 0) { //没有点名
			$("div[id='div1']").remove();
		}
		if (del2 == 0) { //没有评价
			$("div[id='div2']").remove();
		}
		//个人  3 22       班级 4   11
		if (del3 == 1) {
			$("button[id='nexC']").remove();
		}
	});
</script>
<style type="text/css">
.fon {
	color: black;
	font-size: 20px;
}

.fon1 {
	color: green;
	font-size: 18px;
}

label {
	color: black;
	font-size: 18px;
}
</style>
</head>
<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="html" href="CourseManageIndex.do"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>查看</h1>
					<a id="add" data-toggle="html" href="CourseManageIndex.do"><i
						class="iconfont iconline-home"></i> </a>
				</div>
			</header>
			<article data-role="article" id="guideRecord" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form class="form-common">
						<input type="hidden" id="del1" value="${del1}">
					 	<input type="hidden" id="del2" value="${del2}"> 
						<input type="hidden" id="del3" value="${del3}"> 
						<input type="hidden" id="date" value="${date}"> 
						<input type="hidden" id="section_num" value="${section_num}"> 
						<input type="hidden" id="classroom" value="${classroom}"> 
						<input type="hidden" id="tc_id" value="${tc_class.id}">
						<input type="hidden" id="log_id" value="${logs.id}">
						<div style="width:100%" class="label-left">
							<output>
								<font class="fon">${time} &nbsp; ${logs.section_num}节
								&nbsp; ${place}</font>
							</output>
						</div>
						<div style="width:100%" class="label-left">
							<output>
								<font class="fon">教学班:${tc_class.tc_name}</font>
							</output>
						</div>
						<hr><hr><hr>
						<ul class="listitem">
							<div id="div1">
							<li class="row-large">
					            <button class="ricon" id="editRollCall">修改</button>
					        	<div class="text" style="padding-right:40px;">
					              	<font class="fon">点名详情：</font>
					            </div>
					        </li>
								<!-- <label class="sliver">点名详情：&nbsp;
									<button id="editRollCall">修改缺勤人员</button>
								</label> -->
							<li class="bg-concrete"><font class="fon ">
								班级人数：${true_num} <br>
								请假人数：${app_num} <br> 
								请假人员: <c:forEach var="a" items="${app_stus}">
									${a.true_name} ,
									</c:forEach> <br>
								缺勤人数：${lev_num} <br> 
								缺勤人员: <c:forEach var="l" items="${lev_stus}">
									${l.true_name} ,
									</c:forEach> 
								</font></li>
							</div>
							<hr>
							<div id="div2">
								<li class="sliver"><font class="fon">评价详情：</font></li>
								<font class="fon">
									<c:forEach var="evb" items="${evals_class}">
									<li class="row-large bg-concrete">
							            <button class="ricon" id="editAmClasss">修改</button>
							        	<div class="text" style="padding-right:40px;">
							              	教学班 : ${evb.eval_desc}
							              	<input type="hidden" id="desc" value="${evb.eval_desc}">
							            </div>
							        </li>
									<%-- <li class="row-large">教学班 : ${evb.eval_desc} <br>
										 <button id="editAmClasss">修改对教学班评价</button></li> --%>
									</c:forEach> 
									<c:forEach var="evs" items="${evals_one}">
								        <li class="row-large bg-concrete">
								            <button class="ricon eap" id="editAmPerson(this)" value="${evs.id}">修改</button>
								        	<div class="text" style="padding-right:40px;">
								              	${evs.temp4} :<br> ${evs.temp5} &nbsp;
								            </div>
										</li>
										<%-- <li>${evs.temp4} : ${evs.temp5} &nbsp;
											<button class="eap" id="editAmPerson(this)" value="${evs.id}">修改</button></li> --%>
									</c:forEach> 
									 </font>
							</div>
							<hr>
							<hr>
							<button id="nexC"
								class=" iconfont iconline-rdo-tick block outline">
								<font class="fon1">添加对教学班评价 </font>
							</button>
							<button id="nexP"
								class=" iconfont iconline-rdo-tick block outline">
								<font class="fon1">添加对学生评价 </font>
							</button>
						</ul>
						<br>
						<nav class="menubar">
							<a class="menu active" href="CourseManageIndex.do"> <span
								class="iconfont iconline-rdo-tick block outline"></span> <font
								size="+1">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;回</font> </a>
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
	//修改按钮
	//1.修改点名
	$('#editRollCall').on(
				A.options.clickEvent,
				function() {
					var log_id = $("#log_id").val();//日志id
					var date = $("#date").val();//日期
					var section_num = $("#section_num").val();//节次
					var classroom = $("#classroom").val();//教室id
					var tc_id = $("#tc_id").val();//教学班id
					var dataSend = "date=" + date + "&section_num="
							+ section_num + "&classroom=" + classroom
							+ "&tc_id=" + tc_id+ "&log_id=" + log_id;
					location.href = "editRollCall.do?" + dataSend;
					return false;
				});
	//2.修改对学生评价
	
	 $('.eap').on(
				A.options.clickEvent,
				function() {
					var eva_id = $(this).attr("value");
					var log_id = $("#log_id").val();//日志id
					var date = $("#date").val();//日期
					var section_num = $("#section_num").val();//节次
					var classroom = $("#classroom").val();//教室id
					var tc_id = $("#tc_id").val();//教学班id
					var dataSend = "date=" + date + "&section_num="
							+ section_num + "&classroom=" + classroom
							+ "&tc_id=" + tc_id + "&log_id=" + log_id
							+ "&eva_id=" + eva_id;
					location.href = "editAmPerson.do?" + dataSend;
					return false;
				});
		//3.修改对班级评价	
		$('#editAmClasss').on(
				A.options.clickEvent,
				function() {
					var desc = $("#desc").val();
					var date = $("#date").val();//日期
					var section_num = $("#section_num").val();//节次
					var classroom = $("#classroom").val();//教室id
					var tc_id = $("#tc_id").val();//教学班id
					var dataSend = "date=" + date + "&section_num="
							+ section_num + "&classroom=" + classroom
							+ "&tc_id=" + tc_id+ "&desc=" + desc;
					location.href = "CourseAmClass.do?" + dataSend;
					return false;
				});

		//评价按钮
		$('#nexC').on(
				A.options.clickEvent,
				function() {
					var date = $("#date").val();//日期
					var section_num = $("#section_num").val();//节次
					var classroom = $("#classroom").val();//教室id
					var tc_id = $("#tc_id").val();//教学班id
					var dataSend = "date=" + date + "&section_num="
							+ section_num + "&classroom=" + classroom
							+ "&tc_id=" + tc_id;
					location.href = "CourseAmClass.do?" + dataSend;
					return false;
				});

		$('#nexP').on(
				A.options.clickEvent,
				function() {
					var date = $("#date").val();//日期
					var section_num = $("#section_num").val();//节次
					var classroom = $("#classroom").val();//教室id
					var tc_id = $("#tc_id").val();//教学班id

					var dataSend = "date=" + date + "&section_num="
							+ section_num + "&classroom=" + classroom
							+ "&tc_id=" + tc_id;
					location.href = "CourseAmPerson.do?" + dataSend;

					return false;
				});
	</script>
</body>
</html>
