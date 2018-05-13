<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入教学班</title>
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
	<h2>导入教学班信息表</h2>
	<form action="doGuidenceTeaClassImport.do" method="post" name="form1"
		enctype="multipart/form-data">
		 <input type="hidden" id="type" name="type" value="excelTeachingClass">
		<div style="float:left">
			<table border="1" width="600">
				<tr>
					<td width="150"><input type="hidden" name="_method"
						value="post"> 教学班信息文件(*.xls): <input type="file"
						name="file" onchange="fileChange(this);"> <br>
					</td>
					<td width="70"><input type="button" value=" 提 交 "
						onclick="Check()"> <br></td>
				</tr>
			</table>
		</div>
	</form>
	<div style="float:left">
		<form action="doSaveTeaClass.do" method="post"
			enctype="multipart/form-data">
			<table border="1" width="200">
				<tr>
					<td> 
						<input type="submit" value="保存到数据库" disabled="disabled" id="sb">&nbsp;&nbsp;&nbsp;</td>
					<td><button type="button"
							onClick="window.location='teaClassList.do'">返回</button></td>
				</tr>
			</table>
		</form>
	</div>

	<table border="1" width="1300" id="table1">
		<tr>
			<td width="120" align="center"><b>教学班名称</b></td>
			<td width="100" align="center"><b>课程编码</b></td>
			<td width="120" align="center"><b>课程名称</b></td>
			<td width="100" align="center"><b>课程类型</b></td>
			<td width="100" align="center"><b>周数描述</b></td>
			<td width="70" align="center"><b>学分</b></td>
			<td width="70" align="center"><b>学时</b></td>
			<td width="100" align="center"><b>教工号</b></td>
			<td width="100" align="center"><b>任课教师</b></td>
			<td width="120" align="center"><b>开始时间</b></td>
			<td width="200" align="center"><b>数据表数据问题</b></td>
		</tr>
	    <c:forEach var="tc" items="${teachingClass}" varStatus="stauts">
			<tr>
				<td align="center">${tc.tc_name}</td>
				<td align="center">${tc.temp4}</td> 
				<td align="center">${tc.temp3}</td>
				<td align="center">${tc.courses_type}</td>
				<td align="center">${tc.week_desc}</td>
				<td align="center">${tc.credit}</td>
				<td align="center">${tc.hours}</td>
				<td align="center">${tc.temp1}</td>
				<td align="center">${tc.temp2}</td>
				<td align="center">${tc.begin_time}</td>
				<td align="center"><font color="#FF0000">${tc.temp5}</font>
				</td>
			</tr>
		</c:forEach> 
	</table>
</body>
</html>