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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>

		<br /> <a class="btn btn-info btn-lg"
			href="javascript:history.go(-1);" style="width: 12%">返回</a>



		<form action="<%=path%>/zxcy/question/insert.do" method="post"
			name="form1">

			<input type="hidden" id="id" name="id" value="${q.id}" /> <input
				type="hidden" id="questionnaire_id" name="questionnaire_id"
				value="${q.questionnaire_id}" />
			<div align="center">
				<table class="table">
					<caption align="top" style="font-size:30px">创建测验</caption>
					<thead>
						<tr>
							<th>测验标题</th>
							<th>测验类型</th>
							<!-- 						<th>是否其他</th> -->
							<!-- 						<th>是否必答</th> -->
							<th>测验分值</th>
							<th>测验样式</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><div class="col-sm-15">
									<input type="text" class="form-control" id="title" name="title"
										placeholder="title" value="${q.title}" />
								</div></td>
							<td><select id="type" name="type" class="form-control">
									<option <c:if test="${q.type == '2'}">selected</c:if> value="2">单选</option>
									<option <c:if test="${q.type == '1'}">selected</c:if> value="1">多选</option>
									<option <c:if test="${q.type == '3'}">selected</c:if> value="3">文本</option>
									<option <c:if test="${q.type == '4'}">selected</c:if> value="4">说明</option>
							</select> <!-- 						</td> --> <!-- 						<td><select id="other" name="other" class="form-control"> -->
								<!-- 								<option <c:if test="${q.other == '1'}">selected</c:if> value="1">是</option> -->
								<!-- 								<option <c:if test="${q.other == '0'}">selected</c:if> value="0">否</option> -->
								<!-- 						</select></td> --> <!-- 						<td><select id="answer" name="answer" class="form-control"> -->
								<!-- 								<option <c:if test="${q.answer == '1'}">selected</c:if> value="1">是</option> -->
								<!-- 								<option <c:if test="${q.answer == '0'}">selected</c:if> value="0">否</option> -->
								<!-- 						</select> --> <!-- 						</td> -->
							<td width="20"><input id="score" name="score" type="number"
								value="10">分</td>
							<td><select id="style" name="style" class="form-control">
									<option <c:if test="${q.style == '1'}">selected</c:if>
										value="1">默认</option>
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
