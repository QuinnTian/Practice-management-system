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
		<section id="slider_section" data-role="section" class="active"
			data-aside-left="#left_reveal_aside">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i>
					</a>
					<h1>我的申请</h1>
					<a id="detail_modal_edit" href="ApplyForLeave.do"
						data-toggle="html"><i class="iconfont iconline-mark-plus"></i>
					</a>

				</div>


				<div id="tabbarOuter" data-scroll="horizontal">
					<div class="scroller" style="width:100%;">
						<div class="tabbar" style="width:100%;">
							<a class="tab active" data-role="tab" href="#page1"
								data-toggle="page">已审核</a> <a class="tab" data-role="tab"
								href="#page2" data-toggle="page">未审核</a>
						</div>
					</div>
				</div>
			</header>
			<article data-role="article" id="main_article" class="active"
				style="top:88px;overflow: hidden;">
				<div id="sliderPage" data-role="slider" class="full">
					<div class="scroller">
						<div id="page1" class="slide action" data-role="page">
							<div class="scroller">
								<ul class="listitem">
									<li class="sliver">审核成功的请假申请</li>
									<c:forEach var="pa" items="${passApplicationList}"
										varStatus="status">
										<li>
											<div class="text" onclick="location.href='ApplyForLeavee.do?id=${pa.id}'">
												<!-- !!!!! -->
												申请内容：${pa.sla_reason_desc} <small>类型：${pa.sla_type} <br />
													${pa.sla_time}</small>
												<!--  -->
											</div> <small class="rcaption"> 状态：${pa.sla_approval_state} </small></li>
									</c:forEach>

									<li class="sliver">审核失败的请假申请</li>

	
									<c:if test="${empty failApplicationList}">
										<div>
											您暂时还没有审批失败记录
										</div>
									</c:if>
									<c:forEach var="fa" items="${failApplicationList}"
										varStatus="status">

										<li>
											<div class="text" onclick="location.href='ApplyForLeavee.do?id=${fa.id}'">
												<!-- !!!!! -->
												申请内容：${fa.sla_reason_desc} <small>类型：${fa.sla_type} <br />
													${pa.sla_time}</small>
												<!--  -->
											</div> <small class="rcaption"> 状态：${fa.sla_approval_state} </small></li>
									</c:forEach>
								</ul>

							</div>
						</div>
						<div id="page2" class="slide" data-role="page"
							data-scroll="verticle">
							<div class="scroller">
								<ul class="listitem">
									<li class="sliver">未审核的实习申请</li>
									<!-- !!!!! -->
								
									<c:forEach var="na" items="${noApplicationList}"
										varStatus="status">

										<li>
											<div class="text" onclick="location.href='ApplyForLeavee.do?id=${na.id}'">
												<!-- !!!!! -->
												申请内容：${na.sla_reason_desc} <small>类型：${na.sla_type} <br />
													${na.sla_time}</small>
												<!--  -->
											</div> <small class="rcaption"> 状态：${na.sla_approval_state} </small></li>
									</c:forEach>
									
								</ul>
							</div>
						</div>

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
<script>
			$('#slider_section').on('sectionshow', function() {
				A.Component.scroll('#tabbarOuter');
			});
			$('#main_article').on('articleload', function() {
				A.Slider('#sliderPage', {
					dots : 'hide'
				});
			});
</script>
</body>

</html>
