<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="com.sict.util.Common"%>
<%@ page import="com.sict.entity.Student"%>
<%@ page import="com.sict.entity.Teacher"%>
<%@ page import="com.sict.entity.Files"%>
<%@ page import="com.sict.service.FilesService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
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
					<a href="<%=path%>/weixin/index.do">
					<i class="iconfont iconline-arrow-left"></i> </a>
					<h1>商职贴吧</h1>
				</div>
			</header>
			<article data-role="article" id="main_article"
				class="active bg-clouds" style="top:45px; bottom:46px; hidden;">
				<div id="sliderPage" data-role="slider" class="full">
					<div class="scroller">
						<div id="page1" class="slide" data-role="page"
							data-scroll="pullup">
							<div class="scroller" id="scr">
								<ul class="listitem">
								<c:set var="user_id" value="${in.user_id}" scope="request"></c:set>
											<%
												String id=(String)request.getAttribute("user_id");
											%>
									<li><img
										src="<%= Common.getUserPhotoUrl(id)%>"
										class="img appimg" style="width: 45px;height: 45px; " />
										<div class="text">
											
											<c:if test="${type=='stu'}">
												<%
													Student stu=DictionaryService.findStudent(id);
													out.print(stu.getTrue_name()
													+"("
													+	DictionaryService.findOrg(stu.getClass_id()).getOrg_name()
													+")"																	
													);		
															
												%>
											</c:if>
											<c:if test="${type=='tea'}">
												<%
													Teacher tea=DictionaryService.findTeacher(id);
													out.print(DictionaryService.findTeacher(id).getTrue_name()
													+"("
													+	DictionaryService.findOrg(tea.getDept_id()).getOrg_name()
													+")"																	
													);			
												%>
											</c:if>
											<small>${in.create_time}</small>
										</div>
										<div style="margin-top: 15px">
											<b>${in.title}</b> <br /> <br /> 
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${in.content}
										</div>
										<c:forEach var="file" items="${files}">
										<c:if test="${file.position!=null}">
										<div style="margin-top: 10px;">
											<img src="<%=path%>/uploadedfiles/${file.position }" style="width: 100%; height: 250px;" />
										</div>
										</c:if>
										</c:forEach>
										<%--<div style="margin-top: 10px;">
											<img src="<%=path%>/AgileLite/assets/app/img/aside/photo.jpg" style="width: 100%; height: 250px;" />
										</div>
									--%></li>
								</ul>
								<div>
									<ul id="list" class="listitem bg-clouds"
										style="margin-left: 10px;">

										<c:forEach var="in" items="${sonInList}">
										<c:set var="son_id" value="${in.user_id}" scope="request"></c:set>
											<%
												String son_id=(String)request.getAttribute("son_id");
											%>
											<li><img src="<%= Common.getUserPhotoUrl(son_id)%>"
												class="img appimg" style="width: 35px;height: 35px;" />
												<div class="text">
													${in.useName} <small>${in.create_time}</small>
												</div>
												<div style="margin-top: 15px">${in.content}</div></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
			<footer>
				<div align="center" class="menubar "
					style="width: 100%; background-color: #F2F2F2">
					<input id="content" name="content" type="text"
						style="width:80%; margin-bottom: 5px" placeholder="我也说一句..." /> <input
						type="hidden" name="inId" id="inId" value='${in.id }'>
					<button onclick="postParticulars()"
						style="margin-top: 5px; margin-left: 5px ; line-height: 20px;height:30px;">
						发表</button>
				</div>
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
	<script>
		$('#main_article').on('articleload', function() {
			A.Slider('#sliderPage', {
				dots : 'hide'
			});
		});
		$('#page1').on('slidershow', function() {

		});

		function postParticulars() {
			var content = $("#content").val();
			if (content == "") {
				A.showToast('内容不能为空！');
				return;
			} else {
				$.ajax({
					type : "get",
					contentType : "application/json",
					url : "postParticulars.do?",
					data : getData(), //设置发送参数，即使参数为空，也需要设置                
					dataType : "text", //返回的类型为json                
					success : function(data) { //成功时执行的方法	
						var scroll = A.Scroll("#scr");//已经初始化后不会重新初始化，但是可以得到滚动对象
						$("#list").append(data);
						$("#content").val("");
						A.showToast('回复成功！');
						scroll.refresh();
					},
					error : function(result, status) { //出错时会执行这里的回调函数                     
						if (status == 'error') {
							A.alert("提示", "回复失败！");
						}
					}
				});
			}

		}
		function getData() {
			var content = $("#content").val();
			var inId = $("#inId").val();
			var data = "content=" + content + "&&inId=" + inId;
			return data;

		}
		
	</script>

</body>
</html>
