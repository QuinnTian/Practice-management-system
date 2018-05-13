<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../ys.jsp"%>

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
		<a href="<%=path %>/wjdc/questionnaire/new.htm">新建问卷</a>
	</button>
	<button type="button" class="btn btn-lg btn-link">导入问卷</button>
	<button type="button" class="btn btn-lg btn-link">批量导入问卷</button>
	<button type="button" class="btn btn-lg btn-link">新建单位</button>

	<div class="row">
		<div class="col-md-6">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>问卷ID</th>
						<th>填写者</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qna" items="${qnaList}" varStatus="stauts">
						<tr>
							<td>${stauts.index+1}</td>
							<td><a target="_blank" href="qa/${qna.id}/show.htm">${qna.id}</a>
							</td>
							<td width="50"><a href="question/${qna.user_id}/show.htm">${qna.user_id}</a>
							</td>
							<td width="50"><a href="${qna.questionnaire_id}">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>