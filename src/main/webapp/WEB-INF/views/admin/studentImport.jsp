<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入学生</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	function Check() {
		var s = document.form1.file.value;
		if (s == "") {
			alert("请选择一个文件");
			document.form1.file.focus();
			return;
		} else {
			document.form1.submit();
		}
	}

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
			$("#submit").removeAttr("disabled");
			alert($("#information").val());
		}
	});
	function fileChange(target, id) {
		var filetypes = [ "xls" ];
		var filepath = target.value;
		if (filepath) {
			var isnext = false;
			var fileend = (filepath.substring(filepath.lastIndexOf(".") + 1,
					filepath.length)).toLowerCase();
			if (filetypes && filetypes.length > 0) {
				for ( var i = 0; i < filetypes.length; i++) {
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


</head>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<body>
	<h2>导入学生信息表</h2>
	<form action="doGuidenceTeacherImport.do" name="form1" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="class_id" value="${class_id}"> <input
			type="hidden" id="type" name="type" value="excelStudent">
		<div style="float:left">
			<table border="1" width="800">
				<tr>
					<td width="150"><input type="hidden" name="_method"
						value="post"> 学生信息文件(*.xls): <input type="file"
						name="file" onchange="fileChange(this);"> <br></td>
					<td width="150"><input type="button" value=" 提 交 "
						onclick="Check()"> <br></td>
				</tr>
			</table>
		</div>
	</form>
	<div style="float:left">
		<form action="doSaveTeachers.do" method="post" name="form2"
			enctype="multipart/form-data"
			onsubmit="getElementById('submit').disabled=true;return true;">
			<table border="1" width="200">
				<tr>
					<td><input type="hidden" name="information"
						value="${information}" id="information"> <input
						type="hidden" name="fileName" value="${fileName}"> <input
						type="hidden" name="type" value="${type}"><input
						type="submit" value="保存到数据库" disabled="disabled" id="submit">
					</td>
					<td><button type="button"
							onClick="window.location='studentImportList.do'">返回</button></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 
	<p id="infor"></p>
	 -->
	<table border="1" width="1450" id="table1">
		<tr>
			<td width="100" align="center"><b>学号</b>
			</td>
			<td width="60" align="center"><b>姓名</b>
			</td>
			<td width="40" align="center"><b>性别</b>
			</td>
			<td width="100" align="center"><b>身份证号</b>
			</td>
			<td width="100" align="center"><b>手机号</b>
			</td>
			<td width="100" align="center"><b>班级名称</b>
			</td>
			<td width="100" align="center"><b>家庭电话</b>
			</td>
			<td width="300" align="center"><b>籍贯</b>
			</td>
			<td width="150" align="center"><b>空间主页</b>
			</td>
			<td width="300" align="center"><b>excel问题</b>
			</td>
		</tr>
		<c:forEach var="stu" items="${ss}" varStatus="stauts">
			<tr>
				<td align="center">${stu.stu_code}</td>
				<td align="center">${stu.true_name}</td>
				<td align="center">${stu.sex}</td>
				<td align="center">${stu.id_card}</td>
				<td align="center">${stu.phone}</td>
				<td align="center"><c:set var="classId" value="${stu.class_id}"
						scope="request"></c:set> <%
 	String classId = (String) request.getAttribute("classId");
 		if (DictionaryService.findOrg(classId) == null) {
 			out.print("<font color='red'>无效的班级</font>");
 		} else {
 			out.print(DictionaryService.findOrg(classId).getOrg_name());
 		}
 %>
				</td>
				<td align="center">${stu.home_phone}</td>
				<td align="center">${stu.birthplace}</td>
				<td align="center">${stu.homepage}</td>
				<td align="center"><font color="#FF0000">${stu.temp1}</font>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>