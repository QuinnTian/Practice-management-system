<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href="/springmvc_mybatis/css/pageStyle.css" rel="stylesheet" type="text/css">
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>修改用户信息</title>
<script>
	function update() {
	
	var login_pass1 = $("#login_pass1").val();//原密码
	var login_pass = $("#login_pass").val();//新密码
	var login_pass2 = $("#login_pass2").val();//确认密码
		if (login_pass1 == "") {
			alert("原密码不能为空！");
			 $("#login_pass1").focus();  //获取焦点
			return;
		} 
		if (login_pass == "") {
			alert("新密码不能为空！");
			 $("#login_pass").focus();  //获取焦点
			return;
		} 
		if (login_pass2 == "") {
			alert("确认密码不能为空！");
			 $("#login_pass2").focus();  //获取焦点
			return;
		} 
	
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
	<form id="userLoginForm" name="userLoginForm" method="post" class="sjjx-form">
	<h2 >修改密码</h2>
		<input type="hidden" name="id" value="${student.id}">
		<input type="hidden" name="login_pass3" id ="login_pass3" value="${student.login_pass}">
		<table width="500"  border="0" style="font-size:20px;" cellpadding="4" >
	      	<tr>
	      		<td width="100">姓名：</td>
				<td width="300"> <input type="text" name="stu_name"  value="${student.true_name}"  readonly="readonly"><font color="#FF0000">*</font></td>
			</tr>
			<tr>
	      		<td width="100">原密码：</td>
				<td width="300"> <input type="password" name="login_pass1" id ="login_pass1" value=""><font	color="#FF0000">*</font></td>
			</tr>
			<tr>
	      		<td width="100">新密码： </td>
				<td width="300"><input type="password" name="login_pass" id ="login_pass" value=""><font
					color="#FF0000">*</font></td>
			</tr>
			<tr>
	      		<td width="100">确认密码： </td>
				<td width="300"> <input type="password" name="login_pass2" id ="login_pass2" value=""><font
					color="#FF0000">*</font></td>
			</tr>

		</table>
		<div style="margin-top:20px;margin-left:250px" >
			<input type="button" value="保存" onclick="update() "class="sjjx-button"> 
		</div>
	</form>
</body>
</html>

