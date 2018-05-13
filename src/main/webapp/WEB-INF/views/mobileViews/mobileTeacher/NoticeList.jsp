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

</head>
<body>
	<div id="section_container">
		<section id="Noticelist_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>通知公告列表</h1>
					<a href="NoticeAdd.do">发布通知</a>
					<!-- <a onclick="error()">发布通知</a> -->
				</div>
				<div class="tabbar">
					<a class="tab active" id="C_notice" data-role="tab"
						href="#College_notice" data-toggle="article">学院通知</a> <a
						class="tab" id="M_notice" data-role="tab" href="#I_notice"
						data-toggle="article">本人通知</a>
				</div>
			</header>


			<article data-role="article" id="College_notice"
				data-scroll="verticle" class="active" style="top:88px;bottom:0px;">

				<c:forEach var="collogeNotice" items="${college_NoticeList}"
					varStatus="status">

					<div class="scroller"
						onclick="location.href='detailNotice.do?id=${collogeNotice.id}'">
						<ul class="listitem">
							<li><i class="ricon iconfont iconline-arrow-right"
								onclick="toActive01()"></i>
								<div class="text">
									${collogeNotice.title}<small>
										${collogeNotice.create_time }</small>
								</div></li>

						</ul>

					</div>

				</c:forEach>

			</article>
			<article data-role="article" id="I_notice" data-scroll="verticle"
				style="top:88px;bottom:0px;">
				<c:forEach items="${result}" var="notice" varStatus="status">


					<div class="scroller"
						onclick="location.href='detailNotice.do?notice_id=${notice.id}'">
						<ul id="swipe_test" class="listitem">
							<li class="wrap_li swipe_block" style="left: 0px;"><i
								class="ricon iconfont iconline-arrow-right"
								onclick="toActive01()"> </i>
								<div class="text" onclick="toActive01()">
									<c:out value="${notice.title}"></c:out>
									<small> <c:out value="${notice.create_time}"></c:out>
									</small>

								</div></li>
						</ul>
					</div>

				</c:forEach>
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
	<script type="text/javascript">
		function error() {
			A.alert("此功能正在建设中，请使用电脑端进行操作。")
		}
	</script>
</body>
</html>
