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
<!--- third --->
<script
	src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
<script
	src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
<script
	src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
<!-- agile -->
<%-- <script type="text/javascript"
	src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script> --%>
<script type="text/javascript"
	src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
<!-- app -->
<script type="text/javascript"
	src="<%=path%>/AgileLite/assets/app/js/app.js"></script>

<script type="text/javascript">
	var check_state = false;
	var check_new_old_state = false;
	var check_new_new2_state = false;

	function check_login_pass() {
		$.ajax({
			type : "get",
			url : "ajax_check_login_pass.do?",
			data : getloginpass_old(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法	
				check_state = data.state;
				if (check_state.toString() == "false") {
					show_check_state("原密码错误，请重新输入");
				} else if (check_state.toString() == "true") {
					show_check_state("原密码验证完毕");
				}
			}
		});
	}
	function getloginpass_old() {
		var login_pass_old = $("#login_pass_old").val();
		var dataSend = "login_pass_old=" + login_pass_old;
		return dataSend;
	}
	function show_check_state(data) {
		document.getElementById('error').innerText = data;
	}

	function check_one_pass() {
		if ($("#login_pass_new").val() == $("#login_pass_old").val()) {
			check_new_old_state = false;
		} else {
			check_new_old_state = true;
		}
		if (check_new_old_state.toString() == "false") {
			show_check_state("新密码与原密码相同，请重新输入");
		} else if (check_new_old_state.toString() == "true") {
			show_check_state("新密码验证完毕");
		}

	}
	function check_two_pass() {
		if ($("#login_pass_new_two").val() != $("#login_pass_new").val()) {
			check_new_new2_state = false;
		} else {
			check_new_new2_state = true;
		}
		if (check_new_new2_state.toString() == "false") {
			show_check_state("你两次输入的密码不同，请重新输入");
		} else if (check_new_new2_state.toString() == "true") {
			show_check_state("两次密码验证完毕");
		}

	}

	function up() {
		if (check_state.toString() == "true"
				&& check_new_old_state.toString() == "true"
				&& check_new_new2_state.toString() == "true") {
			A.alert("密码修改成功");
			$("#form1").attr("action", "doChangePassword.do");
			$("#form1").submit();
		} else {
			A.alert("出错啦！！");
		}
	}
</script>
<style type="text/css">
.error {
	color: Red;
	font-size: 13px;
	margin-left: 5px;
	padding-left: 16px;
}
</style>
</head>
<body>
	<div id="section_container">
		<section id="person_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a href="<%=path%>/MobileStudent/PlInformation.do"
						data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>修改密码</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:100px;bottom:0px;">
				<div class="scroller" style="text-align:center">

					<form id="form1" class="form-square" action="" method="post">
						<label class="label-left hint"></label> <label id="error"
							class="label-right error"></label> <label class="label-left">学号</label>
						<label class="label-right"> <output id="email" type="text"
								readonly="true">${stu.stu_code}</output>
						</label> <label class="label-left">原密码</label> <label class="label-right">
							<input id="login_pass_old" type="password"
							oninput="check_login_pass()" />
						</label> <label class="label-left">新密码</label> <label class="label-right">
							<input id="login_pass_new" type="password"
							oninput="check_one_pass()" />
						</label> <label class="label-left">确认密码</label> <label class="label-right">
							<input id="login_pass_new_two" name="login_pass_new_two"
							type="password" oninput="check_two_pass()" />
						</label>
						<button class="block submit" onclick="up()">
							<i class="iconfont iconline-rdo-tick"></i> <span id="save">保存</span>
						</button>

					</form>




				</div>
			</article>

		</section>

	</div>

</body>
</html>
