<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../titlebar.jsp"%>
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
<link href="css/starter-template.css" rel="stylesheet">

</head>

<body>
	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font color="red">${result}</font>
		</c:if>

		<br />

		<form
			action="<%=path %>/wjdc/option/${qn.id}/${qn.q.id}/insert.do?o_id=${qn.q.o.id}"
			method="post">
			<div class="col-sm-5">
				<table class="table">
					<caption align="top" style="font-size:30px">新建选项</caption>
					<thead>
						<tr>
							<th>选项内容</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" id="title" class="form-control"
								name="title" value="${qn.q.o.title}" /></td>
							<td><input type="submit" value="确定"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%-- 			依赖关系:
			<select id="depend" name="depend">
			<option value="">无</option>
				<c:forEach items="${qn.question}" var="q" varStatus="status">
					<option value="${q.id}">${q.title}</option>
				</c:forEach>
			</select> --%>
		</form>
	</div>
</body>
</html>
