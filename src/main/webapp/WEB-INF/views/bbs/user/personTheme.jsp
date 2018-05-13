<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="com.sict.util.Common"%>
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
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/agile/css/flat/iconlogo.css">
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/component/exlist/exlist.css">
		<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
		
  </head>
  
  <body>
		<div id="section_container">
			<section id="list_section" data-role="section" class="active">
				<header>
					<div class="titlebar">
						<a  href="<%=path%>/weixin/toPerson.do"><i class="iconfont iconline-arrow-left"></i></a>
						<h1>我的主题</h1>
					</div>
				</header>
				<article data-role="article" id="main_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">	
						<ul id="swipe_test" class="listitem">
							<li class="sliver" id="liPage1">左滑动删除</li>	
							<c:forEach var="in" items="${inlist}">
							<li class="wrap_li" id="${in.id }" onclick="toParticulars('${in.id }')">
							<c:set var="user_id" value="${in.user_id}" scope="request"></c:set>
							<%
								String id=(String)request.getAttribute("user_id");
							%>
							<img src="<%= Common.getUserPhotoUrl(id)%>" class="img appimg" 
							style="width: 35px;height: 35px;" />
									<div class="text">
										${user.true_name} 
										<small>${in.create_time}</small>
									</div>
									<div style="margin-top: 15px">
									${in.title}
									<br />
									${in.content}
								</div>
							</c:forEach>
						</ul>
					</div>
				</article>
				<script type="text/html" id="add_template">
					<div style="padding:10px 20px;">
					<div style="text-align:center;font-size:20px;color:#3498DB;font-weight:600;margin:5px 0;">添加条目</div>
					<input type="text" name="name" class="full-width" placeholder="条目名称"><div class="rowspace"></div>
					<input type="text" name="description" class="full-width" placeholder="条目描述"><div class="rowspace"></div>
					<button class="width-full">添加</button>
					</div>
				</script>
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
		<script src="<%=path%>/AgileLite/assets/component/exlist/agile.exlist.js"></script>
		<script type="text/javascript" src="<%=path%>/AgileLite/assets/app/js/app.js"></script>

		<script type="text/javascript">
		$(function(){ 
			function deleteTheme(id){
				$.ajax({
					type : "get",
					contentType : "application/json",
					url : "deleteTheme.do?",
					data : "id="+id, //设置发送参数，即使参数为空，也需要设置                
					dataType : "text", //返回的类型为json                
					success : function(data) { //成功时执行的方法		
						list.remove();
					},
					error : function(result, status) { //出错时会执行这里的回调函数                     
						if (status == 'error') {
							alert(status);
						}
					}
				});
			}
			
		}); 	
		//删除li列表操作
		$('#main_article').on('articleload', function() {
				var wrapLiController = A.ExList.liController('.wrap_li', {
					swipeOptionOnTap : function(liElement, targetElement) {
						A.confirm('提示', '确定删除该主题吗？', function() {
							var list = $(liElement);
							var id=list[0].id;
							$.ajax({
								type : "get",
								contentType : "application/json",
								url : "deleteTheme.do?",
								data : "id="+id, //设置发送参数，即使参数为空，也需要设置                
								dataType : "text", //返回的类型为json                
								success : function(data) { //成功时执行的方法		
									list.remove();
									A.showToast('删除成功！');
								},
								error : function(result, status) { //出错时会执行这里的回调函数                     
									if (status == 'error') {
										alert(status);
									}
								}
							});
						});
					}
				});
			});
		function toParticulars(id) {
			window.location.href = "<%=path%>/weixin/toParticulars.do?inId="+id+"&type=2";
		}
		
		</script>

	</body>
</html>