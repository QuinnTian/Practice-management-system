<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../ys.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- <base href="<%=basePath%>"> -->

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">


</head>

<body>


	<div class="page-header">
		<h1></h1>
	</div>

	<c:if test="${!empty result}">
		<font color="red">${result}</font>
	</c:if>
	<br />
	
		<a href="questionnaire/new.htm" class="btn  btn-info" style="width: 12%" role="button">新建月总结</a>
		<a href="questionnaire/upload.htm" class="btn  btn-info" style="width: 12%" role="button">导入月总结</a>


	<div class="row">
		<div class="col-md-6">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>问卷标题</th>
						<th>问题数量</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="wj" items="${wenjuan}" varStatus="stauts">
						<tr>
							<td>${stauts.index+1}</td>
							<td><a href="questionnaire/new.htm?qn_id=${wj.id}">${wj.title}</a>
							</td>
							<td width="50"><a style="text-decoration:underline;" href="question/${wj.id}/show.htm">${wj.qNum}</a>
							</td>
							<td width="50"><a href="questionnaire/delete.do?id=${wj.id}" onclick="return confirm('确认删除问卷吗')">删除</a>
							<td width="50"><a target="_blank" href="questionnaire/${wj.id}/yulan.htm">预览</a></td>
							<td width="50"><a target="_blank" href="questionnaire/analysis.htm?id=${wj.id}">结果</a></td>
							<td width="50"><a target="_blank" href="questionnaire/${wj.id}/text.htm">正式</a></td>
							<td width="50"><a target="_blank" href="questionnaire/${wj.id}/qr.htm">二维</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
</body>
</html>

