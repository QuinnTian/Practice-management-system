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
</head>

<body>
	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font color="red">${result}</font>
		</c:if>

		<br />

		<form
			action="<%=path %>/wjdc/questionnaire/newid.do?qn_id=${questionnaire.id}"
			method="post">
			<div align="center">
				<table class="table">
					<caption align="top" style="font-size:30px">创建问卷</caption>
					<thead>
						<tr>
							<th>问卷标题</th>
							<th>问卷使用者</th>
							<th>问卷使用单位</th>
							<th>问卷是否公开</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>

								<div class="col-sm-15">
									<input type="text" class="form-control" id="title" name="title"
										placeholder="title" value="${questionnaire.title}" />
								</div>
							</td>
							<td><select id="t_s" name="t_s" class="form-control">
									<option <c:if test="${userRole == 'ROLE_TEACHER'}">disabled</c:if> value="teacher">教师</option>
									<option value="student">学生</option>
							</select></td>
							<td><select id="department" name="department"
								class="form-control">

									<c:forEach var="org" items="${org}">
										<option value="${org.id}">${org.org_name}</option>
									</c:forEach>

							</select></td>
							<td><select id="publicQn" name="publicQn"
								class="form-control">

									<option value="否">否</option>
									<option value="是">是</option>

							</select></td>
							<td><input type="submit" value="确定"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
