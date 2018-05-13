<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../ys.jsp"%>
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
<link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	<c:if test="${!empty result}">
		<font color="red">${result}</font>
	</c:if>
	
<br>
<br>
<br>

	<h1 align="center">导入问卷</h1>

	<form action="upload.do" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-2 control-label" for="publicQn">问卷是否公开</label>
			<div class="col-sm-10">
				<select id="publicQn" name="publicQn" class="form-control">

					<option value="否">否</option>
					<option value="是">是</option>

				</select>
			</div>
		</div>
		<p>　</p>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="user_id">问卷使用者</label>
			<div class="col-sm-10">
				<select id="t_s" name="t_s" class="form-control">
					<option value="teacher">教师</option>
					<option value="student">学生</option>
				</select>
			</div>
		</div>
		
		<p>　</p>

		<div class="form-group">
			<label class="col-sm-2 control-label" for="user_id">问卷使用单位</label>
			<div class="col-sm-10">
				<select id="department" name="department" class="form-control">

					<c:forEach var="org" items="${org}">
						<option value="${org.id}">${org.org_name}</option>
					</c:forEach>

				</select>
			</div>
		</div>
		<p>　</p>
		


		<div class="form-group">
			<label class="col-sm-2 control-label" for="file">File input</label>
			<div class="col-sm-10">
				<input type="file" id="file" name="file">
			</div>
			<p class="help-block">　请上传按照相应格式填写的Excel问卷</p>
		</div>
		<button type="submit" class="center-block control-label btn btn-default">确定</button>
	</form>
</body>
</html>
