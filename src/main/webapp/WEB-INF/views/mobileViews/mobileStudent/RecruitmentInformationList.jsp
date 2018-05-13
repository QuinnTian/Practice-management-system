<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
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
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>招聘信息列表</h1>
				</div>
			</header>
			<article data-role="article" id="College_notice"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<c:forEach var="recruitInfo" items="${recruitInfoList}"
						varStatus="status">
						<ul class="listitem"
							onclick="location.href='recrDetailInfo.do?id=${recruitInfo.id}'">
							<li><i class="ricon iconfont iconline-arrow-right"></i> <c:set
									scope="request" var="ri" value="${recruitInfo.com_id}"></c:set>
								<div class="text">
									<%
										String comId = (String) request.getAttribute("ri");
											String comName = DictionaryService.findCompany(comId)
													.getCom_name();
											request.setAttribute("comName", comName);
									%>
									<c:out value="${comName }"></c:out>
									<small> 时间 <fmt:parseDate
											value="${recruitInfo.create_time}" var="createTime" /> <fmt:formatDate
											value="${createTime}" pattern="yyyy-MM-dd" /> - <fmt:parseDate
											value="${recruitInfo.end_time}" var="endTime" /> <fmt:formatDate
											value="${endTime}" pattern="yyyy-MM-dd" />
									</small>
								</div></li>

						</ul>
					</c:forEach>
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
