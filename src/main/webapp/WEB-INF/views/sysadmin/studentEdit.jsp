<%@page import="com.sict.entity.UserRole"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>修改学生</title>
<script type="text/javascript">
	function doAdd() {
		/*var PhoneNumber=$("#phone").val();
		var phontLength = PhoneNumber.length;
		if(phontLength < 7 || phontLength > 12){
			alert("电话号码格式有问题");
		 	return null;
		}else if($("#phone").val()==""){
			alert("电话号码不能为空");
			 return null;
		}else if(isNaN(PhoneNumber) == true){
			alert("电话号码只能为数字");
		}else{*/
		var getCK = document.getElementsByName("role");
		var s = "";
		for ( var v = 0; v < getCK.length; v++) {
			if (getCK[v].checked) {
				s = s + getCK[v].value;
				if (v < getCK.length - 1) {
					s = s + ",";
				}
			}
		}
		//去除多余的逗号
		if (s.substring(s.length - 1, s.length) == ",") {
			s = s.substring(0, s.length - 1);
		}
		

		document.form1.action = "doEditStudent.do?roles=" + s;
		document.form1.submit();
		// };
	}
</script>
</head>
<body>
	<h2 align='left'>学生修改</h2>
	<form name="form1" id="form1" method="post" action="doEditStudent.do">
		<input type="hidden" name="id" id="id" value="${stu.id}">
		<table border="1" width="500">
			<tr>
				<td width="200" align="center">学号：</td>
				<td width="300">${stu.stu_code}</td>
			</tr>

			<tr>
				<td width="200" align="center">姓名：</td>
				<td width="300"><input type="text" name="true_name"
					value="${stu.true_name}"></td>
			</tr>
			<tr>
				<td width="200" align="center">性别：</td>
				<td width="300"><select id="sex" name="sex">
						<c:forEach var="sex" items="${sex}" varStatus="stauts">
							<option value="${sex}">${sex}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="200" align="center">身份证号：</td>
				<td width="300"><input type="text" name="id_card"
					value="${stu.id_card}"></td>
			</tr>
			<tr>
				<td width="200" align="center">手机号：</td>
				<td width="300"><input type="text" name="phone"
					value="${stu.phone}"></td>
			</tr>
			<tr>
				<td width="200" align="center">班级名称：</td>
				<td width="300"><input type="text" name="class_name"
					value="${class_name}"></td>
			</tr>
			<tr>
				<td width="200" align="center">家庭电话：</td>
				<td width="300"><input type="text" name="home_phone"
					value="${stu.home_phone}"></td>
			</tr>
			<tr>
				<td width="200" align="center">籍贯：</td>
				<td width="300"><input type="text" name="birthplace"
					value="${stu.birthplace}"></td>
			</tr>
			<tr>
				<td width="200" align="center">空间主页：</td>
				<td width="300"><input type="text" name="homepage"
					value="${stu.homepage}"></td>
			</tr>
			<tr>
				<td width="200" align="center">学生类型：</td>
				<td width="800"><c:forEach var="role_all" items="${roles}"
						varStatus="stauts">
						<%-- <c:forEach var="role_now" items="${roles_now}" varStatus="stauts">
							<c:if test="${role_now.role_id==role_all.role_code }">
								<input type="checkbox" name="role" value="${role_all.role_code}"
									checked="checked">${role_all.role_name}</input>
								<br>
							</c:if>
							<c:if test="${role_now.role_id!=role_all.role_code }">
								<input type="checkbox" name="role" value="${role_all.role_code}">${role_all.role_name}</input>
								<br>
							</c:if>
						</c:forEach> --%>

						<c:if test="${role_all.isBeOccupied==true }">
							<input type="checkbox" name="role" value="${role_all.role_code}"
								checked="checked">${role_all.role_name}</input>
							<br>
						</c:if>
						<c:if test="${role_all.isBeOccupied==false }">
							<input type="checkbox" name="role" value="${role_all.role_code}">${role_all.role_name}</input>
							<br>
						</c:if>

					</c:forEach></td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd();" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="window.location='./studentImportList.do'">返回</button>
		</div>
	</form>
</body>
</html>





















