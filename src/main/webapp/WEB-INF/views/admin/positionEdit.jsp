<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改企业岗位</title>

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
</head>
<body>
	<h2>企业岗位修改：</h2>
	<form name="form1" method="post" action="doEditPosition.do">
		<input type="hidden" name="id" name="id" value="${p.id}">
		<table border="0" width="400">

			<tr>
				<td width="100">职位类别：</td>
				<td width="300"><input type="text" name="post_type"
					value="${p.post_type}">
				</td>
			</tr>
			<tr>
				<td width="100">岗位编码：</td>
				<td width="300"><input type="text" name="post_code"
					value="${p.post_code}">
				</td>
			</tr>
			<tr>
				<td width="100">岗位名称：</td>
				<td width="300"><input type="text" name="post_name"
					value="${p.post_name}">
				</td>
			</tr>
			<tr>
				<td width="100">岗位职责：</td>
				<td width="300"><input type="text" name="post_duties"
					value="${p.post_duties}" />
				</td>
			</tr>
			<tr>
				<td width="100">父岗位id：</td>
				<td width="300"><input type="text" name="parent_id"
					value="${p.parent_id}" />
				</td>
			</tr>
			<tr>
				<td width="100">审核备注：</td>
				<td width="300"><input type="text" name="check_note"
					value="${p.check_note}" />
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="300"><input type="text" name="state"
					value="${p.state}" />
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./positionList.do'">返回</button>
		</div>
	</form>
</body>
</html>





















