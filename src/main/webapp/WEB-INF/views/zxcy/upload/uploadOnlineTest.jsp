<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../../titlebar.jsp"%>
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
<script type="text/javascript">
	/* 
	2015年5月6日 21:23:32
	邢志武
	增加验证
	 */
	function doAdd() {
		var title = document.getElementById("title");
		var file = document.getElementById("file");
		if (title.value == "") {
			alert("请填写标题！");
			return null;
		}
		if (file.value == "") {
			alert("请选择上传的文件");
			return null;
		}
		
			document.forms[0].submit();
	}

</script>
</head>


<body>
	<c:if test="${!empty result}">
		<font size="5" color="red">${result}</font>
	</c:if>
	<br />

	<form action="<%=path %>/zxcy/uploadOnlineTest.do" method="post" enctype="multipart/form-data">
		<div align="center">
		
			<input type="hidden" id="id" name="id" value="${qn.id}">
			<table class="table">
				<caption align="top" style="font-size:30px">上传测验</caption>
				<thead>
					<tr>
						<th>测验标题</th>
						<th>测验使用者</th>
						<th>测验使用单位</th>
						<th>测验是否公开</th>
						<th>选择文件</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>

							<div class="col-sm-15">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="title" value="${qn.title}" />
							</div>
						</td>
						<td><select id="user_type" name="user_type"
							class="form-control">
								<option <c:if test="${qn.user_type == 1}">selected="selected"</c:if> value="1">教师</option>
								<option <c:if test="${qn.user_type == 2}">selected="selected"</c:if> value="2">学生</option>
						</select></td>
						<td><select id="org_id" name="org_id" class="form-control">
								<option selected="selected">请选择</option>
								<c:forEach var="org" items="${org}">
										<option <c:if test="${org.id == qn.org_id }">selected="selected"</c:if> value="${org.id}">${org.org_name}</option>
								</c:forEach>

						</select></td>
						<td><select id="temp1" name="temp1" class="form-control">

								<option <c:if test="${qn.temp1 == 1}">selected="selected"</c:if> value="1">是</option>
								<option <c:if test="${qn.temp1 == 0}">selected="selected"</c:if> value="0">否</option>

						</select></td>
						<td><input type="file" id="file" name="file"></td>
						<td><input type="button" value="确定" onclick="doAdd()"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>
