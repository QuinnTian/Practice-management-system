<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>添加学生</title>
<script type="text/javascript">
	
	function doAdd() {

		var stu_code = $("#stu_code").val();
		var id_card = $("#id_card").val();
		var phone = $("#phone").val();
		var home_phone = $("#home_phone").val();
		var homepage = $("#homepage").val();
		if (stu_code.length != 12) {
			alert("学号错误");
		} else if (id_card.length != 18) {
			alert("身份证号错误");
		}else if(phone.length < 7 || phone.length > 12){
			alert("电话号码格式有问题");
		}else if (home_phone.length < 7 || home_phone.length > 12) {
			alert("家庭电话格式有问题");
		}else if (!homepage.endsWith(".com")) {
			alert("主页格式有问题");
		}else { 
		document.form1.submit();
		};

	}
</script>
</head>
<body>
	<h2 align='left'>学生添加</h2>
	<form name="form1" id="form1" method="post"
		action="doAddStudent.do?class_id=${class_id}">
		<table border="1" width="370">
			<tr>
				<td width="70">学号：</td>
				<td width="300"><input type="text" name="stu_code">
				</td>
			</tr>

			<tr>
				<td width="70">姓名：</td>
				<td width="300"><input type="text" name="true_name">
				</td>
			</tr>
			<tr>
				<td width="70">性别：</td>
				<td width="300"><select id="sex" name="sex">
						<c:forEach var="sex" items="${sex}" varStatus="stauts">
							<option value="${sex}">${sex}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="70">身份证号：</td>
				<td width="300"><input type="text" name="id_card">
				</td>
			</tr>
			<tr>
				<td width="70">手机号：</td>
				<td width="300"><input type="text" name="phone">
				</td>
			</tr>
			<tr>
				<td width="70">班级名称：</td>
				<td width="300"><input type="text" name="class_name"
					value="${class_name}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td width="70">家庭电话：</td>
				<td width="300"><input type="text" name="home_phone">
				</td>
			</tr>
			<tr>
				<td width="70">籍贯：</td>
				<td width="300"><input type="text" name="birthplace">
				</td>
			</tr>
			<tr>
				<td width="70">空间主页：</td>
				<td width="300"><input type="text" name="homepage">
				</td>
			</tr>

		</table>

		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd();" value="保存" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="window.location='./studentImportList.do'">返回</button>
		</div>
	</form>
</body>
</html>


