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
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>个人资料</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common" id="form1" action="doEidtInfo.do" method="post">
						<label class="label-left" for="num">学号：</label> <label
							class="label-right"> <output id="stu_code"
								name="stu_code" type="text">${stu.stu_code}</output>
						</label>
						<hr />

						<label class="label-left" for="num">姓名：</label> <label
							class="label-right"> <output id="true_name"
								name="true_name" type="text">${stu.true_name}</output>
						</label>
						<hr />

						<label class="label-left" for="qq">QQ号：</label> <label
							class="label-right"> <input id="qqnum" name="qqnum"
							type="text" value="${stu.qqnum}" />
						</label>
						<hr />
						<label class="label-left" for="phone">手机号：</label> <label
							class="label-right"> <input id="phone" name="phone"
							type="text" value="${stu.phone}" />
						</label>

						<hr />

						<label class="label-left" for="email">Email：</label> <label
							class="label-right"> <input id="email" name="email"
							type="email" value="${stu.email}" />
						</label>
						<hr />


						<label class="label-left" for="homedress">家庭住址：</label> <label
							class="label-right"> <input id="home_addr" name="home_addr"
							type="text" value="${stu.home_addr}" />
						</label>
						<hr />
						<label class="label-left" for="homephp">家庭电话：</label> <label
							class="label-right"> <input id="home_phone" name="home_phone"
							type="text" value="${stu.home_phone }" />
						</label>
						<hr />


						</ul>
						<button class="block submit">
							<i class="iconfont iconline-rdo-tick"></i> <span id="save">保存</span>
							</button>
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
		(function(){$('#save').on(A.options.clickEvent, function() {
		var email = $("#email").val();
	 	var qqnum = $("#qqnum").val();
	 	var phone = $("#phone").val();
	 	var home_phone = $("#home_phone").val();
		var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		var b = reg.test(email);
		 var phoneLength = phone.length;
		 if(b==false){
		 	alert("E-mail格式错误");
		 	return;
		 }
		 if(isNaN(qqnum)==true){
	 		alert("QQ号只能为数字");
	 		return;
	 	 }
	 	 if(phoneLength != 11){
		 	alert("手机号码应为11位");
		 	return;
	 	}
		  if(isNaN(phone)==true){
	 		alert("手机号只能为数字");
	 		return;
	 	 }
		  if(isNaN(home_phone)==true){
	 		alert("家庭电话只能为数字");
	 		return;
	 	 }
	
			
			alert("提交成功");
			$("#form1").submit();
		});})();
	</script>
</body>

</html>
