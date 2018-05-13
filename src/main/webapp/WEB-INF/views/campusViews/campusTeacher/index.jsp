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
<style>
.photo {
	border-radius: 30px;
	width: 60px;
	height: 60px;
	overflow: hidden;
	background: url(<%=path%>/AgileLite/assets/app/img/aside/photo.png)
		center center;
	background-size: cover;
	display: inline-block;
	vertical-align: middle;
}

#aside_container aside {
	background: -webkit-linear-gradient(-45deg, #1b63ab 0%, #0e4882 75%);
}

#section_container_mask {
	background-color: #000;
	opacity: .3;
}

/*侧滑列表-列表样式*/
.side-list {
	padding: 10px 20px;
	border-top: 1px solid #1B63AB;
}

.side-list:last-child {
	border-bottom: 1px solid #1B63AB;
}

.side-list:active {
	background-color: rgba(255, 255, 255, 0.2);
}

.side-list.active {
	background-color: rgba(255, 255, 255, 0.2);
}

.side-list.active div {
	background-color: rgba(255, 255, 255, 0.2);
}

.side-list a {
	color: #fff;
}

.side-list-btn {
	font-size: 14px;
	border: 1px solid white;
	width: 80%;
	padding: 6px 0;
	text-align: center;
	position: relative;
	left: 50%;
	-webkit-transform: translateX(-50%);
	margin-bottom: 10px;
}

.side-list-btn:active {
	background-color: rgba(255, 255, 255, 0.2)
}

.side-list-round {
	width: 36px;
	height: 36px;
	border-radius: 18px;
	border: 1px solid rgba(255, 255, 255, 0.5);
	display: inline-block;
	text-align: center;
	font-size: 20px;
	color: white;
	position: relative;
	vertical-align: middle;
	margin-right: 4px;
}

.side-list-round img,.side-list-round .iconfont {
	position: absolute;
	top: 50%;
	left: 50%;
	display: block;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	width: 20px;
}

.side-list-round+span {
	margin-left: 6px;
	font-size: 14px;
}
</style>
</head>
<body>
	<div id="aside_container">

		<aside id="left_push_aside" data-position="left"
			data-transition="push">
			<ul class="menu">
				<li style="color:white;text-align:center;padding:8px 0;">
					<div class="box box-center">
						<div class="photo"></div>
					</div>
					<p style="opacity:0.7;margin:8px;">${true_name }</p></li>
				<li class="side-list">
					<a href="practiceManagementList.do" class="menu active">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/aside/newspaper.png"
								class="wmz-side-img" />
						</div>
						<span>实习管理</span>
				</a></li>
				<li class="side-list"><a href="#">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/about/file.png"
								class="wmz-side-img" />
						</div>
						<span>整周实训</span>
				</a></li>
				<li class="side-list"><a href="#">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/about/search.png"
								class="wmz-side-img" />
						</div>
						<span>常见问题</span>
				</a></li>
				<li class="side-list"><a href="applyLeave.do"data-toggle="html">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/about/personage.png"
								class="wmz-side-img" />
						</div>
						<span>个人信息</span>
						
				</a></li>
				<li class="side-list"><a href="#">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/about/friends.png"
								class="wmz-side-img" />
						</div>
						<span>帮助</span>
				</a></li>
			</ul>
		</aside>
	</div>
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active"
			data-aside-left="#left_push_aside">
			<header>
				<div class="titlebar">
					<a data-toggle="aside" href="#left_push_aside"><i
						class="iconfont iconline-list"></i>
					</a>
					<h1>实践教学管理</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" class="active"
				data-scroll="verticle" style="top:40px; overflow: auto;">
				<div class="scroller">
					<div id="slide" data-role="slider" data-scroll="pull" class="full"
						style="height: 230px;overflow: hidden;">
						<div class="scroller">

							<div class="slide">
								<img src="<%=path%>/AgileLite/images/sz_03.bmp"
									class="full-width" />
								<div class="slider_label">实践教学管理</div>
							</div>
							<div class="slide">
								<img src="<%=path%>/AgileLite/images/sz_02.jpg"
									class="full-width" />
								<div class="slider_label">实践教学管理</div>
							</div>
							<div class="slide">
								<img src="<%=path%>/AgileLite/images/sz_01.jpg"
									class="full-width" />
								<div class="slider_label">实践教学管理</div>
							</div>
						</div>
					</div>

					<ul class="listitem">
						<li class="sliver">学院通知</li>
						<c:forEach var="collogeNotice"
								items="${college_NoticeList}" varStatus="status">
								<li><span class="icon"> <i
										class="iconfont iconline-radio-fill unread"></i> <br /> <i
										class="iconfont iconline-attach"></i>
								</span> <i class="ricon iconfont iconline-arrow-right"></i>
									<div class="text" onclick="location.href='detailNotice.do?id=${collogeNotice.id}'">
										${collogeNotice.title}<i class="right iconfont iconline-fav"></i> <small>电子信息学院<font
											class="right">${collogeNotice.create_time }</font>
										</small>
									</div></li>
							</c:forEach>

						
						<li class="sliver">校内近况</li>
						<li>
							<div class="text">实践教学手机网页版正式上线啦~</div></li>
						<li>
							<div class="text">实践教学手机网页版正式上线啦~</div></li>
						<li>
							<div class="text">实践教学手机网页版正式上线啦~</div></li>
						<li>
							<div class="text">实践教学手机网页版正式上线啦~</div></li>
						<li>
							<div class="text">实践教学手机网页版正式上线啦~</div></li>
						<li>
							<div class="text">实践教学手机网页版正式上线啦~</div></li>
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
	<script>
		$('#slider_section').on('sectionshow', function() {
			A.Component.scroll('#tabbarOuter');
		});
		$('#main_article').on('articleload', function() {
			A.Slider('#slide', {
				dots : 'right',
				auto : true
			});
			A.Slider('#sliderPage', {
				dots : 'hide'
			});
		});
	</script>
</body>
</html>
