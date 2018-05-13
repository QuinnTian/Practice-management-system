<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<title>山东商业职业技术学院</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<style>
[data-role="slider"] img {
	display: block;
}
</style>

</head>

<body>
	<div id="section_container">
		<section id="slider_section" data-role="section" class="active"
			data-aside-left="#left_reveal_aside">
			<header>
				<div class="titlebar">
					<a href="<%=path%>/weixin/toPosting.do"><i
						class=" iconfont iconline-write"></i> </a>
					<h1>商职贴吧</h1>
					<a onclick="toPerson()"><i class=" iconfont iconline-user-man"></i>
					</a>

				</div>
				<div id="tabbarOuter" data-scroll="horizontal">
					<div class="scroller" style="width:500px;">
						<div class="tabbar" style="width:100%;">
							<a class="tab active" data-role="tab" href="#page1"
								data-toggle="page">校内生活</a> <a class="tab" data-role="tab"
								href="#page2" data-toggle="page">校外实习</a> <a class="tab"
								data-role="tab" href="#page3" data-toggle="page">人生感悟</a>
						</div>
					</div>
				</div>
			</header>
			<article data-role="article" id="main_article" class="active"
				style="top:88px;overflow: hidden;">
				<div id="sliderPage" data-role="slider" class="full">
					<div class="scroller">
						<div id="page1" class="slide" data-role="page" data-scroll="pull">
							<div class="scroller" style="background-color: #EBEDF0">
								<ul class="listitem" id="listitemPage1">
									<li class="sliver" id="liPage1">校内生活</li>
									<%--<c:forEach var="in1" items="${invitationList1}">
										<li onclick="toParticulars(${in1.id})"><imgsrc="../assets/app/img/logo-exmobi.png" class="img appimg"
											style="width: 45px;height: 45px;" />
											<div class="text">
												<c:set var="user_id" value="${in1.user_id}" scope="request"></c:set>
												<%
													String id = (String) request.getAttribute("user_id");
												%>
												<c:if test="${type=='stu'}">
													<%
														out.print(DictionaryService.findStudent(id).getTrue_name());
													%>
												</c:if>
												<c:if test="${type=='tea'}">
													<%
														out.print(DictionaryService.findTeacher(id).getTrue_name());
													%>
												</c:if>
												<i class="right iconfont iconline-chat" style="size: 1em;">&nbsp;155</i>
												<small>${in1.create_time}</small>
											</div>
											<div style="margin-top: 15px">
												${in1.title} <br /> ${in1.content}
											</div></li>
									</c:forEach>
								--%></ul>
							</div>
						</div>
						<div id="page2" class="slide" data-role="page" data-scroll="pull">
							<div class="scroller" style="background-color: #EBEDF0">
								<ul class="listitem" id="listitemPage2">
									<li class="sliver" >校外实习</li>
								</ul>
							</div>
						</div>
						<div id="page3" class="slide" data-role="page" data-scroll="pull">
							<div class="scroller" style="background-color: #EBEDF0">
								<div class="scroller">
									<ul class="listitem" id="listitemPage3">
										<li class="sliver">人生感悟</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
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
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<script>
		$('#slider_section').on('sectionshow', function() {
			A.Component.scroll('#tabbarOuter');
		});
		$('#main_article').on('articleload', function() {
			A.Slider('#sliderPage', {
				dots : 'hide'
			});
		});
		//下拉刷新ajax
		function  ajaxPage(type) {
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "getInvitations.do?",
				data : "type="+type, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法		
					//首先移除ul下所有的li标记
					 $("#listitemPage"+type+" li").not(":first").remove(); 
					 $("#listitemPage"+type).append(data);
				
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		
		//上拉分页ajax
		function  ajaxUpPage(type) {
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "getUpPageInvitations.do?",
				data : "type="+type, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法		
					//首先移除ul下所有的li标记
					 $("#listitemPage"+type).append(data);
					
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		//page1下拉上拉相应操作
		$('#page1').on('refreshInit', function(){
		    var refresh = A.Refresh('#page1');
		    //监听下拉刷新事件，可以做一些逻辑操作，当data-scroll="pullup"时无效
		    refresh.on('pulldown', function(){
		    	ajaxPage("1");
		        refresh.refresh();//当scroll区域有dom结构变化需刷新
		    });
		    //监听上拉刷新事件，可以做一些逻辑操作，当data-scroll="pulldown"时无效
		    refresh.on('pullup', function(){
		    	ajaxUpPage("1");
		    	refresh.refresh();//当scroll区域有dom结构变化需刷新
		    });
		});
		//page2下拉上拉相应操作
		$('#page2').on('refreshInit', function(){
		    var refresh = A.Refresh('#page2');
		    //监听下拉刷新事件，可以做一些逻辑操作，当data-scroll="pullup"时无效
		    refresh.on('pulldown', function(){
		    	ajaxPage("2");
		        refresh.refresh();//当scroll区域有dom结构变化需刷新
		    });
		    //监听上拉刷新事件，可以做一些逻辑操作，当data-scroll="pulldown"时无效
		    refresh.on('pullup', function(){
		    	ajaxUpPage("2");
		    	refresh.refresh();//当scroll区域有dom结构变化需刷新
		    });
		});
		//page3下拉上拉相应操作
		$('#page3').on('refreshInit', function(){
		    var refresh = A.Refresh('#page3');
		    //监听下拉刷新事件，可以做一些逻辑操作，当data-scroll="pullup"时无效
		    refresh.on('pulldown', function(){
		    	ajaxPage("3");
		        refresh.refresh();//当scroll区域有dom结构变化需刷新
		    });
		    //监听上拉刷新事件，可以做一些逻辑操作，当data-scroll="pulldown"时无效
		    refresh.on('pullup', function(){
		    	ajaxUpPage("3");
		    	refresh.refresh();//当scroll区域有dom结构变化需刷新
		    });
		});
		
		//page每次加载相应的选项
		$('#page1').on('slidershow', ajaxPage("1"));
		$('#page2').on('slidershow', ajaxPage("2"));
		$('#page3').on('slidershow', ajaxPage("3"));
		
		
		
		//链接跳转地址
		function toPosting() {
			window.location.href = "<%=path%>/weixin/toPosting.do";
		}
		function toParticulars(id) {
			window.location.href = "<%=path%>/weixin/toParticulars.do?inId="+id+"&type=1";
		}
		function toPerson() {
			window.location.href = "<%=path%>/weixin/toPerson.do";
		}
		
	</script>

</body>
</html>


