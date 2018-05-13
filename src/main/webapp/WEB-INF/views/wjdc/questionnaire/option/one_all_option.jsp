<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../ys.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<div class="page-header">
		<h1></h1>
	</div>
	<c:if test="${!empty result}">
		<font color="red">${result}</font>
	</c:if>

	<br />
	<button type="button" class="btn btn-lg btn-link">
		<a href="question/${qn.id}/oneallquestion/show.htm">问卷标题：${qn.title}</a>
	</button>
	<button type="button" class="btn btn-lg btn-link">选项标题：${qn.q.title}</button>
	<button type="button" class="btn btn-lg btn-link">
		<a href="questionnaire/admin.htm">返回控制面板</a>
	</button>



	<div class="row">
		<div class="col-xs-9">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>选项标题</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="xx" items="${qn.q.option}" varStatus="stauts">
						<tr>
							<td width="50">${stauts.index+1}</td>
							<td width="50">${xx.title}</td>
							<td width="50"><a target="_blank"
								href="user/${qn.id}/${qn.q.id}/${xx.id}/show_user.htm">查看</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>