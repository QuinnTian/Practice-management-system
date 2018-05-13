<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入分组成员</title>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var a = 0;
		$('#table1 tr').find('td:last').each(function() {
			//判断错误信息列的内容是否"无"
			if ($(this).text().trim() != "无") {
				a++;
			}
		});
		var rowCount = $('#table1 tr').length;
		if ((a == 1 && rowCount > 2) || (a == 1 && rowCount == 2)) {
			//去除灰色不可用属性
			$("#sb").removeAttr("disabled");
		}
	});
	function Check() {
		var s = document.form1.file.value;
		if (s == "") {
			alert("请选择一个文件");
			document.form1.file.focus();
			return;
		} else {
			document.form1.submit();
		}
	};
	function fileChange(target, id) {
		var filetypes = [ "xls" ];
		var filepath = target.value;
		if (filepath) {
			var isnext = false;
			var fileend = (filepath.substring(filepath.lastIndexOf(".") + 1,
					filepath.length)).toLowerCase();
			if (filetypes && filetypes.length > 0) {
				for (var i = 0; i < filetypes.length; i++) {
					if (filetypes[i] == fileend) {
						isnext = true;
						break;
					}
				}
			}
			if (!isnext) {
				alert("暂不支持此类型,暂只接受xls格式的表格");
				target.value = "";
				return false;
			}
		} else {
			return false;
		}
	}
</script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
</head>
<body>
	<h2>导入分组成员</h2>
	<form action="doGetImports.do" method="post" name="form1" enctype="multipart/form-data">
		<input type="hidden" id="type" name="type" value="excelGroupMemberStuId">
		<div style="float:left">
			<table border="1" width="800">
				<tr>
					<td width="150">
						<input type="hidden" name="_method" value="post">
						分组成员文件(*.xls):
						<input type="file" name="file" onchange="fileChange(this);">
						<br>
					</td>
					<td width="150">
						<input type="button" value=" 提 交 " onclick="Check()">
						<br>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<div style="float:left">
		<form action="doSaveDates.do" method="post" enctype="multipart/form-data">
			<table border="1" width="200">
				<tr>
					<td>
						<input type="hidden" name="fileName" value="${fileName}">
						<input type="hidden" name="type" value="${type}">
						<input type="submit" value="保存到数据库" id="sb" disabled="disabled">
					</td>
					<td>
						<button type="button" onClick="window.location='groupsList.do'">返回</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<table border="1" width="1100" id="table1">
		<tr>
			<td width="200" align="center">
				<b>班级</b>
			</td>
			<td width="200" align="center">
				<b>姓名</b>
			</td>
			<td width="200" align="center">
				<b>学号</b>
			</td>
			<td width="250" align="center">
				<b>分组名称</b>
			</td>
			<td width="250" align="center">
				<b>表格问题</b>
			</td>
		</tr>
		<c:forEach var="g" items="${groupMemberList}" varStatus="stauts">
			<c:set var="id" value="${g.user_id}" scope="request"></c:set>
			<tr>
				<td align="center">
					<%
						String id = (String) request.getAttribute("id");
							if (DictionaryService.findStudent(id) != null
									&& DictionaryService.findOrg(DictionaryService
											.findStudent(id).getClass_id()) != null) {
								out.print(DictionaryService.findOrg(
										DictionaryService.findStudent(id).getClass_id())
										.getOrg_name());
							} else {
								out.print("没有此班级信息");
							}
					%>
				</td>
				<td align="center">
					<%
						if (DictionaryService.findStudent(id) != null) {
								out.print(DictionaryService.findStudent(id).getTrue_name());
							} else {
								out.print("无此学生信息");
							}
					%>
				</td>
				<td align="center">
					<%
						if (DictionaryService.findStudent(id) != null) {
								out.print(DictionaryService.findStudent(id).getStu_code());
							} else {
								out.print("无此学生信息");
							}
					%>
				</td>
				<td>${g.temp2}</td>
				<td>
					<font color="read">${g.temp1}</font>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>