<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../../../ys.jsp"%>
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
	<button type="button" class="btn btn-lg btn-link">问卷标题：${qn.title}</button>
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
					<c:forEach var="wt" items="${qn.question}" varStatus="stauts">
						<tr>
							<td>${stauts.index+1}</td>
							<td>${wt.title}</td>
							<td width="50"><a style="text-decoration:underline;"
								href="option/${qn.id}/${wt.id}/oneallquestion/show.htm">查看</a></td>
							<c:if test="${wt.other == '是'}">
								<td width="50"><a style="text-decoration:underline;" target="_blank"
									href="qa/${qn.id}/${wt.id}/other.htm">其他</a></td>
							</c:if>
							<c:if test="${wt.other == '否'}">
								<td width="50">无</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>