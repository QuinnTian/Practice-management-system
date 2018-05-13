<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>修改教室管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.min.js"
	type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script>
	//ajax 根据院查出系和部
	function ajaxUserdept() {
		$.ajax({
			type : "get",
			url : "schooladmin/ajaxPk_userdept.do?",
			data : getXiData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showUserdepts(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showUserdepts(ajaxData) {
		$("#scr_userdept").html(ajaxData);
	}
	function getXiData() {
		var val = $("#campus").val();
		var dataSend = "campus=" + val;
		return dataSend;
	}
	//ajax 根据系和部查出负责人
	function ajaxContacat() {
		$.ajax({
			type : "get",
			url : "schooladmin/ajaxPk_contacat.do?",
			data : getContacatData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showContacat(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showContacat(ajaxData) {
		$("#scr_contacat").html(ajaxData);
	}
	function getContacatData() {
		var val = $("#scr_userdept").val();
		var dataSend = "scr_userdept=" + val;
		return dataSend;
	}
		//表单验证
	function doAdd() {

		var scr_floor = $("#scr_floor").val();
		var scr_floorLength = scr_floor.length;
		var scr_capabilit = $("#scr_capabilit").val();
		//alert(teaCode);
		if($("#scr_campus").val()=="请选择校区"){
		alert("请先选择校区");
		return;
		}else if($("#scr_type").val()=="请选择教室类型"){
		alert("请先选择教室类型");
		return;
		}else if($("#scr_code").val()==""){
		alert("请填写教室编号");
		return;
		}else if($("#scr_name").val()==""){
		alert("请填写教室名称");
		return;
		}else if($("#scr_userdept").val()=="请选择"){
		alert("请选择负责人所属部门");
		return;
		}
		else if($("#scr_contacat").val()=="请选择"){
		alert("请选择负责人");
		return ;
		}
		else if (scr_floorLength > 2) {
			alert("楼层只能为两位数！");
			return;
		} else if (isNaN(scr_capabilit) == true) {
			alert("可容纳人数只能为数字！");
			return;
		} else {
			document.form1.submit();
		}
	}
</script>
</head>
<body>
	<form name="form1" action="schooladmin/doClassroomEdit.do" method="post">
		<input type="hidden" name="id" value="${classRoom.id}">
		<h2>修改教室管理</h2>
		<br>
		<table border="0" width="800">
			<tr>
				<td width="100">校区：</td>
				<td width="270">
				<select name="scr_campus" id="scr_campus">
						<option value="请选择校区">请选择校区</option>
						<c:forEach var="campus" items="${selectCampus}">
							<option value="${campus.id}">${campus.scr_name}</option>
						</c:forEach>
					</select>
					</td>
			</tr>
			<tr>
				<td width="100" id="scr_type">教室类型：</td>
				<td width="270"><select name="classType" id="classType">
						<option value="请选择教室类型">请选择教室类型</option>
						<option value="2">实训教室</option>
						<option value="3">多媒体教室</option>
						<option value="4">普通教室</option>
					</select> </td>
			</tr>
			<tr>
				<td width="100">教室编号：</td>
				<td width="270"><input type="text" name="scr_code" id="scr_code"
						style="width:230px;" value="${classRoom.scr_code}"></td>
			<tr>
				<td width="100">教室名称：</td>
				<td width="270"><input type="text" name="scr_name" id="scr_name"
						style="width:230px;" value="${classRoom.scr_name}" ></td>
			</tr>
			<tr>
				<td width="100">负责人所属学院：</td>
				<td width="270"><select name="campus" id="campus"
						onclick="ajaxUserdept() ">
						<c:forEach var="o" items="${org}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
					</select> 
				</td>
			</tr>
			<tr>
				
				<td width="100">负责人所属部门：</td>
				<td width="270"><select name="scr_userdept" id="scr_userdept"
						onclick="ajaxContacat()"></select> 
				</td>
			</tr>
			<tr>
				<td width="100">负责人：</td>
				<td width="270"><select name="scr_contacat" id="scr_contacat">
					</select> 
				</td>
			</tr>
			<tr>
				<td width="100">可容纳人数：</td>
				<td width="270"><input type="text" name="scr_capabilit"
						id="scr_capabilit" style="width:230px;" value="${classRoom.scr_capabilit}"
						onkeyup="value=value.replace(/[^\d]/g,'')" ></td>
			</tr>
			<tr>
				<td width="100">配套描述：</td>
				<td width="270"><textarea name="scr_devices" id="scr_devices"
						style="resize:none" onkeyup="javascript:checkWord(this);"
						onmousedown="javascript:checkWord(this);" cols="60" rows="4"
						style="overflow-y: scroll" required>${classRoom.scr_devices}</textarea>
					<div>
						还可以输入<span style="font-family: Georgia; font-size: 26px;" id="wordCheck">70</span>个字符
					</div></td>
			</tr>
			<tr>
				<td width="100">备注：</td>
				<td width="270"><textarea name="scr_note" id="scr_note"
						style="resize:none" onkeyup="javascript:checkWord1(this);"
						onmousedown="javascript:checkWord1(this);" cols="60" rows="4"
						style="overflow-y:scroll">${classRoom.scr_note}</textarea>
					<div>
						还可以输入<span style="font-family: Georgia; font-size: 26px;" id="wordCheck">70</span>个字符
					</div></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
		<input type="button" value="保存"  onclick="doAdd()"/> 
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='schooladmin/classroomManage.do'">返回</button>
		</div>
	</form>
</body>
</html>
