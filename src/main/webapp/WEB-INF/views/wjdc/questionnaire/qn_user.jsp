<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../../ys.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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

<br/>
<br/><br/>
<div class="row">
		<div class="col-md-6">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>账号</th>
						<th>姓名</th>
						<th>查看</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}" varStatus="stauts">
						<tr>
							<td>${stauts.index+1}</td>
							<td>${list.zh}</td>
							<td>${list.xm}</td>
							<td><a target="_blank" href="qna/${qn_id}/${list.qna_id}/one_user_qna.htm">单个问卷用户列表</a></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>

</body>
</html>
