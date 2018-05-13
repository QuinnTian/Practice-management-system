<%@page import="com.sict.entity.User"%>
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
						<h1>我的消息</h1>
					</div>
				</header>
				<article data-role="article" id="main_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">	
						<ul id="swipe_test" class="listitem">
							<c:forEach var="re" items="${replyList}" varStatus="status">
							<li class="wrap_li" id="${re.id }" onclick="toParticulars('${re.id }')">
							<c:set var="user_id" value="${re.reply_id}" scope="request"></c:set>
							${status.index+1}
							<%
								String id=(String)request.getAttribute("user_id");
								User user=Common.getUser(id);
								out.print("您参与的主题有新的回复");
							%>
							</c:forEach>
						</ul>
					</div>
				</article>
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
		
		function toParticulars(id) {
			window.location.href = "<%=path%>/weixin/replyNotice.do?reId="+id;
		}
		
		</script>

	</body>
</html>