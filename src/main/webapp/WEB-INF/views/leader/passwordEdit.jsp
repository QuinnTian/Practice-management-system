<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="/springmvc_mybatis/css/pageStyle.css" rel="stylesheet"
	type="text/css">
	<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>修改用户信息</title>
<script>
	function update() {
		if (window.document.userLoginForm.login_pass1.value != window.document.userLoginForm.login_pass3.value) {
			alert("原密码输入错误，请重新输入");
			return false;
		}
		if (window.document.userLoginForm.login_pass.value != window.document.userLoginForm.login_pass2.value) {
			alert("两次密码输入不一致，请重新输入");
			return false;
		}
		var str = window.document.userLoginForm.login_pass.value;
		if(str.indexOf("*")!=-1){
			alert("密码中不能包含 *");
			return false;
		}
		if(str.indexOf("#")!=-1){
			alert("密码中不能包含 #");
			return false;
		}
		window.document.userLoginForm.login_pass.value = window.document.userLoginForm.login_pass2.value;
		window.document.userLoginForm.action = "doPasswordEdit.do";
		window.document.userLoginForm.submit();
		alert("密码修改成功");
	}

	function back() {
		alert("确定退出吗？");
		window.document.userLoginForm.action = "myInfo.do";
		window.document.userLoginForm.submit();
	}
</script>
</head>
<body>
	<form id="userLoginForm" name="userLoginForm" method="post"
		class="sjjx-form">
		<h1 align="left">修改密码</h1>
		<table width="350" border="0" style="font-size:20px;" cellpadding="4">
			<c:forEach var="t" items="${teaList}" varStatus="stauts">
				<tr>
					<td width="350"><input type="hidden" name="id" value="${t.id}">
					</td>
				</tr>
				<tr>
					<td width="60">用户编码： </td>
					<td width="250"><input type="text" name="tea_code"
						value="${t.tea_code}"><font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td width="350"><input type="hidden" name="login_pass3"
						id="logi
						n_pass3" value="${t.login_pass}">
					</td>
				</tr>
				<tr>
					<td width="60">原密码： </td>
					<td width="250"><input type="password" name="login_pass1"
						id="login_pass1" value=""><font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td width="60">新密码：</td>
					<td width="250"> <input type="password" name="login_pass"
						id="login_pass" value=""><font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td width="60">确认密码：</td>
					<td width="250"> <input type="password" name="login_pass2"
						id="login_pass2" value=""><font color="#FF0000">*</font>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div style="margin-top:20px;margin-left:200px">
			<input type="button" value="修  改" onclick="update()" class="sjjx-button"> 
			<input type="button" value="退 出" onclick="back()" class="sjjx-button">
		</div>
	</form>
</body>
</html>

