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
<title>招聘信息列表</title>
</head>
<body>
	<div id="section_container">
		<section id="info_section" data-role="section">

			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>通知详情</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left" for="Title">标题</label>
						<div style="height:auto;" class="label-right">
							<output for="Title">
								<c:out value="${notice_info.title}">${collageDetailNoice.title}</c:out>
							</output>
						</div>
						<hr>
						<label class="label-left" for="Time">创建时间</label>
						<div style="height:auto;" class="label-right">
							<output for="Time">
								<c:out value="${notice_info.create_time}">${collageDetailNoice.create_time}</c:out>
							</output>
						</div>
						<hr>
						<label class="label-left" for="Type">内容</label>
						<div style="height:auto;" class="label-right">
							<output for="Content">
								<c:out value="${notice_info.content}">${collageDetailNoice.content}</c:out>
							</output>
						</div>
						<hr>
						<label class="label-left" for="Publisher">发布人</label>
						<div style="height:auto;" class="label-right">
							<output for="Publisher">
								<c:out value="${teacherName}">${LeaderName}</c:out>
							</output>
						</div>
						<hr>
						<label class="label-left" for="Notification_range">通知范围</label>
						<div style="height:auto;" class="label-right">
							<output for="Notification_range">
								<c:if test="${StuNameList==null}">
									${noticeRange}
								</c:if>

								<c:forEach var="stuName" items="${StuNameList}"
									varStatus="statue">
									<c:out value="${stuName}"></c:out>
								</c:forEach>

							</output>
						</div>
						<hr>
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
