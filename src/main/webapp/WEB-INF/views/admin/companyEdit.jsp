<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改企业</title>

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	function doEdit(){
	 var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	 var email = $("#email").val();
	 var b = reg.test(email);
	 if($("#com_name").val()==""){
	  	alert("企业名称不能为空");
	 	return null;
	 }else if($("#contacts").val()==""){
	  	alert("企业联系人不能为空");
		 return null;
	 }else if($("#phone").val()==""){
	  	alert("联系电话不能为空");
	 	return null;
	 }else if($("#address").val()==""){
	  	alert("企业地址不能为空");
		 return null;
	 }else if($("#email").val()==""){
	  	alert("E-mail不能为空");
	 	return null;
	 }else if(b==false){
	 	alert("E-mail格式错误");
	 	return null;
	 }else{
	 	document.form1.submit();
	 }
	}
</script>
</head>
<body>
	<h2>修改企业：</h2>
	<br>
	<form name="form1" method="post" action="doEditCompany.do">
		<input type="hidden" name="id" name="id" value="${c.id}">
		<table border="0" width="400">

			<tr>
				<td width="100">企业名称：</td>
				<td width="300"><input type="text" name="com_name" id="com_name"
					value="${c.com_name}">
				</td>
			</tr>
			<%-- <tr>
				<td width="100">企业代码：</td>
				<td width="300"><input type="text" name="com_code" id="com_code"
					value="${c.com_code}" onblur="check()"/><font color="read"><span id="infor"></span></font>
				</td>
			</tr> --%>
			<tr>
				<td width="100">企业短名：</td>
				<td width="300"><input type="text" name="short_name" id="short_name"
					value="${c.short_name}">
				</td>
			</tr>
			<tr>
				<td width="100">联系人：</td>
				<td width="300"><input type="text" name="contacts" id="contacts"
					value="${c.contacts}" />
				</td>
			</tr>
			<tr>
				<td width="100">联系电话：</td>
				<td width="300"><input type="text" name="phone" id="phone" onkeyup="value=value.replace(/[^\d]/g,'')"
					onBlur="value=value.replace(/[^\d]/g,'')" value="${c.phone}" />
				</td>
			</tr>
			<tr>
				<td width="100">企业地址：</td>
				<td width="300"><input type="text" name="address" id="address"
					value="${c.address}" />
				</td>
			</tr>
			<tr>
				<td width="100">Email：</td>
				<td width="300"><input type="text" name="email" id="email"
					value="${c.email}" />
				</td>
			</tr>
			<tr>
				<td width="100">审核人：</td>
				<td width="300">
				<c:set var="id" value="${c.check_man}" scope="request"></c:set>
			<%
				String tea_id = (String) request.getAttribute("id");
			%>
				<input type="text" name="check_man"  disabled='disabled'
					value="<% 
				   if(DictionaryService.findTeacher(tea_id)==null){
				   	out.print("  ");
				   }else{
				   out.print(DictionaryService.findTeacher(tea_id).getTrue_name());
				   }%>" />
				</td>
			</tr>
			<tr>
				<td width="100">审核备注：</td>
				<td width="300"><input type="text" name="check_note"
					value="${c.check_note}" />
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="300">
				<select name="state" id="state" >
						<c:forEach var="state" items="${state}" varStatus="stauts">
						<option value="${state}">${state}</option>
					</c:forEach>
				</select>
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="button" onclick="doEdit();" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./companyList.do'">返回</button>
		</div>
	</form>
</body>
</html>





















