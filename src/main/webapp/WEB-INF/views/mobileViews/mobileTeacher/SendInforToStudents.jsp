
<%@page import="com.sict.service.DictionaryService"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">



</head>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="height = device-height,
	width = device-width,
	initial-scale = 1,
	minimum-scale = 0.1,
	maximum-scale = 3,
	user-scalable = yes,
	target-densitydpi = device-dpi
	" />
<title>选择没有实习的学生</title>


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
	$(function() {
		$("li:has(ul)").click(function(e) {
			if (this == e.target) {
				$(this).children("ul").hide();
			}
			return false;
		}).click();
		$("li:not(:has(ul))").find("input:radio").remove();
	});
	function state(PracticeTask_ul_id) {
		$("#" + PracticeTask_ul_id).show(300);
		$("#" + PracticeTask_ul_id).find("input:checkbox").prop("checked",
				"true");
	}
	function getstudents() {

		var student = $("input[id^=PracticeTask]:checkbox:checked").map(
				function(index, elem) {
					return $(elem).val();
				}).get().join(",");
		$("#notice_range").attr("value", student);
		if ($("#notice_range").val() == "") {
			A.alert("通知学生不能为空");
			return null;
		}
		document.forms[0].submit();
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
					<h1>请选择要推送消息的范围</h1>
				</div>
			</header>
			<article data-role="article" id="group_article" class="active"
				data-scroll="verticle" style="top:88px;bottom:0px;">
				<div class="scroller">
					<form class="form-group" method="post" action="doAddRecruInfo.do">

						<div class="card">
							<ol class='table-view'>
								<%=request.getAttribute("badyhtml")%>
							</ol>

							<c:set var="com_id" value="${ri.com_id}" scope="request"></c:set>
							<c:set var="post_id" value="${ri.post_id}" scope="request"></c:set>
							<%
								String com_id = (String) request.getAttribute("com_id");
								String post_id = (String) request.getAttribute("post_id");
							%>

							<input id="notice_range" type="hidden" name="notice_range" />
							<textarea type="hidden" name="content" id="content" rows="10"
								cols="50" style="display:none" style="overflow-y:scroll">[开始时间:]<%
								out.println();
							%><fmt:parseDate value="${ri.effect_time}" var="effect_time" /><fmt:formatDate
									value="${effect_time}" pattern="yyyy-MM-dd" />
									<%
										out.println();
									%>[结束时间:]<%
										out.println();
									%><fmt:parseDate value="${ri.end_time}" var="end_time" /><fmt:formatDate
									value="${end_time}" pattern="yyyy-MM-dd" />
									<%
										out.println();
									%>[公司名称:]<%
										out.println();
									%><%=DictionaryService.findCompany(com_id).getCom_name()%>
									<%
										out.println();
									%>[岗位名称:]<%
										out.println();
									%>${ri.post_id}<%
										out.println();
									%>[招聘描述:]<%
										out.println();
									%>${ri.recruit_desc}<%
										out.println();
									%>[招聘专业:]<%
										out.println();
									%>${ri.recruit_prof}<%
										out.println();
									%>[招聘人数:]<%
										out.println();
									%>${ri.recruit_num}</textarea>

						</div>

					</form>

					<div class="card noborder">
						<button class="submit width-full" onclick="getstudents()">提交</button>
					</div>
				</div>
			</article>

		</section>
	</div>


</body>
</html>