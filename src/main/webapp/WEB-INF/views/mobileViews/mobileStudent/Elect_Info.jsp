<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>招聘信息详情</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">

						<label class="label-left" for="num">企业名称：</label> <label
							class="label-right"> <output id="user" type="text"
							value="${company.com_name}" >${company.com_name}</output>
						</label>
						<hr />
						<label class="label-left" for="qq">岗位名称：</label> <label
							class="label-right"> <output id="user" type="text"
							value="${details.post_id}" >${details.post_id}</output>
						</label>
						<hr />
						<label class="label-left" for="phone">招聘发布时间：</label> <label
							class="label-right"> <fmt:parseDate
								value="${details.create_time}" var="createTime" /> <fmt:formatDate
								value="${createTime}" pattern="yyyy-MM-dd" var="createTime" />
							<output id="user" type="text" value="${createTime}" >${createTime}</output>
						</label>

						<hr />

						<label class="label-left" for="email">招聘人数：</label> <label
							class="label-right"> <output id="email" type="email"
							value="${details.recruit_num}" >${details.recruit_num}</output>
						</label>

						<hr />
						<label class="label-left" for="homephp">招聘专业：</label> <label
							class="label-right"> <output id="user" type="text"
							value="${details.recruit_prof}" >${details.recruit_prof}</output>
						</label>
						<hr />
						<label class="label-left" for="password">开始时间：</label> <label
							class="label-right"> <fmt:parseDate
								value="${details.effect_time}" var="createTime" /> <fmt:formatDate
								value="${createTime}" pattern="yyyy-MM-dd" var="beginTime" /> <output
							id="user" type="text" value="${beginTime}" >${beginTime}</output>
						</label>
						<hr />
						<label class="label-left" for="password">截止时间：</label> <label
							class="label-right"> <fmt:parseDate
								value="${details.end_time}" var="endTime" /> <fmt:formatDate
								value="${endTime}" pattern="yyyy-MM-dd" var="endTime" /> <output
							id="user" type="text" value="${endTime}" >${endTime}</output>
						</label>
						<hr />
						<label class="label-left" for="phone">联系人</label>
						<div class="label-right">
							<output>${comContact}</output>
						</div>

						<hr />
						<label class="label-left" for="phone">联系电话</label>
						<div class="label-right">
							<output>${company.phone}</output>
						</div>
						<hr />
						<label class="label-left" for="phone">联系邮箱</label>
						<div class="label-right">
							<output>${company.email}</output>
						</div>

						<hr />
						<label class="label-left" for="homedress">招聘描述：</label> <label
							class="label-right"> <output style="height: auto">
								${details.recruit_desc} </output>
						</label>
						<hr />
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
