<%@page import="com.sict.service.DictionaryService"%>
<%@page import="com.sict.entity.RecruitInfo"%>
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
		<section id="RecruitmentInformationList_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>招聘信息列表</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" class="active"
				data-scroll="verticle" style="top:44px;bottom:0px;">
				<div class="scroller">
					<c:set var="com_id" value="${recruitInfo.com_id}" scope="request"></c:set>
					<%
						String com_id = (String) request.getAttribute("com_id");
					%>
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left" for="company">企业名称</label>
						<div style="height:auto;" class="label-right">
							<output for="company">
								<%=DictionaryService.findCompany(com_id).getCom_name()%>
							</output>
						</div>
						<hr />
						<label class="label-left" for="effective ">生效时间</label>
						<div style="height:auto;" class="label-right">
							<output for="effective">
								<fmt:parseDate value="${recruitInfo.effect_time}"
									var="effect_time" />
								<fmt:formatDate value="${effect_time}" pattern="yyyy/MM/dd" />
							</output>
						</div>
						<hr />
						<label class="label-left" for="Expiration ">失效时间</label>
						<div style="height:auto;" class="label-right">
							<output for="Expiration">
								<fmt:parseDate value="${recruitInfo.end_time}" var="end_time" />
								<fmt:formatDate value="${end_time}" pattern="yyyy/MM/dd" />
							</output>
						</div>
						<hr />
						<label class="label-left" for="Job ">岗位名称</label>
						<div style="height:auto;" class="label-right">
							<output for="Job"> ${recruitInfo.post_id}</output>
						</div>
						<hr />
						<label class="label-left" for="Professional">招聘专业</label>
						<div style="height:auto;" class="label-right">
							<output for="Professional">${recruitInfo.recruit_prof}</output>
						</div>
						<hr />
						<label class="label-left" for="Description">招聘描述</label>
						<div style="height:auto;" class="label-right">
							<output for="Description">${recruitInfo.recruit_desc}</output>
						</div>
						<hr />
						<label class="label-left" for="number">招聘人数</label>
						<div class="label-right" id="number" href="#">
							<output id="number" href="#" value="${recruitInfo.recruit_num}">${recruitInfo.recruit_num}</output>
						</div>
						<hr />
					</form>
					<div class="card noborder">
						<button class="submit width-full" id="btn_confirm"
							onclick="window.location.href='SendInforToStudents.do?id=${recruitInfo.id}';">推送信息</button>
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
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
</body>
</html>
