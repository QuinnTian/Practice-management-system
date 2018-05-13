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
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">

</head>
<body>
	<div id="section_container">
			<section id="points_section" data-role="section" >
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
					<h1>扣分详情</h1>
				</div>
			</header>
			<article data-role="article" id="modal_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form  class="form-common">
						<c:forEach var="d" items="${dais}">
						    <label class="label-left">扣分原因</label>
							    <div class="label-right">
							    	<output >${d.temp2}</output>
							    </div>
						    <label class="label-left" for="email">扣分对象</label>
								<div class="label-right"style="height: auto;">
							    	<output id="h">${d.temp1}</output>
							    </div>
							 <label class="label-left" for="email">扣分分数</label>
								<div class="label-right"style="height: auto;">
							    	<output id="h">${d.temp3}</output>
							    </div>
							<%--<label class="label-left" >人数</label>
								<div class="label-right">
							    	<output >${d.occur_num}</output>
							    </div> --%>
							     <hr/>
						 </c:forEach> 
						    <hr/>
					</form>
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
</body>
</html>
