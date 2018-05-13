<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="../css/pageStyle.css" rel="stylesheet" type="text/css">
<title>修改密码</title>
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
		alert("密码修改成功,请重新登陆！");
	}

</script>
</head>
<body>
	<form id="userLoginForm" name="userLoginForm" method="post"
		class="sjjx-form">
		<h2>修改密码</h2>
		<table width="500" border="0" style="font-size:20px;" cellpadding="4">
			<tr>
				<td><input type="hidden" name="tea_id" value="${teacher.id}"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="login_pass3" id="login_pass3"
					value="${teacher.login_pass}"></td>
			</tr>
			<tr>
				<td width="80">教工号：</td>
				<td width="300"><input type="text" name="tea_code"
					value="${teacher.tea_code}" readonly="value"><font
					color="#FF0000">*</font></td>
			</tr>
			<tr>
				<td width="80">原密码：</td>
				<td width="300"><input type="password" name="login_pass1"
					id="login_pass1" value=""><font color="#FF0000">*</font></td>
			</tr>
			<tr>
				<td width="80">新密码：</td>
				<td width="300"><input type="password" name="login_pass"
					id="login_pass" value=""><font color="#FF0000">*</font></td>
			</tr>
			<tr>
				<td width="80">确认密码：</td>
				<td width="300"><input type="password" name="login_pass2"
					id="login_pass2" value=""><font color="#FF0000">*</font></td>
			</tr>
		</table>
		<div style="margin-top:20px;margin-left:250px">
			<input type="button" value="保存" onclick="update()"
				class="sjjx-button">
		</div>
	</form>
</body>
</html>

