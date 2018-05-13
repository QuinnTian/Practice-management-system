<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../titlebar.jsp"%>

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
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<br />
		
		<a href="<%=path%>/wjdc/questionnaire/new.htm" style="width: 12%" class="btn btn-lg btn-info">新建问卷</a> 
		<a href="<%=path%>/wjdc/questionnaire/upload.htm" style="width: 12%" class="btn btn-lg btn-info">导入问卷</a>

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
								<td><a
									href="<%=path %>/wjdc/questionnaire/new.htm?qn_id=${wj.id}">${wj.title}</a>
								</td>
								<td>${wj.qNum}</td>
								<td>
								|<a href="<%=path %>/wjdc/question/${wj.id}/show.htm">添加问卷问题</a>
								|<a href="<%=path %>/wjdc/questionnaire/delete.do?id=${wj.id}" onclick="return confirm('确认删除问卷吗')">删除问卷</a>
								|<a target="_blank"
									href="<%=path %>/wjdc/questionnaire/${wj.id}/yulan.htm">预览问卷</a>
								|<a target="_blank"
									href="<%=path %>/wjdc/questionnaire/analysis.htm?id=${wj.id}">查看问卷结果</a>
								|<a target="_blank"
									href="<%=path %>/wjdc/questionnaire/${wj.id}/text.htm">开始答卷</a>
								|<a target="_blank"
									href="<%=path %>/wjdc/questionnaire/${wj.id}/qr.htm">生成二维码</a>|
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

