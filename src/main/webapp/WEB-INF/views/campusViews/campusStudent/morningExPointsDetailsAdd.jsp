<%@page import="com.sict.service.DictionaryService"%>
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
<title>学生端</title>
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
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">

</head>
<body>
	<div id="section_container">
			<section id="points_section" data-role="section" >
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
					<h1>个人扣分详情</h1>
				</div>
			</header>
			<article data-role="article" id="modal_article" data-scroll="verticle" class="active" style="top:44px;bottom:55px;">
				<div class="scroller">
				<output>
					<c:set var="m" value="${member}" scope="request"></c:set>
					<small>扣分对象:<% String mid=(String)request.getAttribute("m");
					                 out.println(DictionaryService.findStudent(mid).getTrue_name()); %></small>
					</output>
					<form class="form-group" action="morningExPointsDetailsSave.do" name="form"  id="form" method="post">
					<input type="hidden" id="meb" name="meb" value="${member}">
					<input type="hidden" id="a" name="a" value="">
					<c:forEach var="x"  items="${index_name}">
							<div class="card" id="1">
							<ul class="listitem">
							<li class="nopadding"><a href='#' data-role="checkbox">
							<input type="checkbox" name="ckb" class="ckb2" value="${x.id}" >${x.index_name}</a></li>
							</ul></div>	
						</c:forEach>
						<div class="card ">
								<input id="etc" name="etc" type="text" placeholder="其他原因" class="noborder" >
							</div>
					</form>
					
				</div>
				<div class="iScrollVerticalScrollbar iScrollLoneScrollbar" style="overflow: hidden; pointer-events: none; transform: translateZ(0px); transition: 500ms; -webkit-transition: 500ms; opacity: 0;">
				<div class="iScrollIndicator" style="transition: 0ms cubic-bezier(0.1, 0.57, 0.1, 1); -webkit-transition: 0ms cubic-bezier(0.1, 0.57, 0.1, 1); display: block; height: 9px; transform: translate(0px, 0px) translateZ(0px);">
				</div>
		</div>
			</article>
		</section>
		<footer id="edit_footer" style="bottom: 0px;">
					<nav class="menubar">
						<a class="menu active"  id="sure">
							<span class="menu-icon iconfont iconline-rdo-tick"></span>
						    <span class="menu-text">确定</span>
						</a>
						<a class="menu active" id="pass">
							<span class="menu-icon iconfont iconline-rdo-cancel"></span>
						    <span class="menu-text">取消</span>
						</a>
					</nav>
				</footer>
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
		$('#sure').on(A.options.clickEvent, function() {
			var a=[];
			$.each($(".ckb2:checked"),function(i,n){
			    a[i]=n.value;
			    $('#a').attr("value",a);
			});
			$('#form').submit();
		});
	</script>
</body>
</html>
		