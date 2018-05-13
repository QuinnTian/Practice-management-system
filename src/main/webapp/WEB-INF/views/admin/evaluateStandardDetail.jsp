<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>评分标准详情</title>

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
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
	<script type="text/javascript">
		function doCheck(id){
			window.location.href="evalsIndexListByStandId.do?id="+id;
		}
	</script>
</head>
<body>
	<h2>评分标准详情</h2>
	<div>
	<table border="1" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
			<tr>
				<th width="200">标准编码:</th>
				<th width="200">标准名称:</th>
				<th width="200">类型：</th>
				<th width="300">描述:</th>
				<th width="200">适用范围:</th>
			</tr>
			<tr>
				<td align="center">${e.standard_code}</td>
				<td align="center">${e.standard_name}</td>
				<td align="center">${e.type}</td>
				<td align="center">${e.description}</td>
				<td align="center">
				<c:set var="scope" value="${e.scope}" scope="request"></c:set>
				<%
					String scope = (String) request.getAttribute("scope");
					out.println(DictionaryService.findOrg(scope).getOrg_name());
				%>
				</td>
			</tr>
		</table>
		</div>
		<div>
	<h2>评分标准指标详情</h2>
		<table border="1" width="900" id="table1" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="200">标准名称</th>
			<th width="200">指标名称</th>
			<th width="300">描述</th>
			<th width="50">分值</th>
			<th width="150">创建时间</th>
		</tr>
			
		<c:forEach var="e" items="${result}" varStatus="stauts">
			<tr>
				<td width="150" align="center">
				<c:set var="standard_id" value="${e.standard_id}" scope="request"></c:set>
				<% String standard_id=(String)request.getAttribute("standard_id"); %>
				<%=DictionaryService.findEvaluateStandard(standard_id).getStandard_name() %>
				</td>				
				<td width="150" align="center">${e.index_name}</td>
				<td width="150" align="center">${e.description}</td>
				<td width="150" align="center">${e.score}</td>
			<td width="150" align="center"><fmt:parseDate value="${e.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
			</td>
			</tr>
		</c:forEach>
	</table>
		</div>
		<div style="margin-top:20px;">
			<button type="button" onclick="window.location='evaluateStandardList.do'">返回</button>
		</div>
</body>
</html>

