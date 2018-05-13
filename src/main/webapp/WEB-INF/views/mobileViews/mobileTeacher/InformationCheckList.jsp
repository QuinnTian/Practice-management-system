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
<title>招聘信息列表</title>

</head>
<body>
	<div id="section_container">
		<section id="Noticelist_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>信息核对列表</h1>
					<a id="detail_modal_edit" href="#addTest_section"
						data-toggle="section"><i class="iconfont iconline-mark-plus"></i>
					</a>
			</header>
			<article data-role="article" id="College_notice"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<ul class="listitem">
						<li class="sliver">学生实习管理</li>
						<li onclick="toActive01()"><i
							class="ricon iconfont iconline-arrow-right"></i>
							<div class="text">
								同学们尽快完成个人信息的核对 <small> 时间2015/11/17-2015/11/17</small>
							</div></li>

					</ul>
				</div>
			</article>

		</section>
		<section id="addTest_section" data-role="section">
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
					<form class="form-group">
						<div class="card">
							<input type="text" placeholder="开始时间" class="noborder"> </input>
						</div>
						<div class="card">
							<input type="text" placeholder="结束时间" class="noborder"> </input>
						</div>
						<div class="card">
							<input type="text" placeholder="核对实习标题" class="noborder">
							</input>
						</div>

						<div class="listitem">
							<label class="sliver">请选择学生：</label>

						</div>
						<div class="card">
							<textarea rows="5" class="noborder"></textarea>
						</div>

						<div class="listitem">
							<label class="sliver">任务描述：</label>
						</div>
						<div class="card">
							<textarea rows="5" class="noborder"></textarea>
						</div>
					</form>
					<div class="card noborder">
						<button class="submit width-full">保存</button>
					</div>
				</div>
				</atricle>
		</section>
		<section id="StudentCheck_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>学生核对情况</h1>
			</header>
			<article data-role="article" id="Check" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left">吴敬国</label>
						<div style="height:auto;" class="label-right">
							<output> 信息已审核 </output>
						</div>
						<hr>
					</form>
				</div>
			</article>

		</section>
		<section id="info_section" data-role="section">

			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>任务详情</h1>
					<a id="detail_modal_edit" href="#StudentCheck_section"
						data-toggle="section"> 核对情况</a>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-group">
						<div class="card">
							<label class="sliver">开始时间</label> <input type="text"
								class="noborder" style="width=100%" value="2015-12-13">
							</input>
						</div>
						<div class="card">
							<label class="sliver">结束时间</label> <input type="text"
								class="noborder" value="2015-12-13"> </input>

						</div>


						<div class="listitem">
							<label class="sliver"> 任务标题：</label>
						</div>
						<div class="card">
							<input id="Task_title" class="noborder" style="width:100%"
								type="text" value="同学们尽快完成个人信息的核对"> </input>
						</div>
						<div class="listitem">
							<label class="sliver">任务描述：</label>
						</div>
						<div class="card">
							<textarea rows="5" class="noborder">同学们尽快在qq群里下载核对信息，完成个人信息的核对。并在系统里进行信息确认.</textarea>
						</div>
					</form>

				</div>
			</article>
			<footer id="edit_footer" style="bottom: 0px;">
				<nav class="menubar">
					<a class="menu active" id="add_mark"> <span
						class="menu-icon iconfont iconline-write"></span> <span
						class="menu-text">修改任务</span>
					</a> <a class="menu active" id="delete_mark"> <span
						class="menu-icon iconfont iconline-trash"></span> <span
						class="menu-text">删除任务</span>
					</a>
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
	<script type="text/javascript">
		function toActive01() {
			A.Controller.section('#info_section');
		}
	</script>
</body>

</html>
