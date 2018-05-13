<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>添加菜单</title>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}

.div {
	border: 1px solid #F00;
	width: 300px;
}
</style>
<script type="text/javascript">
	function doEdit() {
	
		var tea_code = document.getElementById("tea_code").value;
		var tea_name = document.getElementById("tea_name").value;
		var sex = document.getElementById("sex").value;
		var phone = document.getElementById("phone").value;
		var dept_id = document.getElementById("dept_id").value;
		var duties = document.getElementById("duties").value;
		var teaId =  document.getElementById("teaId").value;
		
		var phoneNumber = $("#phone").val();
	 	var phontLength = phoneNumber.length;
		
		if(phontLength < 7 || phontLength > 12){
	 		alert("电话号码格式有问题");
	 		return null;
	 	}else if(isNaN(phoneNumber) == true){
	 		alert("电话号码只能为数字");
	 	}else if($("#phone").val()==""){
	 		alert("电话号码不能为空");
	 		return null;
	 	}else{
	 		var datasend = "tea_code="+tea_code+"&tea_name="+tea_name+"&sex="+sex+
		"&phone="+phone+"&dept_id="+dept_id+"&duties="+duties+"&teaId="+teaId;
		location.href="doSchoolLeadersEdit.do?"+datasend;
	  };
	}
</script>
</head>
<body>
	<h2>修改校级领导</h2>
	<form name="form1" id="myform" method="post" >
		<table border="0" width="1000">
			<tr>
				<td width="150">教工号：</td>
				<td width="700"><input type="text" name="tea_code" id="tea_code" value="${tea.tea_code}" required="required"/></td>
			</tr>
			<tr>
				<td width="150">姓名：</td>
				<td width="700"><input type="text" name="tea_name" id="tea_name" value="${tea.true_name}" required="required"/></td>
			</tr>
			<tr>
				<td width="150">性别：<td width="700">
				<select id="sex" name="sex">
				<c:set var="s"  value="${se}"/>
					<c:if test='${s == "男"}'>  
					<option value="男">男 </option>
					<option value="女">女</option>
					</c:if>
					<c:if test='${s == "女"}'>  
					<option value="女">女</option>
					<option value="男 ">男</option>
					</c:if>
				
			</select>
				
				</td>
			</tr>
			<tr>
				<td width="150">联系电话：</td>
				<td width="700"><input type="text" name="phone"
					id="phone" value="${tea.phone}" required="required"/></td>
			</tr>
			
			<tr>
				<td width="150">所属部门：</td>
				<td width="700">
				<select name="dept_id" id="dept_id" >
				<c:forEach var="org" items="${collegeList}" varStatus="stauts">
					<option value="${org.id}">${org.org_name}</option>
				</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="150">职务：</td>
				<td width="700"><input type="text" name="duties"
					id="duties" value="${tea.duties}" required="required"/></td>
			</tr>
		</table>
		<input type="hidden" id="teaId" value="${teaId}">
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doEdit()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="javascript:history.go(-1);">返回</button>
		</div>
	</form>
</body>
</html>
