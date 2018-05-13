<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户角色列表</title>
	<script type="text/javascript">
	
	</script>
</head>
<body>
<h2 align='center'>学院初始化</h2>
	<form name="doinitCollege" id="doinitCollegeform" method="post" action="doinitCollege.do">
		 <input type="hidden" name="collegeAdmin" id="collegeAdmin" value="${role_code}"/>
		 <table border="0" width="1000">
		 	<%-- <tr>
				<td width="200">学院管理员角色：</td>
				<td width="700">
				<input type="text" name="collegeAdmin" style="width:600px"  value="${role_code}" disabled="disabled"/>
				</td>
			</tr>  --%>
		 	<tr>
				<td width="100">学院名称：</td>
				<td width="700">
					<input type="text" name="college_name"/>
				</td>
			</tr>
			<tr>
				<td width="100">学院编码(不重复)：</td>
				<td width="300"><input type="text" name="college_code"/>
				</td>
			</tr> 
			<tr>
				<td width="100">学院管理员姓名：</td>
				<td width="300"><input type="text" name="tea_name"/>
				</td>
			</tr>
			<tr>
				<td width="100">学院管理员教工号：</td>
				<td width="300"><input type="text" name="tea_code"/>
				</td>
			</tr>
			<tr>
				<td width="100">学院管理员性别：</td>
				<td width="300">
				<select id="tea_sex" name="tea_sex" style="width:200px">
						<option value="男">男</option>
						<option value="女">女</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">学院管理员联系电话：</td>
				<td width="300"><input type="text" name="tea_phone" style="width:600px" />
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
