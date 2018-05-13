<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户角色分配</title>
<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
    </style>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
	/* function changeCK() {
		var selectedValue = document.getElementById("role_name");
		var selectedIndex = selectedValue.selectedIndex;
		var ajaxUrl = "getTeaByRoleId.do?id=" + selectedValue.options[selectedIndex].value;
		ajaxFunction(ajaxUrl);
		document.getElementById("divSelStu").style.display = "";
	}
	function ajaxFunction(url) {
		//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		try {
			// Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest(); // 实例化对象
		} catch (e) {
			// Internet Explorer
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					alert("您的浏览器不支持AJAX！");
					return false;
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				$("#sel").html(result);
			}
		};
		xmlHttp.open("GET", url, false);
		xmlHttp.send(null);
	} */
	function getTeaBydeptIdAndRoleName() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "getTeaBydeptIdAndRoleName.do?",
			data : getSend(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showTeaList(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showTeaList(ajaxData) {
	/* alert(ajaxData); */
		$("table[id='selete'] tr[id!='tr']").remove();
		$("#tr").after(ajaxData);
	}
	function getSend() {
		var role_name = $("#role_name").val();
		var dept_id = $("#dept_id").val();
		var dataSend = "role_name=" + role_name+"&&"+"dept_id="+dept_id;
		return dataSend;
	}
	window.onload = function() {
		$("#all").click(function() {
			$("table :checkbox").prop("checked", $(this).prop("checked"));
		});
	}
	
	function setvalue2() {
		var id = document.getElementsByName("teacher");
		var value = "";
		var name = "";
		for ( var i = 0; i < id.length; i++) {
			if (id[i].checked) {
				value += id[i].value + ",";
				name += id[i].nextSibling.nodeValue + ",";
			}
		}
		document.getElementById("xm").value = name;
		document.getElementById("stu_range").value = value;
		document.getElementById("divSelStu").style.display = "none";
	}
	function getStu() {
		if (document.getElementById("divSelStu").style.display == "none") {
			document.getElementById("divSelStu").style.display = "";
		} else {
			document.getElementById("divSelStu").style.display = "none";
		}
	}
	//全选操作
	function checkAll(flag){
		CBs=document.getElementsByName("teacher");
		for(var i=0;i<CBs.length;i++)
	    CBs[i].checked=flag;
	}
	
	function goback(){
		window.history.go(-1);
	}
	function doAdd(){
	var role_name=$("#role_name").val();
	var dept_id=$("#dept_id").val();
	var teacher = $('input:checkbox[name="teacher"]:checked').val();
	if(role_name=="0"){
	alert("请选择角色名称！");
	return;
	}
	else if(dept_id=="0"){
	alert("请选择用户所在部门！");
	return;
	}
	else if(teacher==undefined){
	alert("请选择用户！");
	return;
	}
	else{
	$("#myform").submit();
	}
	}
</script>
</head>

<body>
	<h2>请分配用户角色</h2>
	<br>
	<form name="form1" id="myform" method="post" action="doAdduserRole.do">
	<table  border="0" width="1000" height="200">
			<tr>
				<td width="200">角色名称：</td>
				<td width="700"><select name="role_name" id="role_name" style="font-family: sans-serif">
						<option value="0">请选择</option>
						<c:forEach var="role" items="${roleList}" varStatus="stauts">
							<option value="${role.id}">${role.role_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="200">用户所在部门：</td>
				<td width="700"><select name="dept_id" id="dept_id" style="font-family: sans-serif" 
						onChange="getTeaBydeptIdAndRoleName()">
						<option value="0">请选择</option>
						<c:forEach var="org" items="${orgList}" varStatus="stauts">
							<option value="${org.id}">${org.org_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
		</table>
		<!-- <table width="100%"> -->
			<!-- <tr>
				<td width="100">请选择分配此权限的教师：</td>
				<td width="300">
				<input type="hidden" name="stu_range" id="stu_range"
					style="width:500px"> 
					<textarea style="resize:none"name="xm" id="xm" rows="5" disabled="disabled"></textarea> 
					<input type="button" name="but1" value="选择教师" onclick="getStu()">
				</td>
			</tr> -->
			
						<table border="1" width="80%" id="selete" >
						<tr id="tr">
							<td width="">教师姓名</td>
							<td width="">教师联系电话</td>
							<!-- <td width="">教师QQ</td> -->
							<td width="">全选<input type="checkbox" name="all" id="all" /></td>
						</tr>
						</table>
						<!-- 全选：<input type="checkbox" value="全选" onClick="checkAll(this.checked)">&nbsp;&nbsp;
						<button type="button" onclick="setvalue2()">确定</button> -->
					
		<!-- </table> -->
		<div style="margin-top:20px;">
			<input type="button" value="保存"  onclick="doAdd()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="goback();">返回</button>
		</div>
	</form>
</body>
</html>
