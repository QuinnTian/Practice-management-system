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
		<section id="TaskDetails_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>学生详情</h1>

				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left">学号</label>
						<div style="height:auto;" class="label-right">
							<output> ${student.stu_code} </output>
						<input type="hidden" id="stu_code" value="${student.stu_code}"/>
						</div>
						<hr>
						<label class="label-left">学生姓名</label>
						<div style="height:auto;" class="label-right">
							<output> ${student.true_name} </output>
						</div>
						<hr>
						<label class="label-left">学生性别</label>
						<div style="height:auto;" class="label-right">
							<output> ${student.sex}</output>
						</div>
						<hr>
						<label class="label-left">班级</label>
						<div style="height:auto;" class="label-right">
							<output> ${org.org_name} </output>
						</div>
						<hr>
						<label class="label-left">学生QQ</label>
						<div style="height:auto;" class="label-right">
							<output>${student.qqnum} </output>
						</div>
						<hr>
						<label class="label-left">联系电话</label>
						<div style="height:auto;" class="label-right">
							<output>
								<a href="tel://${student.phone}">${student.phone}</a>
							</output>
						</div>
						<hr>
						<label class="label-left">学生邮箱</label>
						<div style="height:auto;" class="label-right">
							<output> ${student.email} </output>
						</div>
						<hr>

						<div style="margin:0 auto;width:200px;">
							<button id="reset">重置密码</button>
						</div>
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
	
	(function() {
			$('#reset').on(A.options.clickEvent, function() {
			var code=$("#stu_code").val();
				A.confirm('提示', '确定重置此学生密码？重置后密码为身份证号后六位', function() {
					A.showToast('你选择了“确定”');
						window.location.href = "resetStuPwd.do?code="+$("#stu_code").val();
				}, function() {
					A.alarmToast('你选择了“取消”');

				});
				return false;
			});

		})();
		
	</script>
</body>
</html>
