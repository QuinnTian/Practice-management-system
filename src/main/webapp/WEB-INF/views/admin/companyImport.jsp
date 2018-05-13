<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>导入企业</title>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
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
	/* function Check() {
		var s = document.form1.file.value;
		if (s == "") {
			alert("请选择一个文件");
			document.form1.file.focus();
			return;
		} else {
			document.form1.submit();
		}
	} */
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
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
</head>

<body>
	<h2>导入企业信息表</h2>
	<form action="doGuidenceTeacherImport.do" method="post" name="form1"
		enctype="multipart/form-data">
		<input type="hidden" id="type" name="type" value="excelCompany">
		<div style="float:left">
		<table border="1" width="800">
			<tr>
				<td width="150"><input type="hidden" name="_method"
					value="post"> 企业信息文件(*.xls): <input type="file" name="file" onchange="fileChange(this);">
					<br>
				</td>
				<td width="150"><input type="button" value=" 提 交 " onclick="Check()"> <br>
				</td>
			</tr>
		</table>
		</div>
	</form>
	<div style="float:left">
		<form action="doSaveTeachers.do" method="post"
			enctype="multipart/form-data">
			<table border="1" width="200">
				<tr>
					<td><input type="hidden" name="fileName" value="${fileName}"> <input
							   type="hidden" name="type" value="${type}"><input
							   type="submit" value="保存到数据库" disabled="disabled" id="sb">
					</td>
					<td><button type="button" onClick="window.location='companyList.do'">返回</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<table border="1" width="1100" id="table1">
		<tr>
			<td width="130" align="center"><b>所属的行业</b></td>
			<td width="130" align="center"><b>适用的学院</b></td>
			<td width="120" align="center"><b>企业名称</b></td>
			<td width="120" align="center"><b>企业代码</b></td>
			<td width="100" align="center"><b>企业短名</b></td>
			<td width="80" align="center"><b>联系人</b></td>
			<td width="100" align="center"><b>联系电话</b></td>
			<td width="120" align="center"><b>企业地址</b></td>
			<td width="120" align="center"><b>Email</b></td>
			<td width="120" align="center"><b>数据表问题</b></td>
		</tr>
		<c:forEach var="c" items="${c}" varStatus="stauts">
			<c:set var="industry" value="${c.industry}" scope="request"></c:set>
			<c:set var="applicable_scope" value="${c.applicable_scope}" scope="request"></c:set>
			<tr>
				<td align="center">
				<%	String industry=(String)request.getAttribute("industry");
					if(DictionaryService.getmapIndustryClassificationCode().get(industry)==null){
						out.print("<font color='#FF0000'>无此行业</font>");
					}else{
					
						out.println(DictionaryService.getmapIndustryClassificationCode().get(industry));
					}
				 %>
				</td>
				<td align="center">
				<%
				   
				   String scope=(String)request.getAttribute("applicable_scope"); 
				   if(scope==null || scope.equals("")){
				   		out.print("");
				   }else{
				   String error="";
				   String tru="";
				   String[] coll_id = scope.split(",");
				   for(int i=0;i<coll_id.length;i++){/* .findOrg(coll_id[i]) */
				   if(DictionaryService.findOrgName(coll_id[i])==null){
				   		error=coll_id[i]+"无此学院";
				   }else{
				   		tru=coll_id[i]+" "+tru;
				   	}
				   }
					out.print("<font color='#FF0000'>" +error+"</font> "+tru);
					}
				 %>
				
				</td>
				<td align="center">${c.com_name}</td>
				<td align="center">${c.com_code}</td>
				<td align="center">${c.short_name}</td>
				<td align="center">${c.contacts}</td>
				<td align="center">${c.phone}</td>
				<td align="center">${c.address}</td>
				<td align="center">${c.email}</td>
				<td align="center"><font color="#FF0000">${c.temp1}</font></td>
			</tr>
		</c:forEach>
	</table>
	<%-- <h3>保存至数据库</h3>
	<form action="doSaveTeachers.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="fileName" value="${fileName}"> <input
			type="hidden" name="type" value="${type}"><input
			type="submit" value="保存到数据库" disabled="disabled" id="sb">&nbsp;&nbsp;&nbsp;
		<button type="button" onClick="window.location='companyList.do'">返回</button>
	</form> --%>
</body>
</html>