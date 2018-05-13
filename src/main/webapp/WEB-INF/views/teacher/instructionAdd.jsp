<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>添加指导</title>
<style type="text/css">
	h2{
	    width:100%; 
	    height:20px;
	    text-align:left;
	}
</style>
<script type="text/javascript">
	//返回上一个界面
	function back(){
		 window.history.back();
	}
	//选中所选的学生id
	/**
	 获取选中的学生 ，并赋值给输入框
	 wl
	 */
	function setVals() {
		var value = "";
		var name = "";
		var id = document.getElementsByName("students");//复选框的name
		for ( var i = 0; i < id.length; i++) {
			if (id[i].checked) {
				value += id[i].value + ",";
				name += id[i].nextSibling.nodeValue + ",";
			}
		}
		document.getElementById("notice_range").value = value;
		document.getElementById("temp1").value = name;
		document.getElementById("hidden").style.display = 'none';
		document.getElementById("hidden1").style.display = 'none';
		document.getElementById("infor").style.display = 'none';
	}
	  function doAdd(){
		 	var content=$("#content").val();
		 	if(content.length>70){
		 		alert("内容不能超过70个字");
		 		return null;
		 	}else if(content==""){
		 		alert("内容不能为空");
		 		return null;
		 	}else if($("#title").val()==""){
		 		alert("标题不能为空");
		 		return null;
		 	}else if($("#notice_range").val()==""){
		 		alert("通知范围不能为空");
		 		return null;
		 	}else{
		 		document.form1.submit();
		 	
		 	}
		 	
		 
		 }
</script>


</head>
<body>
<h2>添加指导</h2><br>
	<form name="form1" id="form1" method="post" action="doInstructionAdd.do">
		<table border="1" width="500" height="238">
			<tr>
				<td width="100">标题：</td>
				<td style="width:100px"><input type="text" id="title" name="title" value="" />
				</td>
			</tr>
			<tr>
				<td width="100">内容：</td>
				<td width="300"><textarea name="content" rows="3" style="resize:none" id="content"></textarea><span
					style="color:red;">&nbsp;*</span>
				</td>

			</tr>
			<tr>
				<td width="120">通知范围：</td>
				<td width="300"><input id="notice_range" type="hidden"
					name="notice_range" />
					<textarea rows="4" cols="30" id="temp1" name="temp1" disabled="disabled" style="resize:none"></textarea>
				</td>
			</tr>
		<tr id="hidden">
			<td colspan="2">“${task_name}”任务下,岗位为“${post}”学生列表:</td>
		</tr>
		<tr >
			<td colspan="2">${sendInfor}</td>
		</tr>
		<tr id="hidden1">
			<td colspan="2"><button type="button" onclick="setVals()">确定</button></td>
		</tr>
		</table>
		<div style="magin-top">
			<input type="button" value="发送指导"  onclick="doAdd()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="back()">返回</button>
		</div>
	</form>
</body>
</html>

