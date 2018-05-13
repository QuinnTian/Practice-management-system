<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">

</head>
<body>
	<div id="section_container">
		<section id="moreApplication" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>申请信息</h1>
				</div>
			</header>
			<article data-role="article" data-scroll="verticle" class="active"
				style="top:44px;bottom:0px;">
				<c:if test="${flag==true}">
					<div class="scroller">
						<div>
							<font size="3px" color="blue"><b>正在使用 </b> </font>
						</div>
						<hr>
						<hr>
						<ul class="listitem">
							<li
								onclick=" location.href='moreApplication_details.do?practiceId=${pracavaliable.id}'"><i
								class="ricon iconfont iconline-arrow-right"></i>
								<div class="text">
									<c:set var="si" value="${pracavaliable.company_id}"
										scope="request"></c:set>

									申请公司：<%
										String company_id = (String) request.getAttribute("si");
											out.println(DictionaryService.findCompany(company_id)
													.getCom_name());
									%>
									<small>状态：${state}</small>
								</div></li>

						</ul>
					</div>

					<div class="scroller">
						<div>
							<font size="3px" color="#666666"><b>已使用</b> </font>
						</div>

						<c:forEach var="aa" items="${outOfRecord}" varStatus="stauts">

							<ul class="listitem">
								<li
									onclick=" location.href='moreApplication_details.do?practiceId=${aa.id}'"><i
									class="ricon iconfont iconline-arrow-right"></i>
									<div class="text">
										${stauts.index+1}.
										<c:set var="cc" value="${aa.company_id}" scope="request"></c:set>

										申请公司：<%
											String companyId = (String) request.getAttribute("cc");
													out.println(DictionaryService.findCompany(companyId)
															.getCom_name());
										%>
										<c:set var="dd" value="${aa.check_state}" scope="request"></c:set>
										<small>状态： <%
											String checkState = (String) request.getAttribute("dd");

													if (checkState.equals("0")) {
														out.println("待审核");
													} else if (checkState.equals("1")) {
														out.println("通过");
													} else if (checkState.equals("2")) {
														out.println("未通过");
													} else {
														out.println("暂时没有数据");
													}
										%>
										</small>
									</div></li>
							</ul>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${flag==false}">
					<div>
						<font size="3px" color="blue"><b>很抱歉，您当前没有实习记录！</b> </font>
					</div>
				</c:if>
			</article>
		</section>
	</div>




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
</body>
</html>
