<%@page import="java.sql.Timestamp"%>

<%@page import="java.text.SimpleDateFormat"%>
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
<title>实践教学管理</title>
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
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>通知公告详情</h1>
				</div>

			</header>

			<article data-role="article" class="active" id="border_article"
				data-scroll="verticle" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-square">
						<label class="label-left" for="title">通知标题</label> <label
							class="label-right"> <output id="title" type="text">${notice.title}</output>
						</label> <label class="label-left" for="courtyard">通知类型</label> <label
							class="label-right"> <c:set var="n_type"
								value="${notice.notice_type}" scope="request"></c:set> <%
 	String notice_type = (String) request.getAttribute("n_type");
 	if (notice_type.equals("1")) {
 		notice_type = "院级通知";
 	} else if (notice_type.equals("2")) {
 		notice_type = "指导老师通知";
 	} else if (notice_type.equals("3")) {
 		notice_type = "信息核对通知	";
 	} else if (notice_type.equals("4")) {
 		notice_type = "已阅卷通知";
 	} else if (notice_type.equals("5")) {
 		notice_type = "智能推送招聘信息	";
 	} else if (notice_type.equals("6")) {
 		notice_type = "就业指导类型";
 	} else if (notice_type.equals("7")) {
 		notice_type = "校外学习类型";
 	} else if (notice_type.equals("8")) {
 		notice_type = "审阅审批通知";
 	}
 %> <output id="courtyard" type="text"><%=notice_type%></output>
						</label> <label class="label-left" for="date">时间</label>
						<c:set var="n_time" value="${notice.create_time}" scope="request"></c:set>
						<%
							Timestamp timeStamp = (Timestamp) request.getAttribute("n_time");
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
							String notice_time = df.format(timeStamp);
						%>
						<label class="label-right"> <output id="courtyard"
								type="text"><%=notice_time%></output>
						</label>
						<div class="listitem">
							<label class="sliver">通知内容：</label>

						</div>
						<div class="card">
							<br/><div style="height: 200px" class="noborder">${notice.content}</div>
						</div>
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>

</body>
</html>
