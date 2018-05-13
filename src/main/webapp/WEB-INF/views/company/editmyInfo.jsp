<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="/springmvc_mybatis/css/pageStyle.css" rel="stylesheet" type="text/css">
<title>个人信息维护</title>
<script>
	function update() {
		
		var phone = $("#phone").val();
		var email = $("#email").val();
		var qqnum = $("#qqnum").val();
		if (phone == "") {
			
			alert("请填写手机号！");
			return;
		} 
		if(isNaN(phone)){
			alert("手机号必须是数字！");
			return;
		}
		if (email == "") {

			alert("请填写email！");
			return;
		}
		if (qqnum == "") {

			alert("请填写qq号！");
			return;
		}
		if(isNaN(qqnum)){
			alert("qq号必须是数字！");
			return;
		}
		if (email != '') {//判断
   		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    	if (!reg.test(email)) {
        alert('邮箱格式不正确，请重新填写!');
      	return;
  }
}
		
		window.document.userLoginForm.action = "doeditmyInfo.do";
		alert("信息修改成功");
		window.document.userLoginForm.submit();
		
	}
	function back() {
		alert("确定退出吗？");
		window.document.userLoginForm.action = "myInfo.do";
		window.document.userLoginForm.submit();
	}

</script>
</head>
<body>
	<form id="userLoginForm" name="userLoginForm" method="post" class="sjjx-form">
		<h1>个人信息维护</h1>
		<table width="400" border="0" style="font-size:20px;" cellpadding="4">
			<c:forEach var="t" items="${teaList}" varStatus="stauts">
				
				<tr>
					<td width="300"><input type="hidden" name="id" value="${t.id}">
					</td>
				</tr>
				
					<tr>
					<td width="70">姓名：</td>
					<td width="300"><input type="text" name="true_name" readonly="readonly"
						value="${t.true_name}">
					</td>
				</tr>
				<tr>
					<td width="70">电话：</td>
					<td width="300"><input type="text" name="phone" id="phone"
						value="${t.phone}">
					</td>
				</tr>
				<tr>
					<td width="70">qq：</td>
					<td width="300"><input type="text" name="qqnum" id="qqnum"
						value="${t.qqnum}">
					</td>
				</tr>
					<tr>
					<td width="70">email：</td>
					<td width="300"><input type="text" name="email" id="email"
						value="${t.email}">
					</td>
				</tr>
				<tr>
					<td width="70">职务：</td>
					<td width="300"><input type="text" name="duties" readonly="readonly"
						value="${t.duties}" />
					</td>
				</tr>
				<tr>
					<td width="70">专长：</td>
					<td width="300"><input type="text" name="expertise"
						value="${t.expertise}" />
					</td>
				</tr>
			</c:forEach>
		</table>

		<div style="margin-top:20px;margin-left:300px">
			<input type="button" value="保存" onclick="update()" class="sjjx-button"> 
		</div>
	</form>
</body>
</html>
