<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入教师</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
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
	function Check(){
		 	var s=document.form1.file.value; 
            if(s==""){
                alert("请选择一个文件");
                document.form1.file.focus();
                return;
            }else{
            	document.form1.submit();
            }
        }
	function fileChange(target, id) {
		var filetypes = ["xls"];
		var filepath = target.value;
		if (filepath) {
			var isnext = false;
			var fileend=(filepath.substring(filepath.lastIndexOf(".")+1,filepath.length)).toLowerCase();
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

<body>
	<h2>导入教师信息表</h2>
	<form action="doGuidenceTeacherImport.do" method="post" name="form1"
		enctype="multipart/form-data">
		<input type="hidden" name="xi_id" value="${xi_id}"> <input
			type="hidden" id="type" name="type" value="excelTeacher">
		<div style="float:left">
			<table border="1" width="600">
				<tr>
					<td width="150"><input type="hidden" name="_method"
						value="post"> 教师信息文件(*.xls): <input type="file"
						name="file" onchange="fileChange(this);"> <br>
					</td>
					<td width="70"><input type="button" value=" 提 交 "
						onclick="Check()"> <br></td>
				</tr>
			</table>
		</div>
	</form>
	<div style="float:left">
		<form action="doSaveTeachers.do" method="post"
			enctype="multipart/form-data">
			<table border="1" width="200">
				<tr>
					<td><input type="hidden" name="fileName" value="${fileName}">
						<input type="hidden" name="type" value="${type}"><input
						type="submit" value="保存到数据库" disabled="disabled" id="sb">&nbsp;&nbsp;&nbsp;</td>
					<td><button type="button"
							onClick="window.location='teacherList.do'">返回</button></td>
				</tr>
			</table>
		</form>
	</div>

	<table border="1" width="1300" id="table1">
		<tr>
			<td width="120" align="center"><b>教师编号</b></td>
			<td width="80" align="center"><b>真实姓名</b></td>
			<td width="60" align="center"><b>性别</b></td>
			<td width="120" align="center"><b>手机号</b></td>
			<td width="120" align="center"><b>部门id</b></td>
			<td width="120" align="center"><b>部门名称</b></td>
			<td width="100" align="center"><b>职责</b></td>
			<td width="100" align="center"><b>技能</b></td>
			<td width="180" align="center"><b>所教课程</b></td>
			<td width="300" align="center"><b>数据表数据问题</b></td>
		</tr>
		<c:forEach var="s" items="${tt}" varStatus="stauts">
			<tr>
				<td align="center">${s.tea_code}</td>
				<td align="center">${s.true_name}</td>
				<td align="center">${s.sex}</td>
				<td align="center">${s.phone}</td>
				<td align="center">${s.dept_id}</td>
				<td align="center">
				<c:set var="classId" value="${s.dept_id}" scope="request"></c:set>
				<%
		 			String deptId = (String) request.getAttribute("classId");
		 			if(DictionaryService.findOrg(deptId) ==null){
		 				out.println(" ");
		 			}else{
		 				out.println(DictionaryService.findOrg(deptId).getOrg_name());
		 			}
		 		    %>
				</td>
				<td align="center">${s.duties}</td>
				<td align="center">${s.expertise}</td>
				<td align="center">${s.course_id}</td>
				<td align="center"><font color="#FF0000">${s.temp1}</font>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>