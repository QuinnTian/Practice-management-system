<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
.test_box {
	width: 100%;
	min-height: 120px;
	max-height: 300px;
	_height: 120px;
	margin-left: auto;
	margin-right: auto;
	padding: 3px;
	outline: 0;
	border: 1px solid #a0b3d6;
	font-size: 12px;
	word-wrap: break-word;
	overflow-x: hidden;
	overflow-y: auto;
	_overflow-y: visible;
}
</style>


</head>
<body>
	<div id="section_container">
		<section id="NewAward_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>添加核对任务</h1>

				</div>
			</header>

			<article data-role="article" class="active" id="border_article"
				data-scroll="verticle" style="top:44px;bottom:0px;">
				<div class="scroller">
					<c:if test="${flag==true}">
						<form autocomplete="off"
							oninput="range_output.value=parseInt(range.value)"
							class="form-square" action="doAddCheckInfo.do" method="post">
							<label class="label-left">实习任务</label>
							<div data-role="select" class="label-right">
								<select id="praTask" name="praTask">
									<c:forEach var="praTask" items="${checkinfo_pulltaskList}"
										varStatus="status">
										<option value="${praTask.id }">${praTask.task_name }</option>
									</c:forEach>
									<select>
							</div>

							<label class="label-left">核对实习标题</label>
							<div class="label-right">
								<input type="text" name="task_name" value="" id="task_name" />
							</div>
							<label class="label-left">开始时间</label>
							<div data-role="date" class="label-right">
								<label>请选择时间</label> <input type="hidden" name="begin_Time"
									id="begin_Time" />
							</div>
							<label class="label-left">结束时间</label>
							<div data-role="date" class="label-right">
								<label>请选择时间</label> <input type="hidden" name="end_Time"
									id="end_Time" />
							</div>
							<div class="listitem" onclick="switchs()">
								<label class="sliver">请选择学生：</label><a id="notificationScope"
									style="color:blue">+添加学生</a>

							</div>
							<div class="card">
								<!-- <textarea rows="5" class="noborder" ></textarea> -->
								<div class="card test_box" id="noticeRange"
									contenteditable="true"></div>
							</div>

							<div class="listitem">
								<label class="sliver">任务描述：</label>
							</div>
							<div class="card">
								<textarea rows="5" class="noborder" name="task_desc"
									id="task_desc"></textarea>
							</div>
							<input type="hidden" name="practice_id" value="${practice_id}" />
							<input type="hidden" name="grade" value="${grade}" /> <input
								type="hidden" name="stu_range" id="stu_range" value="" />

						</form>
						<div class="card noborder">
							<button class="submit width-full" id="saveCheckInfo">保存</button>
						</div>
				</div>
				</c:if>
				<c:if test="${flag==false}">
					<div>亲： 您还没有带实习任务哦！</div>
					<div>请找管理员添加实习任务呀！</div>
				</c:if>
				</atricle>
		</section>
	</div>
	<div id="addStudent_modal" data-role="modal" class="modal bg-carrot">
		<header>
			<div class="titlebar">
				<a data-toggle="back" href="#"><i
					class="iconfont iconline-arrow-left"></i></a>
				<h1>通知范围</h1>
			</div>
		</header>
		<article data-role="article" id="modal_article" data-scroll="pull"
			class="active" style="top:44px;bottom:0px;">
			<div class="scroller">
				<form class="form-group">
					<div class="card">
						<ul class="listitem">
							<li class="title">选择范围</li>
							<li class="nopadding"><a href="#" data-role="checkbox">
									<!-- <label for="check_all" class="black">全选 </label> <input
									type="checkbox" id="check_all" /> -->
									<button id="check_all" value="全选" class="submit width-full">全选</button>
							</a></li>
							<!-- 	占位符 用于存放ajax获得到的学生 -->
							<div id="chooseScope"></div>
						</ul>
					</div>

				</form>

				<div class="card noborder">
					<button id="confirm" class="submit width-full">确定</button>
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
	<script type="text/javascript">
		$(function() {
			$("#saveCheckInfo").on(A.options.clickEvent, function() {
				var task_name = $("#task_name");
				var begin_Time = $("#begin_Time");
				var end_Time = $("#end_Time");
				var stu_range = $("#noticeRange");
				var task_Desc = $("#task_desc");

				if (task_name.val() == "") {
					A.alert("请输入核对任务标题");
					task_name.focus();
					return;
				}
				if (begin_Time.val() == "") {
					A.alert("请选择开始时间");
					return;
				}
				if (end_Time.val() == "") {
					A.alert("请选择结束时间");
					return;
				}
				if (end_Time.val() < begin_Time.val()) {
					A.alert("结束时间不能够早于开始时间，请重新选择！");
					return;
				}
				if ($("#stu_range").val() == "") {
					A.alert("学生范围不能为空");
					return null;
				}

				if (task_Desc.val() == "") {
					A.alert("任务描述不能为空，请填写任务描述");
					task_Desc.focus();
					return;
				}

				/* 	if (practice_id.val()==""){
						A.alert("请选择实践任务");
						task_Place.focus();
						return ;
					}  */

				document.forms[0].submit();
				return false;
			});

			$("#check_all").on(A.options.clickEvent, function() {

				/* 	if (!($("#bb").is(':checked'))) {
						//$(":checkbox").attr("checked", "checked");
						$(":checkbox").prop("checked", true);
					}else{
						$(":checkbox").prop("checked", false);
					} */
				//alert($("#check_all").attr("value").indexOf("全选")==-1);
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

			$("#confirm").on(
					A.options.clickEvent,
					function() {
						var count = $(":checked[name='student']").length;
						//alert(count);
						var arrarId = new Array();
						var arrarName = new Array();

						for (i = 0; i < count; i++) {
							arrarId[i] = $(
									":checked[name='student']:eq(" + i + ")")
									.attr("id");
							arrarName[i] = $(
									":checked[name='student']:eq(" + i + ")")
									.attr("value");

						}
						//document.write(arrar);

						$("#noticeRange").text(arrarName);
						$("#stu_range").attr("value", arrarId);

						A.Controller.modal('#addStudent_modal');
						return false;
					});

			$("#notificationScope").on(A.options.clickEvent, function() {
				$.ajax({
					type : "get",
					url : "getStudent.do?",
					data : getpraId(), //设置发送参数，即使参数为空，也需要设置     
					dataType : "text", //返回的类型为json  

					success : function(data) { //成功时执行的方法		
						/* A.alert(data); */
						setEt(data);
						A.Component.formcheck("#modal_article");
					},
					error : function(result, status) { //出错时会执行这里的回调函数                     
						if (status == 'error') {
							alert("出错了");
						}
					}
				});
				A.Controller.modal('#addStudent_modal');
				return false;
			});

			function getpraId() {
				var practice_id = $("#praTask").val();
				var dataSend = "practice_id=" + practice_id;
				return dataSend;
			}
			function setEt(ajaxData) {//根据返回数据显示搜索结果

				$("#chooseScope").html(ajaxData);
			}
			;

		});
		$('#modal_article').on(
				'refreshInit',
				function() {
					var refresh = A.Refresh('#modal_article');
					//监听下拉刷新事件，可以做一些逻辑操作，当data-scroll="pullup"时无效
					refresh.on('pulldown', function() {
						$('#content').prepend(
								'<li><div class="text">下拉刷新的内容</div></li>');
						refresh.refresh();//当scroll区域有dom结构变化需刷新
					});
					//监听上拉刷新事件，可以做一些逻辑操作，当data-scroll="pulldown"时无效
					refresh.on('pullup', function() {
						$('#content').append(
								'<li><div class="text">上拉刷新的内容</div></li>');
						refresh.refresh();//当scroll区域有dom结构变化需刷新
					});
				});
	</script>
</body>

</html>

