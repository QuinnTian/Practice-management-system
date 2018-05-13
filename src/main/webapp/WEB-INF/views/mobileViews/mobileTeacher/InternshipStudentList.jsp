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
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
</head>
<body>
	<div id="section_container">
		<section id="scroll_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i>
					</a>
					<h1>实习学生列表</h1>
				</div>
				<div class="tabbar" style="width:100%">
					<form class="form-group">
						<input type="hidden" id="lastGroupNmae" value="${lastGroupNmae}">
						<div data-role="select" class="card" style="background-color:#FFFFFF;">
							<select name="practice_name" id="practice_name"
								onchange="getPracticeTask()" placeholder="实习任务">
								<option value="">请选择实习任务</option>
								<c:forEach items="${groupList}" var="group" varStatus="status">
									<option value="${group.group_name}">${group.group_name}</option>
								</c:forEach>
							</select>
						</div>
					</form>
				</div>
			</header>
			<article data-role="article" id="College_notice" data-scroll="pull"
				class="active" style="top:100px;bottom:0px;">
				<div class="scroller" id="stulist"></div>
			</article>
		</section>
	</div>
	<!--- third --->
	<script src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
	<!-- agile -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
	<!--- bridge --->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript" src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script>
		/**
		查出该老师的所选实习任务对应的学生 
		by周睿
		 */

		function getPracticeTask() {// 向服务器发送搜索请求
			var practice_name = $("#practice_name").val();
			var dataSend = "practice_name=" + practice_name;
			$.ajax({
				type : "post",
				url : "studentListByPractice_name.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					$("#stulist").html(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
					}
				}
			});
		}
		$(function() {
			var lastGroupNmae = $("#lastGroupNmae").val();
			$("#practice_name").val(lastGroupNmae);
			getPracticeTask();
		});
		$('#College_notice').on('scrollInit', function() {
			var scroll = A.Scroll(this);
			//已经初始化后不会重新初始化，但是可以得到滚动对象
			//监听滚动到顶部事件，可以做一些逻辑操作
			scroll.on('scrollTop', function() {
				A.showToast('滚动到顶部');
				//scroll.refresh(); //如果scroll区域dom有改变，需要刷新一下此区域
			});
			//监听滚动到底部事件，可以做一些逻辑操作
			scroll.on('scrollBottom', function() {
				A.showToast('滚动到底部');
				//scroll.refresh(); //如果scroll区域dom有改变，需要刷新一下此区域，
			});
		});

		//当refresh初始化会进入此监听
		$('#College_notice').on(
				'refreshInit',
				function() {
					var refresh = A.Refresh('#College_notice');
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
