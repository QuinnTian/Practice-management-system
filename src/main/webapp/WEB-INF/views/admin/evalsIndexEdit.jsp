<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改评分标准指标</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
		function doEdit(){
			if($("#index_code").val()==""){
				alert("指标编码不能为空");
				return null;
			}else if($("#index_name").val()==""){
				alert("指标名称不能为空");
				return null;
			}else if($("#description").val()==""){
				alert("描述不能为空");
				return null;
			}else if($("#score").val()==""){
				alert("分值不能为空");
				return null;
			}else{
				document.form1.submit();
			}
		}
	</script>

</head>
<body>
<h2>修改评分标准指标</h2>
	<form name="form1" id="form1" method="post" action="doEditEvalsIndex.do">
		<input type="hidden" name="id" name="id" value="${e.id}">
		<table border="0" width="600">

			<tr>
				<td width="100">标准名称:</td>
				<td width="500">
				<input type="text" name="standard_id" disabled="disabled" style="width:200"
					value="${name}"> 
				</td>
			</tr>
			<tr>
				<td width="100">指标编码:</td>
				<td width="500"><input type="text" name="index_code" disabled="disabled" id="index_code" style="width:200"
					value="${e.index_code}"></td>
			</tr>
			<tr>
				<td width="100">指标名称:</td>
				<td width="500"><input type="text" name="index_name" id="index_name"style="width:200"
					value="${e.index_name}"></td>
			</tr>
			<tr>
				<td width="100">描述:</td>
				<td width="500"><%-- <input type="text" name="description"
					value="${e.description}" /> --%>
					<textarea name="description" rows="5" style="width:200" id="description">${e.description}</textarea>
					</td>
			</tr>
			<tr>
				<td width="100">分值:</td>
				<td width="500"><input type="text" name="score" id="score" style="width:200"
					value="${e.score}" /></td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="button" value="保存" onClick="doEdit()"/>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <button type="button" onClick="window.location='./evalsIndexListByStandId.do'">返回</button> -->
			<button type="button" onclick="location.href='javascript:history.go(-1);'">返回</button>
		</div>
	</form>
</body>
</html>
