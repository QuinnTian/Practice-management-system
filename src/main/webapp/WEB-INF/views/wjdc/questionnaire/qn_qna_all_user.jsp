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

	<br />
	<br />
	<br />
	<div class="row">
		<div class="col-xs-9">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<c:forEach var="q" items="${question_list}" varStatus="stauts">
							<th>${q.title}</th>
						</c:forEach>
						<th>问卷完成时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${all_answer_list}"
						varStatus="result_stauts">
						<tr>
							<td>${(page-1) * 10 + result_stauts.index+1}</td>
							<c:forEach var="value" items="${result}" varStatus="stauts">
								<td>${value}</td>
							</c:forEach>
							<td>${all_qn_list[result_stauts.count-1].enddate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</div>
	</div>
	<p align="center">
		<c:forEach var="i" begin="1" end="${sum_page}" step="1">
			<a style="font-size: 20pt;" href="qna/${qn_id}/qn_qna_all_user.htm?page=${i}">${i}</a>
		</c:forEach>
	</p>

</body>
</html>
