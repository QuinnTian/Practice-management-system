<%@page import="com.alibaba.druid.sql.visitor.functions.Substring"%>
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
<title>教师端</title>
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
						<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
						<h1>我的审批</h1>
					</div>
					<div class="tabbar">
						<a class="tab active"id="C_Approve" data-role="tab" href="#alreadyApprove" data-toggle="article">已审批</a>
						<a class="tab" id="N_Approve"data-role="tab" href="#notApprove" data-toggle="article">未审批</a>
						<a class="tab" id="M_Through"data-role="tab" href="#notThrough" data-toggle="article">未通过</a>
					</div>
				</header>
				<article data-role="article" id="alreadyApprove" data-scroll="verticle" class="active" style="top:88px;bottom:0px;">
					
					<div class="scroller">
						<c:forEach items="${approved}" var="approved" varStatus="status">
							<ul id="swipe_test"class="listitem">
								<li onclick="location.href='applyLeavedDetails.do?id=${approved.id}&stu_id=${approved.sla_stu}'">
								<i class="ricon iconfont iconline-arrow-right" ></i>
								<div class="text" >申请人：${approved.temp1}
								<small>申请时间：${approved.temp2}—${approved.temp3}</small></div>
								</li>
							</ul>
						</c:forEach>
					</div>
				</article>

				<article data-role="article" id="notApprove" data-scroll="verticle"  style="top:88px;bottom:0px;">
					<div class="scroller">
					  <c:forEach items="${approveing}" var="approveing" varStatus="status">
						<ul class="listitem">

							<li onclick="location.href='applyLeavedetails.do?id=${approveing.id}&stu_id=${approveing.sla_stu}'">
								<i class="ricon iconfont iconline-arrow-right" ></i>
								<div class="text" >
									申请人：${approveing.temp1}
									<small>申请时间：${approveing.temp2}—${approveing.temp3}</small>
								</div>
							</li>
						</ul>
					  </c:forEach>
					</div>
				</article>
				<article data-role="article" id="notThrough" data-scroll="verticle"  style="top:88px;bottom:0px;">
					<div class="scroller">
					  <c:forEach items="${disapprove}" var="disapprove" varStatus="status">
						<ul class="listitem">

							<li onclick="location.href='applyLeavedDetails.do?id=${disapprove.id}&stu_id=${disapprove.sla_stu}'">
								<i class="ricon iconfont iconline-arrow-right" ></i>
								<div class="text" >
									申请人：${disapprove.temp1}
									<small>申请时间：${disapprove.temp2}—${disapprove.temp3}</small>
								</div>
							</li>
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
