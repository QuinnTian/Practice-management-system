<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>添加菜单</title>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<style type="text/css">
	h2 {
		width: 100%;
		height: 20px;
		text-align: left;
	}
	.div {
		border: 1px solid #F00;
		width: 300px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("#onelevel").hide();
		$("#twolevel").hide();
		$("#threelevel").hide();
	});
	function choiceLevel(){
	 	var sm_is_top = $("#sm_is_top").val();	
	 	if(sm_is_top=="请选择"){
	 		alert("请选择菜单级别");
	 	}else if(sm_is_top=="1"){
	 		$("#onelevel").show();
	 		$("#twolevel").hide();
			$("#threelevel").hide();
	 	}else if(sm_is_top=="2"){
	 		$("#onelevel").show();
	 		$("#twolevel").show();
	 		$("#threelevel").hide();
	 	}else if(sm_is_top=="3"){
	 		$("#onelevel").show();
	 		$("#twolevel").show();
			$("#threelevel").show();
	 	}
	}

	function doAdd(){
	 		document.forms[0].submit();
		}
		
	function ajaxGetParentMenu() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxGetParentMenu.do?",
			data : getSend(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showSysMenu(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showSysMenu(ajaxData) {
	    $("#sm_parent").html(ajaxData);
	}
	function getSend() {
		var temp1 = $("#temp1").val();
		var dataSend = "type=" + temp1;
		return dataSend;
	}	
</script>
</head>
<body>
	<h2>添加菜单</h2>
	<form name="form1" id="myform" method="post" action="doAddSysMenu.do">
		<table border="0" width="1000">
			<tr>
				<td width="100">菜单名称：</td>
				<td width="700"><input type="text"  name="sm_name" id="sm_name" style="width:300px"/>
				<font color="red"><span id="infor"></span></font>
				</td>
			</tr>
			<tr>
				<td width="100">菜单标题：</td>
				<td width="700"><input type="text" name="sm_title" id="sm_title" style="width:300px"/></td>
			</tr>
			<tr>
				<td width="100">菜单所属类别：</td>
				<td width="700">
				<select name="temp1" id="temp1" onchange="ajaxGetParentMenu();" style="width:150px">
						<!-- <option value="0">请选择</option> -->
						<option value="1">管理员</option>
						<option value="2">教师</option>
						<option value="4">领导</option>
						<option value="3">学生</option>
						<option value="5">公司</option>
				</select>
				</td>
			</tr>
			<tr id ="grade">
				<td width="100">菜单父级菜单：</td>
				<td width="700">
				<select id="sm_parent" name="sm_parent" style="width:250px">
						<option value="无">无</option>
						<c:forEach var="sysMenuList" items="${sysMenuList}" varStatus="stauts">
							<option value="${sysMenuList.id}">${sysMenuList.sm_code}-${sysMenuList.sm_sort_name}-${sysMenuList.sm_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="120">菜单级别：</td>
				<td width="700">
				<select name="sm_is_top" id="sm_is_top" onchange="choiceLevel();" style="width:150px">
						<option value="0">请选择</option>
						<option value="1">一级菜单</option>
						<option value="2">二级菜单</option>
						<option value="3">三级菜单</option>
				</select>
				</td>
			</tr>
			
			<tr id="onelevel">
				<td width="100">一级菜单序号：</td>
				<td width="700"><!-- <input type="text" name="sm_OneNum" id="sm_OneNum"/> -->
				<select name="sm_OneNum" id="sm_OneNum" style="width:150px">
						<option value="无">请选择</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
				</select>
				</td>
			</tr>
			<tr id="twolevel">
				<td width="100">二级菜单序号：</td>
				<td width="700"><!-- <input type="text" name="sm_TwoNum" id="sm_TwoNum"/> -->
				<select name="sm_TwoNum" id="sm_TwoNum" style="width:150px">
				<option value="无">请选择</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
				</select>
				</td>
			</tr>
			<tr id="threelevel">
				<td width="100">三级菜单序号：</td>
				<td width="700"><!-- <input type="text" name="sm_ThreeNum" id="sm_ThreeNum"/> -->
				<select name="sm_ThreeNum" id="sm_ThreeNum" style="width:150px">
						<option value="无">请选择</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
				</select>
				</td>
			</tr>
			
			
			<tr>
				<td width="100">	Pc菜单url地址：</td>
				<td width="700">
				<input type="text" name="sm_page" id="sm_page" style="width:300px"/>
				</td>
			</tr>
			<tr>
				<td width="100">	手机菜单url地址：</td>
				<td width="700">
				<input type="text" name="sm_page_phone" id="sm_page_phone" style="width:300px"/>
				</td>
			</tr>
			<tr>
				<td width="100">菜单描述：</td>
				<td width="700">
				<input type="text" name="sm_description" id="sm_description"  style="width:600px" />
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="javascript:history.go(-1);">返回</button>
		</div>
	</form>
</body>
</html>
