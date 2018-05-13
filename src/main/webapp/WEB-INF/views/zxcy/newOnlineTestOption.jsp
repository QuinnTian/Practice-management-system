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
			<font size="5" color="red">${result}</font>
		</c:if>

		<br /> <a class="btn btn-info btn-lg"
			href="javascript:history.go(-1);" style="width: 12%">返回</a>
		<h3>
			↓测验标题：<small>${cy.title}</small>
		</h3>
		<h4>
			→→问题标题：<small>${cy.onlineTestQuestion.title}</small>
		</h4>

		<form action="<%=path%>/zxcy/option/insert.do" method="post">

			<input type="hidden" name="question_id" id="question_id"
				value="${cy.onlineTestQuestion.id}" /> <input type="hidden" name="id"
				id="id" value="${cy.onlineTestQuestion.onlineTestOption.id}" />
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
								name="title" value="${cy.onlineTestQuestion.onlineTestOption.title}" /></td>
							<td><input type="submit" onclick="return sumbitCheck()" value="确定"></td>
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

	<script type="text/javascript">
		function sumbitCheck() {

			var title = document.getElementById("title").value;
			if (title == '') {
				document.getElementById('myModalBody').innerHTML = '标题不能为空';
				$('#tip').modal();
				return false;
			}
		}
	</script>
</body>
</html>
