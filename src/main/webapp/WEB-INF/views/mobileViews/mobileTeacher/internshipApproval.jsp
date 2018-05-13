<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sict.service.DictionaryService"%>
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
<style>
[data-role="slider"] img {
	display: block;
}
</style>

<script type="text/javascript">
	/* $(document).ready(function(){ 
	 alert("ddd33");
	 $("#listitem1").find("li").remove(); 
	 });  */
</script>
</head>
<body>
	<div id="section_container">
		<section id="slider_section" data-role="section" class="active"
			data-aside-left="#left_reveal_aside">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>实习审批</h1>
				</div>
				<div id="tabbarOuter" data-scroll="horizontal">
					<div class="scroller" style="width:100%;">
						<div class="tabbar" style="width:100%;">
							<a class="tab active" data-role="tab" href="#page1"
								data-toggle="page">未审批</a> <a class="tab" data-role="tab"
								href="#page2" data-toggle="page">已通过</a> <a class="tab"
								data-role="tab" href="#page3" data-toggle="page">未通过</a>
						</div>

					</div>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:88px;overflow: hidden;">

				<div id="sliderPage" data-role="slider">
					<div class="scroller">
						<div id="page1" class="slide" data-role="page">
							<div class="scroller">
								<ul class="listitem" id="listitem1">
									<li class="sliver">未审批的实习申请</li>
									<c:forEach var="o" items="${noCheck}" varStatus="stauts">
										<li><img src="<%=path%>/assets/app/img/list/list_img.jpg"
											style="width:64px;" class="img" />
											<div class="text" href="practiceManagement.do?id=${o.id}"
												data-toggle="html">
												实习公司：
												<c:set var="ci_1" value="${o.company_id}" scope="request"></c:set>
												<%
													String company_id = (String) request.getAttribute("ci_1");
												%>
												<%
													if (DictionaryService.findCompany(company_id) == null) {
															out.println("学生没有申请公司，应该不能通过。");
														} else {
															out.println(DictionaryService.findCompany(company_id)
																	.getCom_name());
														}
												%>
												<small>实习人：<c:set var="si_1" value="${o.stu_id}"
														scope="request"></c:set> <%
 	String stu_id = (String) request.getAttribute("si_1");
 %> <%
 	out.println(DictionaryService.findStudent(stu_id)
 				.getTrue_name());
 %> <br /> 工作岗位：${o.post_id}
												</small> <small class="rcaption"> 地点：${o.com_orgion} </small>
											</div></li>
									</c:forEach>
								</ul>

							</div>
						</div>
						<div id="page2" class="slide" data-role="page"
							data-scroll="verticle">
							<div class="scroller">
								<ul class="listitem">
									<li class="sliver">已通过的实习申请</li>
									<c:forEach var="p" items="${pass}" varStatus="stauts">
										<li>
											<div class="text" href="practiceManagementYES.do?id=${p.id}"
												data-toggle="html">
												${stauts.index+1}.实习公司：
												<c:set var="ci" value="${p.company_id}" scope="request"></c:set>
												<%
													String company_id = (String) request.getAttribute("ci");
												%>
												<%
													if (DictionaryService.findCompany(company_id) == null) {
															out.println("学生没有申请公司，应该不能通过。");
														} else {
															out.println(DictionaryService.findCompany(company_id)
																	.getCom_name());
														}
												%>
												<small>实习人：<c:set var="si" value="${p.stu_id}"
														scope="request"></c:set> <%
 	String stu_id = (String) request.getAttribute("si");
 %> <%
 	out.println(DictionaryService.findStudent(stu_id)
 				.getTrue_name());
 %> <br /> 工作岗位：${p.post_id}
												</small>
											</div>
											<br> <small class="rcaption"> 地点：${p.com_orgion}
										</small>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div id="page3" class="slide" data-role="page"
							data-scroll="verticle">
							<div class="scroller">
								<ul class="listitem">
									<li class="sliver">未通过的实习申请</li>
									<c:forEach var="q" items="${noPass}" varStatus="stauts">
										<li>
											<div class="text" href="practiceManagementNO.do?id=${q.id}"
												data-toggle="html">
												${stauts.index+1}.实习公司：
												<c:set var="ci_2" value="${q.company_id}" scope="request"></c:set>
												<%
													String company_id = (String) request.getAttribute("ci_2");
												%>
												<%
													if (DictionaryService.findCompany(company_id) == null) {
															out.println("学生没有申请公司，应该不能通过。");
														} else {
															out.println(DictionaryService.findCompany(company_id)
																	.getCom_name());
														}
												%>
												<small>实习人：<c:set var="si_2" value="${q.stu_id}"
														scope="request"></c:set> <%
 	String stu_id = (String) request.getAttribute("si_2");
 %> <%
 	out.println(DictionaryService.findStudent(stu_id)
 				.getTrue_name());
 %> <br /> 工作岗位：${q.post_id}
												</small>
											</div> <small class="rcaption"> 地点：${q.com_orgion} </small>
										</li>

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
