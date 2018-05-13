<%@page import="com.sict.entity.Param"%>
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
</style>
<script type="text/javascript">
	function doAdd() {
		document.forms[0].submit();
	}
	function test() {
		var monthStart = $("#monthStart").val();
		var startYear = $("#startYear").val();
		var startState = $("#startState").val();
		var monthEnd = $("#monthEnd").val();
		if (monthEnd < monthStart) {
			alert("开始月份不能大约结束月份！");
			return;
		}
		if (monthStart == "00") {
			alert("请选择开始月份！");
			return;
		}
		if (startYear == "00") {
			alert("请选择年级！");
			return;
		}
		if (startState == "00") {
			alert("请选择状态！");
			return;
		}
		if (monthEnd == "00") {
			alert("请选择结束月份！");
			return;
		}
		alert("提交成功");
		$("#myform").submit();
	};
</script>
</head>
<body>
	<h2>实习时间设置</h2>
	<form name="form1" id="myform" method="post" action="doEditMonth.do">
		<table border="0" width="1000">
			<tr>
				<input type="hidden" name="dept_id" id="dept_id"
					value="${org.org_code}" />
				<td width="150">组织名称：</td>
				<td width="700"><input type="text" id="phone"
					disabled="disabled" value="${org.org_name}" /></td>
			</tr>
			<c:set var="prStart" value="${prStart}" scope="request"></c:set>
			<%
				Param prStart = (Param) request.getAttribute("prStart");
				String Param_value = prStart.getParam_value();
				String year = prStart.getYear();
				String tearm = prStart.getTerm();
				String state = prStart.getState();
			%>
			<tr>
				<td width="100">年级：</td>
				<td width="700"><input value="<%=year%>" id="startYear"
					name="startYear" style="width: 80px" class="Wdate" type="text"
					onClick="WdatePicker({dateFmt:'yyyy'})">
				</td>
			</tr>
			<tr>
				<td width="100">开始时间：</td>
				<td width="700"><input value="<%=Param_value%>" id="monthStart"
					name="monthStart" style="width: 80px" class="Wdate" type="text"
					onClick="WdatePicker({dateFmt:'yyyy-MM'})">
				</td>
			</tr>

			<%
				Param prEnd = (Param) request.getAttribute("prEnd");
				String Param_valueEnd = prEnd.getParam_value();
				String yearEnd = prStart.getYear();
				String tearmEnd = prStart.getTerm();
				String stateEnd = prStart.getState();
			%>

			<tr>
				<td width="100">结束时间：</td>
				<td width="700"><input value="<%=Param_valueEnd%>"
					id="monthEnd" name="monthEnd" style="width: 80px" class="Wdate"
					type="text" onClick="WdatePicker({dateFmt:'yyyy-MM'})">
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="700"><select name="startState" id="startState"
					style="width:362px;" onchange="">
						<option value="00" <%="00".equals(state) ? "selected" : ""%>>请选择状态</option>
						<option value="1" <%="1".equals(state) ? "selected" : ""%>>可用</option>
						<option value="2" <%="2".equals(state) ? "selected" : ""%>>不可用</option>
				</select></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="test()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./backParameter.do'">返回</button>
		</div>
	</form>
</body>
</html>






