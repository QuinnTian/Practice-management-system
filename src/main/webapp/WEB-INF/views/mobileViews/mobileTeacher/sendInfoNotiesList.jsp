
<%@page import="com.sict.service.DictionaryService"%>
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
	href="<%=path%>/AgileLite/assets/agile/css/ratchet/css/ratchet.min.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
<!--- third --->
<script src="<%=path%>/AgileLite/assets/third/zepto/zepto.min.js"></script>
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
	$(function() {
		$("textarea").click(function(e) {
			if (this == e.target) {
				$(this).hide();
			}
			return false;
		}).click();
	});
	function xianshi(input_id) {
		$("#" + input_id).toggle(300);
	}
</script>
</head>
<body>

	<div id="section_container">
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>该招聘发布的通知</h1>
				</div>
			</header>
			<article data-role="article" id="article" data-scroll="verticle"
				class="active" style="top:44px;bottom:50px;">
				<div class="card">
					<ul class="table-view">
						<c:forEach var="n" items="${noticeList}" varStatus="stauts">
							<input type="hidden" id="id" name="id" value="${n.id}">
							<li class="table-view-cell media"><a class="navigate-right"
								onclick="xianshi('${n.id}')">${n.title}
									<p>
										<c:set var="sts" value="${n.stu_id}" scope="request"></c:set>
										<%
											String stuIds = (String) request.getAttribute("sts");
												String[] stu_ids = stuIds.split(",");
												int showCount = 5;
												if (stu_ids.length <= 5) {
													showCount = stu_ids.length;
													for (int i = 0; i < showCount; i++) {
														if (DictionaryService.findStudent(stu_ids[i]) != null) {
															out.print(DictionaryService.findStudent(stu_ids[i])
																	.getTrue_name() + " ");
														}
													}
												} else {
													String students = "";
													for (int i = 0; i < showCount; i++) {
														if (DictionaryService.findStudent(stu_ids[i]) == null) {
															out.print(" ");
														} else {
															students = students
																	+ DictionaryService.findStudent(stu_ids[i])
																			.getTrue_name() + " ";
														}

													}
													out.print(students + ".....");
												}
										%>
									</p>
							</a></li>
							<div class="card">
								<textarea id="${n.id}" rows="8" class="noborder">${n.content}</textarea>
							</div>
						</c:forEach>
					</ul>
					<div class="card noborder">
						<button class="submit width-full"
							onClick="window.location='RecruitmentInformationList.do'">返回招聘信息列表</button>
					</div>

				</div>
			</article>
		</section>
	</div>

</body>
</html>