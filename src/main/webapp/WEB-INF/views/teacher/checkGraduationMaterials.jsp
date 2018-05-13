<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>就业材料详细记录</title>
<style type="text/css">
	h2 {
		width: 100%;
		height: 20px;
		text-align: left;
	}
</style>
<script type="text/javascript"> 
	function doAdd() {
		var materials_note  = document.getElementById("materials_note");
		var check_state=document.getElementsByName("check_state");
		for(var i=0;i<check_state.length;i++){
			 if(check_state[i].checked==true){
			 	temp=1;
				 break;
			 }else{
			 	temp=0;
			 }
		}
		if(temp==0){
			alert("请选择审核状态");
			return false;
			}
		if (materials_note.value==""){
				alert("请输入审核备注");
				materials_note.focus();
				return ;
			}
		document.forms[0].submit();
	}
	//下载就业材料
	function download(id) {
		window.location.href = "downloadFile.do?file_id=" + id;
	}
	//返回
	function doBack() {
		var Materials_stuid = $("#Materials_stuid").val();
		window.location.href = "doCheckMaterialsList.do?stu_id="+ Materials_stuid;
	}
</script>
<!-- 字数限制 -->
<script>
	var maxstrlen = 70;
	function Q(s) {
		return document.getElementById(s);
	}

	function checkWord(c) {
		len = maxstrlen;
		var str = c.value;
		myLen = getStrleng(str);
		var wck = Q("wordCheck");

		if (myLen > len * 2) {
			c.value = str.substring(0, i + 1);
		} else {
			wck.innerHTML = Math.floor((len * 2 - myLen) / 2);
		}
	}

	function getStrleng(str) {
		myLen = 0;
		i = 0;
		for (; (i < str.length) && (myLen <= maxstrlen * 2); i++) {
			if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
				myLen++;
			else
				myLen += 2;
		}
		return myLen;
	}
</script>
</head>
<body>
	<h2>审批就业材料</h2>
	<form name="form1" method="post" action="doEditMaterials.do">
		<input type="button" value="下载就业材料" onclick="download('${materials.file_id}');"><br/>
		<input type="hidden" name="file_id" value="${materials.file_id}" />
		<input type="hidden" name="id" value="${materials.id}">
		<input type="hidden" name="Materials_stuid" id="Materials_stuid" value="${materials.stu_id}">
		<table border="0" width="1000">	
		    <tr>
				<td width="100">实习任务名称：</td>
				<td width="300">
				<c:set var="practice_id" value="${materials.practice_id}" scope="request"></c:set>
					<%
						String practice_id = (String) request.getAttribute("practice_id");
					%> 
					<%
 						out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
 					%></td>
				<td width="100">学生姓名：</td>
				<td width="300">
				<c:set var="stu_id" value="${materials.stu_id}" scope="request"></c:set>
					<%
						String stu_id = (String) request.getAttribute("stu_id");
					%> 
					<%
 						out.println(DictionaryService.findStudent(stu_id).getTrue_name());
 					%></td>
			</tr>
			<tr>
				<td width="100">材料名称：</td>
				<td width="300">${materials.materials_name}</td>
				<td width="100">材料类型：</td>
				<td width="300">${materials.materials_type}</td>
			</tr>
			<tr>
				<td width="100">上传时间：</td>
				<td width="300">${materials.create_time}</td>
				<td width="100">审核时间：</td>
				<td width="300">${materials.check_time}</td>
			</tr>
			<tr>
				<td width="100">审核状态：</td>
				<td width="70">
				<c:set var="check_state" value="${materials.check_state}" scope="request"></c:set>
			    <% String check_state=(String)request.getAttribute("check_state"); %>
				<%-- <select name="check_state" id="check_state" style="font-family:sans-serif">
						<option value="0" <%="0".equals(check_state)?"selected":"" %>>未审核</option>
						<option value="1" <%="1".equals(check_state)?"selected":"" %>>已通过</option>
						<option value="2" <%="2".equals(check_state)?"selected":"" %>>未通过</option>
				</select> --%>
	<input type="radio" name="check_state" value="1" <%="1".equals(check_state)?"checked":"" %>>通过
    <input type="radio" name="check_state" value="2" <%="2".equals(check_state)?"checked":"" %>>不通过
				</td>
			</tr>
		</table>
		 备&nbsp;&nbsp;注：<!-- <textarea name="materials_note" rows="4" cols="70" ></textarea> -->
		 <textarea  style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  					name="content" id="materials_note" cols="60" rows="4" style="overflow-y: scroll">${materials.note}</textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div>
		 
		 
		<br>
	    <input type="button"onclick ="doAdd()" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="doBack()">返回</button>
	</form>
</body>
</html>
