<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入指标</title>
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
	<h2>导入指标信息表</h2>
	<form action="doGuidenceTeacherImport.do" name="form1" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="standard_id" value="${standard_id}">
		<input type="hidden" id="type" name="type" value="excelEvalsIndex">
		<table border="1" width="800">
			<tr>
				<td width="150"><input type="hidden" name="_method"
					value="post"> 指标信息文件(*.xls): <input type="file" name="file" onchange="fileChange(this);">
					<br>
				</td>
				<td width="150"><input type="button" value=" 提 交 " onclick="Check()">  <br>
				</td>
			</tr>
		</table>
	</form>
	<table border="1" width="1120" id="table1">
		<tr>
			<td width="200" align="center"><b>指标编码</b></td>
			<td width="200" align="center"><b>指标名称</b></td>
			<td width="200" align="center"><b>描述</b></td>
			<td width="120" align="center"><b>分值</b></td>
			<td width="200" align="center"><b>标准名称</b></td>
			<td width="200" align="center"><b>数据表格问题</b></td>
		</tr>
		<c:forEach var="ei" items="${eis}" varStatus="stauts">
			<tr>
				<td align="center">${ei.index_code}</td>
				<td align="center">${ei.index_name}</td>
				<td align="center">${ei.description}</td>
				<td align="center">${ei.score}</td>
				<td align="center">${ei.temp2}</td>
				<td align="center"><font color="#FF0000">${ei.temp1}</font></td>
			</tr>
		</c:forEach>
	</table>
	<h3>保存至数据库</h3>
	<form action="doSaveTeachers.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="fileName" value="${fileName}"> <input
			type="hidden" name="type" value="${type}">
			<input type="submit" value="保存到数据库"  disabled="disabled" id="sb">
			<button type="button" onClick="window.location='evaluateStandardList.do'">返回</button>
			<br>
			
	</form>
</body>
</html>