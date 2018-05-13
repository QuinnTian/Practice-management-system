<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.sict.service.DictionaryService"%>
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

		<section id="TaskDetails02_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>问题详情</h1>

				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">

						<label class="label-left">问题</label>
						<div style="height:auto;" class="label-right">
							<output> ${knowledge.question} </output>
						</div>
						<hr>
						<label class="label-left">提问学生</label>
						<div style="height:auto;" class="label-right">
							<output>${stuName}</output>
						</div>
						<hr>
						<label class="label-left">学生所属班级</label>
						<div style="height:auto;" class="label-right">
							<output>${stuClassName}</output>
						</div>
						<hr>
						<label class="label-left">提问时间</label>
						<div style="height:auto;" class="label-right">
							<output> ${knowledge.create_time}</output>
						</div>
						<hr>
						<label class="label-left">状态</label>
						<div style="height:auto;" class="label-right">
							<output>
								<c:if test="${knowledge.answer_time!=null}">
									<font color="green">已解答</font>
								</c:if>
							</output>
						</div>
						<hr>

					</form>
					<button class=" submit block " onclick="jump()">
						<span>修改答案</span>
					</button>
				</div>
			</article>

		</section>

	</div>
	<div id="Edit_questions" data-role="modal" class="modal bg-carrot">
		<header>
			<div class="titlebar">
				<a data-toggle="back" href="#"><i
					class="iconfont iconline-arrow-left"></i> </a>
				<h1>修改问题</h1>

			</div>
		</header>
		<article data-role="article" id="main_article" data-scroll="verticle"
			class="active" style="top:44px;bottom:0px;">
			<div class="scroller">
				<form id="updateAnswer" autocomplete="off"
					oninput="range_output.value=parseInt(range.value)"
					class="form-common" action="updateAnswer.do" method="post">

					<label class="label-left">问题</label>

					<div class="label-right">
						<output>${knowledge.question}</output>
					</div>

					<div class="listitem">
						<label class="sliver">回答问题</label>
					</div>
					<div class="card">
						<textarea rows="5" class="noborder" id="answerer" name="answerer">${knowledge.answer}</textarea>
					</div>
					<input type="hidden" name="id" value="${knowledge.id}" />
				</form>
				<div class="card noborder">
					<button id="submit" class="submit width-full">提交</button>
				</div>
			</div>
		</article>

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
		function jump() {
			A.Controller.modal('#Edit_questions');
		}
		(function() {
			$('#submit').on(A.options.clickEvent, function() {
				A.alert('提示', '提交成功！');
				var answer = document.getElementById("answerer");
				if (answer.value == "") {
					A.alert("问题答案不允许为空！");
					return null;
				}

				document.getElementById("updateAnswer").submit();
				return false;
			});
		})();
	</script>
</body>
</html>
