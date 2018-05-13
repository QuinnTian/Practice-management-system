<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
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
		<section id="info_section" data-role="section">

			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>任务详情</h1>
					<a id="detail_modal_edit" href="#StudentCheck_section"
						data-toggle="section"> 核对情况</a>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-group" action="doEditCheckInfo.do" method="post">
						<fmt:parseDate value="${ic.begin_time}}" var="begin_time" />
						<fmt:formatDate value="${begin_time}" pattern="yyyy-MM-dd"
							var="pbegin_time" />
						<div class="card">
							<label class="sliver">开始时间</label> <input type="text"
								class="noborder" style="width=100%" value="${pbegin_time}"
								name="begin_time" id="begin_time"> </input>
						</div>
						<fmt:parseDate value="${ic.end_time}" var="end_time" />
						<fmt:formatDate value="${end_time}" pattern="yyyy-MM-dd"
							var="pend_time" />
						<div class="card">
							<label class="sliver">结束时间</label> <input type="text"
								class="noborder" value="${pend_time}" name="end_time"
								id="end_time"> </input>

						</div>


						<div class="listitem">
							<label class="sliver"> 任务标题：</label>
						</div>
						<div class="card">
							<input id="Task_title" class="noborder" style="width:100%"
								type="text" value="${ic.task_name}" name="task_name"
								id="task_name"> </input>
						</div>
						<div class="listitem">
							<label class="sliver">任务描述：</label>
						</div>
						<div class="card">
							<textarea rows="5" class="noborder" name="task_desc"
								id="task_desc">${ic.task_desc}</textarea>
						</div>
						<input type="hidden" name="id" value="${ic.id}">

					</form>

				</div>
			</article>
			<footer id="edit_footer" style="bottom: 0px;">
				<nav class="menubar">
					<a class="menu active" id="edit_mark"> <span
						class="menu-icon iconfont iconline-write"></span> <span
						class="menu-text">修改任务</span>
					</a> <a class="menu active" id="delete_mark"> <span
						class="menu-icon iconfont iconline-trash"></span> <span
						class="menu-text">删除任务</span>
					</a>
				</nav>
			</footer>
		</section>

		<section id="StudentCheck_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>学生核对情况</h1>
			</header>
			<article data-role="article" id="Check" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left">姓名</label>
						<div style="height:auto;" class="label-right">
							<output style="width: 30%">审核状态</output>
							<output style="position:absolute;right:0px; width: 30%">审核日期</output>
						</div>
						<hr>
						<c:forEach var="info" items="${result}" varStatus="status">
							<label class="label-left"><c:set var="sc"
									value="${info.stu_id}" scope="request"></c:set> <%
 	String stu_ids = (String) request.getAttribute("sc");
 %> <%
 	out.println(DictionaryService.findStudent(stu_ids)
 				.getTrue_name());
 %></label>
							<div style="height:auto;" class="label-right">
								<output style="width: 30%"> ${info.check_result} </output>
								<output style="position:absolute;right:0px; width: 30%">

									<c:if test="${empty info.check_time}">
										暂无
									</c:if>
									<c:if test="${!	empty info.check_time}">
										<fmt:parseDate value="${info.check_time}" var="check_time" />
										<fmt:formatDate value="${check_time}" pattern="yyyy/MM/dd" />
									</c:if>
								</output>
							</div>
							<hr>
						</c:forEach>

					</form>
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
	<script type="text/javascript">
		function toActive01() {
			A.Controller.section('#info_section');
		}

		$(function() {

			$("#edit_mark").on(A.options.clickEvent, function() {
				var begin_time = $("#begin_time");
				var end_time = $("#end_time");
				var task_desc = $("#content");
				var task_name = $("#task_name");
				if (begin_time.value == "") {
					A.alert("请选择开始时间");
					begin_time.focus();
					return;
				}
				if (end_time.value == "") {
					A.alert("请输入结束时间");
					end_time.focus();
					return;
				}
				if (end_time.value < begin_time.value) {
					A.alert("结束时间不能够早于开始时间，请重新选择!");
					end_time.focus();
					return;
				}
				if (task_desc.value == "") {
					A.alert("请输入任务描述");
					task_desc.focus();
					return;
				}
				if (task_name.value == "") {
					A.alert("任务名称不能为空");
					teacher.focus();
					return;
				}

				document.forms[0].submit();

				return false;
			});
			$("#delete_mark").on(A.options.clickEvent, function() {

				A.confirm('提示', '您确定要删除吗', function() {
					//A.showToast('你选择了“确定”');
					window.location.href = "deleteCheckInfo.do?id=${ic.id}";
				}, function() {
					A.alarmToast('你选择了“取消”');
				});
				return false;
			});

		});
	</script>
</body>

</html>
