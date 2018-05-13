<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>添加校区管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script>

	//ajax 根据学校查出校区负责人
	function ajaxSchoolContacat() {
		$.ajax({
			type : "get",
			url : "schooladmin/ajaxPk_SchoolContacat.do?",
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

	
</script>
</head>
<body>
	<form name="form1" action="schooladmin/doBigClassroomAdd.do" method="post">
		<input type="hidden" name="id" value="">
		<h2>添加校区管理</h2>
		<br>
		<table border="0" width="800">
			<tr>
				<td width="100">校区名称：</td>
				<td width="270"><input type="text" name="scr_name" id="scr_name"
						style="width:230px;" value="" placeholder="请如实填写校区名" required />
				</td>
			</tr>
			
			<tr>
				<td width="100">负责人所属学校：</td>
				<td width="270"><select name="scr_userdept" id="scr_userdept"
						onclick="ajaxSchoolContacat()">
						<c:forEach var="o" items="${orgSchool}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td width="100">负责人：</td>
				<td width="270"><select name="scr_contacat" id="scr_contacat">
					</select></td>
			</tr>
			<tr>
				<td width="100">可容纳人数：</td>
				<td width="270"><input type="text" name="scr_capabilit"
						id="scr_capabilit" style="width:230px;" value=""
						onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="只能填数字" required />
				</td>
			</tr>
			<tr>
				<td width="100">备注：</td>
				<td width="270"><textarea name="scr_note" id="scr_note"
						style="resize:none" onkeyup="javascript:checkWord1(this);"
						onmousedown="javascript:checkWord1(this);" cols="60" rows="4"
						style="overflow-y:scroll"></textarea>
					<div>
						还可以输入<span style="font-family: Georgia; font-size: 26px;" id="wordCheck">70</span>个字符
					</div>
				</td>
			</tr>
		</table>
		<!-- 教室类型： -->
		<input type="hidden" name="scr_type" id="scr_type" value="1" />
		<div style="margin-top:20px;">
			<input type="submit" value="保存"  />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='schooladmin/classroomManage.do'">返回</button>
		</div>
	</form>
</body>
</html>
