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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<script>
	$('#page1').bind('pageinit', function(event) {
		var s = $("input:radio[name='check_result']").val();
		if (s == '2') {
			$('input').validate({
				rules : {
					note : {
						required : true
					}
				}
			});
		}
	});
</script>

</script>

</head>
<body>
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>信息核对</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common" action="saveInfoCheck.do">
						<c:forEach var="checkTask" items="${checkInfo_taskList}"
							varStatus="stauts">
							<label class="label-left" for="user">学号：</label>
							<label class="label-right"> <output id="user"
									name="stu_id" type="text" value="${stu_code}">${stu_code}</output>
							</label>
							<hr />

							<label class="label-left" for="text">实践任务 ：</label>
							<label class="label-right"> <output id="text"
									name="infoid" type="text" value="${checkTask.task_name}">${checkTask.task_name}</output>
							</label>
							<hr />
							<label class="label-left" for="text">任务描述：</label>

							<label class="label-right">
								<div id="text" name="infoid" type="text"
									value="${checkTask.task_desc}">${checkTask.task_desc}</div>
							</label>

							<hr />

							<label class="label-left" for="text">核对结果：</label>
							<label class="label-right" name="check_result1" action="quzhi()">
								<a href="#" data-role="radio"> <input type="radio"
									name="check_result" id="true" style="left:0;right:auto;" /> <label
									for="female" class="black">正确</label>
							</a> <a href="#" data-role="radio"> <input type="radio"
									name="check_result" id="false" style="left:0;right:auto;" /> <label
									for="female" class="black">不完全正确</label>
							</a>
							</label>

							<hr />

							<label class="label-left" for="user">备注：</label>
							<label class="label-right"> <textarea rows="5" name="note" id="note"
								type="text" value="${s.note}" ></textarea>
							</label>
						</c:forEach>
						</ul>
						<button type="submit" class="block submit">
							<i class="iconfont iconline-rdo-tick" onclick="submit()"></i> <span>提交</span>
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