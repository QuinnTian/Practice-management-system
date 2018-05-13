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
	function doAdd() {
		document.forms[0].submit();
	}
	$(function() {
		//var tmp1 = document.getElementsById("#sys_temp1");
		var tmp1 = $("#sys_temp1")[0].value;
		var sm_is_top = $("#sys_sm_is_top")[0].value;
		var sm_parent = $("#sys_sm_parent")[0].value;
		var sm_used = $("#sys_sm_used")[0].value;
		
		$("#temp1").val(tmp1); 
		$("#sm_is_top").val(sm_is_top); 
		$("#sm_used").val(sm_used); 
		$("#sm_parent").val(sm_parent); 
	});
</script>
</head>
<body>
	<h2>修改菜单</h2>
	<form name="form1" id="myform" method="post" action="dosysMenuEdit.do">
		<input  type="hidden" name="id" value="${sysmenu.id}"/>
		<table border="0" width="1000">
			<tr>
				<td width="100">菜单名称：</td>
				<td width="700"><input type="text" name="sm_name" id="sm_name"
					value="${sysmenu.sm_name}" /> <font color="red"><span
						id="infor"></span></font></td>
			</tr>
			<tr>
				<td width="100">菜单所属类别：</td>
				<td width="700"><input type="hidden" id="sys_temp1"
					value="${sysmenu.temp1}" /> <select name="temp1" id="temp1">
						<option value="1">管理员</option>
						<option value="2">教师</option>
						<option value="4">领导</option>
						<option value="3">学生</option>
						<option value="5">公司</option>
				</select></td>
			</tr>
			<tr>
				<td width="120">菜单级别：</td>
				<td width="700"><input type="hidden" id="sys_sm_is_top"
					value="${sysmenu.sm_is_top}" /> <select name="sm_is_top"
					id="sm_is_top">
						<option value="1">一级菜单</option>
						<option value="2">二级菜单</option>
						<option value="3">三级菜单</option>
						<option value="4">四级菜单</option>
				</select></td>
			</tr>

			<tr>
				<td width="100">菜单编码：</td>
				<td width="700">${sysmenu.sm_code}<input type="hidden"
					name="sm_code" value="${sysmenu.sm_code}" />
				</td>
			</tr>

			<tr>
				<td width="100">菜单标题：</td>
				<td width="700"><input type="text" name="sm_title"
					id="sm_title" value="${sysmenu.sm_title}" /></td>
			</tr>
			<tr id="grade">
				<td width="100">菜单父级菜单：</td>
				<td width="700"><input type="hidden" id="sys_sm_parent"
					value="${sysmenu.sm_parent}" /> 
					<select id="sm_parent" name="sm_parent" style="width:200px">
						<option value="无">无</option>
						<c:forEach var="sysMenuList" items="${sysMenuList}"
							varStatus="stauts">
							<option value="${sysMenuList.id}">${sysMenuList.sm_code}-${sysMenuList.sm_sort_name}-${sysMenuList.sm_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="100">Pc菜单url地址：</td>
				<td width="700"><input type="text" name="sm_page" id="sm_page"
					style="width:200px" value="${sysmenu.sm_page}" /></td>
			</tr>
			<tr>
				<td width="100">Mp菜单url地址：</td>
				<td width="700"><input type="text" name="sm_page_phone" id="sm_page_phone"
					style="width:200px" value="${sysmenu.sm_page_phone}" /></td>
			</tr>
			<tr>
				<td width="100">是否可用：</td>
				<td width="700"><input type="hidden" id="sys_sm_used"
					value="${sysmenu.sm_used}" /> <select name="sm_used" id="sm_used">
						<option value="1">可用</option>
						<option value="2">不可用</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">菜单描述：</td>
				<td width="700"><input type="text" name="sm_description"
					id="sm_description" style="width:600px"
					value="${sysmenu.sm_description}" /></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="javascript:history.go(-1);">返回</button>
		</div>
	</form>
</body>
</html>
