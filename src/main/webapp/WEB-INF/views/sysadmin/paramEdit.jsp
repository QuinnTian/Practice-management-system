<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改参数</title>	

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h2>修改参数：</h2>
	<br>
	<form name="form1" method="post" action="doEdit.do">
 		<input type="hidden" name="id" name="id" value="${id}">
		<table border="0" width="400">
		<tr>
				<td width="100">参数编码：</td>
				<td width="300"><input type="text" name="edit_code" 
					value="${edit_code}"/>
				</td>
			</tr>

			<tr>
				<td width="100">参数名称：</td>
				<td width="300"><input type="text" name="edit_name" 
					value="${edit_name}"/>
				</td>
			</tr>
			<tr>
				<td width="100">参数数值：</td>
				<td width="300"><input type="text" name="edit_value" 
					value="${edit_value}"/>
				</td>
			</tr>
			
		</table>

		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./paramList.do'">返回</button>
		</div>
	</form>
</body>
</html>

