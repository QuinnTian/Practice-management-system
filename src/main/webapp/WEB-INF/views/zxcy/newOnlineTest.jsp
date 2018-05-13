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
			<font size="5" color="red">${result}</font>
		</c:if>

		<br /> <a class="btn btn-info btn-lg"
			href="javascript:history.go(-1);" style="width: 12%">返回</a>

		<form action="<%=path%>/zxcy/newOnlineTest.do" method="post">
			<div align="center">

				<input type="hidden" id="id" name="id" value="${qn.id}">
				<table class="table">
					<caption align="top" style="font-size:30px">创建测验</caption>
					<thead>
						<tr>
							<th>测验标题</th>
							<th>测验使用者</th>
							<th>测试对象</th>
							<th>测验是否公开</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>

								<div class="col-sm-15">
									<input type="text" class="form-control" id="title" name="title"
										placeholder="某某学院教师姓名--某某课程测试题" value="${qn.title}" />
								</div>
							</td>
							<td><select id="user_type" name="user_type"
								class="form-control">
									<c:if test="${userRole == 'ROLE_ADMIN'}">
										<option
											<c:if test="${qn.user_type == 1}">selected="selected"</c:if>
											value="1">教师</option>
									</c:if>
									<option
										<c:if test="${qn.user_type == 2}">selected="selected"</c:if>
										value="2">学生</option>
							</select></td>
							<td><select id="org_id" name="org_id" class="form-control">
									<c:forEach var="org" items="${org}">
										<option
											<c:if test="${org.id == qn.org_id }">selected="selected"</c:if>
											value="${org.id}">${org.org_name}</option>
									</c:forEach>

							</select></td>
							<td><select id="temp1" name="temp1" class="form-control">

									<option
										<c:if test="${qn.temp1 == 1}">selected="selected"</c:if>
										value="1">是</option>
									<option
										<c:if test="${qn.temp1 == 0}">selected="selected"</c:if>
										value="0">否</option>

							</select></td>
							<td><input type="submit" onclick="return sumbitCheck()"
								value="确定"></td>
						</tr>
					</tbody>
				</table>
			</div>
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
