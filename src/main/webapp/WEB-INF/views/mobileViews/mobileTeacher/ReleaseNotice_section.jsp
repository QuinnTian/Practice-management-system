<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
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

<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>

<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>

<script type="text/javascript" src="/springmvc_mybatis/js/checkTextArea.js"></script>
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

</head>
<body>

	<div id="section_container">
		<section id="ReleaseNotice_section" data-role="section" class="active">
			<header>
				<div class="titlebar">

					<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i> </a> <a
						href="<%=path%>/MobileTeacher/index.do" style="position: absolute;left:20%;"></a>

					<h1>发布通知</h1>
				</div>
			</header>
			<c:if test="${flag==true}">
				<article data-role="article" id="main_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">
						<form class="form-group" name="form1" id="form1" action="doAddNotice.do" method="post">
							<div data-role="select" class="card">
								<select placeholder=" 请选择实习任务" id="praTask" name="praTask">
									<c:forEach var="praTask" items="${checkinfo_pulltaskList}" varStatus="status">
										<option value="${praTask.id }">${praTask.task_name }</option>
									</c:forEach>
									<select>
							</div>

							<div class="card">

								<input type="text" id="title" name="title" placeholder="标题" class="noborder"></input>
								<span></span>
							</div>
							<div class="listitem">
								<label class="sliver">内容：</label>

							</div>

							<div class="card" id="wordCount">
								<textarea id="content" name="content" rows="5" class="noborder"></textarea>
								<span></span> <span class="wordwrap"><var class="word">200</var>/200</span>
							</div>

							<div class="listitem">

								<button class="submit width-full" id="notificationScope">通知范围</button>

								<input id="notice_range" type="hidden" value="" name="notice_range" />
								

								<input id="notice_range" type="hidden" value=""
									name="notice_range" /> 

							</div>

							<div class="card test_box" id="noticeRange" contenteditable="true"></div>
						</form>
						<div class="card noborder">

							<button class="submit width-full" data-toggle="section" id="addNotice">发布通知</button>
						</div>
					</div>
				</article>
		</section>
	</div>
	</c:if>
	<c:if test="${flag==false}">
		<div>亲： 您还没有带实习任务哦！</div>
		<div>请找管理员添加实习任务呀！</div>
	</c:if>
	<div id="index_modal" data-role="modal" class="modal bg-carrot">
		<header>
			<div class="titlebar">
				<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
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

							<li class="nopadding"><a href="#" data-role="checkbox"> <!-- 	 <label for="check_all"> 全选 </label>  <input type="checkbox"
									id="check_all" /> -->
									<button id="check_all" value="全选" class="submit width-full">全选</button>

							</a></li>
							<div id="chooseScope"></div>
						</ul>
					</div>

				</form>

				<div class="card noborder">
					<button class="submit width-full" id="confirm">确定</button>
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
						$("#notice_range").attr("value", arrarId);

						A.Controller.modal('#index_modal');
						return false;
					});

			$("#notificationScope").on(A.options.clickEvent, function() {
				$.ajax({
					type : "get",
					url : "getStudent.do?",
					data : getpraId(), //设置发送参数，即使参数为空，也需要设置     
					dataType : "text", //返回的类型为json  

					success : function(data) { //成功时执行的方法		
						/* 	A.alert(data); */
						setEt(data);
						A.Component.formcheck("#modal_article");
					},
					error : function(result, status) { //出错时会执行这里的回调函数                     
						if (status == 'error') {
							alert("出错了");
						}
					}
				});
				A.Controller.modal('#index_modal');
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

			$("#addNotice").on(A.options.clickEvent, function() {

				//alert($("#content").val());
				if ($("#title").val() == "") {
					A.alert("标题不能为空");

				} else if ($("#content").val() == "") {
					A.alert("内容不能为空");
				} else if ($("#noticeRange").text() == "") {
					A.alert("请选择通知范围！");
				} else {

					document.form1.submit();
				}
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

		});
		//当refresh初始化会进入此监听
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
