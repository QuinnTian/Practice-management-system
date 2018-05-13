<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
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

 .connect a:link {
	color: #000000;
	text-decoration: none;
}

.connect a:visited {
	color: #000000;
	text-decoration: none;
}

.connect a:hover {
	color: #000000;
	text-decoration: none;
}

.connect a:active {
	color: #000000;
	text-decoration: none;
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
					<p style="opacity:0.7;margin:8px;">${true_name }</p>
				</li>
				<li class="side-list"><a
					onclick="location.href='practiceManagementList.do'"
					class="menu active">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/aside/newspaper.png"
								class="wmz-side-img" />
						</div> <span>实习管理</span>
				</a></li>
				<!--  <li class="side-list"><a href="#">
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
				</a></li>-->
				<li class="side-list"><a
					onclick="location.href='PersonalInformation.do'">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/about/personage.png"
								class="wmz-side-img" />
						</div> <span>个人信息</span>
				</a></li>
				<li class="side-list"><a onclick="location.href='help.do'">
						<div class="side-list-round">
							<img src="<%=path%>/AgileLite/assets/app/img/about/friends.png"
								class="wmz-side-img" />
						</div> <span>帮助</span>
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
						class="iconfont iconline-list"></i> </a>
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
					<div style="width:100%;height:auto;">
						<ul class="listitem">
							<li class="sliver">快捷菜单导航栏 <a id="getMenu"><i
									style="float:right;" class="iconfont iconline-rdo-add"></i></a>
							</li>
						</ul>
						<div style="height:auto;">
							<div class="grid" data-col="1" id="navigationBar"></div>
							<!-- 显示页面快速导航 -->


						</div>
					</div>
					<hr>
					<ul class="listitem">
						<li class="sliver">学院通知</li>
			
						
						<c:forEach var="notice" items="${noticeFive}" varStatus="status">
							<li class="connect"><a href="detailNotice.do?id=${notice.id}"><span
									class="icon"> <i
										class="iconfont iconline-radio-fill unread"></i> <br /> <i
										class="iconfont iconline-attach"></i>
								</span> <i class="ricon iconfont iconline-arrow-right"></i>
									<div class="text">
										${notice.title}<i class="right iconfont iconline-fav"></i> 
										<small>${org_name}<font
											class="right"> <fmt:formatDate
													value="${notice.create_time}" pattern="yyyy/MM/dd" /></small></font> </small>
									</div></a></li>
						</c:forEach>


					<li class="sliver">本人通知</li>
						<c:forEach var="myNotice" items="${myNoticeFive}" varStatus="status">
							<li class="connect"><a href="detailNotice.do?notice_id=${myNotice.id}">
								<div class="text">${myNotice.title}
								<small> <fmt:formatDate
											value="${myNotice.create_time}" pattern="yyyy/MM/dd" />
									</small></div></a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</article>
		</section>
	</div>
	<div id="index_modal" data-role="modal" class="modal bg-carrot">
		<header>
			<div class="titlebar">
				<a data-toggle="modal" href="#index_modal"><i
					class="iconfont iconline-arrow-left"></i></a>
				<h1>添加菜单</h1>
			</div>
			<div class="tabbar">
				<a class="tab active" id="C_notice" data-role="tab">选中菜单进行添加</a>
			</div>
		</header>
		<article data-role="article" id="modal_article" data-scroll="verticle"
			class="active" style="top:88px;bottom:0px;">
			<div class="scroller">
				<div class="form-common">

					<div class="grid" data-col="2" id="getRoleIdMenu">
						<!--从数据库读取菜单列表  -->
					</div>
					<button id="userRoleIdMenu" class="block submit">确定</button>
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
	<script>
	var time = 100000;
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
		/* 获取用户自定义菜单 */
		/* 获取可自定义菜单 */
		/* 保存用户自定义菜单 */

		$("#getMenu").on(A.options.clickEvent, function(e) {
			//A.Controller.modal('#index_modal');
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "getRoleIdMenu.do",
				data : "", //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为text                
				success : function(data) { //成功时执行的方法
					$("#getRoleIdMenu").html(data);
					setTimeout("A.Component.formcheck(\"#modal_article\")",time);
					//A.Component.formcheck("#modal_article");
					A.Controller.modal('#index_modal');
					if(time>0){
						time -= 100000;
					}
				},
				error : function() { //出错时会执行这里的回调函数                     
					A.alert('提示', '获取菜单失败');
				}
			});

			return false;
		});

		$("#userRoleIdMenu").on(A.options.clickEvent, function(e) {
			A.Controller.modal('#index_modal');

			var customMenu = $("input[name='roleIdMenu']:checked").serialize();
			$.ajax({
				url : "updateCustomMenuAjax.do",
				type : "post",
				data : customMenu,
				success : function() {
					updateCustomMenuShow();
				},
				error : function() { //出错时会执行这里的回调函数        
					A.alert('提示', '保存失败');
				}
			});
		});

		function updateCustomMenuShow() {
			$.ajax({
				type : "get",
				url : "updateCustomMenuShow.do?",
				data : "", //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为text                
				success : function(data) { //成功时执行的方法
					$("div #navigationBar").html(data);
				},
				error : function() {
				}
			});
		}
		(function() {
			updateCustomMenuShow();
		})();
	</script>
</body>
</html>
