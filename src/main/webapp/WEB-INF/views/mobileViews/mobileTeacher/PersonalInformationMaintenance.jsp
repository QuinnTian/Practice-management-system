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
<script type="text/javascript">
	function update() {
		var phone = $("#phone").val();
		var email = $("#email").val();
		var qqnum = $("#qqnum").val();
		if (phone == "") {
			A.alert("请填写手机号！");
			return;
		}
		if (isNaN(phone)) {
			A.alert("手机号必须是数字！");
			return;
		}
		if (email == "") {
			A.alert("请填写email！");
			return;
		}
		if (qqnum == "") {
			A.alert("请填写qq号！");
			return;
		}
		if (isNaN(qqnum)) {
			A.alert("qq号必须是数字！");
			return;
		}
		if (email != '') {//判断
			var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
			if (!reg.test(email)) {
				A.alert('邮箱格式不正确，请重新填写!');
				return;
			}
		}
		window.document.userLoginForm.action = "doeditmyInfo.do";
		window.document.userLoginForm.submit();

	}
</script>
</head>
<body>

	<div id="section_container">
		<section id="person_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>个人信息维护</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form class="form-square" id="userLoginForm" name="userLoginForm"
						method="post">

						<label class="label-left" for="email">姓名</label> <label
							class="label-right"> <output id="true_name" type="text"
								name="true_name" value="${teacher.true_name}">${teacher.true_name}</output>
						</label> <label class="label-left">电话</label> <label class="label-right">
							<input id="phone" type="text" name="phone"
							value="${teacher.phone}" />
						</label> <label class="label-left">qq</label> <label class="label-right">
							<input id="qqnum" type="text" name="qqnum"
							value="${teacher.qqnum}" />
						</label> <label class="label-left">email</label> <label
							class="label-right"> <input id="email" type="text"
							name="email" value="${teacher.email}" />
						</label> <label class="label-left">云空间地址</label> <label
							class="label-right"> <input id="homepage" type="text"
							name="homepage" value="${teacher.homepage}" />
						</label> <label class="label-left">职务</label> <label class="label-right">
							<output id="duties" type="text" name="duties"
								value="${teacher.duties}">${teacher.duties}</output>
						</label> <label class="label-left">专长</label> <label class="label-right">
							<input id="expertise" type="text" name="expertise"
							value="${teacher.expertise}" />
						</label>

					</form>

					<button class="submit block" onclick="update()">保存</button>
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

</body>
</html>
