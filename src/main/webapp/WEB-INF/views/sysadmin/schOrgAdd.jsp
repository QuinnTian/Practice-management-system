<%@page import="com.sict.entity.Teacher"%>
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
	//ajax 获取学院的老师
	function ajaxTeacher() {
		$.ajax({
			type : "get",
			url : "ajaxXY_teacher.do?",
			data : getcontactsDeptData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showTeachers(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function getcontactsDeptData() {
		var val = $("#contactsDept").val();
		var dataSend = "contactsDept=" + val;
		return dataSend;
	}
	function showTeachers(ajaxData) {
		$("#contacts").html(ajaxData);
	}
	$(function() {
			$("#grade").hide();
	});
	//保存验证
	function doAdd() {
		var phone = $("#phone").val();
		var org_name = document.getElementById("org_name");
		var org_code = document.getElementById("org_code");
		var begin_Time = document.getElementById("begin_Time");
	
		var isMobile=/^(?:13\d|17\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //手机号码验证规则    手机验证规则错误178***
		var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;   //座机验证规则
		if(!isMobile.test(phone) && !isPhone.test(phone)){ //如果用户输入的值不同时满足手机号和座机号的正则
		    alert("请正确填写电话号码，例如:13415764179或0321-4816048");  //就弹出提示信息
		    $("#phone").focus();       //输入框获得光标
		    return false;         //返回一个错误，不向下执行
		}
		if (phone == "") {
			alert("请填写手机号！");
			return null;
		} 
		
		if (org_name.value == "") {
				alert("组织名称不能为空！");
				org_name.focus();
				return null;
			}
		if (org_code.val=="") {
				alert("组织编码不能为空！");
				org_code.focus();
				return null;
			}
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<h2>添加校级组织</h2>
	<form name="form1" id="myform" method="post" action="dosysOrgAdd.do">
		<table border="0" width="1000">
			<tr>
				<td width="150">组织编码：</td>
				<td width="700"><input type="text" name="org_code" id="org_code" />
				<font color="red" size="2px">&lt;-组织编码为组织名称首字母大写</font></td>
			</tr>
			<!-- <tr>
				<td width="150">组织级别：</td>
				<td width="700"><input type="text" name="org_name"
					id="org_name" readonly/></td>
			</tr> -->
			<tr>
				<td width="150">组织名称：</td>
				<td width="700"><input type="text" name="org_name" id="org_name" /></td>
			</tr>
			<tr id ="grade">
				<td width="100">成立时间：</td>
				<td width="700"><input type="text" name="begin_Time" id="begin_Time" class="Wdate" onClick="WdatePicker()" placeholder="单击选择日期"></td>
			</tr>
			<tr>
				<td width="100">联系电话：</td>
				<td width="700"><input type="text" name="phone" id="phone" /><font color="red" size="2px">&lt;-输入的格式如:13415764179或0321-4816048</font></td>
			</tr>
			<tr>
				<td width="100">联系人部门：</td>
				<td width="700"><select name="contactsDept" id="contactsDept" onChange="ajaxTeacher()" style="width:173px;" >
				<option value="请选择" selected="selected">请选择</option>
						<c:forEach var="o" items="${orgList}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="100">联系人：</td>
				<td width="700"><select name="contacts" id="contacts" style="width:173px;" ></select></td>
			</tr>
		  	<!-- <tr>
				<td width="150">上级组织：</td>
				<td width="700"><select type="text" name="parent_id" style="width:173px;"
					id="parent_id" >
					<option value="请选择" selected="selected">请选择</option>
							<option value="商职学院">山东商职</option>
						</select></td>
			</tr> -->
			<tr id="parent_dept">
		  	<c:set var="n" value="${org}" scope="request"></c:set>
				<td width="150">上级组织：</td>
				<td width="700"><select id="par_dept" name="par_dept" style="width:173px"><option value="${n.id}">${n.org_name}</option></select></td>
			</tr>
			
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./schOrgList.do'">返回</button>
		</div>
	</form>
</body>
</html>
