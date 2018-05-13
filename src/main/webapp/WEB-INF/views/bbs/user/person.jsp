<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    
   <meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
		<style>
			.photo {
				margin-top: 20px;
				border-radius: 30px;
				width: 80px;
				height: 80px;
				overflow: hidden;
				background: url(<%=path%>/AgileLite/assets/app/img/aside/photo.png) center center;
				background-size: cover;
				display: inline-block;
				vertical-align: middle;
			}
		</style>
  </head>
  
  <body>
		<div id="section_container">
			<section id="slider_section" data-role="section" class="active" data-aside-left="#left_reveal_aside">
				<header>
					<div class="titlebar">
						<a href="<%=path%>/weixin/index.do"><i class="iconfont iconline-arrow-left"></i></a>
						<h1>个人中心</h1>
					</div>
				</header>
				<article data-role="article" id="main_article" class="active  bg-clouds" style="top:44px; hidden;">
					<div id="sliderPage" data-role="slider" class="full">
						<div class="scroller">
							<div id="page1" class="slide" data-role="page" style="height: 100%;">
								<div class="scroller">
									<div style=" width: 100%; height: 160px; background-image:url(../assets/app/img/bg_image.png)" align="center"  >
										<div class="photo"></div>
										<div style="margin-top: 2px;">
											${user.true_name }
										</div>
										<div>
											2015年11月25日
										</div>
									</div>
									<div class="bg-white" style="height: 8%; line-height:30px; "></div>
									<div style="background-color: #999999;height: 4px;"></div>
									<div>
										<ul class="listitem">
											<li class="sliver" >
												个人中心
											</li>
											<li onclick="toPersonDetails()">
												<i class="icon iconfont iconline-fav"></i>
												<div class="text"  >
													个人信息
												</div>
											</li>
											<li onclick="toNoticeList()">
												<i class="icon iconfont iconline-fav"></i>
												<div class="text" style="width:100 %">
													我的消息
													<c:if test="${notReadcount!=0}">
													<span class="badge bg-pomegranate white pull-right" style="margin-left:10px">${notReadcount}</span>
													</c:if>
												</div>
												
											</li>
											<li onclick="toPersonTheme()">
												<i class="icon iconfont iconline-fav" ></i>
												<div class="text">
													我的主题
												</div>
											</li>
											<c:if test="${user.type=='tea' }">
											<li onclick="toStuList()">
												<i class="icon iconfont iconline-fav" ></i>
												<div class="text" >
													学生主题
												</div>
											</li>
											</c:if>
											<li onclick="WeixinJSBridge.call('closeWindow');">
												<i class="icon iconfont iconline-fav"></i>
												<div class="text" >
													退出贴吧
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
				<footer>
					<nav class="menubar"  style=" width: 100%;background-color: #ECF0F1 ;text-align:center">
								<span>版权所有：山东商业职业技术学院</span><br />
								<span> 通讯地址：济南市旅游路4516号 邮编：250103</span>
					</nav>
				</footer>
			</section>

		</div>

		<!--- third --->
		<script src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
		<script src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
		<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
		<script src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
		<!-- agile -->
		<script type="text/javascript" src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
		<!--- bridge --->
		<script type="text/javascript" src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
		<script type="text/javascript" src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
		<!-- app -->
		<script type="text/javascript" src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
		<script>
			$('#main_article').on('articleload', function() {
				A.Slider('#sliderPage', {
					dots : 'hide'
				});
			});
			$('#page1').on('slidershow', function() {
			});
			
			function toPersonDetails(){
				window.location.href = "<%=path%>/weixin/toPersonDetails.do";
			}
			
			function toPersonTheme(){
				window.location.href = "<%=path%>/weixin/toPersonTheme.do";
			}
			function toStuList(){
				window.location.href = "<%=path%>/weixin/toStuList.do";
			}
			function toNoticeList(){
				window.location.href = "<%=path%>/weixin/noticeList.do";
			}
		</script>

	</body>
</html>