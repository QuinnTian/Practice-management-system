<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改评分标准表</title>

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

.div {
	border: 1px solid #F00;
	width: 300px;
}
</style>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
	<script type="text/javascript">
		function doCheck(id){
			window.location.href="evalsIndexListByStandId.do?id="+id;
		}
	</script>
</head>
<body>
	<h2>修改评分标准</h2>
	<form name="form1" method="post" action="doEditEvaluateStandard.do">
		<input type="hidden" name="id" name="id" value="${e.id}">
		<table border="0">

			<tr>
				<td width="100">标准编码:</td>
				<td width="250"><input type="text" name="standard_code" id="standard_code" style="width:250;"
				disabled='disabled' value="${e.standard_code}"></td>
			</tr>
			<tr>
				<td width="100">标准名称:</td>
				<td width="250"><input type="text" name="standard_name" disabled='disabled' style="width:250;"
					value="${e.standard_name}"></td>
			</tr>
			<tr>
				<td width="100">类型：</td>
				<td width="250">
				<input type="text" name="type" disabled='disabled' style="width:250;"
				value="${e.type}"
				>
				</td>
			</tr>
			<tr>
				<td width="100">描述:</td>
				<td width="250"><%-- <input type="text" name="description"
					value="${e.description}" /> --%>
				<textarea rows="4" cols="19" name="description" style="width:250;">${e.description}</textarea>	
				</td>
			</tr>
			<tr>
				<td width="100">适用范围:</td>
				<td width="250">
				<c:set var="scope" value="${e.scope}" scope="request"></c:set>
			<%
				String scope = (String) request.getAttribute("scope");
			%>
				<input type="text" name="scope" id="scope" style="width:250;"
				disabled='disabled' value="<%out.println(DictionaryService.findOrg(scope).getOrg_name());%>"/>
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="submit"  value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='evaluateStandardList.do'">返回</button>
			<input type="button" onclick="doCheck('${e.id}')" value="修改指标">
		</div>
	</form>
</body>
</html>

