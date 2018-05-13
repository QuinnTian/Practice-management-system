<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学校初始化</title>
	<script type="text/javascript">
	
	</script>
</head>
<body>
<h2 align='center'>学校初始化</h2>
	<form name="doinitSchool" id="doinitSchoolform" method="post" action="doinitSchool.do">
		 <table border="0" width="1000">
		 	<tr>
				<td width="200">学校名称：</td>
				<td width="700">
					<input type="text" name="school_name"/>
				</td>
			</tr>
			<tr>
				<td width="200">学校编码：</td>
				<td width="700"><input type="text" name="school_code"/>
				</td>
			</tr> 
			<tr>
				<td width="200">学校管理员姓名：</td>
				<td width="700"><input type="text" name="tea_name"/>
				</td>
			</tr>
			<tr>
				<td width="200">学校管理员教工号：</td>
				<td width="700"><input type="text" name="tea_code"/>
				</td>
			</tr>
			<tr>
				<td width="200">学校管理员性别：</td>
				<td width="700">
				<select id="tea_sex" name="tea_sex" style="width:200px">
						<option value="男">男</option>
						<option value="女">女</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="200">学校管理员联系电话：</td>
				<td width="700"><input type="text" name="tea_phone" style="width:600px" />
				</td>
			</tr>
			<tr>
				<td width="200">学校管理员角色：</td>
				<td width="700">
				<select id="schoolAdmin" name="schoolAdmin" style="width:200px">
						<c:forEach var="roleList" items="${roleList}" varStatus="stauts">
							<option value="${roleList.id}">${roleList.role_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <button type="button" onclick="window.location='./roleList.do'">返回</button> -->
		</div>
	</form>
</body>
</html>
