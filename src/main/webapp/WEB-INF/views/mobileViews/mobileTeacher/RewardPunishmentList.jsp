<%@page import="com.sict.service.DictionaryService"%>
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
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>奖惩信息列表</h1>
					<a id="detail_modal_edit" onclick="jump02()"> 新增奖惩</a>
				</div>
			</header>
			<article data-role="article" id="College_notice"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<ul class="listitem">
						<li class="sliver">奖惩信息列表-${tea_name}</li>
						<c:forEach items="${evs}" var="ev" varStatus="status">
							<ul class="listitem"
								href="RewardPunishmentList_details.do?id=${ev.id}"
								data-toggle="html">
								<li><i class="ricon iconfont iconline-arrow-right"></i>
									<div class="text">
										<c:set var="stu_id" value="${ev.stu_id}" scope="request"></c:set>
										<%
											String stu_id = (String) request.getAttribute("stu_id");
												out.print(DictionaryService.findStudent(stu_id).getTrue_name());
										%><small>${ev.description}</small>
									</div></li>
							</ul>
						</c:forEach>
					</ul>
				</div>
			</article>
		</section>

		<section id="NewAward_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>学生详情</h1>

				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-square" id="form1" action="doAddRewardPunishment.do"
						method="post">

						<label class="label-left" for="date">开始时间</label>
						<div data-role="date" class="label-right">
							<label>请选择时间</label> <input type="hidden" id="time" name="time" />
						</div>
						<label class="label-left" for="user">发生地点</label> <label
							class="label-right"> <input type="text"
							pattern="^[a-zA-z][a-zA-Z0-9_]{2,9}$" title="英文数字下滑线"
							name="place" id="place" />
						</label> <input type="hidden" id="lastPractice_id"
							value="${lastPractice_id}" /> <label class="label-left">实习任务</label>
						<div data-role="select" class="label-right">
							<select name="practice_id" id="practice_id"
								onchange="getPracticeTask()">
								<option value="">请选择实习任务</option>
								<c:forEach items="${groupList}" var="group" varStatus="status">
									<option value="${group.practice_id}">${group.group_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="listitem">
							<label class="sliver">请选择学生：</label> <a href="#addStudent_modal"
								data-toggle="modal">+添加学生</a>
						</div>
						<div class="card">
							<output id="stu_name" name="stu_name" style="width:100%"></output>
						</div>

						<label class="label-left">奖惩类型：</label>
						<div data-role="select" class="label-right">
							<select name="ei_id" id="ei_id">
								<option value="">请选择奖惩类型</option>
								<c:forEach items="${eiList}" var="ei" varStatus="status">
									<option value="${ei.id}">${ei.index_name}</option>
								</c:forEach>

							</select>
						</div>

						<div class="listitem">
							<label class="sliver">奖惩描述：</label>
						</div>
						<div class="card">
							<textarea rows="5" class="noborder" name="description"
								id="description"></textarea>
							<input type="hidden" id="stu_id" name="stu_id"> </input>

						</div>
					</form>
					<div class="card noborder">
						<button class="submit width-full" id="Preservation">保存</button>
					</div>
				</div>
				</atricle>
		</section>
	</div>




	<div id="addStudent_modal" data-role="modal" class="modal bg-carrot">
		<header>
			<div class="titlebar">
				<a data-toggle="back" href="#"><i
					class="iconfont iconline-arrow-left"></i></a>
				<h1>添加学生</h1>
			</div>
		</header>
		<article data-role="article" id="modal_article" data-scroll="verticle"
			class="active" style="top:44px;bottom:0px;">
			<div class="scroller">
				<form class="form-group">
					<div class="card">
						<ul class="listitem">
							<li class="title">选择范围</li>
							<li class="nopadding"><a href="#" data-role="checkbox">
									<button id="check_all" value="全选" class="submit width-full">全选</button>
							</a></li>
							<ul class="listitem" id="students"></ul>
						</ul>
					</div>

				</form>

				<div class="card noborder">
					<button class="submit width-full" id="stu_enter">确定</button>
				</div>
			</div>
		</article>
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
	<script>
		function jump01() {
			A.Controller.section('#TaskDetails_section');
		}

		function jump02() {
			A.Controller.section('#NewAward_section');
		}

		(function() {
			$('#Preservation').on(A.options.clickEvent, function() {
				var time = $("#time").val();

				var place = $("#place").val();

				var stu_id = $("#stu_id").val();
				var ei_id = $("#ei_id").val();

				if (time == "") {
					A.alert("请选择开始时间！");
					return;
				}
				if (place == "") {
					A.alert("请填写发生地点！");
					return;
				}
				if (stu_id == "") {
					A.alert("请选择学生！");
					return;
				}
				if (ei_id == "") {
					A.alert("请选择奖惩类型！");
					return;
				}

				A.alert("提示", "提交成功");
				$("#form1").submit();

			});

		})();
		$('#stu_enter').on(A.options.clickEvent, function() {
			var value = "";
			var name = "";
			var id = document.getElementsByName("stu_true_id");//复选框的name
			var stu_name = document.getElementsByName("stu_true_name");

			for (var i = 0; i < id.length; i++) {

				if (id[i].checked) {
					value += id[i].value + ",";
					name += stu_name[i].innerHTML + "、";

				}
			}
			document.getElementById("stu_name").value = name;
			document.getElementById("stu_id").value = value;
			A.Controller.modal('#addStudent_modal');
		});

		$("#check_all").on(A.options.clickEvent, function() {
			if ($("#check_all").attr("value").indexOf("全选") == -1) {

				$("#check_all").attr("value", "全选");
				$("#check_all").html("全选");
				$(":checkbox").prop("checked", false);
			} else {
				$("#check_all").attr("value", "取消");
				$("#check_all").html("取消");
				$(":checkbox").prop("checked", true);
			}
			return false;
		});

		/**
		查出该老师的所选实习任务对应的学生 
		by周睿
		 */

		function getPracticeTask() {// 向服务器发送搜索请求
			document.getElementById("stu_name").value = "";
			document.getElementById("stu_id").value = "";
			var practice_id = $("#practice_id").val();
			var dataSend = "practice_id=" + practice_id;
			$.ajax({
				type : "get",
				url : "studentListByPraCodeTeaCode.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					$("#students").html(data);
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
